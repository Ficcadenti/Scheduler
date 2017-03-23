<?php

/*
* |--------------------------------------------------------------------------
* | Application Scheduler
* | AUTHORS:
* | Author Name Raffaele Ficcadenti
* | Author email raffaele.ficcadenti@gmail.com
* |
* | FILE
* | writeDBAdWords.php
* |
* | HISTORY:
* | -[Date]- -[Who]- -[What]-
* | 01-03-2017 Ficcadenti Raffaele Versione 1.0
* |--------------------------------------------------------------------------
* |
* | Schedulatore per avviare batch di download dati AdWords
*/
namespace Batch\lib;

class WriteDBAdWords {
	private $batch_type_lib = array ();
	private $log = null;
	private $dbh = null;
	private $name_file = "";
	private $connetion=false;
	private $id_error = BATCH_WITHOUT_ERROR;
	private $descr_error = "";
	
	private $id_user=-1;
	private $id_account_adw=-1;
	
	private $campagne = array();
	private $gruppi   = array();
	private $keywords = array();
	private $url      = array();
	
	
	function __construct() {
	}
	
	function __destruct() {
		$this->dbh = null;
	}
	
	public function connect() {
		$this->name_file = basename ( __FILE__, ".php" );
	
		try {
			$this->dbh = new \PDO ( 'mysql:host=' . getenv ( 'DB_HOST' ) . ';dbname=' . getenv ( 'DB_NAME_ADPMANAGER' ), getenv ( 'DB_USER' ), getenv ( 'DB_PASS' ) );
			$this->connetion=true;
		} catch ( \PDOException $ex ) 
		{
			$this->id_error = $ex->getCode();
			$this->descr_error = "[".$this->name_file."] ". $ex->getMessage ();
			$this->log->info ( "ERROR(" . $this->name_file . "): " . $ex->getMessage () );
			$this->connetion=false;
		}
	}
	
	public function setLogger($log) {
		$this->log = $log;
	}
	
	public function setIdAccountAdw($id)
	{
		$this->id_account_adw=$id;
	}
	
	public function setIdUser($id)
	{
		$this->id_user=$id;
	}
	
	public function getIdError()
	{
		return $this->id_error;
	}
	
	public function getDescError()
	{
		return $this->descr_error;
	}
	
	public function insertCampagna($c)
	{
		array_push ($this->campagne,$c);
	}
	
	public function insertGruppi($g)
	{
		array_push ($this->gruppi,$g);
	}
	
	public function insertKeywords($k)
	{
		array_push ($this->keywords,$k);
	}
	
	public function insertUrl($u)
	{
		array_push ($this->url,$u);
	}
	
	public function save($status)
	{
		$ret=true;
		$this->log->info("save()");
		
		if(self::clearReportAnagrafiche($this->id_user,$this->id_account_adw,$status))
		{
			$this->log->info("writeDBAnagrafiche()");
			$ret=self::writeDBAnagrafiche($this->id_user,$this->id_account_adw);
		}
		else 
		{
			$ret=false;
		}
		
		return $ret;
	}
	
	private function getField($repoType,$conn)
	{
		$fields       = "";
		$fieldsValues = "";
		$cont_row     = 0;
		$cont_key     = 0;
		$values		  = array();
		
		switch($repoType)
		{
		
			case DOWNLOAD_CAMPAGNE:
				{
					if(count($this->campagne)>0)
					{
						$a = array_keys($this->campagne[0]);
						$values = ($this->campagne);
					}
				}break;
				
			case DOWNLOAD_ADGROUP:
				{
					if(count($this->gruppi)>0)
					{
						$a = array_keys($this->gruppi[0]);
						$values = ($this->gruppi);
					}
				}break;
		
			case DOWNLOAD_KEYWORDS:
				{
					if(count($this->keywords)>0)
					{
						$a = array_keys($this->keywords[0]);
						$values = ($this->keywords);
					}
				}break;
					
			case DOWNLOAD_URL:
				{
					if(count($this->url)>0)
					{
						$a = array_keys($this->url[0]);
						$values = ($this->url);
					}
				}break;	
		}
		
		if(count($values)>0)
		{
			$fields=sprintf("`%s`",$a[0]);	
			
			for($i=1;$i<count($a);$i++)
			{
				$fields=$fields.",".sprintf("`%s`",$a[$i]);	
			}
			
			foreach ($values as $row)
			{
				$cont_key=0;$cont_row++;
					
				$fieldsValues=$fieldsValues."(";
				$keys = array_keys($row);
				foreach ($row as $key => $val)
				{
					$cont_key++;
					if(($key=='api_status')&&($row[$key]==''))
					{
						$fieldsValues=$fieldsValues.$conn->quote(stripslashes("ENABLED"));
					}
					else 
					{
						$fieldsValues=$fieldsValues.$conn->quote(stripslashes($row[$key]));
					}
					if($cont_key<count($row))
					{
						$fieldsValues=$fieldsValues.",";
					}
				}
				$fieldsValues=$fieldsValues.")";
				if($cont_row<count($values))
				{
					$fieldsValues=$fieldsValues.",";
				}
			}
		}
		return array($fields,$fieldsValues);		
	}
	
