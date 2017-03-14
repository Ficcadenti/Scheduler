<?php
/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batch30gg.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
use Batch\Batch30gg_work;
use Batch\lib\BatchLogConfigurator;
use Batch\lib\BatchService;
use Common\lib\CommonService;

$start_time = time ();

/* load librerie e define globali */
require '../vendor/autoload.php';
require '../assets/define/define.php';
require '../assets/lib/common/commonService.php';

/* load librerie batch */
require '../assets/lib/batch/batchLogConfigurator.php';
require '../assets/lib/batch/batchService.php';
require 'batch30gg_work.php';

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

$bt = new Batch30gg_work ();
$service = new BatchService ();
$common = new CommonService ();
$name_log_file = basename ( __FILE__, ".php" );
$id_schedulazione = 0;
$configuration_log = array (
		'LOG_ECHO' => 1,
		'LOG_DAILYFILE' => 2 
);

/* puntamento al file .env */
try {
	$dotenv = new Dotenv\Dotenv ( __DIR__ . "/../assets/env" );
	$dotenv->load ();
	$dotenv->required ( [ 
			'BATCH_DIR',
			'BATCH_LOG_DIR' 
	] );
} catch ( Exception $ex ) {
	printf ( "%s\n", $ex->getMessage () );
	exit ();
}


$id_schedulazione = $bt->getIdSchedulazione ( $argv );

if ($id_schedulazione != - 1) {
	$name_log_file = $id_schedulazione . '.' . $name_log_file;
	
	printf ( "BATCH Log path: %s\n", $service->makePathLog () );
	printf ( "BATCH Log file: <yyyy-mm-dd>.%s.log\n", $name_log_file );
	
	/* set logger */
	Logger::configure ( $configuration_log, new BatchLogConfigurator ( $service->makePathLog (), $name_log_file ) );
	$log = Logger::getLogger ( $name_log_file );
	
	$log->info( "START Time: ".$common->strDade($start_time));
	$bt->setLogger ( $log );
	$service->setLogger ( $log );
	
	/* Cancello old log */
	$service->clearLog ();
	
	/* start Batch */
	if ($bt->init ()) {
		if ($bt->getParam ( $argv ) == true) 
		{
			$bt->info ();
			
			if ($bt->run () == true) {
				$bt->refreshStatus ( true );
			} else {
				$bt->refreshStatus ( false );
			}
		}
		else {
			$bt->refreshStatus ( false );
		}
	} 
	else {
		$bt->refreshStatus ( false );
	}
}

/* calcolo tempi di esecuzione */
$stop_time = time ();
$log->info( "STOP Time: ".$common->strDade($stop_time));
$log->info( "EXEC Time: ".($stop_time-$start_time)." sec.  --> ".$common->strTime($stop_time-$start_time));

