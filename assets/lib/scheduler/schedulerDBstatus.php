<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | schedulerDBstatus.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Scheduler\lib;

class SchedulerDBstatus {
	private $sc_status_lib = array ();
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $name_tabella = "sc_stato_schedulazione_lib";
	private $connetion  = false;
	
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
			unset ( $this->sc_status_lib );
			$this->sc_status_lib = array ();
			$this->log->info ( "	Loading sc_status_lib..." );
			
			try {
				
				$statement = $this->dbh->query ( 'SELECT * FROM '.$this->name_tabella );
				
				foreach ( $statement as $row ) {
					$this->sc_status_lib [$row ['id_stato_schedulazione']] = $row ['descr_stato_schedulazione'];
				}
				return true;
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
				return false;
			}
		} else {
			$this->log->info ( "ERROR(" . $this->name_file . "): Connessione DB non stabilita." );
			return false;
		}
	}
	
	public function get() {
		return $this->sc_status_lib;
	}
	
	public function getAllStatus() {
		return $this->sc_status_lib;
	}
	
	public function getStatus($id_status) {
		if (array_key_exists ( $id_status, $this->sc_status_lib )) {
			return $this->sc_status_lib [$id_status];
		} else {
			$this->log->info ( "ERROR: status (" . $id_status . ") indefinito." );
		}
	}
}