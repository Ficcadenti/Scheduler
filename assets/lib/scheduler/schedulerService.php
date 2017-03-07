<?php
    namespace Scheduler\lib;
    

    
    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | schedulerService.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    class SchedulerService
    {
		private $log 		= null;
		private $batch		= array();

		public function setLogger($log)
		{
			$this->log=$log;
		}
		
		
		public function configChanged()
		{
			return false;
		}
		
		public function chekStatus()
		{
		      return true;
		}
		
		public function makePathLogScheduler()
		{
			$LOG_DIR=getenv('SCHEDULER_LOG_DIR');
			return $LOG_DIR.'/';
		}

		public function clearLog()
		{
			$this->log->info("Cancello i log più vecchi di ".getenv('SCHEDULER_LOG_CLEAR_GG')." giorni in ".SchedulerService::makePathLog());
		}
		
		
		public function dayIsChanged($dt_old)
		{
		    $dt_now=date('Ymd');
		    
		    if($dt_now==$dt_old)
		    {
			return false;
		    }
		    else 
		    {
			  return true;
		    }
		}
		
		public function getInputParameter($argv)
		{
		      $lista_parametri = array();
		      
		      
		      foreach ($argv as $arg)
		      {
			$tmp = explode('=', $arg);
			if(count($tmp)==2)
			{
			  list($x,$y) = $tmp;
			  $lista_parametri["$x"]    = $y;  
			}
		      }
		      
		      return $lista_parametri;
		 }
	
    }
    
    