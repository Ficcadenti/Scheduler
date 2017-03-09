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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_lib`
--

LOCK TABLES `batch_lib` WRITE;
/*!40000 ALTER TABLE `batch_lib` DISABLE KEYS */;
INSERT INTO `batch_lib` VALUES (1,1,'batch30gg','BATCH a 30 giorni','batch30gg.php'),(2,2,'batchrt','BATCH RealTime','batchrt.php');
/*!40000 ALTER TABLE `batch_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_config`
--

DROP TABLE IF EXISTS `sc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_config` (
  `id_schedulazione` int(11) NOT NULL,
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
  `descr_error` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_schedulazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabella di configurazione scheduler';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_config`
--

LOCK TABLES `sc_config` WRITE;
/*!40000 ALTER TABLE `sc_config` DISABLE KEYS */;
INSERT INTO `sc_config` VALUES (5,NULL,13,1,'Schedulazione Utente Raffaele','{\"userGoogle\": 1,\"userAdw\": 2,\"tipoBatch\": 1,\"tipoReport\": 1,\"tipoSchedulazione\": 1,\"periodo\": 10800,\"dal\": \"2016-01-01 00:00:00\",\"al\": \"2017-01-01 00:00:00\"}',7,10800,'2017-03-09 17:26:00','2017-03-09 14:43:00',6,NULL,'2017-03-03 00:00:00','0','');
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
  `descrizione` varchar(45) DEFAULT NULL,
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
  `descrizione` varchar(45) DEFAULT NULL,
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

-- Dump completed on 2017-03-09 14:45:00
