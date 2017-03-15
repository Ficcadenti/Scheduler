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
		if($this->connetion==true)
		{
			
			
			try {
				$stmt = $this->dbh->query( "SELECT * FROM adplify_manager.db_user" );
			
				foreach ( $stmt as $row ) {
					//array_push($fields, $row['Name']);
					printf("%s\n",$row['user_id']);
				}
				
				exit
				
				/*
				$stmt = $this->dbh->prepare( "SELECT * FROM `api_adgroup-performance-report` WHERE enabled=1" );
				$stmt->execute ();
					
				while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
					printf("%s\n",$row->Name);
					$fields[$row->Name]=$row->Name;
				}
				
				*/
				
				
			} catch ( \PDOException $ex ) {
				$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			}
			
		}
		
		
		
		
		
		/*$fields = array (
				"AdNetworkType1" => "AdNetworkType1",
				"AllConversionRate" => "AllConversionRate",
				"AllConversions" => "AllConversions",
				"AllConversionValue" => "AllConversionValue",
				"AverageCpc" => "AverageCpc",
				"AverageCpm" => "AverageCpm",
				"AverageCpv" => "AverageCpv",
				"AveragePosition" => "AveragePosition",
				"Clicks" => "Clicks",
				"ConversionRate" => "ConversionRate",
				"Conversions" => "Conversions",
				"ConversionValue" => "ConversionValue",
				"Cost" => "Cost",
				"CostPerAllConversion" => "CostPerAllConversion",
				"CostPerConversion" => "CostPerConversion",
				"CrossDeviceConversions" => "CrossDeviceConversions",
				"Ctr" => "Ctr",
				"Date" => "Date",
				"DayOfWeek" => "DayOfWeek",
				"Device" => "Device",
				"Impressions" => "Impressions",
				"Month" => "Month",
				"MonthOfYear" => "MonthOfYear",
				"Quarter" => "Quarter",
				"ValuePerAllConversion" => "ValuePerAllConversion",
				"ValuePerConversion" => "ValuePerConversion",
				"VideoViewRate" => "VideoViewRate",
				"VideoViews" => "VideoViews",
				"ViewThroughConversions" => "ViewThroughConversions",
				"Week" => "Week",
				"Year" => "Year",
				"CampaignId" => "CampaignId",
				"AdGroupId" => "AdGroupId" 
		);*/
		
		return $fields;

	}
	
	private function downloadReport($user_id, $param,  $namefileCSV, $settings, $access_token, $clientCustomerId) 
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
		$fields = DownloadAdWords::getFields();
		
		// RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
		$date_min = $param['dal']; // "20150301"; // PRENDI DA DATA
		$date_max = $param['al']; // "20170228"; // ...A DATA
		
		$selector = new \Selector ();
		$selector->fields = array_keys ( $fields ); // CAMPI DA CHIEDERE A GOOGLE
		$selector->dateRange = new \DateRange ( $date_min, $date_max ); // INTERVALLO TEMPORALE
		
		$reportDefinition = new \ReportDefinition ();
		$reportDefinition->selector = $selector;
		
		$reportDefinition->reportName = 'Criteria performance report #' . uniqid ();
		// TIPO DI INTERVALLO TEMPORALE
		$reportDefinition->dateRangeType = "CUSTOM_DATE"; // TIPO INTERVALLO PERSONALIZZATO. ALTRI POSSIBILI VALORI SONO : TODAY, LAST_7_DAYS, TODAY, YESTERDAY, THIS_WEEK, LAST_WEEK, LAST_14_DAYS, THIS_MONTH, LAST_30_DAYS, LAST_MONTH, ALL_TIME
		                                                  
		// $reportDefinition->dateRangeType = 'LAST_7_DAYS';
		                                                  // TIPO DI REPORT , ALTRI POSSIBILI SONO : KEYWORDS_PERFORMANCE_REPORT, CAMPAIGN_PERFORMANCE_REPORT, KEYWORDS_PERFORMANCE_REPORT, URL_PERFORMANCE_REPORT, ACCOUNT_PERFORMANCE_REPORT
		$reportDefinition->reportType = 'ADGROUP_PERFORMANCE_REPORT';
		// $reportDefinition->reportType = 'CRITERIA_PERFORMANCE_REPORT';
		$reportDefinition->downloadFormat = 'CSV'; // FORMATO EXPORT ALTRI VALORI : XML
		                                           
		// Set additional options.
		$options = array (
				'version' => ADWORDS_VERSION 
		);
		
		// Optional: Set skipReportHeader, skipColumnHeader, skipReportSummary to
		// suppress headers or summary rows.
		$options ['skipReportHeader'] = true;
		// $options['skipColumnHeader'] = true;
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
		//$reportUtils->DownloadReport ( $reportDefinition, $namefileCSV, $user, $options );
		
		return $namefileCSV;
	}
	
	public function writeDB($user_id,$fileCSV)
	{
		$ret=true;
		
		$complete_fileCSV = getenv ( 'CSV_PATH_FILE' ) . '/' .$fileCSV;
	
		$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
		
		$fields = DownloadAdWords::getFields();
		
		$table_columns_for_insert = "";
		$table_columns_for_select = array ();
		
		foreach ( $fields as $k => $field ) {
			$field_4_select = "api_" . strtolower ( str_replace ( " ", "", $field ) ) . "";
			$field_4_insert = "`" . $field_4_select . "`";
			printf("%s\n",$field_4_insert);
			$table_columns_for_insert = $table_columns_for_insert == "" ? $field_4_insert : $table_columns_for_insert . "," . $field_4_insert;
			$table_columns_for_select [] = $field_4_select;
		}
		
		$conn = DownloadAdWords::getConnectionFromUserId ( $user_id );
		
		if($conn!=null)
		{
			$stmt = $conn->prepare ( "TRUNCATE " . $table );
			$stmt->execute (); // QUESTA RIGA SVUOTA LA TABELLA PRIMA DI CARICARLA
			
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
	
	private function getGoogleAccountsByUserId($user_id,$customer_id) {
		$conn = DownloadAdWords::getConnectionFromUserId ( $user_id );
		$ret = array ();
		if($conn!=null)
		{
			$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
			$stmt = $conn->prepare ( "SELECT g.access_token,a.api_externalcustomerid,a.api_accountdescriptivename FROM google_account g inner join adwords_account a on g.id=a.google_user_id AND a.api_externalcustomerid = :customer_id" );
			$stmt->bindParam ( ':customer_id', $customer_id );
			$stmt->execute ();
			
			while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
				$ret [] = array (
						"access_token" => $row->access_token,
						"customer_id" => $row->api_externalcustomerid,
						"descr" => $row->api_accountdescriptivename
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
		$arrayReport = array ();

		if($this->connetion==true)
		{
			
			$settings = DownloadAdWords::getSettings ();
			$google_accounts = DownloadAdWords::getGoogleAccountsByUserId ( $user_id, $param['customer_id'] );

			foreach ( $google_accounts as $index => $google_account ) 
			{

				$namefileCSV = $google_account ['descr'] . ".csv";
				$this->log->info("... downloading '".$namefileCSV."'");
				
				$fileCSV = DownloadAdWords::downloadReport ( $user_id, $param, $namefileCSV, $settings, $google_account ['access_token'], $google_account ['customer_id'] );
				$arrayReport [$google_account ['customer_id']] = $fileCSV;

			}
		}
		return $arrayReport;
	}
	
}