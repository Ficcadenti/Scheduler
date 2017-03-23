<?php

namespace Batch;

use Batch\lib\BatchDBType;
use Batch\lib\WriteDBAdWords;


require 'batchDBtype.php';
require 'writeDBAdWords.php';

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

class DownloadAdWords
{
	private $log                = null;
	private $dbh                = null;
	private $name_file          = "";
	private $lista_parametri    = array ();
	private $id_error           = BATCH_WITHOUT_ERROR;
	private $descr_error        = "";
	private $connetion          = false;
	private $param              = array();
	private $pid                = -1;
	private $batchType          = null;
	private $dbAdwords          = null;
	private $includi_CampagneId = array();
	private $includi_GruppiId   = array();

	function __construct() {
		$this->name_file = basename ( __FILE__, ".php" );
		$this->pid=getmypid();
		$this->batchType=new BatchDBType();
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
		$this->batchType->setLogger ( $log );
	}

	public function info() {
		$this->log->info ( "info()" );
	}
	
	private function getFields($repoType)
	{
		//$this->log->info ( "getFields($repoType)" );
		$fields = array ();
		
		switch($repoType)
		{	
			case DOWNLOAD_ADGROUP:
				{
					$table = "api_adgroup-performance-report"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_CAMPAGNE:
				{
					$table = "api_campaign-performance-report"; // TABELLA DA ALIMENTARE
				}break;
			
			case DOWNLOAD_KEYWORDS:
				{
					$table = "api_keywords-performance-report"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_URL:
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
					//$this->log->info($msg);
					$fields[$row->Name]=$row->Name;
				}
	
				
			} catch ( \PDOException $ex ) {
				$this->id_error = $ex->getCode();
				$this->descr_error = "[".$this->name_file."] getFields: ".$ex->getMessage ();
				$this->log->info ( $this->descr_error );
			}
			
		}
		
		return $fields;

	}
	
	private function downloadMetriche($repoType, $user_id,  $namefileCSV, $settings, $access_token, $clientCustomerId)
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
		$fields = self::getFields($repoType);
	
		// RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
		$date_min = $this->param['dal']; // "20150301"; // PRENDI DA DATA
		$date_max = $this->param['al']; // "20170228"; // ...A DATA
	
		$selector = new \Selector ();
		$selector->fields = array_keys ( $fields ); // CAMPI DA CHIEDERE A GOOGLE
		$selector->dateRange = new \DateRange ( $date_min, $date_max ); // INTERVALLO TEMPORALE
		
	
		$reportDefinition = new \ReportDefinition ();
		
	
		$reportDefinition->reportName = 'Criteria performance report #' . uniqid ();
		// TIPO DI INTERVALLO TEMPORALE
		$reportDefinition->dateRangeType = "CUSTOM_DATE"; // TIPO INTERVALLO PERSONALIZZATO. ALTRI POSSIBILI VALORI SONO : TODAY, LAST_7_DAYS, TODAY, YESTERDAY, THIS_WEEK, LAST_WEEK, LAST_14_DAYS, THIS_MONTH, LAST_30_DAYS, LAST_MONTH, ALL_TIME
	
		// Set additional options.
		// Optional: Set skipReportHeader, skipColumnHeader, skipReportSummary to
		// suppress headers or summary rows.
		//
		// Optional: Set useRawEnumValues to return enum values instead of enum
		// display values.
		// $options['useRawEnumValues'] = true;
		//
		// Optional: Set includeZeroImpressions to include zero impression rows in
		// the report output.
		$options = array (
				'version' => ADWORDS_VERSION
		);
		$options ['skipReportHeader'] = true;
		$options ['skipReportSummary'] = true;
		
