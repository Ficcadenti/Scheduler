CREATE DATABASE  IF NOT EXISTS `scheduler` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `scheduler`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: scheduler
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
-- Table structure for table `sc_config`
--

DROP TABLE IF EXISTS `sc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_batch` int(11) DEFAULT NULL COMMENT 'Chiave univoca che lega la tabella scheduler a la tabella dei batch',
  `phpname_batch` varchar(45) DEFAULT NULL,
  `descr_batch` varchar(45) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `time_start` datetime DEFAULT NULL,
  `last_time_start` datetime DEFAULT NULL COMMENT 'i tempi sono in formato unix',
  `status` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `id_error` varchar(45) DEFAULT NULL,
  `descr_error` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Tabella di configurazione scheduler';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_config`
--

LOCK TABLES `sc_config` WRITE;
/*!40000 ALTER TABLE `sc_config` DISABLE KEYS */;
INSERT INTO `sc_config` VALUES (3,1,'batch_30_gg.php','BATCH Test Raffo',1,0,'2017-03-07 14:30:00','2017-03-07 13:38:00',7,NULL,'2017-03-03 00:00:00','0',NULL),(4,2,'batch_30_gg.php','BATCH Test Giampiero',1,0,'2017-03-07 14:30:00','2017-03-07 13:38:00',7,NULL,'2017-03-03 00:00:00','0',NULL),(5,3,'batch_30_gg.php','BATCH Test Francesco',7,10800,'2017-03-07 16:40:00','2017-03-07 13:40:00',7,NULL,'2017-03-03 00:00:00','0',NULL);
/*!40000 ALTER TABLE `sc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_status_lib`
--

DROP TABLE IF EXISTS `sc_status_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_status_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_status` int(11) DEFAULT NULL,
  `descr_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_status_lib`
--

LOCK TABLES `sc_status_lib` WRITE;
/*!40000 ALTER TABLE `sc_status_lib` DISABLE KEYS */;
INSERT INTO `sc_status_lib` VALUES (1,1,'Working'),(2,2,'Finished'),(3,3,'Stalled'),(4,4,'Error'),(5,5,'Undefined'),(6,6,'To be submitted'),(7,7,'Submitted');
/*!40000 ALTER TABLE `sc_status_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_type_lib`
--

DROP TABLE IF EXISTS `sc_type_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_type_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` varchar(45) DEFAULT NULL,
  `descr_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_type_lib`
--

LOCK TABLES `sc_type_lib` WRITE;
/*!40000 ALTER TABLE `sc_type_lib` DISABLE KEYS */;
INSERT INTO `sc_type_lib` VALUES (1,'1','ORARIO'),(2,'2','GIORNALIERO'),(3,'3','SETTIMANALE'),(4,'4','MENSILE'),(5,'5','ANNUALE'),(6,'6','UNA TANTUM'),(8,'7','PERIODICO');
/*!40000 ALTER TABLE `sc_type_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'scheduler'
--

--
-- Dumping routines for database 'scheduler'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-07 14:04:06
