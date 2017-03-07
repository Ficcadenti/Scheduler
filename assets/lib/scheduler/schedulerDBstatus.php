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
	
	function __construct() {
	}
	
	function __destruct() {
		$this->dbh = null;
	}
	
	public function connect() {
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
	
	public function load() {
		if ($this->dbh != null) {
			unset ( $this->sc_status_lib );
			$this->sc_status_lib = array ();
			$this->log->info ( "	Loading sc_status_lib..." );
			
			try {
				
				$statement = $this->dbh->query ( 'SELECT * from sc_status_lib' );
				
				foreach ( $statement as $row ) {
					$this->sc_status_lib [$row ['id_status']] = $row ['descr_status'];
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