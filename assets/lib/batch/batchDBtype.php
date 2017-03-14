<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batchBDtype.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Batch\lib;

class BatchDBType {
	private $batch_type_lib = array ();
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $name_tabella = "batch_type_lib";
	private $connetion=false;
	
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
			unset ( $this->$batch_type_lib );
			$this->$batch_type_lib = array ();
			$this->log->info ( "	Loading batch_type_lib..." );
			
			try {
				
				$statement = $this->dbh->query ( 'SELECT * FROM '.$this->name_tabella );
				
				foreach ( $statement as $row ) {
					$this->$batch_type_lib [$row ['id_batch_type']] = $row ['descrizione'];
				}
				return true;
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			}
		} else {
			$this->log->info ( "ERROR(" . $this->name_file . "): Connessione DB non stabilita." );
		}
	}
	
	public function get() {
		return $this->$batch_type_lib;
	}
	
	public function getAllType() {
		return $this->$batch_type_lib;
	}
	
	public function getStatus($id_batch_type) {
		if (array_key_exists ( $id_batch_type, $this->$batch_type_lib )) {
			return $this->$batch_type_lib [$id_batch_type];
		} else {
			$this->log->info ( "ERROR: type (" . $id_batch_type . ") indefinito." );
		}
	}
}