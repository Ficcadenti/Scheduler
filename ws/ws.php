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


$operation = $_GET['operation'];


$o = new \stdClass();
foreach ($_POST as $key => $value) {
    $o->$key=$value;
}

$json_str = json_encode($o);



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

/* tipo_batch: definiti nella tabella adplify_scheduler.batch_type_lib  
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
//var_dump($_POST['hostname']);
//var_dump($_SERVER["REQUEST_METHOD"]);


//$json_str='{
//	"id_schedulazione": '.$_POST['id_schedulazione'].',
//	"hostname": "'.$_POST['hostname'].'",
//	"id_user": '.$_POST['id_user'].',
//	"id_account_adw": 2,
//	"id_batch": '.$_POST['id_batch'].',
//	"descr_schedulazione": "BATCH a 30 giorni",
//	"type_schedulazione": '.$_POST['type_schedulazione'].',
//	"frequenza": '.$_POST['id_schedulazione'].',
//	"stato_schedulazione": '.$_POST['stato_schedulazione'].',
//	"tipo_batch": 1,
//	"time_start": "'.$_POST['time_start'].'",
//	"dal": "20170212",
//	"al": "20170311"
//}';



define("OPERATION_EXISTS",0);
define("OPERATION_INSERT",1);
define("OPERATION_UPDATE",2);
define("OPERATION_DELETE",3);


define("CURRENT_STATUS_UNKONWN",-1);
define("CURRENT_STATUS_EXITS",0);
define("CURRENT_STATUS_NOT_EXITS",1);


function checkBatchExists($sm,$json_str){
    return ($sm->setBatch($json_str) && $sm->status()==MODIY_BATCH);
}

function batchInsert($sm,$json_str,&$newid){

    if($sm->setBatch($json_str))
    {
            //$sm->showParameter();
            $newid = $sm->insert(); /* per creare un nuovo batch */
            return true;
    }

    return false;
}

function batchUpdate($sm,$json_str){
    if($sm->setBatch($json_str))
    {
           //$sm->showParameter();
           $sm->update();
           return true;
    }

    return false;
}

function batchDelete($sm,$json_str){
    if($sm->setBatch($json_str))
    {
           $sm->delete();
           return true;
    }

    return false;
}

$jsonResult = new \stdClass();
$jsonResult->current_status=CURRENT_STATUS_UNKONWN;
switch($operation)
{
    case OPERATION_EXISTS:
        $jsonResult->current_status=checkBatchExists($sm, $json_str) ? CURRENT_STATUS_EXITS :CURRENT_STATUS_NOT_EXITS ;
        break;
    case OPERATION_INSERT:
        $newid = "";
        $jsonResult->current_status= batchInsert($sm,$json_str, $newid) ? CURRENT_STATUS_EXITS :CURRENT_STATUS_UNKONWN;
        break;
    case OPERATION_UPDATE:
        $jsonResult->current_status= batchUpdate($sm,$json_str, $newid) ? CURRENT_STATUS_EXITS :CURRENT_STATUS_UNKONWN;
        break;
    case OPERATION_DELETE:
        $jsonResult->current_status= batchDelete($sm,$json_str) ? CURRENT_STATUS_EXITS :CURRENT_STATUS_UNKONWN;
        break;
    
}
echo json_encode($jsonResult);
	

?>