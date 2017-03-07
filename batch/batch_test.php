<?php

    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | batch_test.php
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

		require 'vendor/autoload.php';
		require 'assets/lib/schedulerLogConfigurator.php';
		require 'assets/lib/schedulerService.php';

		date_default_timezone_set('UTC');
		date_default_timezone_set('Europe/Rome');

		$service            = new SchedulerService();
		$name_log_file      = basename(__FILE__, ".php");
		$id_batch           = 0;
		$configuration_log  = array(
								      'LOG_ECHO' => 1,
								      'LOG_DAILYFILE' => 2
								  	);

		/* puntamento al file .env */
		try 
		{
		    $dotenv = new Dotenv\Dotenv(__DIR__);
		    $dotenv->load();
		    $dotenv->required([ 'BATCH_DIR','BATCH_LOG_DIR']);
		    
		} 
		catch (Exception $ex) 
		{
			printf("%s\n",$ex->getMessage());
			exit;
		}


		Logger::configure($configuration_log, new SchedulerLogConfigurator($service->makePathLogBatch(),$name_log_file));
		$log = Logger::getLogger("batch_test");

		/* get argv */
		
		
		array_shift($argv);

		if (count($argv) == 0) 
		{
			$log->info("Il Batch è stato invocato senza parametri.");
			exit;
		}
		
		$lista_parametri=$service->getInputParameter($argv);
		
		
		if (array_key_exists(strtolower("--id_batch"), $lista_parametri) )
		{
			if (array_key_exists(strtolower("--run_time"), $lista_parametri) )
			{
				$log->info("START Batch Test(".$lista_parametri['--id_batch'].",".$lista_parametri['--run_time'].").");
				/* Codice BATCH */
			}
			else
			{
				$log->info("Il Batch è stato invocato senza parametro --run_time");
				exit;
			}
		}
		else
		{
			$log->info("Il Batch è stato invocato senza parametro --id_batch");
			exit;
		}
		
		
		
