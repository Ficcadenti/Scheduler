<?php

namespace Batch;

use Batch\lib\BatchDBType;

require 'batchDBtype.php';

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

class CheckPagamento
{
	private $log                = null;
	private $dbh                = null;
	private $name_file          = "";
	private $lista_parametri    = array ();
	private $id_error           = BATCH_WITHOUT_ERROR;
	private $descr_error        = "";
	private $connetion          = false;
	private $param              = array();
	private $pid                = -1;
	private $batchType          = null;
	
	

	function __construct() {
		$this->name_file = basename ( __FILE__, ".php" );
		$this->pid=getmypid();
		$this->batchType=new BatchDBType();
		print_r(dirname(dirname(__FILE__)));
	}
	
	function __destruct() {
	}

	private function boolToStr($b) {
		return ($b) ? 'true' : 'false';
	}

	public function connect() {
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_ADPMANAGER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
			$this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
			$this->connetion=true;

		} catch ( \PDOException $ex ) {
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] ". $ex->getMessage ();
			$this->log->info ( $this->descr_error );
			$this->connetion=false;
		}
	}
	
	public function getIdError()
	{
		return $this->id_error;
	}

	public function getDescError()
	{
		return $this->descr_error;
	}
	
	public function setLogger($log) {
		$this->log = $log;
		$this->batchType->setLogger ( $log );
	}

	public function info() {
		$this->log->info ( "info()" );
	}
	
	
        public function checkPagamento($user_id) {
            return true;
        }
}