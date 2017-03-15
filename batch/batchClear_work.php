<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batchClear_work.php
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
use Common\lib\Error;

require '../assets/lib/batch/batchGlobal.php';
require_once "../assets/lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';


class BatchClear_work implements BatchGlobal {
	
	
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error = BATCH_WITHOUT_ERROR;
	private $descr_error = "";
	private $connetion=false;
	private $JSONparam = null;
	
	
	function __construct() {
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
	}
	public function init() {
		
		$this->log->info ( "init()" );
		BatchClear_work::connect ();
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
			$this->descr_error = "Il Batch è stato invocato senza parametri.";
			return false;
		}
		
		BatchClear_work::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					BatchClear_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], WORKING, BATCH_WITHOUT_ERROR, "getParam OK" );
					return true;
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
		
		BatchClear_work::getInputParameter ( $argv );
		
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
		

		$msg = sprintf ( "------------------------------------------------" );
		$this->log->info ( $msg );
	}
	
	public function run()
	{
		$ret=true;
		$this->log->info ( "run()" );
		if ($this->connetion==true) 
		{
			$ret=true;
			/* Elenco i BATCH di tipo UNA_TANTUM nello stato FINISCHED */
			try 
			{
				$sql = "SELECT a.id_schedulazione,b.descr_batch,c.descr_stato_schedulazione,d.descr_type_schedulazione
						FROM sc_config a, batch_lib b, sc_stato_schedulazione_lib c, sc_type_schedulazione_lib d
						WHERE a.type_schedulazione=d.id_type_schedulazione 
							AND a.stato_schedulazione=c.id_stato_schedulazione 
							AND a.id_batch=b.id_batch 
							AND type_schedulazione = :type_schedulazione 
							AND stato_schedulazione = :stato_schedulazione";
				$stmt = $this->dbh->prepare($sql);
				$type_schedulazione=BATCH_UNA_TANTUM;
				$stato_schedulazione=FINISCHED;
				$stmt->bindParam ( ':type_schedulazione', $type_schedulazione , \PDO::PARAM_INT );
				$stmt->bindParam ( ':stato_schedulazione', $stato_schedulazione , \PDO::PARAM_INT );
				$stmt->execute ();
				
				while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
					$msg=sprintf("... Delete => %s(%d): %s - %s",$row->descr_batch,$row->id_schedulazione,$row->descr_type_schedulazione,$row->descr_stato_schedulazione);
					$this->log->info ( $msg );

				}
			
				$ret=true;
			}
			catch ( \PDOException $ex ) 
			{
				$this->id_error = $ex->getCode();
				$this->descr_error = $ex->getMessage ();
				$this->log->info ($this->descr_error);
			}
			
			/* cancello i BATCH di tipo UNA_TANTUM nello stato FINISCHED */
			try
			{
				$sql = "DELETE FROM sc_config WHERE
								 type_schedulazione = :type_schedulazione
								AND stato_schedulazione = :stato_schedulazione";
				$stmt = $this->dbh->prepare($sql);
				$type_schedulazione=BATCH_UNA_TANTUM;
				$stato_schedulazione=FINISCHED;
				$stmt->bindParam ( ':type_schedulazione', $type_schedulazione , \PDO::PARAM_INT );
				$stmt->bindParam ( ':stato_schedulazione', $stato_schedulazione , \PDO::PARAM_INT );
				$stmt->execute ();
			}
			catch ( \PDOException $ex )
			{
				$this->id_error = $ex->getCode();
				$this->descr_error = $ex->getMessage ();
				$this->log->info ($this->descr_error);
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
		$this->log->info ( "refreshStatus(" . BatchClear_work::boolToStr ( $status ) . ")" );
		
		if ($status == false) {
			BatchClear_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], ERROR );
			$this->log->info ( "ERROR(" . $this->name_file . "): (" . $this->id_error.")-".$this->descr_error );
		} else {
			if ($this->lista_parametri ['--type'] == BATCH_UNA_TANTUM) {
				BatchClear_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], FINISCHED );
			} else {
				BatchClear_work::setStatus ( $this->lista_parametri ['--id_schedulazione'], TO_BE_SUBMITTED );
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