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
			unset ( $this->batch_type_lib );
			$this->batch_type_lib = array ();
			
			try {
				
				$statement = $this->dbh->query ( 'SELECT * FROM '.$this->name_tabella );
				
				foreach ( $statement as $row ) {
					$this->batch_type_lib [$row ['id_download_report_type']] = array(
															'descrizione'=>$row ['descrizione'],
															'suffisso_file_csv'=>$row ['suffisso_file_csv']);
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
	
	public function get() {
		return $this->batch_type_lib;
	}
	
	public function getAllType() {
		return $this->batch_type_lib;
	}
	
	public function getDescrizione($id_batch_type) {
		if (array_key_exists ( $id_batch_type, $this->batch_type_lib )) {
			return $this->batch_type_lib [$id_batch_type]['descrizione'];
		} else {
			$this->log->info ( "ERROR: type (" . $id_batch_type . ") indefinito." );
		}
	}
	
	public function getSuffisso($id_batch_type) {
		if (array_key_exists ( $id_batch_type, $this->batch_type_lib )) {
			return $this->batch_type_lib [$id_batch_type]['suffisso_file_csv'];
		} else {
			$this->log->info ( "ERROR: type (" . $id_batch_type . ") indefinito." );
		}
	}
}