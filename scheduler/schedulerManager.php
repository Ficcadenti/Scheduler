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
require '../assets/define/define.php';

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
	private $connetion=false;
	private $id_error = 0;
	private $descr_error = "";
	private $param = null;
	
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
		
		//printf ( "SCHEDULER_MANAGER Log path: %s\n", $this->service->makePathLog () );
		//printf ( "SCHEDULER_MANAGER Log file: <yyyy-mm-dd>.%s.log\n", $this->name_log_file );
		
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
		if($this->connetion==true)
		{
			$this->log->info ( "setBatch()" );
			$this->param = json_decode ( $parameter );

			/* check parameter */
			if (! isset ( $this->param->id_schedulazione )) 
			{
				$this->log->info("Non è definito il parametro 'id_schedulazione' !!!");
				return false;	
			}
			if (! isset ( $this->param->hostname ))
			{
				$this->log->info("Non è definito il parametro 'hostname' !!!");
				return false;
			}
			if (! isset ( $this->param->id_user ))
			{
				$this->log->info("Non è definito il parametro 'id_user' !!!");
				return false;
			}
			if (! isset ( $this->param->id_account_adw ))
			{
				$this->log->info("Non è definito il parametro 'id_account_adw' !!!");
				return false;
			}
			if (! isset ( $this->param->id_batch ))
			{
				$this->log->info("Non è definito il parametro 'id_batch' !!!");
				return false;
			}
			if (! isset ( $this->param->descr_schedulazione ))
			{
				$this->log->info("Non è definito il parametro 'descr_schedulazione' !!!");
				return false;
			}
			if (! isset ( $this->param->type_schedulazione ))
			{
				$this->log->info("Non è definito il parametro 'type_schedulazione' !!!");
				return false;
			}
			if (! isset ( $this->param->frequenza ))
			{
				$this->log->info("Non è definito il parametro 'frequenza' !!!");
				return false;
			}
			if (! isset ( $this->param->stato_schedulazione ))
			{
				$this->log->info("Non è definito il parametro 'stato_schedulazione' !!!");
				return false;
			}
			if (! isset ( $this->param->download_report_type ))
			{
				$this->log->info("Non è definito il parametro 'download_report_type' !!!");
				return false;
			}
			if (! isset ( $this->param->abilita_anagrafiche ))
			{
				$this->log->info("Non è definito il parametro 'abilita_anagrafiche' !!!");
				return false;
			}
			if (! isset ( $this->param->status_anagrafiche ))
			{
				$this->log->info("Non è definito il parametro 'status_anagrafiche' !!!");
				return false;
			}
			if (! isset ( $this->param->abilita_metriche ))
			{
				$this->log->info("Non è definito il parametro 'abilita_metriche' !!!");
				return false;
			}
			if (! isset ( $this->param->status_metriche ))
			{
				$this->log->info("Non è definito il parametro 'status_metriche' !!!");
				return false;
			}
			if (! isset ( $this->param->time_start ))
			{
				$this->log->info("Non è definito il parametro 'time_start' !!!");
				return false;
			}
			if (! isset ( $this->param->dal ))
			{
				$this->log->info("Non è definito il parametro 'dal' !!!");
				return false;
			}
			if (! isset ( $this->param->al ))
			{
				$this->log->info("Non è definito il parametro 'al' !!!");
				return false;
			}
		}
		else
		{
			$this->log->info("Errore generico con la connessione al Database !!!");
			return false;
		}
		
		return true;
	}
	
	public function unsetBatch() {
		$this->log->info ( "unsetBatch()" );
		$this->param=null;
	}
	
	public function insert() {
		$this->log->info ( "insert()" );
		
		$ret=DB_ERROR;
		if($this->connetion)
		{
			try {
				$sql = "INSERT INTO sc_config (hostname,id_user,id_batch,descr_schedulazione,parametri_batch,type_schedulazione,frequenza,stato_schedulazione,time_start,creation_time) 
						VALUES (:hostname,:id_user,:id_batch,:id_batch,:parametri_batch,:type_schedulazione,:frequenza,:stato_schedulazione,:time_start,:creation_time)";
						
						//id_user,id_batch,descr_schedulazione,parametri_batch,type_schedulazione,frequenza,stato_schedulazione,time_start,last_time_start,creation_time) VALUES (:hostname,:id_user,:id_batch,:descr_schedulazione,:parametri_batch,:type_schedulazione,:frequenza,:stato_schedulazione,:time_start,:last_time_start,:creation_time) ";

														
				$str_time=date("Y/m/d H:i:s",time());
				$str_param=json_encode($this->param);
				$stmt = $this->dbh->prepare ( $sql );
				
				$stmt->bindParam ( ':hostname', $this->param->hostname, \PDO::PARAM_STR );
				$stmt->bindParam ( ':id_user', $this->param->id_user, \PDO::PARAM_INT );
				$stmt->bindParam ( ':id_batch', $this->param->id_batch, \PDO::PARAM_INT );
				$stmt->bindParam ( ':descr_schedulazione', $this->param->descr_schedulazione, \PDO::PARAM_STR );
				$stmt->bindParam ( ':parametri_batch',$str_param , \PDO::PARAM_STR );
				$stmt->bindParam ( ':type_schedulazione', $this->param->type_schedulazione, \PDO::PARAM_INT );
				$stmt->bindParam ( ':frequenza', $this->param->frequenza, \PDO::PARAM_INT );
				$stmt->bindParam ( ':stato_schedulazione', $this->param->stato_schedulazione, \PDO::PARAM_INT );
				$stmt->bindParam ( ':time_start', $this->param->time_start, \PDO::PARAM_STR );
				$stmt->bindParam ( ':creation_time',$str_time, \PDO::PARAM_STR );
				$stmt->execute ();
				
				$this->param->id_schedulazione=$this->dbh->lastInsertId();

				$ret=DB_NO_ERROR;
				
			} catch ( \PDOException $ex ) {
				$this->id_error = DB_ERROR;
				$this->descr_error = $ex->getMessage ();
				$this->log->info ( $this->descr_error );
				$ret=DB_ERROR;
			}
		}
		else
		{
			$ret=DB_ERROR;
		}
		return $ret;
	}
	
	public function delete() {
		$this->log->info ( "delete()" );
		$ret=DB_ERROR;
		
		if($this->connetion)
		{
			try {
					$sql = "DELETE FROM sc_config WHERE  id_schedulazione = :id_schedulazione and id_user=:id_user";
					$stmt = $this->dbh->prepare ( $sql );
					$stmt->bindParam ( ':id_schedulazione', $this->param->id_schedulazione, \PDO::PARAM_INT );
					$stmt->bindParam ( ':id_user', $this->param->id_user, \PDO::PARAM_INT );
					printf("%d,%d\n",$this->param->id_user,$this->param->id_schedulazione);
					$stmt->execute ();
					$ret=DB_NO_ERROR;
				} catch ( \PDOException $ex ) 
				{
					$this->id_error = DB_ERROR;
					$this->descr_error = $ex->getMessage ();
					$this->log->info ( $this->descr_error );
				}
		}
		else
		{
			$ret=DB_ERROR;
		}
		
		return $ret;
	}
	
	public function update() {
		$this->log->info ( "update()" );
		$ret=DB_ERROR;
		if($this->connetion)
		{
			try {
				$sql = "UPDATE sc_config SET hostname=:hostname,id_batch=:id_batch,descr_schedulazione=:descr_schedulazione,parametri_batch=:parametri_batch,type_schedulazione=:type_schedulazione,frequenza=:frequenza,stato_schedulazione=:stato_schedulazione,time_start=:time_start,creation_time=:creation_time WHERE id_schedulazione = :id_schedulazione AND id_user = :id_user";
				$stmt = $this->dbh->prepare ( $sql );
				
				$str="";
				$str_time=date("Y/m/d H:i:s",time());
				$str_param=json_encode($this->param);
				$stmt = $this->dbh->prepare ( $sql );
				
				$stmt->bindParam ( ':id_schedulazione', $this->param->id_schedulazione, \PDO::PARAM_INT );
				$stmt->bindParam ( ':id_user', $this->param->id_user, \PDO::PARAM_INT );
				$stmt->bindParam ( ':hostname', $this->param->hostname, \PDO::PARAM_STR );
				$stmt->bindParam ( ':id_batch', $this->param->id_batch, \PDO::PARAM_INT );
				$stmt->bindParam ( ':descr_schedulazione', $this->param->descr_schedulazione, \PDO::PARAM_STR );
				$stmt->bindParam ( ':parametri_batch',$str_param , \PDO::PARAM_STR );
				$stmt->bindParam ( ':type_schedulazione', $this->param->type_schedulazione, \PDO::PARAM_INT );
				$stmt->bindParam ( ':frequenza', $this->param->frequenza, \PDO::PARAM_INT );
				$stmt->bindParam ( ':stato_schedulazione', $this->param->stato_schedulazione, \PDO::PARAM_INT );
				$stmt->bindParam ( ':time_start', $this->param->time_start, \PDO::PARAM_STR );
				$stmt->bindParam ( ':creation_time',$str_time, \PDO::PARAM_STR );
				
				$stmt->execute ();
				
			} catch ( \PDOException $ex ) {
				$this->id_error = DB_ERROR;
				$this->descr_error = $ex->getMessage ();
				$this->log->info ( $this->descr_error );
				$ret=DB_ERROR;
			}
		}
		else
		{
			$ret=DB_ERROR;
		}
		return $ret;
	}
	
	
	public function status() {
		$this->log->info ( "status()" );
		$ret=DB_ERROR;
		if($this->connetion)
		{
			try {
				$sql = "SELECT id_user FROM sc_config WHERE  id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare ( $sql );
				$stmt->bindParam ( ':id_schedulazione', $this->param->id_schedulazione, \PDO::PARAM_INT );
				$stmt->execute ();
				$count = $stmt->rowCount ();
				if ($count == 0) {
					$ret=NEW_BATCH;
				}
				else if ($count == 1) 
				{
					$ret=MODIY_BATCH;
				}
				else
				{
					$ret=DB_ERROR;
				}
			} catch ( \PDOException $ex ) {
				$this->id_error = DB_ERROR;
				$this->descr_error = $ex->getMessage ();
				$this->log->info ( $this->descr_error );
				$ret=DB_ERROR;
			}
		}
		else
		{
			$ret=DB_ERROR;
		}
		return $ret;
	}
	
	public function getIdSchedulazione() {
		return $this->param->id_schedulazione;
	}
	
	public function getAllIdSchedulazione() {
		$this->log->info ( "getIdSchedulazione(".$this->param->id_user.")" );
		$ret=null;
		if($this->connetion)
		{
			try {
				$sql = "SELECT id_schedulazione FROM sc_config WHERE  id_user = :id_user";
				$stmt = $this->dbh->prepare ( $sql );
				$stmt->bindParam ( ':id_user', $this->param->id_user, \PDO::PARAM_INT );
				$stmt->execute ();
				
				$ret=array();
				
				foreach ( $stmt as $row ) {
					array_push($ret,$row ['id_schedulazione']);
				}
				
			} catch ( \PDOException $ex ) {
				$this->id_error = DB_ERROR;
				$this->descr_error = $ex->getMessage ();
				$this->log->info ( $this->descr_error );
				$ret=null;
			}
		}
		else
		{
			$ret=null;
		}
		return $ret;
	}
	
	public function connect() {
		$this->name_file = basename ( __FILE__, ".php" );
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
	
	public function showParameter() {
		$this->log->info ( "showParameter()" );
		
		$this->log->info ( "id_schedulazione     : ". $this->param->id_schedulazione );
		$this->log->info ( "hostname             : ". $this->param->hostname );
		$this->log->info ( "id_user              : ". $this->param->id_user );
		$this->log->info ( "id_account_adw       : ". $this->param->id_account_adw );
		$this->log->info ( "id_batch             : ". $this->param->id_batch );
		$this->log->info ( "type_schedulazione   : ". $this->param->type_schedulazione );
		$this->log->info ( "frequenza            : ". $this->param->frequenza );
		$this->log->info ( "stato_schedulazione  : ". $this->param->stato_schedulazione );
		$this->log->info ( "download_report_type : ". $this->param->download_report_type );
		$this->log->info ( "abilita_anagrafiche  : ". $this->param->abilita_anagrafiche );
		$this->log->info ( "abilita_metriche     : ". $this->param->abilita_metriche );
		$this->log->info ( "time_start           : ". $this->param->time_start );
		$this->log->info ( "dal                  : ". $this->param->dal );
		$this->log->info ( "al                   : ". $this->param->al );
		
	}
}