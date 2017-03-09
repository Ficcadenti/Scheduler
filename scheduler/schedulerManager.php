<?php

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | schedulerManager.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
namespace Scheduler;

use Scheduler\lib\SchedulerManagerLogConfigurator;
use SchedulerManager\lib\SchedulerManagerService;

/* load librerie e define globali */
require '../vendor/autoload.php';

/* load librerie schedulatore */
require '../assets/lib/schedulermanager/schedulerManagerLogConfigurator.php';
require '../assets/lib/schedulermanager/schedulerManagerService.php';
class SchedulerManager {
	
	private $name_log_file = "schedulerManager";
	private $sc_type_lib = array ();
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $name_tabella = "sc_config";
	private $configuration_log = array (
			'LOG_ECHO' => 1,
			'LOG_DAILYFILE' => 2 
	);
	
	function __construct() {
		$this->service = new SchedulerManagerService ();
		
		/* puntamento al file .env */
		try {
			$dotenv = new \Dotenv\Dotenv ( __DIR__ . "/../assets/env" );
			$dotenv->load ();
			$dotenv->required ( [ 
					'SCHEDULER_MANAGER_DIR',
					'SCHEDULER_MANAGER_LOG_DIR' 
			] );
		} catch ( Exception $ex ) {
			printf ( "%s\n", $ex->getMessage () );
			exit ();
		}
		
		printf ( "SCHEDULER_MANAGER Log path: %s\n", $this->service->makePathLog () );
		printf ( "SCHEDULER_MANAGER Log file: <yyyy-mm-dd>.%s.log\n", $this->name_log_file );
		
		\Logger::configure ( $this->configuration_log, new SchedulerManagerLogConfigurator ( $this->service->makePathLog (), $this->name_log_file ) );
		$this->log = \Logger::getLogger ( "schedulerManagerLogger" );
		
		$this->service->setLogger ( $this->log );
		$this->service->clearLog ();
		
		SchedulerManager::connect ();
	}
	
	function __destruct() {
		$this->dbh = null;
	}
	
	public function setBatch($parameter) {
		if(!$this->dbh = null)
		{
			$this->log->info ( "setBatch()" );
			return true;
		}else
		{
			return false;
		}
	}
	
	public function unsetBatch() {
		$this->log->info ( "unsetBatch()" );
	}
	
	public function insert() {
		$this->log->info ( "insert()" );
	}
	
	public function delete() {
		$this->log->info ( "delete()" );
	}
	
	public function update() {
		$this->log->info ( "update()" );
	}
	
	public function status() {
		$this->log->info ( "status()" );
		return true;
	}
	
	public function getIdSchedulazione() {
		$this->log->info ( "getIdSchedulazione()" );
		return 100;
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
	
	public function showParameter() {
		$this->log->info ( "showParameter()" );
	}
}