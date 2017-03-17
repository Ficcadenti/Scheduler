<?php

namespace Batch;

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

class DownloadAdWords
{
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $lista_parametri = array ();
	private $id_error = BATCH_WITHOUT_ERROR;
	private $descr_error = "";
	private $connetion=false;
	private $param=array();

	function __construct() {
		$this->name_file = basename ( __FILE__, ".php" );
		
	}
	function __destruct() {
	}

	private function boolToStr($b) {
		return ($b) ? 'true' : 'false';
	}

	public function connect() {
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_ADPMANAGER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
			$this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
			$this->connetion=true;
		} catch ( \PDOException $ex ) {
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] ". $ex->getMessage ();
			$this->log->info ( $this->descr_error );
			$this->connetion=false;
		}
	}
	public function getIdError()
	{
		return $this->id_error;
	}
	
	
	public function getDescError()
	{
		return $this->descr_error;
	}
	
	public function setLogger($log) {
		$this->log = $log;
	}

	public function info() {
		$this->log->info ( "info()" );
	}
	
	private function getFields()
	{
		$this->log->info ( "getFields()" );
		$fields = array ();
		
		switch($this->param['download_report_type'])
		{	
			case DOWNLOAD_ADGROUP_METRICHE:
				{
					$table = "api_adgroup-performance-report"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_CAMPAGNE_METRICHE:
				{
					$table = "api_campaign-performance-report"; // TABELLA DA ALIMENTARE
				}break;
			
			case DOWNLOAD_KEYWORDS_METRICHE:
				{
					$table = "api_keywords-performance-report"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_URL_METRICHE:
				{
					$table = "api_url-performance-report"; // TABELLA DA ALIMENTARE
				}break;
					
			
					
		}
		
		if($this->connetion==true)
		{
			
			
			try {
				$stmt = $this->dbh->prepare( "SELECT * FROM `".$table."` WHERE enabled=1" );
				$stmt->execute ();
					
				while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
					$msg=sprintf("... Enabled: %s",$row->Name);
					$this->log->info($msg);
					$fields[$row->Name]=$row->Name;
				}
	
				
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			}
			
		}
		
		return $fields;

	}

	
	private function downloadReport($user_id,  $namefileCSV, $settings, $access_token, $clientCustomerId)
	{
		$user = new \AdWordsUser ();
		$user->SetOAuth2Info ( array (
				'client_id' => $settings->client_id,
				'client_secret' => $settings->client_secret,
				'refresh_token' => $settings->refresh_token,
				'access_token' => $access_token
		) );
	
		// Load the service, so that the required classes are available.
		$user->LoadService ( 'ReportDefinitionService', ADWORDS_VERSION );
		// Optional: Set clientCustomerId to get reports of your child accounts
		$user->SetClientCustomerId ( $clientCustomerId );
		$user->SetDeveloperToken ( $settings->dev_key );
	
		// Create selector.
	
		// CAMPI DA PRENDERE PER SCARICARE ADGROUP
		$fields = self::getFields();
	
		// RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
		$date_min = $this->param['dal']; // "20150301"; // PRENDI DA DATA
		$date_max = $this->param['al']; // "20170228"; // ...A DATA
	
		$selector = new \Selector ();
		$selector->fields = array_keys ( $fields ); // CAMPI DA CHIEDERE A GOOGLE
		$selector->dateRange = new \DateRange ( $date_min, $date_max ); // INTERVALLO TEMPORALE
	
		$reportDefinition = new \ReportDefinition ();
		$reportDefinition->selector = $selector;
	
		$reportDefinition->reportName = 'Criteria performance report #' . uniqid ();
		// TIPO DI INTERVALLO TEMPORALE
		$reportDefinition->dateRangeType = "CUSTOM_DATE"; // TIPO INTERVALLO PERSONALIZZATO. ALTRI POSSIBILI VALORI SONO : TODAY, LAST_7_DAYS, TODAY, YESTERDAY, THIS_WEEK, LAST_WEEK, LAST_14_DAYS, THIS_MONTH, LAST_30_DAYS, LAST_MONTH, ALL_TIME
	
		$reportDefinition->reportType = 'CAMPAIGN_PERFORMANCE_REPORT';
		
		switch($this->param['download_report_type'])
		{		
			
			case DOWNLOAD_ADGROUP_METRICHE:
				{
					$reportDefinition->reportType = 'ADGROUP_PERFORMANCE_REPORT';
				}break;
			
			case DOWNLOAD_CAMPAGNE_METRICHE:
				{
					$reportDefinition->reportType = 'CAMPAIGN_PERFORMANCE_REPORT';
				}break;
						
			case DOWNLOAD_KEYWORDS_METRICHE:
				{
					$reportDefinition->reportType = 'KEYWORDS_PERFORMANCE_REPORT';
				}break;
				
			case DOWNLOAD_URL_METRICHE:
				{
					$reportDefinition->reportType = 'URL_PERFORMANCE_REPORT';
				}break;
				
		}
		
		$reportDefinition->downloadFormat = 'CSV'; // FORMATO EXPORT ALTRI VALORI : XML
		 
		// Set additional options.
		$options = array (
				'version' => ADWORDS_VERSION
		);
	
		// Optional: Set skipReportHeader, skipColumnHeader, skipReportSummary to
		// suppress headers or summary rows.
		$options ['skipReportHeader'] = true;
		$options ['skipReportSummary'] = true;
		//
		// Optional: Set useRawEnumValues to return enum values instead of enum
		// display values.
		// $options['useRawEnumValues'] = true;
		//
		// Optional: Set includeZeroImpressions to include zero impression rows in
		// the report output.
		$options ['includeZeroImpressions'] = true;
	
		// Download report.
	
		$filePath = getenv ( 'CSV_PATH_FILE' ) . '/' . $namefileCSV; // PERCORSO FILE DA CREARE CON I DATI DEL REPORT
		$reportUtils = new \ReportUtils ();
		$reportUtils->DownloadReport ( $reportDefinition, $filePath, $user, $options );
	
		return $namefileCSV;
	}
	
	private function clearReport($conn,$id_account_adw)
	{
		$ret=true;
		$table = "";
		
		$s=$this->param['dal'];
		$str_dal = substr($s,0,4)."-".substr($s,4,2)."-".substr($s,6,2);
		$s=$this->param['al'];
		$str_al = substr($s,0,4)."-".substr($s,4,2)."-".substr($s,6,2);
		
		
		$this->log->info ( "clearReport DAL: ".$str_dal."   AL: " .$str_al);
		
		switch($this->param['download_report_type'])
		{
			case DOWNLOAD_ADGROUP_ANAGRAFICHE:
				{
					$table = "cache_adgroup_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_ADGROUP_METRICHE:
				{
					$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_CAMPAGNE_ANAGRAFICHE:
				{
					$table = "cache_campaign_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_CAMPAGNE_METRICHE:
				{
					$table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_KEYWORDS_ANAGRAFICHE:
				{
					$table = "cache_keywords_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_KEYWORDS_METRICHE:
				{
					$table = "cache_keywords_metrics"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_URL_ANAGRAFICHE:
				{
					$table = "cache_url_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_URL_METRICHE:
				{
					$table = "cache_url_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
		}

		$sql = "DELETE FROM ".$table." WHERE api_date >= :api_date";
				//AND id_account_adw=:id_account_adw";
	
		
		$stmt = $conn->prepare ( $sql );
		$stmt->bindParam ( ':api_date', $str_dal );
		//$stmt->bindParam ( ':id_account_adw', $id_account_adw );
		$stmt->execute (); // QUESTA RIGA PRENDE IL FILE DAL PERCORSO INDICATO E CARICA LA TABELLA*/
		
		$ret=true;
		
		return $ret;
	}
	
	
	public function writeDB($user_id,$id_account_adw,$fileCSV)
	{
		$ret=true;
		$table = "";
		$complete_fileCSV = getenv ( 'CSV_PATH_FILE' ) . '/' .$fileCSV;
	
		
		switch($this->param['download_report_type'])
		{
			case DOWNLOAD_CAMPAGNE_ANAGRAFICHE:
				{
					$table = "cache_campaign_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_CAMPAGNE_METRICHE:
				{
					$table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_ADGROUP_ANAGRAFICHE:
				{
					$table = "cache_adgroup_attributes"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_ADGROUP_METRICHE:
				{
					$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
		}
		
		$fields = self::getFields();
		
		$table_columns_for_insert = "";
		$table_columns_for_select = array ();
		
		foreach ( $fields as $k => $field ) {
			$field_4_select = "api_" . strtolower ( str_replace ( " ", "", $field ) ) . "";
			$field_4_insert = "`" . $field_4_select . "`";
			$table_columns_for_insert = $table_columns_for_insert == "" ? $field_4_insert : $table_columns_for_insert . "," . $field_4_insert;
			$table_columns_for_select [] = $field_4_select;
		}
		
		$conn = self::getConnectionFromUserId ( $user_id );
		
		if($conn!=null)
		{
			/*clear data */
			self::clearReport($conn,$id_account_adw);
			
			$sql = "LOAD DATA LOCAL INFILE '" . str_replace ( "\\", "/", $complete_fileCSV )  . "'
			INTO TABLE `" . $table . "`
			CHARACTER SET utf8mb4
			FIELDS
			TERMINATED BY ','
			LINES
			TERMINATED BY '\n'
			IGNORE 1 LINES
			(" . $table_columns_for_insert . ")";
			
			$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
			$stmt = $conn->prepare ( $sql );
			$stmt->execute (); // QUESTA RIGA PRENDE IL FILE DAL PERCORSO INDICATO E CARICA LA TABELLA
			$ret=true;
		}
		else
		{
			$ret=false;
		}
		
		return $ret;

	}
	
	private function getConnectionFromUserId($user_id) {
		if($this->connetion==true)
		{
			$stmt = $this->dbh->prepare ( "SELECT * FROM db_user where user_id=:user_id" );
			$stmt->bindParam ( ':user_id', $user_id );
		
			$stmt->execute ();
			if ($row = $stmt->fetch ( \PDO::FETCH_OBJ )) {
		
				try {
					$ret = new \PDO ( "mysql:host=" . $row->db_host . ";dbname=" . $row->db_name, $row->db_user, $row->db_password , [\PDO::MYSQL_ATTR_LOCAL_INFILE => true]);
					// set the PDO error mode to exception
					return $ret;
				} catch ( \PDOException $ex ) {
					$this->id_error = $ex->getCode();
					$this->descr_error = $ex->getMessage ();
					$this->log->info ( $this->descr_error );
					return null;
				}
			}
			else 
			{
				return null;
			}
		}
		else 
		{
			return null;
		}
	}
	
	private function getGoogleAccountsByUserId($user_id,$id_account_adw) {
		$conn = self::getConnectionFromUserId ( $user_id );
		$ret = array ();
		if($conn!=null)
		{
			$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
			$stmt = $conn->prepare ( "SELECT g.access_token,a.api_externalcustomerid,a.api_accountdescriptivename 
					FROM google_account g 
					INNER JOIN adwords_account a on g.id=a.google_user_id 
					AND a.api_externalcustomerid = :id_account_adw" );
			
			$stmt->bindParam ( ':id_account_adw', $id_account_adw );
			$stmt->execute ();
			
			while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
				$ret [] = array (
						"access_token" => $row->access_token,
						"id_account_adw" => $row->api_externalcustomerid,
						"adw_name" => $row->api_accountdescriptivename
				);
			}
		}
		
		return $ret;
	}
	
	private function getSettings() {
		if($this->connetion==true)
		{
			$stmt = $this->dbh->prepare ( "SELECT * FROM settings" );
			$stmt->execute ();
			
			if ($row = $stmt->fetch ( \PDO::FETCH_OBJ )) {
				return $row;
			}
		
			return null;
		}
	}
	
	public function downloadAllReportsFromUserdId($user_id,$param) {
		$arrayReport       = array ();
		$this->param       = $param;
		
		
		if($this->param['download_report_type']==DOWNLOAD_UNDEFINED)
		{
			$this->log->info("Download report type Undefined !!!");
			return $arrayReport;
		}
		else if($this->param['download_report_type']!=DOWNLOAD_ALL_METRICHE)
		{
			if($this->connetion==true)
			{
				
				$settings = self::getSettings ();
				$google_accounts = self::getGoogleAccountsByUserId ( $user_id, $param['id_account_adw'] );
	
				foreach ( $google_accounts as $index => $google_account ) 
				{
					/* costruzione nome file CSV */
					$namefileCSV = $this->param['al'].
									"_".$user_id.
									"_".$google_account ['adw_name'].
									"_".$this->param['descr_report_type'].
									".csv";
					$namefileCSV = preg_replace('/\s+/', '', $namefileCSV);
					
					$this->log->info("... downloading report type (".$this->param['descr_report_type'].") sul file '".$namefileCSV."'");
					$fileCSV = self::downloadReport ( $user_id, $namefileCSV, $settings, $google_account ['access_token'], $google_account ['id_account_adw'] );
					//$arrayReport [$google_account ['id_account_adw']] = $fileCSV;
					array_push($arrayReport, $fileCSV);
				}
			}
		}
		else if($this->param['download_report_type']==DOWNLOAD_ALL_METRICHE)
		{
			if($this->connetion==true)
			{
				$settings = self::getSettings ();
				$google_accounts = self::getGoogleAccountsByUserId ( $user_id, $param['id_account_adw'] );
				$all_metrics=array(DOWNLOAD_ADGROUP_METRICHE,
									DOWNLOAD_CAMPAGNE_METRICHE,
									DOWNLOAD_KEYWORDS_METRICHE,
									DOWNLOAD_URL_METRICHE);
				$all_metrics_csv=array( "ADGM",
										"CAMM",
										"KEYM",
										"URLM");
				
				foreach ( $google_accounts as $index => $google_account )
				{
					for($i=0;$i<2;$i++)
					{
						$this->param['download_report_type']=$all_metrics[$i];
						/* costruzione nome file CSV */
						$namefileCSV = $this->param['al'].
										"_".$user_id.
										"_".$google_account ['adw_name'].
										"_".$all_metrics_csv[$i].
										".csv";
						$namefileCSV = preg_replace('/\s+/', '', $namefileCSV);
						$this->log->info("... downloading report type (".$all_metrics_csv[$i].") sul file '".$namefileCSV."'");
						$fileCSV = self::downloadReport ( $user_id, $namefileCSV, $settings, $google_account ['access_token'], $google_account ['id_account_adw'] );
						array_push($arrayReport, $fileCSV);
					}
				}
			}
		}
		return $arrayReport;
	}
	
}