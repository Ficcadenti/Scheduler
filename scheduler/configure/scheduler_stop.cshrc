#!/bin/tcsh


#    |--------------------------------------------------------------------------
#    | Application Scheduler
#    | AUTHORS:
#    | Author Name		Raffaele Ficcadenti
#    | Author email		raffaele.ficcadenti@gmail.com
#    |
#    | FILE
#    | scheduler_stop.cshrc
#    |
#    | HISTORY:
#    | -[Date]-      -[Who]-               -[What]-
#    | 01-03-2017    Ficcadenti Raffaele   Versione 1.0 
#    |--------------------------------------------------------------------------
#    |
#    | Script per lo sto dello schedulatore

# check if scheduler is running
set counter=`pgrep -a php | grep scheduler.php | wc -l`;

echo $counter

if ( $counter == 0 ) then
    echo "Scheduler Server not running...";
else
    echo "Scheduler Server stopped...";
    set pid_scheduler=`/bin/ps -edaf | grep "scheduler.php" | awk '{print $2}' | head -1`
    kill -9 $pid_scheduler
endif


# end


