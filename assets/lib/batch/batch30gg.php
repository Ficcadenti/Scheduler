<?php

    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | batch30gg.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    namespace Batch\lib;

    use Batch\lib\BatchGlobal;

    require 'batchGlobal.php';
    
    
    class Batch30gg implements BatchGlobal
    {
        private $log             = null;
        private $dbh             = null;
        private $name_file       = "";
        private $lista_parametri = array();

        function __construct()
        {
        }

        function __destruct() 
        {
            $this->dbh=null;
        }
        
        private function connect()
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

        public function init()
        {
	     $this->log->info("init()");
	     Batch30gg::connect();
         if($this->dbh==null)
         {
            return false;
         }else
         {
            return true;
         }
        }

        public function getParam($argv)
        {
	    array_shift($argv);

	    if (count($argv) == 0) 
	    {
		    $this->log->info("Il Batch è stato invocato senza parametri.");
		    return false;
	    }
		
		Batch30gg::getInputParameter($argv);
		
		
		
	    if (array_key_exists(strtolower("--id_batch"), $this->lista_parametri) )
	    {
		    if (array_key_exists(strtolower("--run_time"), $this->lista_parametri) )
		    {
			    return true;
		    }
		    else
		    {
			    $this->log->info("Il Batch è stato invocato senza parametro --run_time");
			    
		    }
	    }
	    else
	    {
		    $this->log->info("Il Batch è stato invocato senza parametro --id_batch");
		    return false;
	    }
		
        }

        public function info()
        {
            $this->log->info("info()");
        }

        public function run()
        {
            $this->log->info("START Batch Test(".$this->lista_parametri['--id_batch'].",".$this->lista_parametri['--run_time'].").");
        }

        public function refreshStatus()
        {
            $this->log->info("refreshStatus()");
        }
        
        private function getInputParameter($argv)
	{
	      $this->lista_parametri = array();

	      foreach ($argv as $arg)
	      {
		$tmp = explode('=', $arg);
		if(count($tmp)==2)
		{
		  list($x,$y) = $tmp;
		  $this->lista_parametri["$x"]    = $y;  
		}
	      }
	      
	  }
    }