	private function writeDBAnagrafiche($id_user,$id_account_adw)
	{
		$ret      = true;
		
		$table    = array(	"cache_campaign_attributes",
						"cache_adgroup_attributes",
						"cache_keywords_attributes",
						"cache_url_attributes");
	
		if($this->connetion==true)
		{
			$conn = self::getConnectionFromUserId ( $id_user );
			
			if($conn!=null)
			{
					try {
						$sql = "set foreign_key_checks=0";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
						
						if(count($this->campagne)>0)
						{
							/* INSERT ANAGRAFICHE CAMPAGNE */
							$fields=self::getField(DOWNLOAD_CAMPAGNE,$conn);
							$sql = "INSERT INTO ".$table[0]." (".$fields[NOME_CAMPI].") VALUES ".$fields[VALORE_CAMPI];
							$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
							$stmt = $conn->prepare ( $sql );
							$stmt->execute();
							
							$this->log->info("... Campagne ok !!");
						}
						
						if(count($this->gruppi)>0)
						{
							/* INSERT ANAGRAFICHE GRUPPI */
							$fields=self::getField(DOWNLOAD_ADGROUP,$conn);	
							$sql = "INSERT INTO ".$table[1]." (".$fields[NOME_CAMPI].") VALUES ".$fields[VALORE_CAMPI];
							$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
							$stmt = $conn->prepare ( $sql );
							$stmt->execute();
							
							$this->log->info("... Gruppi ok !!");
						}
						
						if(count($this->keywords)>0)
						{
							/* INSERT ANAGRAFICHE KEYWORDS */
							$fields=self::getField(DOWNLOAD_KEYWORDS,$conn);
							$sql = "INSERT INTO ".$table[2]." (".$fields[NOME_CAMPI].") VALUES ".$fields[VALORE_CAMPI];
							$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
							$stmt = $conn->prepare ( $sql );
							$stmt->execute();
							
							$this->log->info("... Keywords ok !!");
						}
						
						if(count($this->url)>0)
						{
							/* INSERT ANAGRAFICHE KEYWORDS */
							$fields=self::getField(DOWNLOAD_URL,$conn);
							$sql = "INSERT INTO ".$table[3]." (".$fields[NOME_CAMPI].") VALUES ".$fields[VALORE_CAMPI];
							$conn->setAttribute ( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION );
							$stmt = $conn->prepare ( $sql );
							$stmt->execute();
							
							$this->log->info("... Url ok !!");
						}
						
						$sql = "set foreign_key_checks=1";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
						
						//$table[3]; // write anagrafiche url
					}
					catch ( \PDOException $ex ) {
						$this->id_error = $ex->getCode();
						$this->descr_error = "[".$this->name_file."] writeDBAnagrafiche: ".$ex->getMessage ();
						$this->log->info($this->descr_error);
						$ret=false;
					}
				
				$ret=true;
			}
			else
			{
				$ret=false;
				print_r("SONO qua 4 -conn=nulllll");
			}
		}else 
		{
			print_r("SONO qua 3 -conn=nulllll");
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
					$this->descr_error = "[".$this->name_file."] getConnectionFromUserId: ".$ex->getMessage ();
					return null;
				}
			}
			else
			{
				$this->id_error = ERROR;
				$this->descr_error = "[".$this->name_file."] non ci sono database per user_id=".$user_id;
				return null;
			}
		}
		else
		{
			return null;
		}
	}
	
	private function clearReportAnagrafiche($id_user,$id_account_adw,$status)
	{
		$ret         = true;
		$statusWhere = "";
		$table       = array("cache_campaign_attributes",
						"cache_adgroup_attributes",
						"cache_keywords_attributes",
						"cache_url_attributes");
	
	
		$this->log->info ( "clearReportAnagrafiche per ID_user ".$id_user.", ID_ADW_Account: ".$id_account_adw." status: ".$status);
	
	
		if($status=='ALL')
		{
			$statusWhere="";
		}else
		{
			$statusWhere=" AND api_status='".$status."'";
		}
		
		if($this->connetion==true)
		{
			$conn = self::getConnectionFromUserId ( $id_user );
			if($conn!=null)
			{
				for($i=0;$i<count($table);$i++)
				{
					try {
						$sql = "set foreign_key_checks=0";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
						
						$sql = "LOCK TABLES ".$table[$i]." WRITE";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
				
						$sql = "DELETE FROM ".$table[$i]." WHERE api_externalcustomerid = :api_externalcustomerid ".$statusWhere;
						$stmt = $conn->prepare ( $sql );
						$stmt->bindParam ( ':api_externalcustomerid', $id_account_adw );
						$stmt->execute ();
						
						$this->log->info ( $sql );
						
				
						$sql = "UNLOCK  TABLES";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
						
						$sql = "set foreign_key_checks=1";
						$stmt = $conn->prepare ( $sql );
						$stmt->execute ();
						
						
					} 
					catch ( \PDOException $ex ) {
						$this->id_error = $ex->getCode();
						$this->descr_error = "[".$this->name_file."] clearReportAnagrafiche: ".$ex->getMessage ();
						$this->log->info ($this->descr_error);
						$ret=false;
					}
				}
				$ret=true;
			}
			else 
			{
				$ret=false;
			}
		
			$ret=true;
		}else
		{
			$ret=false;
		}
	
		return $ret;
	}
	
	public function countCampagne()
	{
		return count($this->campagne);
	}
	
	public function countGruppi()
	{
		return count($this->gruppi);
	}
	
	public function countKeywords()
	{
		return count($this->keywords);
	}
	
	public function countUrl()
	{
		return count($this->url);
	}
	
	public function show()
	{
		foreach ($this->campagne as $row)
		{
			
			foreach ($row as $key => $value)
			{
				$msg=sprintf("%s: %s",$key,$value);
				$this->log->info($msg);
			}
			
			self::showGruppi($row['api_campaignid']);
			
			$this->log->info("--------------------------------------");
		}
	}
	
	public function showGruppi($id_campagna)
	{
		foreach ($this->gruppi as $row)
		{
			
			if($row['api_campaignid']==$id_campagna)
			{
				foreach ($row as $key => $value)
				{
					$msg=sprintf("	%s: %s",$key,$value);
					$this->log->info($msg);
				}
				
				self::showKeyword($id_campagna,$row['api_adgroupid']);
				//self::showUrl($id_campagna,$row['api_adgroupid']);
				
				$this->log->info("");
			}
		}
	}
	
	public function showKeyword($id_campagna,$id_gruppo)
	{
		foreach ($this->keywords as $row)
		{
				
			if(($row['api_campaignid']==$id_campagna)&&($row['api_adgroupid']==$id_gruppo))
			{
				foreach ($row as $key => $value)
				{
					if(($key=='api_keywordname') || ($key=='api_keywordstatus') || ($key=='api_qualityscore') ) 
					{
						$msg=sprintf("	  (KEY) %s: %s",$key,$value);
						$this->log->info($msg);
					}
				}

			}
		}
	}
	
	public function showUrl($id_campagna,$id_gruppo)
	{
		foreach ($this->url as $row)
		{
	
			if(($row['api_campaignid']==$id_campagna)&&($row['api_adgroupid']==$id_gruppo))
			{
				foreach ($row as $key => $value)
				{
					if($key=='api_url')
					{
						$msg=sprintf("	  (URL) %s: %s",$key,$value);
						$this->log->info($msg);
					}
				}
			}
		}
	}
}