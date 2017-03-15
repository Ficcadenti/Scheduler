<?php
   /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | define.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
  define("WORKING",1);
  define("FINISCHED",2);
  define("STALLED",3);
  define("ERROR",4);
  define("UNDEFINED",5);
  define("TO_BE_SUBMITTED",6);
  define("SUBMITTED",7);
 
  
  define("BATCH_WITHOUT_ERROR",0);
  define("BATCH_STALLED",1);
  
  define("BATCH_ORARIO",1);
  define("BATCH_GIORNALIERO",2);
  define("BATCH_SETTIMANALE",3);
  define("BATCH_MENSILE",4);
  define("BATCH_ANNUALE",5);
  define("BATCH_UNA_TANTUM",6);
  define("BATCH_PERIODICO",7);
  
  define("ROUND_TIME",60);
  define("SCHEDULER_SLEEP",10);
  
  define("OK",1);
  define("NOT_OK",-1);
  
  define("NEW_BATCH",1);
  define("MODIY_BATCH",2);
  define("DB_ERROR",3);
  define("DB_NO_ERROR",4);
  
  define("GIORNI_30",0);
  define("GIORNI_60",1);
  define("ANNI_2",2);
  define("USER_DEFINED",3);
  
  
