#!/bin/tcsh

    
#    |--------------------------------------------------------------------------
#    | Application Scheduler
#    | AUTHORS:
#    | Author Name		Raffaele Ficcadenti
#    | Author email		raffaele.ficcadenti@gmail.com
#    |
#    | FILE
#    | scheduler_start.cshrc
#    |
#    | HISTORY:
#    | -[Date]-      -[Who]-               -[What]-
#    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
#    |--------------------------------------------------------------------------
#    |
#    | Script per lo start dello schedulatore
    
# check if scheduler is running
set counter=`pgrep -a php | grep scheduler.php | wc -l`;

echo $counter

if ( $counter == 0 ) then
    echo "Starting Scheduler Server......";
    cd $SCHEDULER_DIR
    php $SCHEDULER_DIR/scheduler.php > /dev/null &
else
    echo "Scheduler Server is running...";
endif


# end


