<?php

    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | schedulerDBtype.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    namespace Scheduler\lib;
    
    
    class SchedulerDBtype
    {
	private $sc_type_lib	= array();
	private $log		= null;
	private $dbh		= null;
	private $name_file	= "";
	private $name_tabella = "sc_type_schedulazione_lib";


	function __construct()
	{
	}
	
	
	        
        function __destruct() 
        {
			$this->dbh=null;
		}
		
	public function connect()
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

		public function setLogger($log)
		{
			$this->log=$log;
		}     
		
		public function load()
		{
			if($this->dbh!=null)
			{
				unset($this->sc_type_lib);
				$this->sc_type_lib=array();
				$this->log->info("	Loading sc_type_lib...");
				
				try 
				{
				    
				    $statement=$this->dbh->query('SELECT * FROM '.$this->name_tabella);
				    
				    foreach($statement as $row) 
				    {
					  
						$this->sc_type_lib[$row['id_type_schedulazione']]=$row['descrizione'];
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
			return $this->sc_type_lib;
		}
		
		public function getAllType()
		{
			return $this->sc_type_lib;
		}
		
		public function getType($id_type)
		{
			if (array_key_exists($id_type, $this->sc_type_lib)) 
			{
			   return $this->sc_type_lib[$id_type];
			}
			else
			{
				$this->log->info("ERROR: type (".$id_type.") indefinito.");
			}
		}
	}