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
use Common\lib\Error;

require '../assets/lib/batch/batchGlobal.php';

class Batch30gg_work implements BatchGlobal {
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error=BATCH_WITHOUT_ERROR;
	private $descr_error="";
	
	function __construct() {
	}
	
	function __destruct() {
		$this->dbh = null;
	}
	
	private function boolToStr($b)
	{
		return ($b) ? 'true' : 'false';
	}
	
	private function connect() {
		$this->name_file = basename ( __FILE__, ".php" );
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
		} catch ( \PDOException $ex ) {
			$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			$this->dbh = null;
		}
	}
	
	public function setLogger($log) {
		$this->log = $log;
	}
	
	public function init() {
		$this->log->info ( "init()" );
		Batch30gg_work::connect ();
		if ($this->dbh == null) {
			$this->id_error=ERROR;
			$this->descr_error="Errore 1";
			return false;
		} else {
			return true;
		}
	}
	
	private function getIdUser($id_schedulazione)
	{
		if ($this->dbh != null) {
			
			try {
				$sql = "SELECT id_user FROM sc_config WHERE  id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare($sql);
				$stmt->bindParam(':id_schedulazione',$id_schedulazione, \PDO::PARAM_INT);
				$stmt->execute();
				
				foreach($stmt as $row)
				{
					$this->lista_parametri['--id_user']=$row ['id_user'];
				}
				return true;
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
				$this->dbh = null;
			}
		} else {
			$this->log->info ( "ERROR(" . $this->name_file . "): Connessione DB non stabilita." );
			$this->dbh = null;
		}
	}
	
	public function getParam($argv) {
		$this->log->info ( "getParam()" );
		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$msg="Il Batch è stato invocato senza parametri.";
			$this->log->info ( $msg );
			$this->id_error=ERROR;
			$this->descr_error="Errore 1";
			return false;
		}
		
		Batch30gg_work::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					Batch30gg_work::setStatus($this->lista_parametri['--id_schedulazione'],WORKING,BATCH_WITHOUT_ERROR,"dsad");
					Batch30gg_work::getIdUser($this->lista_parametri['--id_schedulazione']);
					return true;
				}else {
					$msg="Il Batch è stato invocato senza parametro --type";
					$this->log->info ( $msg );
					Batch30gg_work::setStatus($this->lista_parametri['--id_schedulazione'],ERROR,1,$msg);
					$this->id_error=ERROR;
					$this->descr_error=$msg;
					return false;
				}
			} else {
				
				$this->id_error=ERROR;
				$this->descr_error="Il Batch è stato invocato senza parametro --run_time";
				
				$this->log->info ( $this->descr_error );
				Batch30gg_work::setStatus($this->lista_parametri['--id_schedulazione'],ERROR,$this->id_error,$this->descr_error);
				
				return false;
			}
		} else {
			$this->id_error=ERROR;
			$this->descr_error="Il Batch è stato invocato senza parametro --id_batch";
			
			$this->log->info ( $this->descr_error );
			Batch30gg_work::setStatus($this->lista_parametri['--id_batch'],ERROR,$this->id_error,$this->descr_error);
			return false;
		}
	}
	
	public function getIdSchedulazione($argv) /* chiamata prima del log */
	{
		array_shift ( $argv );
	
		if (count ( $argv ) == 0) {
			$msg="-Il Batch è stato invocato senza parametri.";
			printf("%s\n", $msg );
			return -1;
		}
	
		Batch30gg_work::getInputParameter ( $argv );
	
		if (array_key_exists ( strtolower ( "--id_schedulazione" ), $this->lista_parametri )) 
		{
			printf("id_schedulazione=%d\n",$this->lista_parametri['--id_schedulazione']);
			return $this->lista_parametri['--id_schedulazione'];
		} else {
			$msg="-Il Batch è stato invocato senza parametro --id_schedulazione";
			printf("%s\n", $msg );
			return -1;
		}
	}
	
	
	public function info() {
		$this->log->info ( "info()" );
		$msg=sprintf("------------------------------------------------");
		$this->log->info( $msg );
		$msg=sprintf("Batch Name: %s",$this->name_file);
		$this->log->info( $msg );
		$msg=sprintf("Input param: ");
		$this->log->info( $msg );
		foreach ($this->lista_parametri as $key => $value)
		{
			$msg=sprintf("	%s: %s",$key,$value);
			$this->log->info ( $msg );
		}
		
		$msg=sprintf("------------------------------------------------");
		$this->log->info( $msg );
		
	}
	
	public function run() {
		$this->log->info ( "run()" );
		$command="sh '".getenv("REFRESH_TOKEN_CMD")."' " .$this->lista_parametri['--id_user'];

		$this->log->info($command);
		exec(escapeshellcmd($command),$output);
		
		foreach ($output as $key => $value)
		{
			$obj=json_decode($value);
			$ret=$obj->failed;
			if($ret==1)
			{
				$this->id_error=1;
				
				if(isset($obj->errors->general))
				{
					$this->log->info($obj->errors->general);
					$this->descr_error=$obj->errors->general;
				}
				else if(isset($obj->errors->google_accounts))
				{
					$this->log->info($obj->errors->google_accounts);
				}

				return false;
			}
		}
		
		return true;
		
	}
	
	public function  finish()
	{
		$this->log->info ( "finish()" );
		Batch30gg_work::setStatus($this->lista_parametri ['--id_schedulazione'],TO_BE_SUBMITTED,BATCH_WITHOUT_ERROR,"");
	}
	
	private function setStatus($id_schedulazione,$stato_schedulazione,$id_error,$descr_error)
	{
		if($this->dbh!=null)
		{
			$sql = "UPDATE sc_config SET stato_schedulazione = :stato_schedulazione, id_error = :id_error, descr_error = :descr_error WHERE id_schedulazione = :id_schedulazione";
			$stmt = $this->dbh->prepare($sql);
			$stmt->bindParam(':stato_schedulazione',$stato_schedulazione, \PDO::PARAM_INT);
			$stmt->bindParam(':id_error',$id_error, \PDO::PARAM_INT);
			$stmt->bindParam(':descr_error',$descr_error, \PDO::PARAM_STR);
			$stmt->bindParam(':id_schedulazione',$id_schedulazione, \PDO::PARAM_INT);
			$stmt->execute();
		}
		else
		{
			$this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
		}
	}
	
	public function refreshStatus($status) {
		$this->log->info ( "refreshStatus(".Batch30gg_work::boolToStr($status).")" );
		if($status==false)
		{
			Batch30gg_work::setStatus($this->lista_parametri ['--id_schedulazione'],ERROR,$this->id_error,$this->descr_error);
		}
		else
		{
			if($this->lista_parametri ['--type']==BATCH_UNA_TANTUM)
			{
				Batch30gg_work::setStatus($this->lista_parametri ['--id_schedulazione'],FINISCHED,BATCH_WITHOUT_ERROR,"");
			}
			else
			{
				Batch30gg_work::setStatus($this->lista_parametri ['--id_schedulazione'],TO_BE_SUBMITTED,BATCH_WITHOUT_ERROR,"");
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