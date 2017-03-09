<?php
    namespace Scheduler\lib;
    
    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | schedulerManagerLogConfigurator.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    class SchedulerManagerLogConfigurator implements \LoggerConfigurator 
    {
	private  $path = "/tmp/";
    	private  $filename = "scheduler.log";

        public function __construct($p,$f)
        {
		$this->path=$p;
                $this->filename=$f;
        }

        public function configure(\LoggerHierarchy $hierarchy, $input = null) 
        {
            $str_date=date("Y-m-d");
            // Use a different layout
            $layout = new \LoggerLayoutPattern();
            $layout->setConversionPattern("[%pid - %date{H:i:s}]: %msg%newline");
            $layout->activateOptions();

            // Create an appender which logs to file
            /*$appFile = new LoggerAppenderFile('foo');
            $appFile->setFile($str_date.'-'.$this->filename.'.log');
            $appFile->setLayout($layout);
            $appFile->setAppend(true);
            $appFile->setThreshold('all');
            $appFile->activateOptions();*/
            
            // Create an appender which echoes log events, using a custom layout
            // and with the threshold set to INFO 
            $appEcho = new \LoggerAppenderEcho('LOG_ECHO');
            $appEcho->setLayout($layout);
            $appEcho->setThreshold('ALL');
            $appEcho->activateOptions();

            // creates daily rolling file appender
            $rollingAppender = new \LoggerAppenderDailyFile('LOG_DAILYFILE');
            $rollingAppender->setFile($this->path.'/%s.'.$this->filename.'.log');
            $rollingAppender->setDatePattern('Y-m-d');
            $rollingAppender->setLayout($layout);
            $rollingAppender->setThreshold('ALL');
            $rollingAppender->activateOptions();

            // Add both appenders to the root logger
            $root = $hierarchy->getRootLogger();
            //$root->addAppender($appFile);
            $root->addAppender($appEcho);
            $root->addAppender($rollingAppender);
        }
    }
