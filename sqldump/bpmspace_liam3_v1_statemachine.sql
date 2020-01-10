-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bpmspace_liam3_v1
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `entrypoint` tinyint(1) NOT NULL DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL DEFAULT '1',
  `script_IN` longtext,
  `script_OUT` longtext,
  PRIMARY KEY (`state_id`),
  KEY `state_machine_id_fk` (`statemachine_id`),
  CONSTRAINT `state_machine_id_fk` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'not verified',1,1,'include_once(__DIR__.\'/../_state/1/in.php\');','include_once(__DIR__.\'/../_state/1/out.php\');'),(2,'verified',0,1,'include_once(__DIR__.\'/../_state/2/in.php\');','include_once(__DIR__.\'/../_state/2/out.php\');'),(4,'deleted',0,1,'include_once(__DIR__.\'/../_state/4/in.php\');','include_once(__DIR__.\'/../_state/4/out.php\');'),(5,'new',1,2,'include_once(__DIR__.\'/../_state/5/in.php\');','include_once(__DIR__.\'/../_state/5/out.php\');'),(6,'active',0,2,'include_once(__DIR__.\'/../_state/6/in.php\');','include_once(__DIR__.\'/../_state/6/out.php\');'),(7,'update',0,2,'include_once(__DIR__.\'/../_state/7/in.php\');','include_once(__DIR__.\'/../_state/7/out.php\');'),(8,'inactive',0,2,'include_once(__DIR__.\'/../_state/8/in.php\');','include_once(__DIR__.\'/../_state/8/out.php\');'),(9,'incomplete',1,3,'include_once(__DIR__.\'/../_state/9/in.php\');','include_once(__DIR__.\'/../_state/9/out.php\');'),(10,'complete',0,3,'include_once(__DIR__.\'/../_state/10/in.php\');','include_once(__DIR__.\'/../_state/10/out.php\');'),(11,'update',0,3,'include_once(__DIR__.\'/../_state/11/in.php\');','include_once(__DIR__.\'/../_state/11/out.php\');'),(12,'inactive',0,3,'include_once(__DIR__.\'/../_state/12/in.php\');','include_once(__DIR__.\'/../_state/12/out.php\');'),(13,'use',1,4,'include_once(__DIR__.\'/../_state/13/in.php\');','include_once(__DIR__.\'/../_state/13/out.php\');'),(14,'unselected',0,4,'include_once(__DIR__.\'/../_state/14/in.php\');','include_once(__DIR__.\'/../_state/14/out.php\');'),(15,'selected',1,5,'include_once(__DIR__.\'/../_state/15/in.php\');','include_once(__DIR__.\'/../_state/15/out.php\');'),(16,'unselected',0,5,'include_once(__DIR__.\'/../_state/16/in.php\');','include_once(__DIR__.\'/../_state/16/out.php\');');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) DEFAULT NULL,
  `transition_script` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machines`
--

LOCK TABLES `state_machines` WRITE;
/*!40000 ALTER TABLE `state_machines` DISABLE KEYS */;
INSERT INTO `state_machines` VALUES (1,'liam3_email','include_once(__DIR__.\'/../_state_machines/1/create.php\');'),(2,'liam3_loginattempts','include_once(__DIR__.\'/../_state_machines/2/create.php\');'),(3,'liam3_user','include_once(__DIR__.\'/../_state_machines/3/create.php\');'),(4,'liam3_user_email','include_once(__DIR__.\'/../_state_machines/4/create.php\');'),(5,'liam3_user_loginattempt','include_once(__DIR__.\'/../_state_machines/5/create.php\');');
/*!40000 ALTER TABLE `state_machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_rules`
--

DROP TABLE IF EXISTS `state_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` longtext,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_rules`
--

LOCK TABLES `state_rules` WRITE;
/*!40000 ALTER TABLE `state_rules` DISABLE KEYS */;
INSERT INTO `state_rules` VALUES (1,1,1,'include_once(__DIR__.\'/../_state_rules/1.php\');'),(3,1,2,'include_once(__DIR__.\'/../_state_rules/3.php\');'),(6,2,4,'include_once(__DIR__.\'/../_state_rules/6.php\');'),(7,5,5,'include_once(__DIR__.\'/../_state_rules/7.php\');'),(8,7,7,'include_once(__DIR__.\'/../_state_rules/8.php\');'),(9,5,6,'include_once(__DIR__.\'/../_state_rules/9.php\');'),(10,6,7,'include_once(__DIR__.\'/../_state_rules/10.php\');'),(11,7,6,'include_once(__DIR__.\'/../_state_rules/11.php\');'),(12,6,8,'include_once(__DIR__.\'/../_state_rules/12.php\');'),(13,9,9,'include_once(__DIR__.\'/../_state_rules/13.php\');'),(14,11,11,'include_once(__DIR__.\'/../_state_rules/14.php\');'),(15,9,10,'include_once(__DIR__.\'/../_state_rules/15.php\');'),(16,10,11,'include_once(__DIR__.\'/../_state_rules/16.php\');'),(17,11,10,'include_once(__DIR__.\'/../_state_rules/17.php\');'),(18,10,12,'include_once(__DIR__.\'/../_state_rules/18.php\');'),(19,13,14,'include_once(__DIR__.\'/../_state_rules/19.php\');'),(20,14,13,'include_once(__DIR__.\'/../_state_rules/20.php\');'),(21,15,16,'include_once(__DIR__.\'/../_state_rules/21.php\');'),(22,16,15,'include_once(__DIR__.\'/../_state_rules/22.php\');');
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'liam3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 10:15:29