		switch($repoType)
		{		
			
			case DOWNLOAD_CAMPAGNE:
				{
					$reportDefinition->reportType = 'CAMPAIGN_PERFORMANCE_REPORT';
					$options ['includeZeroImpressions'] = true;
					$selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS',$this->param['status_metriche']);
				}break;
				
			case DOWNLOAD_ADGROUP:
				{
					$reportDefinition->reportType = 'ADGROUP_PERFORMANCE_REPORT';
					$options ['includeZeroImpressions'] = true;
					$selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS',$this->param['status_metriche']);
					$selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS',$this->param['status_metriche']);
					
				}break;
			
				
			case DOWNLOAD_KEYWORDS:
				{
					$reportDefinition->reportType = 'KEYWORDS_PERFORMANCE_REPORT';
					$options ['includeZeroImpressions'] = true;
					$selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS',$this->param['status_metriche']);
					$selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS',$this->param['status_metriche']);
					$selector->predicates[] = new \Predicate('Status', 'EQUALS','ENABLED');
				}break;
				
			case DOWNLOAD_URL:
				{
					$reportDefinition->reportType = 'URL_PERFORMANCE_REPORT';
					$options ['includeZeroImpressions'] = false;
					$selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS',$this->param['status_metriche']);
					$selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS',$this->param['status_metriche']);
				}break;
				
		}
		
		$reportDefinition->selector = $selector;
		
		$reportDefinition->downloadFormat = 'CSV'; // FORMATO EXPORT ALTRI VALORI : XML
	
		// Download report.
	
		$filePath = getenv ( 'CSV_PATH_FILE' ) . '/' . $namefileCSV; // PERCORSO FILE DA CREARE CON I DATI DEL REPORT
		$reportUtils = new \ReportUtils ();
		$reportUtils->DownloadReport ( $reportDefinition, $filePath, $user, $options );
		
