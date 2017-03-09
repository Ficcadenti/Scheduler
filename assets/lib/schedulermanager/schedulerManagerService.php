<?php

namespace SchedulerManager\lib;

/*
 * |--------------------------------------------------------------------------
 * | Application Scheduler
 * | AUTHORS:
 * | Author Name Raffaele Ficcadenti
 * | Author email raffaele.ficcadenti@gmail.com
 * |
 * | FILE
 * | schedulerManagerService.php
 * |
 * | HISTORY:
 * | -[Date]- -[Who]- -[What]-
 * | 01-03-2017 Ficcadenti Raffaele Versione 1.0
 * |--------------------------------------------------------------------------
 * |
 * | Schedulatore per avviare batch di download dati AdWords
 */
class SchedulerManagerService {
	private $log = null;
	
	
	public function setLogger($log) {
		$this->log = $log;
	}
	
	
	public function makePathLog() {
		$LOG_DIR = getenv ( 'SCHEDULER_MANAGER_LOG_DIR' );
		return $LOG_DIR . '/';
	}
	
	public function clearLog() {
		$path = SchedulerManagerService::makePathLog ();
		$gg = getenv ( 'SCHEDULER_MANAGER_LOG_CLEAR_GG' );
		$this->log->info ( "Cancello i log piu vecchi di " . $gg . " giorni in " . $path );
		
		if ($handle = opendir ( $path )) {
			while ( false !== ($file = readdir ( $handle )) ) {
				if ($file != "." && $file != "..") {
					if ((time () - filemtime ( $path . '/' . $file )) > $gg * (60 * 60 * 24)) {
						$str = sprintf ( "unlink %s/%s\n", $path, $file );
						$this->log->info ( $str );
						unlink ( $path . '/' . $file );
					}
				}
			}
		}
	}
	
}
    
    