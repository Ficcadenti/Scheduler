<?php
    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name		Raffaele Ficcadenti
    | Author email		raffaele.ficcadenti@gmail.com
    |
    | FILE
    | scheduler.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    use Scheduler\lib\SchedulerLogConfigurator;
    use Scheduler\lib\SchedulerService;
    use Scheduler\lib\SchedulerDBstatus;
    use Scheduler\lib\SchedulerDBtype;
    use Scheduler\lib\SchedulerDBconfig;
    use Common\lib\CommonService;
    

    /* load librerie e define globali */
    require '../vendor/autoload.php';
    require '../assets/define/define.php';
    require '../assets/lib/common/commonService.php';
    
    /* load librerie schedulatore */
    require '../assets/lib/scheduler/schedulerLogConfigurator.php';
    require '../assets/lib/scheduler/schedulerService.php';
    require '../assets/lib/scheduler/schedulerDBstatus.php';
    require '../assets/lib/scheduler/schedulerDBtype.php';
    require '../assets/lib/scheduler/schedulerDBconfig.php';
    
    

    date_default_timezone_set('UTC');
    date_default_timezone_set('Europe/Rome');


	/* START Scheduler */
	
	/* puntamento al file .env */
	try 
	{
	    $dotenv = new Dotenv\Dotenv(__DIR__."/../assets/env");
	    $dotenv->load();
	    $dotenv->required([ 'SCHEDULER_DIR','BATCH_DIR','SCHEDULER_LOG_DIR']);
	    
	} 
	catch (Exception $ex) 
	{
		printf("%s\n",$ex->getMessage());
		exit;
	}

	$name_log_file          = basename(__FILE__, ".php");
	$log			= null;
	$dt_old			= "";
	$configuration_sched	= null;
	$service		= new SchedulerService();
	$common     		= new CommonService();
	$st_status_lib          = new SchedulerDBstatus();
	$st_type_lib            = new SchedulerDBtype();
	$st_config              = new SchedulerDBconfig();
	$configLoaded           = false;
	$bt1			= null;
	$id_batch               = -1;
	$cmd                    = "";
	$configuration_log      = array(
								      'LOG_ECHO' => 1,
								      'LOG_DAILYFILE' => 2
								  	);

	  
	printf("SCHEDULER Log path: %s\n",$service->makePathLogScheduler());
	printf("SCHEDULER Log file: <yyyy-mm-dd>.%s.log\n",$name_log_file);

	Logger::configure($configuration_log, new SchedulerLogConfigurator($service->makePathLogScheduler(),$name_log_file));
	$log = Logger::getLogger("schedulerLogger");
	
	/* set logger */
	$service->setLogger($log);
	$common->setLogger($log);
	$st_status_lib->setLogger($log);
	$st_type_lib->setLogger($log);
	$st_config->setLogger($log);
	
	
	$st_status_lib->connect();
	$st_type_lib->connect();
	$st_config->connect();
	

	/* iniziamo a scrivere il codice */

	try
	{
		//$configuration_sched = $service->loadConfig();
		    
		/* sincronizazione al minuto successivo */
		$log->info("Syncronizazione Scheduler");
		do
		{
			$run_time_unix=time();
			$resto=($run_time_unix%ROUND_TIME);
			$log->info("Wait... ".(ROUND_TIME-$resto));
			sleep(1);
		}
		while((ROUND_TIME-$resto)!=1);


		$log->info("START Scheduler");
		$dt_start=date('Ymd'); /*data utilizzata per cambio giorno */

		while(true) /* loop cheduler */
		{
			$run_time_unix=time();
			$val=(int)($run_time_unix/(ROUND_TIME));
			$run_time_unix=(ROUND_TIME)*$val;
			
			$log->info("Running....(".$run_time_unix.": ".$common->strDade($run_time_unix).")");
			
			/* Controllo cambio giorno */
			if($service->dayIsChanged($dt_start)==true)
			{
			      $log->info("Change Day: execute SanityCheck and ClearLog.");
			      $service->clearLog();
			      $dt_start=date('Ymd');
			} 
		
			/* Load Config*/
			$log->info("Loading configuration....");
			if($st_status_lib->load()==true)
			{
				if($st_type_lib->load()==true)
				{
				      if($st_config->load()==true)
				      {
					      $configLoaded=true;
				      }
				}
			}

			/* config ok */
			if($configLoaded==true)
			{
				$log->info("Configuration loaded....");	
			}
			else
			{
				$log->info("Configuration NOT loaded....");	
				exit;
			}

			foreach($st_config->getAllconfig() as $batch) 
			{
				$status=$st_status_lib->getStatus($batch['status']);
				$type=$st_type_lib->getType($batch['id_type']);
				$periodo=$batch['periodo'];
				$id_batch=$batch['id_batch'];
				
				$ts_batch_unix=strtotime($batch['time_start']);
				$lts_batch_unix=strtotime($batch['last_time_start']);

				$str=sprintf("	%s(%d): %s - %s (START time=%d:%s, LAST start time=%d:%s)",$batch['descr_batch'],$id_batch,$type,$status,$ts_batch_unix,$common->strDade($ts_batch_unix),$lts_batch_unix,$common->strDade($lts_batch_unix));
				$log->info($str);
				
				/* controllo lo stato dei batch*/
				if(($batch['status']==TO_BE_SUBMITTED) && ($batch['id_error']==BATCH_WITHOUT_ERROR)) 
				{
					/* controllo se è ora di far partire il batch */
					if($run_time_unix>=$ts_batch_unix) 
					{

						$cmd = "	php ".getenv("BATCH_DIR")."/".$batch['phpname_batch']." --id_batch=".$id_batch." --run_time=".$run_time_unix." &";
						$log->info($cmd);
						exec(escapeshellcmd($cmd),$return);

						/* aggiorna parametri batch */
						$st_config->setStatus($id_batch,SUBMITTED);
						$st_config->setNextStartTime($id_batch,$common->calcolaNextStartTime($ts_batch_unix,$batch['id_type'],$periodo));
						$st_config->setLastStartTime($id_batch,$run_time_unix);

						$log->info("	Submitted");
					}
					else 
					{
						$log->info("	Skipped 1");
					}
					
				}
				else 
				{
					$log->info("	Skipped 2");
				}
				
				
			}
			
			sleep(SCHEDULER_SLEEP);
			
		} /* end while */
	}
	catch (Exception $ex) 
	{
	    printf("%s\n",$ex->getMessage());
	}
