<?php

    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | batch.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    
    namespace Batch\lib;
    
    
    abstract class Batch
    {
        public function  init()
        {}
        public function  getParam($argv)
        {}
        public function  info()
        {}
        public function  refreshStatus($status)
        {}
        public function  finish()
        {}
        
        abstract public function  run();
    }