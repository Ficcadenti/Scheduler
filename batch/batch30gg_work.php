<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batch30gg_work.php
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
require_once "../assets/lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';
require 'downloadAdWords.php';

class Batch30gg_work implements BatchGlobal {
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
		Batch30gg_work::connect ();
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
						if(Batch30gg_work::validateJSONParam($row ['parametri_batch']))
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
	
		return true;
	}
	
	public function setDataIntervall()
	{
		$t=time();
		$this->lista_parametri ['--al']=CommonService::strDadeGoogle($t);
		$t=$t-((60*60)*24)*30; /* 30gg*/
		$this->lista_parametri ['--dal']=CommonService::strDadeGoogle($t);
	}
	
	public function getParam($argv) {
		$this->log->info ( "getParam()" );
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$this->id_error = ERROR;
			$this->descr_error = "Il Batch è stato invocato senza parametri.";
			return false;
		}
		
		Batch30gg_work::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					Batch30gg_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], WORKING, BATCH_WITHOUT_ERROR, "dsad" );
					if (Batch30gg_work::getIdUser ( $this->lista_parametri ['--id_schedulazione'] ) == true) {
						/*if (Batch30gg_work::getJSONParam ( $this->lista_parametri ['--id_schedulazione'] ) == true) {
							return true;
						} else {
							return false;
						}*/
						Batch30gg_work::setDataIntervall();
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
		
		Batch30gg_work::getInputParameter ( $argv );
		
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
		
		/*
		 * $msg = sprintf ( "	--dal: %s", $this->JSONparam->dal );
		$this->log->info ( $msg );
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
		/*$param=array(
				'dal' => $this->JSONparam->dal,
				'al' => $this->JSONparam->al
		);*/
		$param=array(
				'dal' => $this->lista_parametri ['--dal'],
				'al' => $this->lista_parametri ['--al']
		);
		
		return $this->downAdWords->downloadAllReportsFromUserdId($this->lista_parametri ['--id_user'],$param);
	}
	
	public function run() {
		$ret=true;
		$this->log->info ( "run()" );
		
		$ret = Batch30gg_work::refreshToken();
		if($ret==true)
		{
			$this->downAdWords->connect();
			if ($this->downAdWords->getIdError()==BATCH_WITHOUT_ERROR)
			{
				$arrayFileCsv = Batch30gg_work::getReport();
				foreach ($arrayFileCsv as $key => $value)
				{
					$this->log->info ( "(".$key.")=> ".$value );
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
		$this->log->info ( "refreshStatus(" . Batch30gg_work::boolToStr ( $status ) . ")" );
		
		if ($status == false) {
			Batch30gg_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], ERROR );
			$this->log->info ( "ERROR(" . $this->name_file . "): (" . $this->id_error.")-".$this->descr_error );
		} else {
			if ($this->lista_parametri ['--type'] == BATCH_UNA_TANTUM) {
				Batch30gg_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], FINISCHED );
			} else {
				Batch30gg_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], TO_BE_SUBMITTED );
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