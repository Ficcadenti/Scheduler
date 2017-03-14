<?php
require_once "lib/googleads-php-lib/examples/AdWords/v201609/init.php";
require_once ADWORDS_UTIL_VERSION_PATH . '/ReportUtils.php';

$db_settings = array (
		"db_host" => "localhost", // host name
		"db_name" => "adplify_manager", // db name
		"db_user" => "root", // db user
		"db_password" => "raffo" 
) // db password
;
function getConnectionFromUserId($user_id) {
	$conn = getConnection ();
	$conn->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT * FROM db_user where user_id=:user_id" );
	$stmt->bindParam ( ':user_id', $user_id );
	
	$stmt->execute ();
	if ($row = $stmt->fetch ( PDO::FETCH_OBJ )) {
		
		try {
			$ret = new PDO ( "mysql:host=" . $row->db_host . ";dbname=" . $row->db_name, $row->db_user, $row->db_password );
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
		$conn = new PDO ( "mysql:host=" . $db_settings ['db_host'] . ";dbname=" . $db_settings ['db_name'], $db_settings ['db_user'], $db_settings ['db_password'] );
		// set the PDO error mode to exception
		return $conn;
	} catch ( PDOException $e ) {
		echo "Connection failed: " . $e->getMessage ();
	}
}
function getGoogleAccountsByUserId($user_id) {
	$conn = getConnectionFromUserId ( $user_id );
	$conn->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT g.access_token,a.api_externalcustomerid FROM google_account g inner join adwords_account a on g.id=a.google_user_id" );
	$stmt->execute ();
	$ret = array ();
	while ( $row = $stmt->fetch ( PDO::FETCH_OBJ ) ) {
		$ret [] = array (
				"access_token" => $row->access_token,
				"customer_id" => $row->api_externalcustomerid 
		);
	}
	
	return $ret;
}
function getSettings() {
	$conn = getConnection ();
	$conn->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare ( "SELECT * FROM settings" );
	
	$stmt->execute ();
	if ($row = $stmt->fetch ( PDO::FETCH_OBJ )) {
		return $row;
	}
	
	return null;
}
function downloadAllReportsFromUserdId($user_id) {
	$settings = getSettings ();
	$google_accounts = getGoogleAccountsByUserId ( $user_id );
	foreach ( $google_accounts as $index => $google_account ) {
		
		downloadReport ( $settings, $google_account ['access_token'], $google_account ['customer_id'] );
	}
}
function downloadReport($settings, $access_token, $clientCustomerId) {
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
	
	$selector = new \Selector ();
	$selector->fields = array (
			'CampaignId',
			'AdGroupId',
			'Id',
			'Criteria',
			'CriteriaType',
			'Impressions',
			'Clicks',
			'Cost' 
	);
	
	$reportDefinition = new ReportDefinition ();
	$reportDefinition->selector = $selector;
	$reportDefinition->reportName = 'Criteria performance report #' . uniqid ();
	$reportDefinition->dateRangeType = 'LAST_7_DAYS';
	$reportDefinition->reportType = 'CRITERIA_PERFORMANCE_REPORT';
	$reportDefinition->downloadFormat = 'CSV';
	
	//
	// // Create report definition.
	// $reportDefinition = new \ReportDefinition();
	// $reportDefinition->selector = $selector;
	// $reportDefinition->reportName = 'Criteria performance report #' . uniqid();
	// $reportDefinition->reportType = 'CRITERIA_PERFORMANCE_REPORT';
	// $reportDefinition->reportType = 'CAMPAIGN_PERFORMANCE_REPORT';
	// $reportDefinition->downloadFormat = 'CSV';
	
	// PRINT_R($reportDefinition);
	// exit;
	//
	
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
	
	$filePath = dirname ( __FILE__ ) . '/report.csv';
	$reportUtils = new \ReportUtils ();
	//var_dump($reportDefinition);
	$reportUtils->DownloadReport ( $reportDefinition, $filePath, $user, $options );
	
	return $filePath;
}

function pdoMultiInsert($tableName, $data){
	$conn = getConnection ();
	$conn->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	

	//Will contain SQL snippets.
	$rowsSQL = array();

	//Will contain the values that we need to bind.
	$toBind = array();

	//Get a list of column names to use in the SQL statement.
	$columnNames = array_keys($data[0]);

	//Loop through our $data array.
	foreach($data as $arrayIndex => $row){
		$params = array();
		foreach($row as $columnName => $columnValue){
			$param = ":" . $columnName . $arrayIndex;
			$params[] = $param;
			$toBind[$param] = $columnValue;
		}
		$rowsSQL[] = "(" . implode(", ", $params) . ")";
	}

	//Construct our SQL statement
	$sql = "INSERT INTO `$tableName` (" . implode(", ", $columnNames) . ") VALUES " . implode(", ", $rowsSQL);

	//Prepare our PDO statement.
	$pdoStatement = $conn->prepare($sql);

	//Bind our values.
	foreach($toBind as $param => $val){
		$pdoStatement->bindValue($param, $val);
	}

	//Execute our statement (i.e. insert the data).
	return $pdoStatement->execute();
}

$user_id = 20;
$file = downloadAllReportsFromUserdId ( $user_id );

/*$row = 1;
if (($handle = fopen("report.csv", "r")) !== FALSE) {
	while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
		$num = count($data);
		echo "<p> $num fields in line $row: <br /></p>\n";
		$row++;
		for ($c=0; $c < $num; $c++) {
			echo $data[$c] . "<br />\n";
		}
	}
	fclose($handle);
}

 'api_clicks',
 api_impressions
 'api_cost',*/

?>


