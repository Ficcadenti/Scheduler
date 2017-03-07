<?php
    /*
    |--------------------------------------------------------------------------
    | Application Scheduler
    | AUTHORS:
    | Author Name       Raffaele Ficcadenti
    | Author email      raffaele.ficcadenti@gmail.com
    |
    | FILE
    | config.php
    |
    | HISTORY:
    | -[Date]-      -[Who]-               -[What]-
    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
    |--------------------------------------------------------------------------
    |
    | Schedulatore per avviare batch di download dati AdWords
    */
    return array(
        'rootLogger' => array(
            'appenders' => array('default'),
        ),
        'appenders' => array(
            'default' => array(
                'class' => 'LoggerAppenderFile',
                'layout' => array(
                    'class' => 'LoggerLayoutSimple'
                ),
                'params' => array(
                	'file' => 'my.log',
                	'append' => true
                )
            )
        )
    );
