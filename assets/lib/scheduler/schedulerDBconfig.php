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
				    
				    $statement=$this->dbh->query('SELECT * from sc_config');
				    
				    foreach($statement as $row) 
				    {
						$a=array();
						$a['id_batch']=$row['id_batch'];
						$a['descr_batch']=$row['descr_batch'];
						$a['phpname_batch']=$row['phpname_batch'];
						$a['id_type']=$row['id_type'];
						$a['periodo']=$row['periodo'];
						$a['time_start']=$row['time_start'];
						$a['last_time_start']=$row['last_time_start'];
						$a['status']=$row['status'];
						$a['id_error']=$row['id_error'];
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
		
		public function setStatus($id_batch,$status)
		{
		    if($this->dbh!=null)
		    {
			  $sql = "UPDATE sc_config SET status = :status WHERE id_batch = :id_batch";
			  $stmt = $this->dbh->prepare($sql);                                  
			  $stmt->bindParam(':status',$status, \PDO::PARAM_INT); 
			  $stmt->bindParam(':id_batch',$id_batch, \PDO::PARAM_INT); 
			  $stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}

		public function setNextStartTime($id_batch,$t)
		{
		    if($this->dbh!=null)
		    {
		    	$str_t=date("Y/m/d H:i:s",$t);
				$sql = "UPDATE sc_config SET time_start = :time_start WHERE id_batch = :id_batch";
				$stmt = $this->dbh->prepare($sql);                                  
				$stmt->bindParam(':time_start',$str_t, \PDO::PARAM_STR); 
				$stmt->bindParam(':id_batch',$id_batch, \PDO::PARAM_INT); 
				$stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}

		public function setLastStartTime($id_batch,$t)
		{
		    if($this->dbh!=null)
		    {
		    	$str_t=date("Y/m/d H:i:s",$t);
				$sql = "UPDATE sc_config SET last_time_start = :last_time_start WHERE id_batch = :id_batch";
				$stmt = $this->dbh->prepare($sql);                                  
				$stmt->bindParam(':last_time_start',$str_t, \PDO::PARAM_STR); 
				$stmt->bindParam(':id_batch',$id_batch, \PDO::PARAM_INT); 
				$stmt->execute(); 
		    }
		    else 
		    {
			  $this->log->info("ERROR(".$this->name_file."): Connessione DB non stabilita.");
			  $this->dbh=null;
		    }
		}
    }