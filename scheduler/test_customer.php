<?php

    require '../vendor/autoload.php';

    $log = null;
    $dbh = null;
    $name_file = "";
    $name_schema = "adplify_manager";
    $name_tabella = "`api_adgroup-performance-report`";
    $connetion=false;
    
    /* puntamento al file .env */
    try {
            $dotenv = new Dotenv\Dotenv ( __DIR__ . "/../assets/env" );
            $dotenv->load ();
            $dotenv->required ( [ 
                            'SCHEDULER_DIR',
                            'BATCH_DIR',
                            'SCHEDULER_LOG_DIR' 
            ] );
    } catch ( Exception $ex ) {
            printf ( "%s\n", $ex->getMessage () );
            exit ();
    }

        
    try {
            $dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . $name_schema, getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
            $connetion=true;
            printf ( "TEST CUSTOMER OK %s\n",$name_schema);
    } catch ( \PDOException $ex ) {
           printf ( "TEST CUSTOMER errore DB\n");
            $connetion=false;
    }
    
    try {
            $sql='SELECT * FROM '.$name_tabella.' WHERE enabled=1';
            printf ( "SQL=%s\n",$sql); 
            $statement = $dbh->query ( $sql );

            foreach ( $statement as $row ) {
                printf ( "%s,       %s\n",$row ['Name'],strtoupper($row ['Type'])); 
            }
            return true;
    } catch ( \PDOException $ex ) {
            printf ( "TEST CUSTOMER errore DB\n");
            return false;
    }
                        
?>
