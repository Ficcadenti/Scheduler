<?php


require_once "../assets/lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';


date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

$db_settings = array (
		"db_host" => "localhost", // host name
		"db_name" => "adplify_manager", // db name
		"db_user" => "root", // db user
		"db_password" => "raffo" 
); // db password
function getConnectionFromUserId($user_id) {
	$conn = getConnection ();
	$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT * FROM db_user where user_id=:user_id" );
	$stmt->bindParam ( ':user_id', $user_id );
	
	$stmt->execute ();
	if ($row = $stmt->fetch ( \PDO::FETCH_OBJ )) {
		
		try {
			$ret = new \PDO ( "mysql:host=" . $row->db_host . ";dbname=" . $row->db_name, $row->db_user, $row->db_password );
			// set the PDO error mode to exception
			return $ret;
		} catch ( PDOException $e ) {
			echo "Connection failed: " . $e->getMessage ();
		}
	}
	
	return null;
}
function getConnection() {
	global $db_settings;
	
	try {
		$conn = new \PDO ( "mysql:host=" . $db_settings ['db_host'] . ";dbname=" . $db_settings ['db_name'], $db_settings ['db_user'], $db_settings ['db_password'] );
		// set the PDO error mode to exception
		return $conn;
	} catch ( PDOException $e ) {
		echo "Connection failed: " . $e->getMessage ();
	}
}
function getGoogleAccountsByUserId($user_id) {
	$conn = getConnectionFromUserId ( $user_id );
	$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT g.access_token,a.api_externalcustomerid,a.api_accountdescriptivename FROM google_account g inner join adwords_account a on g.id=a.google_user_id" );
	$stmt->execute ();
	$ret = array ();
	while ( $row = $stmt->fetch ( \PDO::FETCH_OBJ ) ) {
		$ret [] = array (
				"access_token" => $row->access_token,
				"customer_id" => $row->api_externalcustomerid,
				"descr" => $row->api_accountdescriptivename 
		);
	}
	
	return $ret;
}
function getSettings() {
	$conn = getConnection ();
	$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT * FROM settings" );
	
	$stmt->execute ();
	if ($row = $stmt->fetch ( \PDO::FETCH_OBJ )) {
		return $row;
	}
	
	return null;
}
function downloadAllReportsFromUserdId($user_id) {
	$arrayReport = array ();
	$settings = getSettings ();
	$google_accounts = getGoogleAccountsByUserId ( $user_id );
	foreach ( $google_accounts as $index => $google_account ) {
		$namefileCSV = $google_account ['descr'] . ".csv";
		$fileCSV = downloadReport ( $user_id, $namefileCSV, $settings, $google_account ['access_token'], $google_account ['customer_id'] );
		$arrayReport [$google_account ['customer_id']] = $fileCSV;
	}
	return $arrayReport;
}
function downloadReport($user_id, $namefileCSV, $settings, $access_token, $clientCustomerId) {
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
	$fields = array (
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
	);
	
	$table_columns_for_insert = "";
	$table_columns_for_select = array ();
	
	foreach ( $fields as $k => $field ) {
		$field_4_select = "api_" . strtolower ( str_replace ( " ", "", $field ) ) . "";
		$field_4_insert = "`" . $field_4_select . "`";
		$table_columns_for_insert = $table_columns_for_insert == "" ? $field_4_insert : $table_columns_for_insert . "," . $field_4_insert;
		$table_columns_for_select [] = $field_4_select;
	}
	
	// RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
	$date_min = "20150301"; // PRENDI DA DATA
	$date_max = "20170228"; // ...A DATA
	
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
	
	$filePath = dirname ( __FILE__ ) . '/' . $namefileCSV; // PERCORSO FILE DA CREARE CON I DATI DEL REPORT
	$reportUtils = new \ReportUtils ();
	$reportUtils->DownloadReport ( $reportDefinition, $filePath, $user, $options );
	
	return $filePath;
}
function writeDB($filePath) {
	$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
	$conn = getConnectionFromUserId ( $user_id );
	
	$stmt = $conn->prepare ( "TRUNCATE " . $table );
	$stmt->execute (); // QUESTA RIGA SVUOTA LA TABELLA PRIMA DI CARICARLA
	
	var_dump ( $table_columns_for_insert );
	exit ();
	$sql = "LOAD DATA LOCAL INFILE '" . str_replace ( "\\", "/", $filePath ) . "'
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
}


$user_id = 20;
$a = downloadAllReportsFromUserdId ( $user_id );
var_dump ( $a );

