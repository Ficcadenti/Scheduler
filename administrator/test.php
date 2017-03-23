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
require '../scheduler/schedulerManager.php';


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

/* download_report_type: definiti nella tabella adplify_scheduler.batch_type_lib  
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
var_dump($_POST['hostname']);
var_dump($_SERVER["REQUEST_METHOD"]);


$json_str='{
	"id_schedulazione": '.$_POST['id_schedulazione'].',
	"hostname": "'.$_POST['hostname'].'",
	"id_user": '.$_POST['id_user'].',
	"id_account_adw": 2,
	"id_batch": '.$_POST['id_batch'].',
	"descr_schedulazione": "BATCH a 30 giorni",
	"type_schedulazione": '.$_POST['type_schedulazione'].',
	"frequenza": '.$_POST['frequenza'].',
	"stato_schedulazione": '.$_POST['stato_schedulazione'].',
	"download_report_type": '.$_POST['download_report_type'].',
	"abilita_anagrafiche": '.$_POST['abilita_anagrafiche'].',
	"status_anagrafiche": "'.$_POST['status_anagrafiche'].'",
	"abilita_metriche": '.$_POST['abilita_metriche'].',
	"status_metriche": "'.$_POST['status_metriche'].'",
	"time_start": "'.$_POST['time_start'].'",
	"dal": "20170212",
	"al": "20170311"
}';

if($sm->setBatch($json_str))
{
	print_r("<h1>Sono QUA</h1><br>");
	$sm->showParameter();

	switch($sm->status())
	{
		case NEW_BATCH:
			{
				$newid=$sm->insert(); /* per creare un nuovo batch */
				print_r("<h1>insert</h1><br>");
				$sm->showParameter(); /* per prendere il nuovo id_schedulazione inserito */
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
	/*$id = $sm->getIdSchedulazione(); // ritorna un array di id 
	foreach ($id as $key => $value)
	{
		printf("id[%d]=%d\n",$key,$value);
	}*/
   	$sm->unsetBatch();
}
else
{
	/* gestione errore */
	print_r("<h1>gestione errore</h1><br>");
}


	


/**************************/
?>
