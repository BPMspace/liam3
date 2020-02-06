-- MySQL dump 10.16  Distrib 10.1.33-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: liam3
-- ------------------------------------------------------
-- Server version	10.1.33-MariaDB

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
-- Temporary table structure for view `_edges`
--

DROP TABLE IF EXISTS `_edges`;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_edges` (
  `EdgeType` tinyint NOT NULL,
  `EdgeID` tinyint NOT NULL,
  `EdgePartner` tinyint NOT NULL,
  `EdgeStateID` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_nodes`
--

DROP TABLE IF EXISTS `_nodes`;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_nodes` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_orphans`
--

DROP TABLE IF EXISTS `_orphans`;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_orphans` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `liam3_email`
--

DROP TABLE IF EXISTS `liam3_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam3_email` (
  `liam3_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `liam3_email_text` varchar(254) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '1',
  PRIMARY KEY (`liam3_email_id`),
  KEY `state_id_60534bd2` (`state_id`),
  CONSTRAINT `state_id_60534bd2` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam3_loginattempts`
--

DROP TABLE IF EXISTS `liam3_loginattempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam3_loginattempts` (
  `liam3_LoginAttempts_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam3_LoginAttempts_time` datetime DEFAULT NULL,
  `liam3_LoginAttempts_info` mediumtext,
  `state_id` bigint(20) DEFAULT '5',
  PRIMARY KEY (`liam3_LoginAttempts_id`),
  KEY `state_id_85c73855` (`state_id`),
  CONSTRAINT `state_id_85c73855` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam3_user`
--

DROP TABLE IF EXISTS `liam3_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam3_user` (
  `liam3_User_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_firstname` varchar(60) DEFAULT NULL,
  `liam3_User_lastname` varchar(60) DEFAULT NULL,
  `liam3_User_password` mediumtext,
  `liam3_User_salt` mediumtext,
  `state_id` bigint(20) DEFAULT '9',
  PRIMARY KEY (`liam3_User_id`),
  KEY `state_id_38047781` (`state_id`),
  CONSTRAINT `state_id_38047781` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam3_user_email`
--

DROP TABLE IF EXISTS `liam3_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam3_user_email` (
  `liam3_User_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_id_fk_164887` bigint(20) NOT NULL,
  `liam3_email_id_fk_396224` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '13',
  PRIMARY KEY (`liam3_User_email_id`),
  KEY `liam3_email_id_fk_396224` (`liam3_email_id_fk_396224`),
  KEY `liam3_User_id_fk_164887` (`liam3_User_id_fk_164887`),
  KEY `state_id_9c23c55f` (`state_id`),
  CONSTRAINT `liam3_user_email_ibfk_1` FOREIGN KEY (`liam3_User_id_fk_164887`) REFERENCES `liam3_user` (`liam3_User_id`),
  CONSTRAINT `liam3_user_email_ibfk_2` FOREIGN KEY (`liam3_email_id_fk_396224`) REFERENCES `liam3_email` (`liam3_email_id`),
  CONSTRAINT `state_id_9c23c55f` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam3_user_loginattempt`
--

DROP TABLE IF EXISTS `liam3_user_loginattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam3_user_loginattempt` (
  `liam3_User_LoginAttempt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_id_fk_955788` bigint(20) NOT NULL,
  `liam3_LoginAttempts_id_fk_234561` bigint(20) NOT NULL,
  `state_id` bigint(20) DEFAULT '15',
  PRIMARY KEY (`liam3_User_LoginAttempt_id`),
  KEY `liam3_User_id_fk_955788` (`liam3_User_id_fk_955788`),
  KEY `liam3_LoginAttempts_id_fk_234561` (`liam3_LoginAttempts_id_fk_234561`),
  KEY `state_id_5963bd17` (`state_id`),
  CONSTRAINT `liam3_user_loginattempt_ibfk_1` FOREIGN KEY (`liam3_User_id_fk_955788`) REFERENCES `liam3_user` (`liam3_User_id`),
  CONSTRAINT `liam3_user_loginattempt_ibfk_2` FOREIGN KEY (`liam3_LoginAttempts_id_fk_234561`) REFERENCES `liam3_loginattempts` (`liam3_LoginAttempts_id`),
  CONSTRAINT `state_id_5963bd17` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `ConfigDiff` longtext,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `role_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_user_id`),
  KEY `role_id_fk` (`role_id`),
  KEY `role_user_user_idx` (`user_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_user_user` FOREIGN KEY (`user_id`) REFERENCES `liam3_user` (`liam3_User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Final view structure for view `_edges`
--

/*!50001 DROP TABLE IF EXISTS `_edges`*/;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_edges` AS select 'liam3_user_email' AS `EdgeType`,`liam3_user_email`.`liam3_User_email_id` AS `EdgeID`,0 AS `EdgePartner`,`liam3_user_email`.`state_id` AS `EdgeStateID`,`liam3_user_email`.`liam3_User_id_fk_164887` AS `ObjectID` from `liam3_user_email` union select 'liam3_user_email' AS `EdgeType`,`liam3_user_email`.`liam3_User_email_id` AS `EdgeID`,1 AS `EdgePartner`,`liam3_user_email`.`state_id` AS `EdgeStateID`,`liam3_user_email`.`liam3_email_id_fk_396224` AS `ObjectID` from `liam3_user_email` union select 'liam3_user_loginattempt' AS `EdgeType`,`liam3_user_loginattempt`.`liam3_User_LoginAttempt_id` AS `EdgeID`,0 AS `EdgePartner`,`liam3_user_loginattempt`.`state_id` AS `EdgeStateID`,`liam3_user_loginattempt`.`liam3_User_id_fk_955788` AS `ObjectID` from `liam3_user_loginattempt` union select 'liam3_user_loginattempt' AS `EdgeType`,`liam3_user_loginattempt`.`liam3_User_LoginAttempt_id` AS `EdgeID`,1 AS `EdgePartner`,`liam3_user_loginattempt`.`state_id` AS `EdgeStateID`,`liam3_user_loginattempt`.`liam3_LoginAttempts_id_fk_234561` AS `ObjectID` from `liam3_user_loginattempt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_nodes`
--

/*!50001 DROP TABLE IF EXISTS `_nodes`*/;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_nodes` AS select 'liam3_email' AS `ObjectType`,`liam3_email`.`liam3_email_id` AS `ObjectID`,`liam3_email`.`state_id` AS `ObjectStateID` from `liam3_email` union select 'liam3_loginattempts' AS `ObjectType`,`liam3_loginattempts`.`liam3_LoginAttempts_id` AS `ObjectID`,`liam3_loginattempts`.`state_id` AS `ObjectStateID` from `liam3_loginattempts` union select 'liam3_user' AS `ObjectType`,`liam3_user`.`liam3_User_id` AS `ObjectID`,`liam3_user`.`state_id` AS `ObjectStateID` from `liam3_user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_orphans`
--

/*!50001 DROP TABLE IF EXISTS `_orphans`*/;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orphans` AS select `n`.`ObjectType` AS `ObjectType`,`n`.`ObjectID` AS `ObjectID`,`n`.`ObjectStateID` AS `ObjectStateID` from (`_nodes` `n` left join `_edges` `e` on((`e`.`ObjectID` = `n`.`ObjectID`))) where isnull(`e`.`EdgeType`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 10:55:17
