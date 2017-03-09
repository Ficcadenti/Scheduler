<?php

    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | schedulerDBconfig.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    namespace Scheduler\lib;
    
    
    class SchedulerDBconfig
    {
		private $sc_config	= array();
		private $log		= null;
		private $dbh		= null;
		private $name_file	= "";

		
		function __construct()
	    {
			
	    }
	    
	    function connect()
	    {
			$this->name_file=basename(__FILE__, ".php");
			try 
			{
			    $this->dbh = new \PDO('mysql:host='.getenv('DB_HOST').';dbname='.getenv('DB_NAME'), getenv('DB_USER') , getenv('DB_PASS'));
			} 
			catch (\PDOException $ex) 
			{
			    $this->log->info("ERROR(".$this->name_file."): ".$ex->getMessage());
			    $this->dbh=null;
			}
	    }
	        
        function __destruct() 
        {
			$this->dbh=null;
		}

		public function setLogger($log)
		{
			$this->log=$log;
		}
		
		public function load()
		{
			if($this->dbh!=null)
			{
				unset($this->sc_config);
				$this->sc_config=array();
				$this->log->info("	Loading sc_config...");

				try 
				{
				    
				    $statement=$this->dbh->query('SELECT a.id_schedulazione,
				    										a.hostname,
				    										a.descr_schedulazione,
				    										a.id_user,
				    										b.id_batch,
				    										b.name_batch,
				    										b.descr_batch,
				    										b.phpname_batch,
				    										a.type_schedulazione,
												    		a.frequenza,
												    		a.time_start,
												    		a.last_time_start,
												    		a.stato_schedulazione,
												    		a.pid,
												    		a.creation_time,
												    		a.id_error,
												    		a.descr_error
				    								FROM sc_config a, batch_lib b 
				    								WHERE a.id_batch=b.id_batch');
				    
				    foreach($statement as $row) 
				    {
						$a=array();
						$a['id_schedulazione']=$row['id_schedulazione'];
						$a['hostname']=$row['hostname']; /* attualmente non gestito */
						$a['descr_schedulazione']=$row['descr_schedulazione'];
						$a['id_user']=$row['id_user'];
						$a['id_batch']=$row['id_batch'];
						$a['name_batch']=$row['name_batch'];
						$a['descr_batch']=$row['descr_batch'];
						$a['phpname_batch']=$row['phpname_batch'];
						$a['type_schedulazione']=$row['type_schedulazione'];
						$a['frequenza']=$row['frequenza'];
						$a['time_start']=$row['time_start'];
						$a['last_time_start']=$row['last_time_start'];
						$a['stato_schedulazione']=$row['stato_schedulazione'];
						$a['pid']=$row['pid'];
						$a['creation_time']=$row['creation_time'];
						$a['id_error']=$row['id_error'];
						$a['descr_error']=$row['descr_error'];
						
						array_push($this->sc_config,$a);
						
				    }

				    return true;
				} 
				catch (\PDOException $ex) 
				{
				    $this->log->info("ERROR(".$this->name_file."): ".$ex->getMessage());
				    $this->dbh=null;
				}
			}
			else 
			{
			      $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			      $this->dbh=null;
			}
		}
		
		public function get()
		{
			return $this->sc_config;
		}
		
		
		public function getAllconfig()
		{
			return $this->sc_config;
		}

		public function getDBConfig($id)
		{
			//return $this->sc_config[$id_status];
		}
		
		public function setStatus($id_schedulazione,$stato_schedulazione)
		{
		    if($this->dbh!=null)
		    {
			  $sql = "UPDATE sc_config SET stato_schedulazione = :stato_schedulazione WHERE id_schedulazione = :id_schedulazione";
			  $stmt = $this->dbh->prepare($sql);                                  
			  $stmt->bindParam(':stato_schedulazione',$stato_schedulazione, \PDO::PARAM_INT); 
			  $stmt->bindParam(':id_schedulazione',$id_schedulazione, \PDO::PARAM_INT); 
			  $stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}

		public function setNextStartTime($id_schedulazione,$t)
		{
		    if($this->dbh!=null)
		    {
		    	$str_t=date("Y/m/d H:i:s",$t);
				$sql = "UPDATE sc_config SET time_start = :time_start WHERE id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare($sql);                                  
				$stmt->bindParam(':time_start',$str_t, \PDO::PARAM_STR); 
				$stmt->bindParam(':id_schedulazione',$id_schedulazione, \PDO::PARAM_INT); 
				$stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}

		public function setLastStartTime($id_schedulazione,$t)
		{
		    if($this->dbh!=null)
		    {
		    	$str_t=date("Y/m/d H:i:s",$t);
				$sql = "UPDATE sc_config SET last_time_start = :last_time_start WHERE id_schedulazione = :id_schedulazione";
				$stmt = $this->dbh->prepare($sql);                                  
				$stmt->bindParam(':last_time_start',$str_t, \PDO::PARAM_STR); 
				$stmt->bindParam(':id_schedulazione',$id_schedulazione, \PDO::PARAM_INT); 
				$stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}
    }