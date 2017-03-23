<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batchBDnToken.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Batch\lib;

class BatchBDnToken {
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $name_tabella = "batch_ntoken";
	private $connetion=false;
	private $countToken = array( "dev_token" => 0,
									"num_token" => 0
								);
	
	public function setDeveloperToken($t)
	{
		$this->countToken['dev_token']=$t;
		$this->countToken['num_token']=0;
	}
	
	public function incNumToken($t)
	{
		$this->countToken['num_token']++;
	}
	
	public function getNumToken()
	{
		$str=sprintf("%s: %d",$this->countToken['dev_token'],$this->countToken['num_token']);
		return $str;
	}
	
	
	function __construct() {
	}
	
	function __destruct() {
		$this->dbh = null;
	}
	
	public function connect() {
		$this->name_file = basename ( __FILE__, ".php" );
		
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_SCHEDULER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
			$this->connetion=true;
		} catch ( \PDOException $ex ) {
			$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			$this->connetion=false;
		}
	}
	
	public function setLogger($log) {
		$this->log = $log;
	}
	
	public function load() {
		if ($this->connetion==true) {
			unset ( $this->batch_type_lib );
			$this->batch_type_lib = array ();
			$this->log->info ( "Loading batch_type_lib..." );
			
			try {
				
				$statement = $this->dbh->query ( 'SELECT * FROM '.$this->name_tabella );
				
				foreach ( $statement as $row ) 
				{
					$this->countToken ['dev_doken'] = $row ['dev_doken'];
					$this->countToken ['num_token'] = $row ['num_token'];
				}
				return true;
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
				return false;
			}
		} else {
			$this->log->info ( "ERROR(" . $this->name_file . "): Connessione DB non stabilita111." );
			return false;
		}
	}

}
