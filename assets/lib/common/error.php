<?php

namespace Common\lib;


/*
 |--------------------------------------------------------------------------
 | Application Scheduler
 | AUTHORS:
 | Author Name       Raffaele Ficcadenti
 | Author email      raffaele.ficcadenti@gmail.com
 |
 | FILE
 | error.php
 |
 | HISTORY:
 | -[Date]-      -[Who]-               -[What]-
 | 01-03-2017    Ficcadenti Raffaele   Versione 1.0
 |--------------------------------------------------------------------------
 |
 | Schedulatore per avviare batch di download dati AdWords
 */

class Error
{
	private $list_error = array(
			"-1" => "No error",
			"1" => "Errore connessione DB"
	);
	
	public function getError($id)
	{
		return $this->list_error[$id];
	}
}