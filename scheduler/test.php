<?php
/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | test.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
 
use Scheduler\SchedulerManager;

/* load manager schedulatore */
require 'schedulerManager.php';


date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

/* START SchedulerManager */

$sm=new SchedulerManager();

/* stato_schedulazione sono definiti nella tabella adplify_scheduler.sc_stato_schedulazione_lib 
  valori possibili:
  
  
  define("WORKING",1);
  define("FINISCHED",2);
  define("STALLED",3);
  define("ERROR",4);
  define("UNDEFINED",5);
  define("TO_BE_SUBMITTED",6);
  define("SUBMITTED",7);
*/


/* type_schedulazione sono definiti nella tabella adplify_scheduler.sc_type_schedulazione_lib 
  valori possibili:
  
  define("BATCH_ORARIO",1);
  define("BATCH_GIORNALIERO",2);
  define("BATCH_SETTIMANALE",3);
  define("BATCH_MENSILE",4);
  define("BATCH_ANNUALE",5);
  define("BATCH_UNA_TANTUM",6);
  define("BATCH_PERIODICO",7);
  
*/
/* id_batch sono definiti nella tabella adplify_scheduler.batch_lib 
  per test abbiamo:
  id_batch=1 --> batch 30 giorni
  id_batch=2 --> batch Real Time
*/

/* download_batch_type: definiti nella tabella adplify_scheduler.batch_type_lib  
   valori possibili:
   
   1=ALL,
   2=CAMPAGNE,
   3=ANNUNCI,
   4=KEYWORD,
   5=URL,
   ???? dobbiamo vedere se conviene fare un batch unico, che in base al parametro tipo_batch scarica le campagne o gli annunci o le keywords, ecc... 
   ho creare batch mirati.
   
   ad esempio:
    - batch30gg_campagne
    - batch30gg_annunci
    - batch30gg_keywords
    - batch30gg_qualcosa
   
   tu che dici?
   */

/* la frequenza è espressa in secondi. */

/* NB: id_schedulazione=-1 indica un nuovo batch schedulato.*/
$json_str='{
	"id_schedulazione": -1,   
	"hostname": "devadplify",
	"id_user": 20,
	"id_account_adw": -1,
	"id_batch": 1,
	"descr_schedulazione": "BATCH a 30 giorni",
	"type_schedulazione": 7,
	"frequenza": 10800,
	"stato_schedulazione": 6,
	"download_report_type": 2,
	"abilita_anagrafiche": 0,
	"status_anagrafiche": "ENABLED",
	"abilita_metriche": 1,
	"status_metriche":  "ENABLED",
	"time_start": "2017-03-14 16:40:00",
	"dal": "20170212",
	"al": "20170311"
}';


print_r("Try Inserimento");
if($sm->setBatch($json_str))
{
	$sm->showParameter();

	switch($sm->status())
	{
		case NEW_BATCH:
			{
				print_r("New Batch");
				$newid=$sm->insert(); /* per creare un nuovo batch */
				$sm->showParameter(); /* per prendere il nuovo id_schedulazione inserito */
				$id = $sm->getIdSchedulazione();
				printf("id=%d\n",$id);
			}break;
			
		case MODIY_BATCH:
			{
				print_r("Modifica o delete\n");
				//$sm->delete(); /* per cancellare un batch */
				$sm->update(); /* per aggiornare un batch */
			}break;
			
		case DB_ERROR:
			{
				printf("Errore \n");
				/* gestione errore database */
			}break;		
	}
	
   	$sm->unsetBatch();
}
else
{
	/* gestione errore */
}


	


/**************************/
