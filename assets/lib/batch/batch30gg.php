<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batch30gg.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Batch\lib;

use Batch\lib\BatchGlobal;
use Common\lib\Error;

require 'batchGlobal.php';

class Batch30gg implements BatchGlobal {
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error=-1;
	
	function __construct() {
	}
	function __destruct() {
		$this->dbh = null;
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
		Batch30gg::connect ();
		if ($this->dbh == null) {
			return false;
		} else {
			return true;
		}
	}
	public function getParam($argv) {

		array_shift ( $argv );
		
		if (count ( $argv ) == 0) {
			$msg="Il Batch è stato invocato senza parametri.";
			$this->log->info ( $msg );
			return false;
		}
		
		Batch30gg::getInputParameter ( $argv );
		
		if (array_key_exists ( strtolower ( "--id_batch" ), $this->lista_parametri )) {
			if (array_key_exists ( strtolower ( "--run_time" ), $this->lista_parametri )) {
				if (array_key_exists ( strtolower ( "--type" ), $this->lista_parametri )) {
					Batch30gg::setStatus($this->lista_parametri['--id_batch'],WORKING,BATCH_WITHOUT_ERROR,"dsad");
					return true;
				}else {
					$msg="Il Batch è stato invocato senza parametro --type";
					$this->log->info ( $msg );
					Batch30gg::setStatus($this->lista_parametri['--id_batch'],ERROR,1,$msg);
					return false;
				}
			} else {
				$msg="Il Batch è stato invocato senza parametro --run_time";
				$this->log->info ( $msg );
				Batch30gg::setStatus($this->lista_parametri['--id_batch'],ERROR,1,$msg);
				return false;
			}
		} else {
			$msg="Il Batch è stato invocato senza parametro --id_batch";
			$this->log->info ( $msg );
			return false;
		}
	}
	
	public function info() {
		$this->log->info ( "info()" );
		
	}
	
	public function run() {
		$this->log->info ( "START Batch Test(" . $this->lista_parametri ['--id_batch'] . "," . $this->lista_parametri ['--run_time'] . ")." );
		Batch30gg::setStatus($this->lista_parametri ['--id_batch'],WORKING,BATCH_WITHOUT_ERROR,"");
	}
	
	private function setStatus($id_batch,$status,$id_error,$descr_error)
	{
		if($this->dbh!=null)
		{
			$sql = "UPDATE sc_config SET status = :status, id_error = :id_error, descr_error = :descr_error WHERE id_batch = :id_batch";
			$stmt = $this->dbh->prepare($sql);
			$stmt->bindParam(':status',$status, \PDO::PARAM_INT);
			$stmt->bindParam(':id_error',$id_error, \PDO::PARAM_INT);
			$stmt->bindParam(':descr_error',$descr_error, \PDO::PARAM_STR);
			$stmt->bindParam(':id_batch',$id_batch, \PDO::PARAM_INT);
			$stmt->execute();
		}
		else
		{
			$this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			$this->dbh=null;
		}
	}
	
	public function refreshStatus($status) {
		$this->log->info ( "refreshStatus()" );
		if($status==false)
		{
			Batch30gg::setStatus($this->lista_parametri ['--id_batch'],WORKING,BATCH_WITHOUT_ERROR,"");
		}
		else
		{
			if($this->lista_parametri ['--type']==BATCH_UNA_TANTUM)
			{
				Batch30gg::setStatus($this->lista_parametri ['--id_batch'],FINISCHED,BATCH_WITHOUT_ERROR,"");
			}
			else
			{
				Batch30gg::setStatus($this->lista_parametri ['--id_batch'],TO_BE_SUBMITTED,BATCH_WITHOUT_ERROR,"");
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