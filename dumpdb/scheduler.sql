CREATE DATABASE  IF NOT EXISTS `adplify_scheduler` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adplify_scheduler`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adplify_scheduler
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch_lib`
--

DROP TABLE IF EXISTS `batch_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_batch` int(11) DEFAULT NULL,
  `name_batch` varchar(45) DEFAULT NULL,
  `descr_batch` varchar(45) DEFAULT NULL,
  `phpname_batch` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_lib`
--

LOCK TABLES `batch_lib` WRITE;
/*!40000 ALTER TABLE `batch_lib` DISABLE KEYS */;
INSERT INTO `batch_lib` VALUES (1,1,'batch30gg','BATCH a 30 giorni','batch30gg.php'),(2,2,'batch60gg','BATCH a 60 giorni','batch60gg.php'),(3,3,'batch2year','BATCH a 2 anni','batch2year.php'),(4,4,'batchClear','BATCH Clear BATCH','batchClear.php'),(5,5,'batchUser','BATCH a date variabili','batchUser.php');
/*!40000 ALTER TABLE `batch_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_type_lib`
--

DROP TABLE IF EXISTS `batch_type_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_type_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_batch_type` int(11) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_type_lib`
--

LOCK TABLES `batch_type_lib` WRITE;
/*!40000 ALTER TABLE `batch_type_lib` DISABLE KEYS */;
INSERT INTO `batch_type_lib` VALUES (1,1,'All'),(2,2,'Campagne'),(3,3,'Annunci'),(4,4,'Keyword'),(5,5,'URL');
/*!40000 ALTER TABLE `batch_type_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_config`
--

DROP TABLE IF EXISTS `sc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_config` (
  `id_schedulazione` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_batch` int(11) DEFAULT NULL COMMENT 'Chiave univoca che lega la tabella scheduler a la tabella dei batch',
  `descr_schedulazione` varchar(45) DEFAULT NULL,
  `parametri_batch` varchar(2000) DEFAULT NULL,
  `type_schedulazione` int(11) DEFAULT NULL,
  `frequenza` int(11) DEFAULT NULL,
  `time_start` datetime DEFAULT NULL,
  `last_time_start` datetime DEFAULT NULL COMMENT 'i tempi sono in formato unix',
  `stato_schedulazione` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `id_error` varchar(45) DEFAULT NULL,
  `descr_error` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_schedulazione`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Tabella di configurazione scheduler';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_config`
--

LOCK TABLES `sc_config` WRITE;
/*!40000 ALTER TABLE `sc_config` DISABLE KEYS */;
INSERT INTO `sc_config` VALUES (35,'devadplify',20,4,'4','{\"id_schedulazione\":-1,\"hostname\":\"devadplify\",\"id_user\":20,\"id_account_adw\":2,\"id_batch\":4,\"descr_schedulazione\":\"BATCH a 30 giorni\",\"type_schedulazione\":7,\"frequenza\":-1,\"stato_schedulazione\":6,\"tipo_batch\":1,\"time_start\":\"2017-03-15 20:00:00\",\"dal\":\"20170212\",\"al\":\"20170311\"}',7,60,'2017-03-15 21:19:00','2017-03-15 21:18:00',6,NULL,'2017-03-15 21:04:00','0','');
/*!40000 ALTER TABLE `sc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_stato_schedulazione_lib`
--

DROP TABLE IF EXISTS `sc_stato_schedulazione_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_stato_schedulazione_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stato_schedulazione` int(11) DEFAULT NULL,
  `descr_stato_schedulazione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_stato_schedulazione_lib`
--

LOCK TABLES `sc_stato_schedulazione_lib` WRITE;
/*!40000 ALTER TABLE `sc_stato_schedulazione_lib` DISABLE KEYS */;
INSERT INTO `sc_stato_schedulazione_lib` VALUES (1,1,'Working'),(2,2,'Finished'),(3,3,'Stalled'),(4,4,'Error'),(5,5,'Undefined'),(6,6,'To be submitted'),(7,7,'Submitted');
/*!40000 ALTER TABLE `sc_stato_schedulazione_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_type_schedulazione_lib`
--

DROP TABLE IF EXISTS `sc_type_schedulazione_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_type_schedulazione_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type_schedulazione` int(11) DEFAULT NULL,
  `descr_type_schedulazione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_type_schedulazione_lib`
--

LOCK TABLES `sc_type_schedulazione_lib` WRITE;
/*!40000 ALTER TABLE `sc_type_schedulazione_lib` DISABLE KEYS */;
INSERT INTO `sc_type_schedulazione_lib` VALUES (1,1,'ORARIO'),(2,2,'GIORNALIERO'),(3,3,'SETTIMANALE'),(4,4,'MENSILE'),(5,5,'ANNUALE'),(6,6,'UNA TANTUM'),(8,7,'PERIODICO');
/*!40000 ALTER TABLE `sc_type_schedulazione_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'adplify_scheduler'
--

--
-- Dumping routines for database 'adplify_scheduler'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-16  7:18:18
