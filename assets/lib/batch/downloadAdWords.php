<?php

namespace Batch;

use Batch\lib\BatchDBType;
use Batch\lib\WriteDBAdWords;
use Google\Auth\CredentialsLoader;
use Google\Auth\OAuth2;
use Google\AdsApi\Common\OAuth2TokenBuilder;
use Google\AdsApi\AdWords\AdWordsServices;
use Google\AdsApi\AdWords\AdWordsSession;
use Google\AdsApi\AdWords\AdWordsSessionBuilder;
use Google\AdsApi\AdWords\ReportSettingsBuilder;
use Google\AdsApi\AdWords\v201710\cm\ReportDefinitionReportType;
use Google\AdsApi\AdWords\v201710\cm\ReportDefinitionService;
use Google\AdsApi\AdWords\v201710\cm\CampaignService;
use Google\AdsApi\AdWords\v201710\cm\AdGroupService;
use Google\AdsApi\AdWords\v201710\cm\AdGroupCriterionService;
use Google\AdsApi\AdWords\v201710\cm\OrderBy;
use Google\AdsApi\AdWords\v201710\cm\Paging;
use Google\AdsApi\AdWords\v201710\cm\Predicate;
use Google\AdsApi\AdWords\v201710\cm\PredicateOperator;
use Google\AdsApi\AdWords\v201710\cm\Selector;
use Google\AdsApi\AdWords\v201710\cm\SortOrder;
use Google\AdsApi\AdWords\v201710\cm\DateRange;
use Google\AdsApi\AdWords\Reporting\v201710\ReportDownloader;
use Google\AdsApi\AdWords\Reporting\v201710\DownloadFormat;
use Google\AdsApi\AdWords\Reporting\v201710\ReportDefinition;
use Google\AdsApi\AdWords\Reporting\v201710\ReportDefinitionDateRangeType;
use Monolog\Handler\NullHandler;
use Monolog\Logger;



require 'batchDBtype.php';
require 'writeDBAdWords.php';

date_default_timezone_set('UTC');
date_default_timezone_set('Europe/Rome');

class DownloadAdWords {

    private $log = null;
    private $dbh = null;
    private $name_file = "";
    private $lista_parametri = array();
    private $id_error = BATCH_WITHOUT_ERROR;
    private $descr_error = "";
    private $connetion = false;
    private $param = array();
    private $pid = -1;
    private $batchType = null;
    private $dbAdwords = null;
    private $includi_CampagneId = array();
    private $includi_GruppiId = array();

    function __construct() {
        $this->name_file = basename(__FILE__, ".php");
        $this->pid = getmypid();
        $this->batchType = new BatchDBType();
        print_r(dirname(dirname(__FILE__)));
    }

    function __destruct() {
        
    }

    private function boolToStr($b) {
        return ($b) ? 'true' : 'false';
    }

