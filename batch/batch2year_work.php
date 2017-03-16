<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | self.php
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
use Common\lib\CommonService;
use Batch\DownloadAdWords;

use Common\lib\Error;

require '../assets/lib/batch/batchGlobal.php';
require '../assets/lib/batch/downloadAdWords.php';

require_once "../assets/lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';

class Batch2year_work implements BatchGlobal {
	
	private $typeBatch = ANNI_2;
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error = BATCH_WITHOUT_ERROR;
	private $descr_error = "";
	private $connetion=false;
	private $downAdWords= null;
	private $JSONparam = null;
	
	
	function __construct() {
		$this->downAdWords=new DownloadAdWords();
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
		$this->downAdWords->setLogger ( $log );
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
	private function getIdUser($id_schedulazione) {
		if ($this->connetion==true) {
			
			try {
				$sql = "SELECT id_user FROM sc_config WHERE  id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare ( $sql );
				$stmt->bindParam ( ':id_schedulazione', $id_schedulazione, \PDO::PARAM_INT );
				$stmt->execute ();
				
				$count = $stmt->rowCount ();
				if ($count == 1) {
					foreach ( $stmt as $row ) {
						$this->lista_parametri ['--id_user'] = $row ['id_user'];
					}
					
					return true;
				} else {
					if ($count == 0) {
						$this->id_error = ERROR;
						$this->descr_error = "Non esistono schedulazioni con id_schedulazione=" . $id_schedulazione;
						$this->log->info ( $this->descr_error );
					} else {
						$this->id_error = ERROR;
						$this->descr_error = "Ci sono più schedulazioni con lo stesso id_schedulazione=" . $id_schedulazione;
						$this->log->info ( $this->descr_error );
					}
					return false;
				}
			} catch ( \PDOException $ex ) {
				$this->id_error = ERROR;
				$this->descr_error = $ex->getMessage ();
				return false;
			}
		} else {
			return false;
		}
	}
	
	private function getJSONParam($id_schedulazione) {
		if ($this->connetion==true) {
				
			try {
				$sql = "SELECT parametri_batch FROM sc_config WHERE  id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare ( $sql );
				$stmt->bindParam ( ':id_schedulazione', $id_schedulazione, \PDO::PARAM_INT );
				$stmt->execute ();
	
				$count = $stmt->rowCount ();
				if ($count == 1) {
					foreach ( $stmt as $row ) {
						//$this->lista_parametri ['--parametri_batch'] = $row ['parametri_batch'];
						if(self::validateJSONParam($row ['parametri_batch']))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					return true;
				} else {
					if ($count == 0) {
						$this->id_error = ERROR;
						$this->descr_error = "Non esistono schedulazioni con id_schedulazione=" . $id_schedulazione;
						$this->log->info ( $this->descr_error );
					} else {
						$this->id_error = ERROR;
						$this->descr_error = "Ci sono più schedulazioni con lo stesso id_schedulazione=" . $id_schedulazione;
						$this->log->info ( $this->descr_error );
					}
					return false;
				}
			} catch ( \PDOException $ex ) {
				$this->id_error = ERROR;
				$this->descr_error = $ex->getMessage ();
				return false;
			}
		} else {
			return false;
		}
	}
	
	public function validateJSONParam($parameter) {

			$this->log->info ( "setBatch()" );
			$this->JSONparam = json_decode ( $parameter );
	
			/* check parameter */
			if (! isset ( $this->JSONparam->id_account_adw ))
			{
				$this->log->info("Non è definito il parametro 'id_account_adw' !!!");
				return false;
			}
			if (! isset ( $this->JSONparam->download_report_type ))
			{
				$this->log->info("Non è definito il parametro 'download_report_type' !!!");
				return false;
			}
			if($this->typeBatch==USER_DEFINED)
			{
				if (! isset ( $this->JSONparam->dal ))
				{
					$this->log->info("Non è definito il parametro 'dal' !!!");
					return false;
				}
				if (! isset ( $this->JSONparam->al ))
				{
					$this->log->info("Non è definito il parametro 'al' !!!");
					return false;
				}
			}
	
		return true;
	}
	
	public function setDataIntervall()
	{
		$t_al=time();
		
		switch($this->typeBatch)
		{
			case GIORNI_30: /* Calcolo i 30 giorni   */
				{
					$t_dal=$t_al-((60*60)*24)*30; /* 30gg*/
					$this->lista_parametri ['--dal']=CommonService::strDadeGoogle($t_dal);
					$this->lista_parametri ['--al']=CommonService::strDadeGoogle($t_al);
				}break;
			case GIORNI_60: /* Calcolo i 60 giorni   */
				{
					$t_dal=$t_al-((60*60)*24)*60; /* 60gg*/
					$this->lista_parametri ['--dal']=CommonService::strDadeGoogle($t_dal);
					$this->lista_parametri ['--al']=CommonService::strDadeGoogle($t_al);
				}break;
			case ANNI_2: /* Calcolo i 2 anni  */
				{
					$t_dal=$t_al-(((60*60)*24)*365)*2; /* 2anni*/
					$this->lista_parametri ['--dal']=CommonService::strDadeGoogle($t_dal);
					$this->lista_parametri ['--al']=CommonService::strDadeGoogle($t_al);
				}break;
			case USER_DEFINED: /* vengono dai parametri JSON passati dal be */
				{
					$this->lista_parametri ['--dal']=$this->JSONparam->dal;
					$this->lista_parametri ['--al']=$this->JSONparam->al;			
				}break;
		}
	}
	
	public function getParam($argv) {
		$this->log->info ( "getParam()" );
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$this->id_error = ERROR;
			$this->descr_error = "Il Batch è stato invocato senza parametri.";
			return false;
		}
		
		self::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					self::setStatus ( $this->lista_parametri ['--id_schedulazione'], WORKING, BATCH_WITHOUT_ERROR, "dsad" );
					if (self::getIdUser ( $this->lista_parametri ['--id_schedulazione'] ) == true) {
						
						if (self::getJSONParam ( $this->lista_parametri ['--id_schedulazione'] ) == true) {
							self::setDataIntervall();
							return true;
						} else {
							return false;
						}
						
						return true;
					} else {
						return false;
					}
				} else {
					$this->id_error = ERROR;
					$this->descr_error = "Il Batch è stato invocato senza parametro --type";
					return false;
				}
			} else {
				
				$this->id_error = ERROR;
				$this->descr_error = "Il Batch è stato invocato senza parametro --run_time";
				return false;
			}
		} else {
			$this->id_error = ERROR;
			$this->descr_error = "Il Batch è stato invocato senza parametro --id_batch";
			return false;
		}
	}
	public function getIdSchedulazione($argv) /* chiamata prima del log */
	{
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$msg = "-Il Batch è stato invocato senza parametri.";
			printf ( "%s\n", $msg );
			return - 1;
		}
		
		self::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			return $this->lista_parametri ['--id_schedulazione'];
		} else {
			$msg = "-Il Batch è stato invocato senza parametro --id_schedulazione";
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
		
		
		$msg = sprintf ( "	--id_account_adw: %s", $this->JSONparam->id_account_adw );
		$this->log->info ( $msg );
		$msg = sprintf ( "	--download_report_type: %s", $this->JSONparam->download_report_type );
		$this->log->info ( $msg );
		/*
		$msg = sprintf ( "	--al: %s", $this->JSONparam->al );
		$this->log->info ( $msg );
		*/
		$msg = sprintf ( "------------------------------------------------" );
		$this->log->info ( $msg );
	}
	
	private function refreshToken()
	{
		$this->log->info ( "refreshToken()" );
		$command = "sh '" . getenv ( "REFRESH_TOKEN_CMD" ) . "' " . $this->lista_parametri ['--id_user'];
		
		$this->log->info ( $command );
		exec ( escapeshellcmd ( $command ), $output );
		
		
		foreach ( $output as $key => $value ) {
			$this->log->info($key."=> ".$value);
			$obj = json_decode ( $value );
			$ret = $obj->failed;
			if ($ret == 1) {
				$this->id_error = 1;
		
				if (isset ( $obj->errors->general )) {
					$this->log->info ( $obj->errors->general );
					$this->descr_error = $obj->errors->general;
					$this->id_error = ERROR;
					$this->descr_error = $obj->errors->general;
				} else if (isset ( $obj->errors->google_accounts )) {
					$this->id_error = ERROR;
					$this->descr_error =  $obj->errors->google_accounts;
					$this->log->info ( $obj->errors->google_accounts );
				}
		
				return false;
			}
		}
		
		return true;
	}
	
	private function getReport()
	{
		$this->log->info ( "getReport(".$this->lista_parametri ['--id_user'].")" );

		$param=array(
				'customer_id' => $this->JSONparam->id_account_adw,
				'download_report_type' => $this->JSONparam->download_report_type,
				'dal' => $this->lista_parametri ['--dal'],
				'al' => $this->lista_parametri ['--al']
		);
		
		return $this->downAdWords->downloadAllReportsFromUserdId($this->lista_parametri ['--id_user'],$param);
	}
	
	private function writeDB($user_id,$fileCSV) 
	{
		$this->log->info ( "... writeDB(".$user_id.",".getenv ( 'CSV_PATH_FILE' )."/".$fileCSV.")" );
		
		$import=$this->downAdWords->writeDB($this->lista_parametri ['--id_user'],$fileCSV);
		if($import==true)
		{
			
		}
		else
		{
			
		}
		return $import;
	}
	
	private function renameCSVtoIMP($csv_file)
	{
		$path_csv=getenv ( 'CSV_PATH_FILE' );
		$path_imp=getenv ( 'IMP_PATH_FILE' );
		$imp_file=str_replace("csv","imp",$csv_file);
		$this->log->info ( "... renameCSVtoIMP(".$path_csv."/".$csv_file." --> ".$path_imp."/".$imp_file .")" );
		$ok = rename($path_csv."/".$csv_file, $path_imp."/".$imp_file);
		
		return $ok;
	}
	
	public function run() {
		$ret=true;
		$this->log->info ( "run()" );
		
		$ret = self::refreshToken();
		if($ret==true)
		{
			$this->downAdWords->connect();
			if ($this->downAdWords->getIdError()==BATCH_WITHOUT_ERROR)
			{
				$arrayFileCsv = self::getReport();
				foreach ($arrayFileCsv as $key => $value)
				{
					$import=self::writeDB($this->lista_parametri ['--id_user'],$value);
					if($import==true)
					{
						$ren=self::renameCSVtoIMP($value);
						if($ren==false)
						{
							$this->id_error = ERROR;
							$this->descr_error = "Errore rename file ".$value;
							return false;
						}
					}
					else 
					{
						$this->id_error = ERROR;
						$this->descr_error = "Errore import file ".$value;
						return false;
					}
				}
				$ret=true;
			}
			else 
			{
				$this->id_error = $this->downAdWords->getIdError();
				$this->descr_error = $this->downAdWords->getDescError();
				$ret=false;
			}
		}
		
		return $ret;
	}
	public function finish() {
		$this->log->info ( "finish()" );
	}
	private function setStatus($id_schedulazione, $stato_schedulazione) {
		if ($this->connetion==true) {
			$str_error="[".$this->name_file."] ".$this->descr_error;
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