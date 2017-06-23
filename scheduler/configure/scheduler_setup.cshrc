#!/bin/tcsh

#    |--------------------------------------------------------------------------
#    | Application Scheduler
#    | AUTHORS:
#    | Author Name		Raffaele Ficcadenti
#    | Author email		raffaele.ficcadenti@gmail.com
#    |
#    | FILE
#    | scheduler_setup.cshrc
#    |
#    | HISTORY:
#    | -[Date]-      -[Who]-               -[What]-
#    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
#    |--------------------------------------------------------------------------
#    |
#    | Script per il set dell'environment dello schedulatore

# Scheduler Environment
if ! $?SCHEDULER_DIR then
    setenv SCHEDULER_DIR /var/www/html/Scheduler/scheduler
endif

mkdir $SCHEDULER_DIR/../logs
mkdir $SCHEDULER_DIR/../logs/scheduler
mkdir $SCHEDULER_DIR/../logs/batch