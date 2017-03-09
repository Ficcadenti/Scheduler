<?php
    namespace Common\lib;
    
    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | commonService.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    class CommonService
    {
		private $log 		= null;

		public function setLogger($log)
		{
			$this->log=$log;
		}
		
		
		public function strDade($t)
		{
		    return date("Y/m/d H:i:s",$t);
		}
		
		public function isWindows()
		{
			$this->log->info( "Sistema operativo: ".substr(php_uname(), 0, 7) );
			if (substr(php_uname(), 0, 7) == "Windows"){
				return true;
			}
			else {
				return false;
			}
		}
		
		public function calcolaNextStartTime($run_time_unix,$id_type,$periodo)
		{
		      $t=0;
		      switch($id_type)
		      {
			      case BATCH_ORARIO: /* ORARIO */
			      {
				      $t=$run_time_unix+(60*60);
			      }break;
			      
			      case BATCH_PERIODICO: /* ORARIO */
			      {
				      $t=$run_time_unix+$periodo;
			      }break;
		      }

		      return $t;
		}
	
    }
    
    