<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batchPagamento_work.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Batch;

use Batch\lib\BatchGlobal;
use Batch\ControllaPagamento;
use Common\lib\Error;

require '../assets/lib/batch/batchGlobal.php';
require '../assets/lib/batch/checkPagamento.php';

require_once "../assets/lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';


class BatchPagamento_work implements BatchGlobal {
	
	public static $SUBSCRIPTION_OPERATION_CANCEL="Cancel";
        public static $USER_EXPIRED=5;
        public static $DELTA_TIME=5;
        public static $PIANO_MENSILE=0;
        public static $PIANO_ANNUALE=1;
        
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error = BATCH_WITHOUT_ERROR;
	private $descr_error = "";
	private $connetion=false;
	private $JSONparam = null;
        private $chkPay= null;
	
	
	function __construct() {
                $this->chkPay=new CheckPagamento();
		$this->name_file = basename ( __FILE__, ".php" );
	}
	function __destruct() {
		$this->dbh = null;
	}
	private function boolToStr($b) {
		return ($b) ? 'true' : 'false';
	}
	private function connect() {
		$this->log->info ( "connect()" );
		
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_SCHEDULER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
			$this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
			$this->connetion=true;
		} catch ( \PDOException $ex ) {
			$this->id_error = $ex->getCode();
			$this->descr_error = $ex->getMessage ();
			$this->connetion=false;
		}
	}
	public function setLogger($log) {
		$this->log = $log;
                $this->chkPay->setLogger ( $log );
	}
	public function init() {
		
		$this->log->info ( "init()" );
		self::connect ();
		if ($this->connetion == true) {
			return $this->connetion;
		} else {
			$this->id_error = ERROR;
			$this->descr_error = "Errore connessione DB null pointer";
			return $this->connetion;
		}
	}
	
	public function getParam($argv) {
		$this->log->info ( "getParam()" );
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$this->id_error = ERROR;
			$this->descr_error = "Il Batch � stato invocato senza parametri.";
			return false;
		}
		
		self::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					self::setStatus ( $this->lista_parametri ['--id_schedulazione'], WORKING, BATCH_WITHOUT_ERROR, "getParam OK" );
					return true;
				} else {
					$this->id_error = ERROR;
					$this->descr_error = "Il Batch � stato invocato senza parametro --type";
					return false;
				}
			} else {
				
				$this->id_error = ERROR;
				$this->descr_error = "Il Batch � stato invocato senza parametro --run_time";
				return false;
			}
		} else {
			$this->id_error = ERROR;
			$this->descr_error = "Il Batch � stato invocato senza parametro --id_batch";
			return false;
		}
	}
	public function getIdSchedulazione($argv) /* chiamata prima del log */
	{
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$msg = "-Il Batch � stato invocato senza parametri.";
			printf ( "%s\n", $msg );
			return - 1;
		}
		
		self::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			return $this->lista_parametri ['--id_schedulazione'];
		} else {
			$msg = "-Il Batch � stato invocato senza parametro --id_schedulazione";
			printf ( "%s\n", $msg );
			return - 1;
		}
	}
	public function info() {
		$this->log->info ( "info()" );
		$msg = sprintf ( "------------------------------------------------" );
		$this->log->info ( $msg );
		$msg = sprintf ( "Batch Name: %s", $this->name_file );
		$this->log->info ( $msg );
		$msg = sprintf ( "Input param: " );
		$this->log->info ( $msg );
		foreach ( $this->lista_parametri as $key => $value ) {
			$msg = sprintf ( "	%s: %s", $key, $value );
			$this->log->info ( $msg );
		}
		

		$msg = sprintf ( "------------------------------------------------" );
		$this->log->info ( $msg );
	}
        
	
        public function checkPagamento($api_user,$api_password,$api_signature,$api_url,$paypal_subscription_id)
        {
            $ret = true;
            
            $run_time_unix = time ();
            $run_time_unix= $run_time_unix-(86400);
            $data_str = sprintf("%sT00:00:00Z",date("Y-m-d",$run_time_unix));
            
            $api_request = 'USER=' . urlencode( $api_user )
                        .  '&PWD=' . urlencode( $api_password)
                        .  '&SIGNATURE=' . urlencode( $api_signature )
                        .  '&VERSION=76.0'
                        .  '&METHOD=TransactionSearch'
                        .  '&PROFILEID='. urlencode( $paypal_subscription_id )
                        .  '&STARTDATE=' . urlencode( $data_str )
                          ;
          
            $msg=sprintf("URL: %s?%s",$api_url,$api_request);
            $this->log->info ( $msg );      

            $ch = curl_init($api_url);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $api_request);
            curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            // Request response from PayPal
            $result = curl_exec($ch);

            /* controllare stato curl */

            parse_str(urldecode($result),$myArray);
            print_r($myArray);

            if (array_key_exists (  "L_TRANSACTIONID0" , $myArray )) 
            {
                $ret = true;
            }
            else
            {
                $ret = false;   
            }

            return $ret;
        }
        
	public function run()
	{
		$ret=true;
                $flag=false;
                
		$this->log->info ( "run()" );
		if ($this->connetion==true) 
		{
                    $ret=true;

                    try {
                        $db_manager = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_ADPMANAGER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
                        $db_manager->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
                        
                        
                        $sql = "SELECT paypal_api_username,paypal_api_password,paypal_api_signature,paypal_api_url FROM `settings`";
                        $stmt = $db_manager->prepare($sql);
                        $stmt->execute ();
                        
                        while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) 
                        {
                            $api_user      = $row->paypal_api_username;
                            $api_password  = $row->paypal_api_password;
                            $api_signature = $row->paypal_api_signature;
                            $api_url       = $row->paypal_api_url;
                        }
                        
                        
                        $run_time_unix = time ();
                        $run_time_unix= $run_time_unix-86400;
                        $data_str = date("Y-m-d",$run_time_unix);
                        /* controllo i piani scaduti */
                        $sql = "SELECT a.user_id,name,surname,user_payment_subscription_id,paypal_subscription_id,expire_date, DATEDIFF(CURDATE(), expire_date) AS delta, c.annualService "
                            ."from user_service_profile_types a , users b, user_payment_subscription c " 
                            ."where a.flag_current=1 and a.expire_date<=:data_str and a.user_id=b.id and a.user_payment_subscription_id=c.id "
                            ."and DATEDIFF(CURDATE(), expire_date)<:delta_time";
                        
//                        printf("sql=%s\n",$sql);
                        $stmt = $db_manager->prepare($sql);
                        $stmt->bindParam ( ':data_str', $data_str ,  \PDO::PARAM_STR );
                        $stmt->bindParam ( ':delta_time', self::$DELTA_TIME ,  \PDO::PARAM_INT );
                        $stmt->execute ();
                        
                        while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) 
                        {
                            var_dump($row);
                            $msg=sprintf("... Controllo se l'utente(%d)=%s %s [%s] ha pagato il piano scaduto il %s da %d giorni!!!!",
                                    $row->user_id,
                                    $row->name,
                                    $row->surname,
                                    $row->paypal_subscription_id,
                                    $row->expire_date,
                                    $row->delta);
                            $this->log->info ( $msg );
                            
                            $response=self::checkPagamento($api_user,$api_password,$api_signature,$api_url,$row->paypal_subscription_id);

                            if( $response == false) //il cliente non ha pagato
                            {
                                $msg=sprintf("NON PAGATO");
                                $this->log->info ( $msg );
                                
                                $sql = "update role_user set role_id=:role_id where user_id=:user_id";
                                $stmt_update = $db_manager->prepare($sql);
                                $user_id=$row->user_id;
                                $role_id=self::$USER_EXPIRED;
                                $stmt_update->bindParam ( ':user_id', $user_id , \PDO::PARAM_INT );
                                $stmt_update->bindParam ( ':role_id', $role_id , \PDO::PARAM_INT );
                                $stmt_update->execute ();
                            }
                            else
                            {
                                $msg=sprintf("PAGATO estendo il servizio di tipo %d",$row->annualService);
                                $this->log->info ( $msg ); 
                                if($row->annualService==self::$PIANO_MENSILE)
                                {
                                    $delta_unix_time=strtotime($row->expire_date)+(60*60*24*30);
                                }
                                else if($row->annualService==self::$PIANO_ANNUALE)
                                {
                                    $delta_unix_time=strtotime($row->expire_date)+(60*60*24*365);
                                }
                                
                                $sql = "update user_service_profile_types set expire_date=:expire_date where user_id=:user_id and flag_current=1";
                                $stmt_update = $db_manager->prepare($sql);
                                $user_id=$row->user_id;
                                $expire_date=date("Y-m-d",$delta_unix_time);
                                
                                $stmt_update->bindParam ( ':user_id', $user_id , \PDO::PARAM_INT );
                                $stmt_update->bindParam ( ':expire_date', $expire_date , \PDO::PARAM_STR );
                                $stmt_update->execute ();
                                
                                $msg=sprintf("... il servizio scadrà il %s !!!",$expire_date);
                                $this->log->info ( $msg ); 
                                
                            }
                        }
                        $ret=true;
                    }
                    catch ( \PDOException $ex ) 
                    {
                        $this->id_error = $ex->getCode();
                        $this->descr_error = $ex->getMessage ();
                        $this->connetion=false;
                        $ret=false;
                        print_r("ufdpfiospfpiosadifposafdi");
                    }
		}
		return $ret;
	}
	
	public function finish() {
		$this->log->info ( "finish()" );
	}
	private function setStatus($id_schedulazione, $stato_schedulazione) {
		if ($this->connetion==true) {
			if($this->descr_error!="")
			{
				$str_error="[".$this->name_file."] ".$this->descr_error;
			}
			else 
			{
				$str_error="";
			}
			$sql = "UPDATE sc_config SET stato_schedulazione = :stato_schedulazione, id_error = :id_error, descr_error = :descr_error WHERE id_schedulazione = :id_schedulazione";
			$stmt = $this->dbh->prepare($sql);
			$stmt->bindParam ( ':stato_schedulazione', $stato_schedulazione, \PDO::PARAM_INT );
			$stmt->bindParam ( ':id_error', $this->id_error, \PDO::PARAM_INT );
			$stmt->bindParam ( ':descr_error', $str_error , \PDO::PARAM_STR );
			$stmt->bindParam ( ':id_schedulazione', $id_schedulazione, \PDO::PARAM_INT );
			$stmt->execute ();
		} 
	}
	public function refreshStatus($status) {
		$this->log->info ( "refreshStatus(" . self::boolToStr ( $status ) . ")" );
		
		if ($status == false) {
			self::setStatus ( $this->lista_parametri ['--id_schedulazione'], ERROR );
			$this->log->info ( "ERROR(" . $this->name_file . "): (" . $this->id_error.")-".$this->descr_error );
		} else {
			if ($this->lista_parametri ['--type'] == BATCH_UNA_TANTUM) {
				self::setStatus ( $this->lista_parametri ['--id_schedulazione'], FINISCHED );
			} else {
				self::setStatus ( $this->lista_parametri ['--id_schedulazione'], TO_BE_SUBMITTED );
			}
		}
	}
	private function getInputParameter($argv) {
		$this->lista_parametri = array ();
		
		foreach ( $argv as $arg ) {
			$tmp = explode ( '=', $arg );
			if (count ( $tmp ) == 2) {
				list ( $x, $y ) = $tmp;
				$this->lista_parametri ["$x"] = $y;
			}
		}
	}
}