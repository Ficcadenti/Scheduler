<?php
/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | batch_30_gg.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
use Batch\lib\Batch30gg;
use Batch\lib\BatchLogConfigurator;
use Batch\lib\BatchService;

/* load librerie e define globali */
require '../vendor/autoload.php';
require '../assets/define/define.php';

/* load librerie batch */
require '../assets/lib/batch/batchLogConfigurator.php';
require '../assets/lib/batch/batchService.php';
require '../assets/lib/batch/batch30gg.php';

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

$bt = new Batch30gg ();
$service = new BatchService ();
$name_log_file = basename ( __FILE__, ".php" );
$id_batch = 0;
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

/* set logger */
Logger::configure ( $configuration_log, new BatchLogConfigurator ( $service->makePathLogBatch (), $name_log_file ) );
$log = Logger::getLogger ( $name_log_file );
$bt->setLogger ( $log );
$service->setLogger ( $log );

/* Cancello old log */
$service->clearLog ();

/* start Batch */
if ($bt->init ()) {
	if ($bt->getParam ( $argv ) == true) {
		$bt->info ();
		$bt->run ();
		$bt->refreshStatus(true);
	}
}
else 
{
	$bt->refreshStatus (false);
}