    public function connect() {
        try {
            $this->dbh = new \PDO('mysql:host=' . getenv('DB_HOST') . ';dbname=' . getenv('DB_NAME_ADPMANAGER'), getenv('DB_USER'), getenv('DB_PASS'));
            $this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->connetion = true;
        } catch (\PDOException $ex) {
            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] " . $ex->getMessage();
            $this->log->info($this->descr_error);
            $this->connetion = false;
        }
    }

    public function getIdError() {
        return $this->id_error;
    }

    public function getDescError() {
        return $this->descr_error;
    }

    public function setLogger($log) {
        $this->log = $log;
        $this->batchType->setLogger($log);
    }

    public function info() {
        $this->log->info("info()");
    }

    private function getFields($repoType) {
        //$this->log->info ( "getFields($repoType)" );
        $fields = array();

        switch ($repoType) {
            case DOWNLOAD_ADGROUP: {
                    $table = "api_adgroup-performance-report"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_CAMPAGNE: {
                    $table = "api_campaign-performance-report"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_KEYWORDS: {
                    $table = "api_keywords-performance-report"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_QUERY: {
                    $table = "api_search-query-performance-report"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $table = "api_finalurl-performance-report"; // TABELLA DA ALIMENTARE
                }break;
            case DOWNLOAD_QS: {
                    $table = "api_keywords-qs-report"; // TABELLA DA ALIMENTARE
                }break;
            case DOWNLOAD_URL: {
                    $table = "api_url-performance-report"; // TABELLA DA ALIMENTARE
                }break;
        }

        if ($this->connetion == true) {

            try {
                $stmt = $this->dbh->prepare("SELECT * FROM `" . $table . "` WHERE enabled=1");
                $stmt->execute();

                while ($row = $stmt->fetch(\PDO::FETCH_OBJ)) {
                    $msg = sprintf("... Enabled: %s", $row->Name);
                    //$this->log->info($msg);
                    $fields[$row->Name] = $row->Name;
                }
            } catch (\PDOException $ex) {
                $this->id_error = $ex->getCode();
                $this->descr_error = "[" . $this->name_file . "] getFields: " . $ex->getMessage();
                $this->log->info($this->descr_error);
            }
        }

        return $fields;
    }

    private function downloadMetriche($repoType, $user_id, $namefileCSV, $settings, $refresh_token, $clientCustomerId) {
        $user = new \AdWordsUser ();
        $user->SetOAuth2Info(array(
            'client_id' => $settings->client_id,
            'client_secret' => $settings->client_secret,
            'refresh_token' => $settings->refresh_token,
            'access_token' => $access_token
        ));

        // Load the service, so that the required classes are available.
        $user->LoadService('ReportDefinitionService', ADWORDS_VERSION);
        // Optional: Set clientCustomerId to get reports of your child accounts
        $user->SetClientCustomerId($clientCustomerId);
        $user->SetDeveloperToken($settings->dev_key);

        // Create selector.
        // CAMPI DA PRENDERE PER SCARICARE ADGROUP
        $fields = self::getFields($repoType);

        // RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
        $date_min = $this->param['dal']; // "20150301"; // PRENDI DA DATA
        $date_max = $this->param['al']; // "20170228"; // ...A DATA

        $selector = new \Selector ();
        $selector->fields = array_keys($fields); // CAMPI DA CHIEDERE A GOOGLE
        $selector->dateRange = new \DateRange($date_min, $date_max); // INTERVALLO TEMPORALE


        $reportDefinition = new \ReportDefinition ();


        $reportDefinition->reportName = 'Criteria performance report #' . uniqid();
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
        $options = array(
            'version' => ADWORDS_VERSION
        );
        $options ['skipReportHeader'] = true;
        $options ['skipReportSummary'] = true;

        switch ($repoType) {

            case DOWNLOAD_CAMPAGNE: {
                    $reportDefinition->reportType = 'CAMPAIGN_PERFORMANCE_REPORT';
                    //$options ['includeZeroImpressions'] = true;

                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;

            case DOWNLOAD_ADGROUP: {
                    $reportDefinition->reportType = 'ADGROUP_PERFORMANCE_REPORT';
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;


            case DOWNLOAD_KEYWORDS: {
                    $reportDefinition->reportType = 'KEYWORDS_PERFORMANCE_REPORT';
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('Status', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;

            case DOWNLOAD_QUERY: {
                    $reportDefinition->reportType = 'SEARCH_QUERY_PERFORMANCE_REPORT';
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('Status', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $reportDefinition->reportType = 'FINAL_URL_REPORT';
                    //$options ['includeZeroImpressions'] = false;
                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;
            case DOWNLOAD_QS: {
                    /* Per il quality score l'unica metrica la scarichiamo con le anagrafiche */
                }break;

            case DOWNLOAD_URL: {
                    $reportDefinition->reportType = 'URL_PERFORMANCE_REPORT';
                    //$options ['includeZeroImpressions'] = false;
                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->predicates[] = new \Predicate('AdGroupStatus', 'EQUALS', $this->param['status_metriche']);
                        $selector->predicates[] = new \Predicate('CampaignStatus', 'EQUALS', $this->param['status_metriche']);
                    }
                }break;
        }

        $reportDefinition->selector = $selector;

        $reportDefinition->downloadFormat = 'CSV'; // FORMATO EXPORT ALTRI VALORI : XML
        // Download report.

        $filePath = getenv('CSV_PATH_FILE') . '/' . $namefileCSV; // PERCORSO FILE DA CREARE CON I DATI DEL REPORT
        $reportUtils = new \ReportUtils ();
        $reportUtils->DownloadReport($reportDefinition, $filePath, $user, $options);

        return $namefileCSV;
    }

    private function downloadMetricheV201710($session, $repoType, $user_id, $namefileCSV, $settings) {
       
        
        /*->withReportDownloaderLogger($this->log)*/
        $adWordsServices = new AdWordsServices();

        
        // CAMPI DA PRENDERE PER SCARICARE ADGROUP
        $fields = self::getFields($repoType);

        // RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
        $date_min = $this->param['dal']; // "20150301"; // PRENDI DA DATA
        $date_max = $this->param['al']; // "20170228"; // ...A DATA

        
            // Create selector.
        $selector = new Selector();
        $selector->setFields(array_keys($fields));
        
        // RAPPRESENTA L'INTERVALLO TEMPORALE NEL QUALE PRENDERE I DATI
        $date_min  = $this->param['dal']; // "20150301"; // PRENDI DA DATA
        $date_max  = $this->param['al']; // "20170228"; // ...A DATA
        $dateRange = new DateRange($date_min, $date_max);
        $selector->setDateRange($dateRange);

            // Create report definition.
        $reportDefinition = new ReportDefinition();
        
        $reportDefinition->setReportName('Criteria performance report #' . uniqid());
        $reportDefinition->setDateRangeType(ReportDefinitionDateRangeType::CUSTOM_DATE);

        switch ($repoType) {

            case DOWNLOAD_CAMPAGNE: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::CRITERIA_PERFORMANCE_REPORT);
                    //$options ['includeZeroImpressions'] = true;

                    if ($this->param['status_metriche'] != 'ALL') {
                        $selector->setPredicates([new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']])]);
                    }
                }break;

            case DOWNLOAD_ADGROUP: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::ADGROUP_PERFORMANCE_REPORT);
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') 
                    {
                        $selector->setPredicates([
                            new Predicate('AdGroupStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']])
                            ]);
                    }
                }break;


            case DOWNLOAD_KEYWORDS: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::KEYWORDS_PERFORMANCE_REPORT);
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') 
                    {
                        $selector->setPredicates([
                            new Predicate('AdGroupStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_metriche']])
                            ]);
                    }
                    
                }break;

            case DOWNLOAD_QUERY: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::SEARCH_QUERY_PERFORMANCE_REPORT);
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') 
                    {
                        $selector->setPredicates([
                            new Predicate('AdGroupStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_metriche']])
                            ]);
                    }
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::FINAL_URL_REPORT);
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') 
                    {
                        $selector->setPredicates([
                            new Predicate('AdGroupStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']])
                            ]);
                    }
                }break;
            case DOWNLOAD_QS: {
                    /* Per il quality score l'unica metrica la scarichiamo con le anagrafiche */
                }break;

            case DOWNLOAD_URL: {
                    $reportDefinition->setReportType(ReportDefinitionReportType::URL_PERFORMANCE_REPORT);
                    //$options ['includeZeroImpressions'] = true;
                    if ($this->param['status_metriche'] != 'ALL') 
                    {
                        $selector->setPredicates([
                            new Predicate('AdGroupStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']]),
                            new Predicate('CampaignStatus', PredicateOperator::EQUALS, [$this->param['status_metriche']])
                            ]);
                    }
                }break;
        }

        $reportDefinition->setSelector($selector);
        $reportDefinition->setDownloadFormat(DownloadFormat::CSV);
         
        
        // Download report.
        $reportDownloader = new ReportDownloader($session);
        
        $reportSettingsOverride = (new ReportSettingsBuilder())
        ->includeZeroImpressions(false)
        ->skipReportHeader(true)
        ->skipReportSummary(true)
        ->build();
        
        $filePath = getenv('CSV_PATH_FILE') . '/' . $namefileCSV; // PERCORSO FILE DA CREARE CON I DATI DEL REPORT
        
        $reportDownloadResult = $reportDownloader->downloadReport($reportDefinition, $reportSettingsOverride);
        $reportDownloadResult->saveToFile($filePath);
        

        return $namefileCSV;
    }

    public function downloadAnagraficheCampagneV201710($session) {
        $clientCustomerId = $session->getClientCustomerId();
        $all_campagneervice = null;
        $all_campagne_id = array();
        $ret = false;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;
        $adWordsServices = new AdWordsServices();

        $msg = sprintf("downloadAnagraficheCampagneV201710 (clientCustomerId=%s)", $clientCustomerId);
        $this->log->info($msg);

        try {
            $tstart = time();
            $all_campagneervice = $adWordsServices->get($session, CampaignService::class);
            // Create selector.
            $selector = new Selector();
            $selector->setFields(['Id', 'Name', 'Amount', 'AdvertisingChannelType', 'ServingStatus', 'StartDate', 'EndDate', 'Status', 'BiddingStrategyType']);
            $selector->setOrdering([new OrderBy('Name', SortOrder::ASCENDING)]);

            if ($this->param['status_anagrafiche'] != 'ALL') {
                $selector->setPredicates([
                    new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_anagrafiche']])
                ]);
            }
            // Create paging controls.
            $selector->setPaging(new Paging(0, RECOMMENDED_PAGE_SIZE));
            do {
                // Make the get request.
                $page = $all_campagneervice->get($selector);

                // Display results.
                if ($page->getEntries() !== null) {
                    $totalNumEntries = $page->getTotalNumEntries();
                    foreach ($page->getEntries() as $campaign) {
                        $amount = ($campaign->getBudget()->getAmount()->getMicroAmount()) / (GOOGLE_MONEY_UNIT);
                        if (is_null($campaign->getBiddingStrategyConfiguration())) {
                            $target = "";
                        } else {
                            $target = $campaign->getBiddingStrategyConfiguration()->getBiddingStrategyType();
                        }

                        $c = array("api_campaignid" => $campaign->getId(),
                            "api_campaignname" => $campaign->getName(),
                            "api_amount" => $amount,
                            "api_servingstatus" => $campaign->getServingStatus(),
                            "api_chaneltype" => $campaign->getAdvertisingChannelType(),
                            "api_startdate" => $campaign->getStartDate(),
                            "api_enddate" => $campaign->getEndDate(),
                            "api_status" => $campaign->getStatus(),
                            "api_biddingstrategytype" => $target,
                            "api_externalcustomerid" => $session->getClientCustomerId()
                        );
                        $this->dbAdWord->insertCampagna($c);
                    }
                }
                // Advance the paging index.
                $selector->getPaging()->setStartIndex($selector->getPaging()->getStartIndex() + RECOMMENDED_PAGE_SIZE);
            } while ($selector->getPaging()->getStartIndex() < $totalNumEntries);

            $ret = true;
            $tstop = time();
            $delta = ($tstop - $tstart);
            $msg = sprintf("Downloaded %d campagne in %d sec !!!", $this->dbAdWord->countCampagne(), $delta);
            $this->log->info($msg);
        } catch (\Exception $ex) {
            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] downloadAnagrafiche: " . $ex->getMessage();
            $this->log->info($this->descr_error);
            $ret = false;
        }

        return $ret;
    }
    
    public function downloadAnagraficheAdGroupsV201710($session) {
        $page = null;
        $all_adgroups_id = array();
        $clientCustomerId = $session->getClientCustomerId();
        $ret = true;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;
        $adWordsServices = new AdWordsServices();
        try {

            $tstart = time();
            $all_gruppi_service = $adWordsServices->get($session, AdGroupService::class);

            // Create selector.
            $selector = new Selector();
            $selector->setFields(['Id', 'Name', 'CampaignId', 'Status']);
            $selector->setOrdering([new OrderBy('Name', SortOrder::ASCENDING)]);

            if ($this->param['status_anagrafiche'] != 'ALL') {
                $selector->setPredicates([
                    new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_anagrafiche']])
                ]);
            }
            // Create paging controls.
            $selector->setPaging(new Paging(0, RECOMMENDED_PAGE_SIZE));


            do {
                // Make the get request.
                $page = $all_gruppi_service->get($selector);

                // Display results.
                if ($page->getEntries() !== null) {
                    $totalNumEntries = $page->getTotalNumEntries();
                    foreach ($page->getEntries() as $adgroup) {
                        $key = $adgroup->getId() . "-" . $adgroup->getName();

                        if (!isset($all_adgroups_id[$key])) {
                            $g = array("api_adgroupid" => $adgroup->getId(),
                                "api_adgroupname" => $adgroup->getName(),
                                "api_status" => $adgroup->getStatus(),
                                "api_campaignid" => $adgroup->getCampaignId(),
                                "api_externalcustomerid" => $session->getClientCustomerId()
                            );

                            $all_adgroups_id[$key] = $adgroup->getId();
                            $this->dbAdWord->insertGruppi($g);
                        }
                    }
                }

                // Advance the paging index.
                $selector->getPaging()->setStartIndex($selector->getPaging()->getStartIndex() + RECOMMENDED_PAGE_SIZE);
            } while ($selector->getPaging()->getStartIndex() < $totalNumEntries);
            $ret = true;

            $tstop = time();
            $delta = ($tstop - $tstart);
            $msg = sprintf("Downloaded %d gruppi in %d sec !!!", $this->dbAdWord->countGruppi(), $delta);
            $this->log->info($msg);
        } catch (\Exception $ex) {

            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] downloadAnagraficheAdGroups: " . $ex->getMessage();
            $this->log->info($this->descr_error);
        }
        return $ret;
    }

    public function downloadAnagraficheKeywordsV201710($session) {
        $page = null;
        $all_gruppi_id_predicate = array();
        $all_keywords_id = array();
        $clientCustomerId = $session->getClientCustomerId();
        $ret = true;
        $q = 0;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;
        $adWordsServices = new AdWordsServices();

        $msg = sprintf("downloadAnagraficheKeywordsV201710 (clientCustomerId=%s)", $clientCustomerId);
        $this->log->info($msg);

        try {

            $tstart = time();
            $all_keywords_ervice = $adWordsServices->get($session, AdGroupCriterionService::class);
            // Create selector.
            $selector = new Selector();
            $selector->setFields(['Id', 'AdGroupId', 'BaseCampaignId', 'QualityScore', 'Status', 'KeywordText', 'PlacementUrl', 'CriteriaType', 'BiddingStrategyType']);
            $selector->setOrdering([new OrderBy('KeywordText', SortOrder::ASCENDING)]);

            if ($this->param['status_anagrafiche'] != 'ALL') {
                $selector->setPredicates([
                    new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_anagrafiche']])
                ]);
            }
            // Create paging controls.
            $selector->setPaging(new Paging(0, RECOMMENDED_PAGE_SIZE));

            do {

                // Make the get request.
                $page = $all_keywords_ervice->get($selector);

                // Display results.
                if ($page->getEntries() !== null) {
                    $totalNumEntries = $page->getTotalNumEntries();
                    foreach ($page->getEntries() as $element) {

                        if ($element->getCriterion()->getType() == 'KEYWORD') {
                            if (method_exists(get_class($element), "getQualityInfo")) {
                                if (is_null($element->getQualityInfo())) {
                                    $q = 0;
                                } else {
                                    $q = $element->getQualityInfo()->getQualityScore();
                                }
                            } else {
                                $q = 0;
                            }
                            
                            if (method_exists(get_class($element), "getBiddingStrategyConfiguration")) {
                                if (is_null($element->getBiddingStrategyConfiguration())) {
                                    $target = "";
                                } else {
                                    $target = $element->getBiddingStrategyConfiguration()->getBiddingStrategyType();
                                }
                            } else {
                                $target = "";
                            }

                            if (method_exists(get_class($element), "getUserStatus")) {
                                if (is_null($element->getUserStatus())) {
                                    $status = "";
                                } else {
                                    $status = $element->getUserStatus();
                                }
                            } else {
                                $status = "";
                            }

                            $k = array("api_id" => $element->getCriterion()->getId(),
                                "api_qualityscore" => $q,
                                "api_keywordname" => $element->getCriterion()->getText(),
                                "api_status" => $status,
                                "api_campaignid" => $element->getBaseCampaignId(),
                                "api_adgroupid" => $element->getAdGroupId(),
                                "api_biddingstrategytype" => $target,
                                "api_externalcustomerid" => $session->getClientCustomerId()
                            );
                            $this->dbAdWord->insertKeywords($k);
                        }
                    }
                }

                // Advance the paging index.
                $selector->getPaging()->setStartIndex($selector->getPaging()->getStartIndex() + RECOMMENDED_PAGE_SIZE);
            } while ($selector->getPaging()->getStartIndex() < $totalNumEntries);

            $ret = true;
            $tstop = time();
            $delta = ($tstop - $tstart);
            $msg = sprintf("Downloaded %d keywords and ", $this->dbAdWord->countKeywords());
            $this->log->info($msg);
            
        } catch (\Exception $ex) {

            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] downloadAnagraficheKeywordsV201710: " . $ex->getMessage();
            $this->log->info($this->descr_error);
        }
        return $ret;
    }

    public function downloadAnagraficheQueryV201710($session) {
        return true;
    }

    public function downloadAnagraficheUrlV201710($session) {
        $page = null;
        $all_gruppi_id_predicate = array();
        $all_keywords_id = array();
        $clientCustomerId = $session->getClientCustomerId();
        $ret = true;
        $q = 0;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;
        $adWordsServices = new AdWordsServices();

        $msg = sprintf("downloadAnagraficheUrlV201710 (clientCustomerId=%s)", $clientCustomerId);
        $this->log->info($msg);

        try {

            $tstart = time();
            $all_url_service = $adWordsServices->get($session, AdGroupCriterionService::class);
            // Create selector.
            $selector = new Selector();
            $selector->setFields(['Id', 'AdGroupId', 'BaseCampaignId', 'QualityScore', 'Status', 'KeywordText', 'PlacementUrl', 'CriteriaType']);
            $selector->setOrdering([new OrderBy('KeywordText', SortOrder::ASCENDING)]);

            if ($this->param['status_anagrafiche'] != 'ALL') {
                $selector->setPredicates([
                    new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_anagrafiche']])
                ]);
            }
            // Create paging controls.
            $selector->setPaging(new Paging(0, RECOMMENDED_PAGE_SIZE));
            
            

            do {
                // Make the get request.
                $page = $all_url_service->get($selector);

                // Display results.
                if ($page->getEntries() !== null) {
                    $totalNumEntries = $page->getTotalNumEntries();
                    foreach ($page->getEntries() as $element) {
                        
                        if ($element->getCriterion()->getType() == 'PLACEMENT') {
                            $u = array("api_id" => $element->getCriterion()->getId(),
                                "api_url" => $element->getCriterion()->getUrl(),
                                "api_campaignid" => $element->getBaseCampaignId(),
                                "api_adgroupid" => $element->getAdGroupId(),
                                "api_externalcustomerid" => $session->getClientCustomerId()
                            );
                            $this->dbAdWord->insertUrl($u);
                        }
                    }
                }

                // Advance the paging index.
                $selector->getPaging()->setStartIndex($selector->getPaging()->getStartIndex() + RECOMMENDED_PAGE_SIZE);
            } while ($selector->getPaging()->getStartIndex() < $totalNumEntries);

            $ret = true;
            $tstop = time();
            $delta = ($tstop - $tstart);
            $msg = sprintf("Downloaded %d url in %d sec !!!", $this->dbAdWord->countUrl(), $delta);
            $this->log->info($msg);
        } catch (\Exception $ex) {

            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] downloadAnagraficheUrlV201710: " . $ex->getMessage();
            $this->log->info($this->descr_error);
        }
        return $ret;
    }
    
    public function downloadAnagraficheKeywordsQSV201710($session) {
        $page = null;
        $all_gruppi_id_predicate = array();
        $all_keywords_id = array();
        $clientCustomerId = $session->getClientCustomerId();
        $ret = true;
        $q = 0;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;
        $adWordsServices = new AdWordsServices();

        $msg = sprintf("downloadAnagraficheKeywordsQSV201710 (clientCustomerId=%s)", $clientCustomerId);
        $this->log->info($msg);

        try {

            $tstart = time();
            $api_date = $this->param['dal'];
            $str_api_date = substr($api_date, 0, 4) . "-" . substr($api_date, 4, 2) . "-" . substr($api_date, 6, 2);

            $all_qs_service = $adWordsServices->get($session, AdGroupCriterionService::class);

            // Create selector.
            $selector = new Selector();
            $selector->setFields(['Id', 'AdGroupId', 'BaseCampaignId', 'QualityScore', 'Status', 'KeywordText', 'PlacementUrl', 'CriteriaType']);
            $selector->setOrdering([new OrderBy('KeywordText', SortOrder::ASCENDING)]);

            if ($this->param['status_anagrafiche'] != 'ALL') {
                $selector->setPredicates([
                    new Predicate('Status', PredicateOperator::EQUALS, [$this->param['status_anagrafiche']])
                ]);
            }
            // Create paging controls.
            $selector->setPaging(new Paging(0, RECOMMENDED_PAGE_SIZE));

            do {
                // Make the get request.
                $page = $all_qs_service->get($selector);

                // Display results.
                if ($page->getEntries() !== null) {
                    $totalNumEntries = $page->getTotalNumEntries();
                    foreach ($page->getEntries() as $element) {
                        if ($element->getCriterion()->getType() == 'KEYWORD') {
                            if (method_exists(get_class($element), "getQualityInfo")) {
                                if (is_null($element->getQualityInfo())) {
                                    $q = 0;
                                } else {
                                    $q = $element->getQualityInfo()->getQualityScore();
                                }
                            } else {
                                $q = 0;
                            }

                            if (method_exists(get_class($element), "getUserStatus")) {
                                if (is_null($element->getUserStatus())) {
                                    $status = "";
                                } else {
                                    $status = $element->getUserStatus();
                                }
                            } else {
                                $status = "";
                            }

                            $k = array("api_id" => $element->getCriterion()->getId(),
                                "api_date" => $str_api_date,
                                "api_qualityscore" => $q,
                                "api_keywordname" => $element->getCriterion()->getText(),
                                "api_status" => $status,
                                "api_campaignid" => $element->getBaseCampaignId(),
                                "api_adgroupid" => $element->getAdGroupId(),
                                "api_externalcustomerid" => $session->getClientCustomerId()
                            );
                            $this->dbAdWord->insertKeywordsQS($k);
                        }
                    }
                }

                // Advance the paging index.
                $selector->getPaging()->setStartIndex($selector->getPaging()->getStartIndex() + RECOMMENDED_PAGE_SIZE);
            } while ($selector->getPaging()->getStartIndex() < $totalNumEntries);

            $ret = true;

            $tstop = time();
            $delta = ($tstop - $tstart);

            $msg = sprintf("Downloaded %d keywordQS in %d sec !!!", $this->dbAdWord->countKeywordsQS(), $delta);
            $this->log->info($msg);
        } catch (\Exception $ex) {

            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] downloadAnagraficheKeywordsQSV201710: " . $ex->getMessage();
            $this->log->info($this->descr_error);
        }
        return $ret;
    }

    public function downloadAnagraficheV201710($session,$all_anagrafiche, $settings) {
        $i = 0;
        $ret = true;
        $repoType = $this->param['download_report_type'];

        

        while (($i < count($all_anagrafiche)) && ($all_anagrafiche[$i] <= $repoType)) {
            if ($all_anagrafiche[$i] == DOWNLOAD_ALL) /* DOWNLOAD_ALL esclude tutti gli ID > di DOWNLOAD_ALL */ {
                $i++;
                continue;
            }

            switch ($all_anagrafiche[$i]) {

                case DOWNLOAD_CAMPAGNE: {
                        $this->log->info("DOWNLOAD_CAMPAGNE");
                        $ret = $ret && self::downloadAnagraficheCampagneV201710($session);
                    }break;

                case DOWNLOAD_ADGROUP: {
                        $this->log->info("DOWNLOAD_ADGROUP");
                        $ret = $ret && self::downloadAnagraficheAdGroupsV201710($session);
                    }break;

                case DOWNLOAD_KEYWORDS: {
                        $this->log->info("DOWNLOAD_KEYWORDS");
                        $ret = $ret && self::downloadAnagraficheKeywordsV201710($session);
                    }break;

                case DOWNLOAD_QUERY: {
                        $this->log->info("DOWNLOAD_QUERY");
                        $ret = $ret && self::downloadAnagraficheQueryV201710($session);
                    }break;

                case DOWNLOAD_FINAL_URL: {
                        
                    }break;
                case DOWNLOAD_QS: {
                        $this->log->info("DOWNLOAD_QUALITYSCORE");
                        $ret = $ret && self::downloadAnagraficheKeywordsQSV201710($session);
                    }break;
                case DOWNLOAD_URL: {
                        $this->log->info("DOWNLOAD_URL");
                        $ret = $ret && self::downloadAnagraficheUrlV201710($session);
                    }break;
            }
            $i++;
        }
        return $ret;
    }

    private function clearReportMetriche($conn, $id_account_adw, $repoType) {
        $ret = true;
        $table = "";
        $status = "";
        $tstart = 0;
        $tstop = 0;
        $delta = 0;

        $tstart = time();
        $s = $this->param['dal'];
        $str_dal = substr($s, 0, 4) . "-" . substr($s, 4, 2) . "-" . substr($s, 6, 2);
        $s = $this->param['al'];
        $str_al = substr($s, 0, 4) . "-" . substr($s, 4, 2) . "-" . substr($s, 6, 2);


        $this->log->info("... clearReportMetriche (dal: " . $str_dal . " al: " . $str_al . ") per ADW Account: " . $id_account_adw . " tipo report: " . $this->batchType->getDescrizione($repoType));

        if ($this->param['status_metriche'] != 'ALL') {
            $status = $this->param['status_metriche'];
        }
        switch ($repoType) {

            case DOWNLOAD_ADGROUP: {
                    $table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_CAMPAGNE: {
                    $table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_KEYWORDS: {
                    $table = "cache_keywords_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_QUERY: {
                    $table = "cache_search_query_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $table = "cache_finalurl_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_QS: {
                    
                }break;

            case DOWNLOAD_URL: {
                    $table = "cache_url_metrics"; // TABELLA DA ALIMENTARE
                }break;
        }

        try {
            $sql = "set foreign_key_checks=0";
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            $sql = "LOCK TABLES " . $table . " WRITE";
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            $sql = "DELETE FROM " . $table . " WHERE api_date >= :api_date AND api_externalcustomerid = :api_externalcustomerid";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':api_date', $str_dal);
            $stmt->bindParam(':api_externalcustomerid', $id_account_adw);
            $stmt->execute(); // QUESTA RIGA PRENDE IL FILE DAL PERCORSO INDICATO E CARICA LA TABELLA*/

            $sql = "UNLOCK  TABLES";
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            $sql = "set foreign_key_checks=1";
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            $ret = true;
        } catch (\Exception $ex) {

            $this->id_error = $ex->getCode();
            $this->descr_error = "[" . $this->name_file . "] clearReportMetriche: " . $ex->getMessage();
            $this->log->info($this->descr_error);
        }

        $tstop = time();
        $delta = ($tstop - $tstart);
        $this->log->info("... clear in $delta sec !!!");
        return $ret;
    }

    public function writeDB($user_id, $id_account_adw, $repoType, $fileCSV) {
        $ret = true;
        if (self::writeDBMetriche($user_id, $id_account_adw, $repoType, $fileCSV)) {
            /** da mandare un codice di errore per capire dove o fallito: metriche o anagrafiche */
            $ret = true;
        } else {
            $this->id_error = ERROR;
            $this->descr_error = "[" . $this->name_file . "] writeDB: Errore write metriche " . $repoType;
            $ret = false;
        }

        return $ret;
    }

    private function writeDBMetriche($user_id, $id_account_adw, $repoType, $fileCSV) {
        $ret = true;
        $table = "";
        $complete_fileCSV = getenv('CSV_PATH_FILE') . '/' . $fileCSV;
        $tstart = 0;
        $tstop = 0;
        $delta = 0;

        switch ($repoType) {
            case DOWNLOAD_ADGROUP: {
                    $table = "cache_adgroup_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_CAMPAGNE: {
                    $table = "cache_campaign_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_KEYWORDS: {
                    $table = "cache_keywords_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_QUERY: {
                    $table = "cache_search_query_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $table = "cache_finalurl_metrics"; // TABELLA DA ALIMENTARE
                }break;

            case DOWNLOAD_QS: {
                    
                }break;

            case DOWNLOAD_URL: {
                    $table = "cache_url_metrics"; // TABELLA DA ALIMENTARE
                }break;
        }

        $fields = self::getFields($repoType);

        $table_columns_for_insert = "";
        $table_columns_for_select = array();

        foreach ($fields as $k => $field) {
            $field_4_select = "api_" . strtolower(str_replace(" ", "", $field)) . "";
            $field_4_insert = "`" . $field_4_select . "`";
            $table_columns_for_insert = $table_columns_for_insert == "" ? $field_4_insert : $table_columns_for_insert . "," . $field_4_insert;
            $table_columns_for_select [] = $field_4_select;
        }

        $conn = self::getConnectionFromUserId($user_id);

        if ($conn != null) {
            /* clear data */
            if (self::clearReportMetriche($conn, $id_account_adw, $repoType)) {

                try {
                    $this->log->info("... writeDBMetriche (" . $this->batchType->getSuffisso($repoType) . ") CSV file '" . $fileCSV . "'");
                    $tstart = time();

                    $sql = "set foreign_key_checks=0";
                    $stmt = $conn->prepare($sql);
                    $stmt->execute();

                    $sql = "LOAD DATA LOCAL INFILE '" . str_replace("\\", "/", $complete_fileCSV) . "'
					INTO TABLE `" . $table . "`
					CHARACTER SET utf8mb4
					FIELDS
					TERMINATED BY ','
					LINES
					TERMINATED BY '\n'
					IGNORE 1 LINES
					(" . $table_columns_for_insert . ")";

                    $conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
                    $stmt = $conn->prepare($sql);
                    $stmt->execute(); // QUESTA RIGA PRENDE IL FILE DAL PERCORSO INDICATO E CARICA LA TABELLA

                    $sql = "set foreign_key_checks=1";
                    $stmt = $conn->prepare($sql);
                    $stmt->execute();
                    $ret = true;

                    $tstop = time();
                    $delta = ($tstop - $tstart);
                    $this->log->info("... writeDBMetriche in $delta sec !!!");
                } catch (\Exception $ex) {

                    $this->id_error = $ex->getCode();
                    $this->descr_error = "[" . $this->name_file . "] writeDBMetriche: " . $ex->getMessage();
                    $this->log->info($this->descr_error);
                }
            } else {
                $ret = false;
            }
        } else {
            $ret = false;
        }



        return $ret;
    }

    private function getConnectionFromUserId($user_id) {
        if ($this->connetion == true) {
            $stmt = $this->dbh->prepare("SELECT * FROM db_user where user_id=:user_id");
            $stmt->bindParam(':user_id', $user_id);

            $stmt->execute();
            if ($row = $stmt->fetch(\PDO::FETCH_OBJ)) {

                try {
                    $ret = new \PDO("mysql:host=" . $row->db_host . ";dbname=" . $row->db_name, $row->db_user, $row->db_password, [\PDO::MYSQL_ATTR_LOCAL_INFILE => true]);
                    // set the PDO error mode to exception
                    return $ret;
                } catch (\PDOException $ex) {
                    $this->id_error = $ex->getCode();
                    $this->descr_error = $ex->getMessage();
                    $this->log->info($this->descr_error);
                    return null;
                }
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    private function getGoogleAccountsByUserId($user_id, $id_account_adw) {
        $conn = self::getConnectionFromUserId($user_id);
        $ret = array();
        if ($conn != null) {
            $conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $stmt = $conn->prepare("SELECT g.refresh_token, g.access_token,a.api_externalcustomerid,a.api_accountdescriptivename 
					FROM google_account g 
					INNER JOIN adwords_account a on g.id=a.google_user_id 
					AND a.api_externalcustomerid = :id_account_adw");

            $stmt->bindParam(':id_account_adw', $id_account_adw);
            $stmt->execute();

            while ($row = $stmt->fetch(\PDO::FETCH_OBJ)) {
                $ret [] = array(
                    "refresh_token" => $row->refresh_token,
                    "access_token" => $row->access_token,
                    "id_account_adw" => $row->api_externalcustomerid,
                    "adw_name" => $row->api_accountdescriptivename
                );
            }
        }

        return $ret;
    }

    private function getSettings() {
        if ($this->connetion == true) {
            $stmt = $this->dbh->prepare("SELECT * FROM settings");
            $stmt->execute();

            if ($row = $stmt->fetch(\PDO::FETCH_OBJ)) {
                return $row;
            }

            return null;
        }
    }

    public function logicaAnagrafiche($repoType) {
        $all_metrics = array();

        switch ($repoType) {

            case DOWNLOAD_CAMPAGNE: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE);
                }break;

            case DOWNLOAD_ADGROUP: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE, DOWNLOAD_ADGROUP);
                }break;

            case DOWNLOAD_KEYWORDS: {
                    $all_metrics = array(DOWNLOAD_KEYWORDS);
                }break;

            case DOWNLOAD_QUERY: {
                    $all_metrics = array(DOWNLOAD_QUERY);
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $all_metrics = array(DOWNLOAD_FINAL_URL);
                }break;

            case DOWNLOAD_ALL: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE,
                        DOWNLOAD_ADGROUP,
                        DOWNLOAD_ALL);
                }break;

            case DOWNLOAD_QS: {
                    $all_metrics = array(DOWNLOAD_QS);
                }break;

            case DOWNLOAD_URL: {
                    $all_metrics = array(DOWNLOAD_URL);
                }break;
        }

        return $all_metrics;
    }

    public function logicaMetriche($repoType) {
        $all_metrics = array();

        switch ($repoType) {

            case DOWNLOAD_CAMPAGNE: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE);
                }break;

            case DOWNLOAD_ADGROUP: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE, DOWNLOAD_ADGROUP);
                }break;

            case DOWNLOAD_KEYWORDS: {
                    $all_metrics = array(DOWNLOAD_KEYWORDS);
                }break;

            case DOWNLOAD_QUERY: {
                    $all_metrics = array(DOWNLOAD_QUERY);
                }break;

            case DOWNLOAD_FINAL_URL: {
                    $all_metrics = array(DOWNLOAD_FINAL_URL);
                }break;

            case DOWNLOAD_ALL: {
                    $all_metrics = array(DOWNLOAD_CAMPAGNE,
                        DOWNLOAD_ADGROUP,
                        DOWNLOAD_ALL);
                }break;

            case DOWNLOAD_QS: {
                    $all_metrics = array(DOWNLOAD_QS);
                }break;

            case DOWNLOAD_URL: {
                    $all_metrics = array(DOWNLOAD_URL);
                }break;
        }

        return $all_metrics;
    }

    public function downloadAllReportsFromUserdId($user_id, $param) {
        $ret = true;
        $arrayReport = array();
        $all_metrics = array();
        $all_anagrafiche = array();
        $this->param = $param;
        $repoType = $this->param['download_report_type'];
        $tstart = 0;
        $tstop = 0;
        $delta = 0;


        $this->batchType->connect();

        if ($this->batchType->load()) {
            if ($repoType == DOWNLOAD_UNDEFINED) {
                $this->id_error = ERROR;
                $this->descr_error = "[" . $this->name_file . "] downloadAllReportsFromUserdId: Download report type Undefined !!!";
                $this->log->info($this->descr_error);
                $ret = false;
            } else {
                $all_metrics = self::logicaMetriche($repoType);
                $all_anagrafiche = self::logicaAnagrafiche($repoType);

                if ($this->connetion == true) {
                    $settings = self::getSettings();
                    $google_accounts = self::getGoogleAccountsByUserId($user_id, $param['id_account_adw']);

                    foreach ($google_accounts as $index => $google_account) {
                        $i = 0;
                        $ana = true;

                        $oAuth2Credential = (new OAuth2TokenBuilder())
                            ->withClientId($settings->client_id)
                            ->withClientSecret($settings->client_secret)
                            ->withRefreshToken($google_account ['refresh_token'])
                            ->build();
                        $session = (new AdWordsSessionBuilder())
                            ->withDeveloperToken($settings->dev_key)
                            ->withClientCustomerId($google_account ['id_account_adw'])
                            ->withOAuth2Credential($oAuth2Credential)
                            ->withReportDownloaderLogger(new Logger('', [new NullHandler()]))
                            ->withSoapLogger(new Logger('', [new NullHandler()]))
                            ->build();
                    

                        if ($this->param['abilita_anagrafiche'] == ANAGRAFICHE_ABILITATE) {
                            $this->dbAdWord = new WriteDBAdWords();
                            $this->dbAdWord->init();
                            $this->dbAdWord->setLogger($this->log);
                            $this->dbAdWord->setIdAccountAdw($google_account ['id_account_adw']);
                            $this->dbAdWord->setIdUser($user_id);

                            $ana = self::downloadAnagraficheV201710($session, $all_anagrafiche, $settings);
                            if ($ana == true) {
                                $this->dbAdWord->connect();
                                $ret_save = $this->dbAdWord->save($all_anagrafiche, $repoType, $this->param['status_anagrafiche']);
                            } else {
                                $ret = false;
                            }
                        } else {
                            $ana = true; /* forzatura per abilitare il successivo download delle metriche */
                        }

                        if ($this->param['abilita_metriche'] == METRICHE_ABILITATE) {
                            if ($ana == true) {
                                while (($i < count($all_metrics)) && ($all_metrics[$i] <= $repoType)) {
                                    if ($all_metrics[$i] == DOWNLOAD_ALL) {
                                        $i++;
                                        continue;
                                    }

                                    // costruzione nome file CSV 
                                    $namefileCSV = $this->param['al'] .
                                            "_" . $this->pid .
                                            "_" . $user_id .
                                            "_" . $google_account ['adw_name'] .
                                            "_" . $this->batchType->getSuffisso($all_metrics[$i]) .
                                            ".csv";
                                    $namefileCSV = preg_replace('/\s+/', '', $namefileCSV);


                                    $this->log->info("... downloading report type (" .
                                            $this->batchType->getSuffisso($all_metrics[$i]) . ") sul file '" . $namefileCSV . "'");

                                    $tstart = time();
                                    $fileCSV_METRIC = self::downloadMetricheV201710($session, $all_metrics[$i], $user_id, $namefileCSV, $settings);
                                    array_push($arrayReport, $fileCSV_METRIC);
                                    $tstop = time();
                                    $delte = ($tstop - $tstart);
                                    $this->log->info("... downloaded $delte sec !!!");
                                    $i++;
                                }
                            }
                        }
                    }
                }

                $i = 0;
                foreach ($arrayReport as $key => $value) {
                    $writeReportDB = self::writeDB($user_id, $param['id_account_adw'], $all_metrics[$i], $value);
                    if ($writeReportDB == true) {
                        $ren = self::renameCSVtoIMP($value);
                        if ($ren == false) {
                            $ret = false;
                        }
                    } else {
                        $ret = false;
                    }
                    $i++;
                }
            }
        } else {
            $this->id_error = ERROR;
            $this->descr_error = "Errore nel caricamento della tabella batch_type_lib !!!!!";
            $ret = false;
        }

        return $ret;
    }

    private function renameCSVtoIMP($csv_file) {
        $path_csv = getenv('CSV_PATH_FILE');
        $path_imp = getenv('IMP_PATH_FILE');
        $imp_file = str_replace("csv", "imp", $csv_file);
        $this->log->info("... renameCSVtoIMP()");
        $this->log->info("      " . $path_csv . "/" . $csv_file);
        $this->log->info("      " . $path_imp . "/" . $imp_file);
        $ok = rename($path_csv . "/" . $csv_file, $path_imp . "/" . $imp_file);
        if ($ok == false) {
            $this->id_error = ERROR;
            $this->descr_error = "[" . $this->name_file . "] downloadAllReportsFromUserdId: Errore rename file " . $csv_file;
        }
        return $ok;
    }

}
