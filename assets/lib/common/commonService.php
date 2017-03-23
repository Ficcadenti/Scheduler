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
		
		function __construct() {
		}
		
		function __destruct() {
		}
		
		public function setLogger($log)
		{
			$this->log=$log;
		}
		
		public function strDade($t)
		{
		    return date("Y/m/d H:i:s",$t);
		}
		
		public function strDeleteReport($t)
		{
			return date("Y-m-d 00:00:00",$t);
		}
		
		public static function strDadeGoogle($t)
		{
			return date("Ymd",$t);
		}
		public function strTime($t)
		{
			$h=0;
			$m=0;
			$s=0;
			$str="";
	
			$h = (int)($t/3600);
			$resto = $t % 3600;

			if($resto>0)
			{
				$m=(int)($resto/60);
				$resto = $resto % 60;
				if($resto>0)
				{
					$s=$resto;
				}
			}
			$str=sprintf("%02d:%02d:%02d",$h,$m,$s);
			return $str;
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
		
		public function calcolaNextStartTime($run_time_unix,$ts_batch_unix,$id_type,$periodo)
		{
		      $t=0;
		      $p=0;
		      $num_int=1;
		     
		      switch($id_type)
		      {
			      case BATCH_ORARIO: /* ORARIO */
			      {
			      	$p=(60*60);
			      	if($run_time_unix > $ts_batch_unix)
			      	{
			      		$num_int=(int)(($run_time_unix-$ts_batch_unix)/$p);
			      		$num_int++;
			      	}	
	
			      }break;
			      
			      case BATCH_PERIODICO: /* ORARIO */
			      {
			      	$p=$periodo;
			      	if($run_time_unix > $ts_batch_unix)
			      	{
			      		$num_int=(int)(($run_time_unix-$ts_batch_unix)/$p);
			      		$num_int++;
			      	}
			      }break;
		      }
		      
		      /* calcolo in next time start */
		      $t=$ts_batch_unix+($num_int*$p);
		      $str_t=CommonService::strDade($t);

		      return $t;
		}
	
    }
    
    