		return $namefileCSV;
	}
	
	
	private function downloadAnagrafiche($user_id, $settings, $access_token, $clientCustomerId)
	{
		$all_campagneervice = null;
		$all_campagne_id    = array();
		$adwordsUser        = new \AdWordsUser ();
		$ret                = false;
		
		$adwordsUser->SetOAuth2Info ( array (
				'client_id' => $settings->client_id,
				'client_secret' => $settings->client_secret,
				'refresh_token' => $settings->refresh_token,
				'access_token' => $access_token
		) );
	
		$adwordsUser->SetClientCustomerId ( $clientCustomerId );
		$adwordsUser->SetDeveloperToken ( $settings->dev_key );
	
		try {
			
			$all_campagneervice = $adwordsUser->GetService('CampaignService', ADWORDS_VERSION);
		
			// Create selector.
			$selector = new \Selector();
			$selector->fields = array('Id', 'Name','Amount','ServingStatus','StartDate','EndDate','Status');
			$selector->ordering[] = new \OrderBy('Name', 'ASCENDING');
			$selector->predicates[] = new \Predicate('Status', 'EQUALS',$this->param['status_anagrafiche']);
	
			// Create paging controls.
			$selector->paging = new \Paging(0, \AdWordsConstants::RECOMMENDED_PAGE_SIZE);
			do 
			{
				// Make the get request.
				$page = $all_campagneervice->get($selector);
		
				// Display results.
				if (isset($page->entries)) {
					foreach ($page->entries as $campagna) 
					{
						if(!in_array($campagna->id,$all_campagne_id))
						{
							$amount = ($campagna->budget->amount->microAmount)/(GOOGLE_MONEY_UNIT);
							
							$c = array("api_campaignid"=>$campagna->id,
									"api_campaignname"=>$campagna->name,
									"api_amount"=>$amount,
									"api_servingstatus"=>$campagna->servingStatus,
									"api_startdate"=>$campagna->startDate,
									"api_enddate"=>$campagna->endDate,
									"api_campaignstatus"=>$campagna->status,
									"api_externalcustomerid"=>$clientCustomerId
							);
							
							array_push($all_campagne_id, $campagna->id);
							$this->dbAdWord->insertCampagna($c);
						}
					}
				}
				$msg=sprintf("Downloaded %d campagne...",$this->dbAdWord->countCampagne());
				$this->log->info ( $msg );
				// Advance the paging index.
				$selector->paging->startIndex += \AdWordsConstants::RECOMMENDED_PAGE_SIZE;
			} while ($page->totalNumEntries > $selector->paging->startIndex);
			$ret=true;

			$ret  = $ret  && self::downloadAnagraficheAdGroups($adwordsUser, $all_campagne_id);
			
			
			//$this->dbAdWord->show();
			//$this->dbAdWord->showKeyword(166120940,9082894940);
			//$this->dbAdWord->showKeyword(213596180,15118173260);

		}
		catch(Exception $ex)
		{
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] downloadAnagrafiche: ".$ex->getMessage ();
			$this->log->info ( $this->descr_error );
			$ret=false;
		}
		
		return $ret;
	}
	
	public function downloadAnagraficheAdGroups($adwordsUser,$all_campagne_id)
	{
		$page = null;
		$all_adgroups_id = null;
		$clientCustomerId = $adwordsUser->GetClientCustomerId();
		$ret=true;
		
		try {
	
			$service = $adwordsUser->GetService('AdGroupService', ADWORDS_VERSION);
	
			// Create selector.
			$selector = new \Selector();
			$selector->fields = array('Id', 'Name','CampaignId','Status');
			$selector->ordering[] = new \OrderBy('Name', 'ASCENDING');

			$selector->predicates[] = new \Predicate('CampaignId', 'IN',$all_campagne_id);
			$selector->predicates[] = new \Predicate('Status', 'EQUALS',$this->param['status_anagrafiche']);
			 
			// Create paging controls.
			$selector->paging = new \Paging(0, \AdWordsConstants::RECOMMENDED_PAGE_SIZE);
	
			$adgroups = array();
	
			do {
				// Make the get request.
				$page = $service->get($selector);
	
				// Display results.
				if (isset($page->entries)) {
					foreach ($page->entries as $adgroup) 
					{
						$key=$adgroup->id . "-". $adgroup->campaignId;
	
						if(!isset($all_adgroups_id[$key]))
						{
							$g = array("api_adgroupid"=>$adgroup->id,
									"api_adgroupname"=>$adgroup->name,
									"api_adgroupstatus"=>$adgroup->status,
									"api_campaignid"=>$adgroup->campaignId,
									"api_externalcustomerid"=>$clientCustomerId
							);
							
							$all_adgroups_id[$key]=$adgroup->id;
							$this->dbAdWord->insertGruppi($g);
						}
					} 
				}
	
				// Advance the paging index.
				$selector->paging->startIndex += \AdWordsConstants::RECOMMENDED_PAGE_SIZE;
			} while ($page->totalNumEntries > $selector->paging->startIndex);
	
			
			$msg=sprintf("Downloaded %d gruppi...",$this->dbAdWord->countGruppi());
			$this->log->info ( $msg );
			
			$ret=true;
			
			$ret=$ret && self::downloadAnagraficheKeywordsAndUrl($adwordsUser,$all_adgroups_id);
	
		} catch (\Exception $ex) {
	
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] downloadAnagraficheAdGroups: ".$ex->getMessage ();
			$this->log->info ( $this->descr_error );
		}
		return $ret;
	
	}
	
	public function downloadAnagraficheKeywordsAndUrl($adwordsUser,$all_gruppi_id)
	{
		$page                    = null;
		$all_gruppi_id_predicate = array();
		$all_keywords_id         = array();
		$clientCustomerId        = $adwordsUser->GetClientCustomerId();
		$ret                     = true;
		
		//$all_gruppi_id =array(9082894940,15118173260); // per test
				
		/* traduzione per generare l'array dei predicati*/
		foreach ($all_gruppi_id as $key => $value)
		{
			array_push($all_gruppi_id_predicate, $value);
		}
		

		try {
	
			$service = $adwordsUser->GetService('AdGroupCriterionService', ADWORDS_VERSION);
	
			// Create selector.
			$selector = new \Selector();
			$selector->fields = array('Id','AdGroupId', 'BaseCampaignId', 'Status','KeywordText','PlacementUrl','CriteriaType');
			$selector->ordering[] = new \OrderBy('KeywordText', 'ASCENDING');
			$selector->predicates[] = new \Predicate('AdGroupId', 'IN',$all_gruppi_id_predicate);
			$selector->predicates[] = new \Predicate('Status', 'EQUALS',$this->param['status_anagrafiche']);
			
			// Create paging controls.
			$selector->paging = new \Paging(0, \AdWordsConstants::RECOMMENDED_PAGE_SIZE);
	
			$adgroups = array();
	
			do {
				// Make the get request.
				$page = $service->get($selector);
	
				// Display results.
				if (isset($page->entries)) {
					foreach ($page->entries as $element)
					{
						//$this->log->info(json_encode($keyword));
						//if(!in_array($keyword->criterion->id,$all_keywords_id))
						//array_push($all_keywords_id, $keyword->criterion->id);
						if ($element->criterion->type=='KEYWORD')
						{
							$k = array("api_id"=>$element->criterion->id,
									"api_qualityscore"=>0,
									"api_keywordname"=>$element->criterion->text,
									"api_keywordstatus"=>$element->userStatus,
									"api_campaignid"=>$element->baseCampaignId,
									"api_adgroupid"=>$element->adGroupId,
									"api_externalcustomerid"=>$clientCustomerId
							);
							$this->dbAdWord->insertKeywords($k);
						}
						else if ($element->criterion->type=='PLACEMENT')
						{
							$u = array("api_id"=>$element->criterion->id,
									"api_url"=>$element->criterion->url,
									"api_campaignid"=>$element->baseCampaignId,
									"api_adgroupid"=>$element->adGroupId,
									"api_externalcustomerid"=>$clientCustomerId
							);
							$this->dbAdWord->insertUrl($u);
						}
					}
				}
	
				// Advance the paging index.
				$selector->paging->startIndex += \AdWordsConstants::RECOMMENDED_PAGE_SIZE;
			} while ($page->totalNumEntries > $selector->paging->startIndex);
	
			$ret=true;
			
			$msg=sprintf("Downloaded %d keywords...",$this->dbAdWord->countKeywords());
			$this->log->info ( $msg );
			$msg=sprintf("Downloaded %d url...",$this->dbAdWord->countUrl());
			$this->log->info ( $msg );
	
		} catch (\Exception $ex) {
	
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] downloadAnagraficheAdGroups: ".$ex->getMessage ();
			$this->log->info ( $this->descr_error );
		}
		return $ret;
	
	}
	
	private function clearReportMetriche($conn,$id_account_adw,$repoType)
	{
		$ret=true;
		$table = "";
		
		$s=$this->param['dal'];
		$str_dal = substr($s,0,4)."-".substr($s,4,2)."-".substr($s,6,2);
		$s=$this->param['al'];
		$str_al = substr($s,0,4)."-".substr($s,4,2)."-".substr($s,6,2);
		
		
		$this->log->info ( "clearReportMetriche (dal: ".$str_dal." al: " .$str_al. ") per ADW Account: ".$id_account_adw." tipo report: ".$this->batchType->getDescrizione($repoType));
		
		switch($repoType)
		{
	
			case DOWNLOAD_ADGROUP:
				{
					$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_CAMPAGNE:
				{
					$table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
				}break;
										
			case DOWNLOAD_KEYWORDS:
				{
					$table = "cache_keywords_metrics"; // TABELLA DA ALIMENTARE
				}break;				
					
			case DOWNLOAD_URL:
				{
					$table = "cache_url_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
		}
		
		try {
			$sql = "set foreign_key_checks=0";
			$stmt = $conn->prepare ( $sql );
			$stmt->execute ();
			
			$sql = "LOCK TABLES ".$table." WRITE";
			$stmt = $conn->prepare ( $sql );
			$stmt->execute ();
			
			$sql = "DELETE FROM ".$table." WHERE api_date >= :api_date AND api_externalcustomerid = :api_externalcustomerid";
			$stmt = $conn->prepare ( $sql );
			$stmt->bindParam ( ':api_date', $str_dal );
			$stmt->bindParam ( ':api_externalcustomerid', $id_account_adw );
			$stmt->execute (); // QUESTA RIGA PRENDE IL FILE DAL PERCORSO INDICATO E CARICA LA TABELLA*/
	
			$sql = "UNLOCK  TABLES";
			$stmt = $conn->prepare ( $sql );
			$stmt->execute ();
			
			$sql = "set foreign_key_checks=1";
			$stmt = $conn->prepare ( $sql );
			$stmt->execute ();
			
			$ret=true;
		} catch (\Exception $ex) {
	
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] clearReportMetriche: ".$ex->getMessage ();
			$this->log->info ( $this->descr_error );
		}
		
		return $ret;
	}
	
	
	public function writeDB($user_id,$id_account_adw,$repoType,$fileCSV)
	{
		$ret=true;
		
		if(self::writeDBMetriche($user_id,$id_account_adw,$repoType,$fileCSV))
		{
			/** da mandare un codice di errore per capire dove o fallito: metriche o anagrafiche */
			$ret=true;
		}
		else 
		{
			$this->id_error = ERROR;
			$this->descr_error = "[".$this->name_file."] writeDB: Errore write metriche ".$repoType;
			$ret=false;
		}

		return $ret;
	}
	
	private function writeDBMetriche($user_id,$id_account_adw,$repoType,$fileCSV)
	{
		$ret=true;
		$table = "";
		$complete_fileCSV = getenv ( 'CSV_PATH_FILE' ) . '/' .$fileCSV;
	
		
		switch($repoType)
		{
			case DOWNLOAD_ADGROUP:
				{
					$table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
				}break;
				
			case DOWNLOAD_CAMPAGNE:
				{
					$table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_KEYWORDS:
				{
					$table = "cache_keywords_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
			case DOWNLOAD_URL:
				{
					$table = "cache_url_metrics"; // TABELLA DA ALIMENTARE
				}break;
					
		}
		
		$fields = self::getFields($repoType);
		
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
			if(self::clearReportMetriche($conn,$id_account_adw,$repoType))
			{
				try 
				{
					$sql = "set foreign_key_checks=0";
					$stmt = $conn->prepare ( $sql );
					$stmt->execute ();
					
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
					
					$sql = "set foreign_key_checks=1";
					$stmt = $conn->prepare ( $sql );
					$stmt->execute ();
					$ret=true;
				}
				catch (\Exception $ex) {
				
					$this->id_error = $ex->getCode();
					$this->descr_error = "[".$this->name_file."] writeDBMetriche: ".$ex->getMessage ();
					$this->log->info ( $this->descr_error );
				}
			}
			else
			{
				$ret=false;
			}
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
	
	public function logicaMetriche($repoType) 
	{
		$all_metrics = array();
		
		switch($repoType)
		{
			
			case DOWNLOAD_CAMPAGNE:
				{
					$all_metrics = array(DOWNLOAD_CAMPAGNE);
				}break;
				
			case DOWNLOAD_ADGROUP:
				{
					$all_metrics = array(DOWNLOAD_CAMPAGNE,
										DOWNLOAD_ADGROUP);
				}break;
		
			case DOWNLOAD_KEYWORDS:
				{
					$all_metrics = array(DOWNLOAD_KEYWORDS);
				}break;
					
			case DOWNLOAD_URL:
				{
					$all_metrics  = array(DOWNLOAD_URL);
				}break;
				
			case DOWNLOAD_ALL:
				{
					$all_metrics = array(DOWNLOAD_CAMPAGNE,
										DOWNLOAD_ADGROUP,
										DOWNLOAD_KEYWORDS,
										DOWNLOAD_URL,
										DOWNLOAD_ALL);
				}break;
					
		}
		
		return $all_metrics;
		
	}
	
	public function downloadAllReportsFromUserdId($user_id,$param) {
		$ret               = true;
		$arrayReport       = array ();
		$this->param       = $param;
		$repoType          = $this->param['download_report_type'];
		
		
		$this->batchType->connect();
		
		if($this->batchType->load())
		{
			if($repoType==DOWNLOAD_UNDEFINED)
			{
				$this->id_error = ERROR;
				$this->descr_error = "[".$this->name_file."] downloadAllReportsFromUserdId: Download report type Undefined !!!";
				$this->log->info($this->descr_error);
				$ret=false;
			}
			else 
			{
				$all_metrics = self::logicaMetriche($repoType);
				
				if($this->connetion==true)
				{
					$settings = self::getSettings ();
					$google_accounts = self::getGoogleAccountsByUserId ( $user_id, $param['id_account_adw'] );
		
					foreach ( $google_accounts as $index => $google_account ) 
					{
						$i=0;
						$ana=true;
						

						if($this->param['abilita_anagrafiche']==ANAGRAFICHE_ABILITATE)
						{	
							$this->dbAdWord=new WriteDBAdWords();
							$this->dbAdWord->setLogger($this->log);
							$this->dbAdWord->setIdAccountAdw($google_account ['id_account_adw']);
							$this->dbAdWord->setIdUser($user_id);

							$ana=self::downloadAnagrafiche($user_id, $settings, $google_account ['access_token'], $google_account ['id_account_adw'] );
							if($ana==true)
							{
								$this->dbAdWord->connect();
								$ret_save=$this->dbAdWord->save();
							}
							else 
							{
								$ret=false;
							}
						}
						else 
						{
							$ana=true; /* forzatura per abilitare il successivo download delle metriche */
						}
						
						if($this->param['abilita_metriche']==METRICHE_ABILITATE)
						{
							if($ana==true)
							{
								while( ($i<count($all_metrics)) && ($all_metrics[$i]<=$repoType) )
								{
									if($all_metrics[$i]==DOWNLOAD_ALL)
									{
										$i++;
										continue;
									}
									
									// costruzione nome file CSV 
									$namefileCSV = $this->param['al'].
													"_".$this->pid.
													"_".$user_id.
													"_".$google_account ['adw_name'].
													"_".$this->batchType->getSuffisso($all_metrics[$i]).
													".csv";
									$namefileCSV = preg_replace('/\s+/', '', $namefileCSV);
									
									
									$this->log->info("... downloading report type (".
															$this->batchType->getSuffisso($all_metrics[$i]).") sul file '".$namefileCSV."'");
									
				
									$fileCSV_METRIC = self::downloadMetriche( $all_metrics[$i], $user_id, $namefileCSV, $settings, $google_account ['access_token'], $google_account ['id_account_adw'] );
									array_push($arrayReport, $fileCSV_METRIC);
									$i++;
								}
							}
						}
					}
				}
	
				$i=0;
				foreach ($arrayReport as $key => $value)
				{
					$writeReportDB=self::writeDB($user_id,$param['id_account_adw'],$all_metrics[$i],$value);
					if($writeReportDB==true)
					{
						$ren=self::renameCSVtoIMP($value);
						if($ren==false)
						{
							$ret=false;
						}
					}
					else
					{
						$ret=false;
					}
					$i++;
				}
			}
		}
		else
		{
			$this->id_error = ERROR;
			$this->descr_error = "Errore nel caricamento della tabella batch_type_lib !!!!!";
			$ret=false;
		}
		
		return $ret;
	}
	
	private function renameCSVtoIMP($csv_file)
	{
		$path_csv=getenv ( 'CSV_PATH_FILE' );
		$path_imp=getenv ( 'IMP_PATH_FILE' );
		$imp_file=str_replace("csv","imp",$csv_file);
		$this->log->info ( "renameCSVtoIMP()" );
		$this->log->info ( "    ".$path_csv."/".$csv_file );
		$this->log->info ( "    ".$path_imp."/".$imp_file );
		$ok = rename($path_csv."/".$csv_file, $path_imp."/".$imp_file);
		if($ok==false)
		{
			$this->id_error = ERROR;
			$this->descr_error = "[".$this->name_file."] downloadAllReportsFromUserdId: Errore rename file ".$csv_file;
		}
		return $ok;
	}
	
}