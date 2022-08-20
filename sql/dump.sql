-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: services
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `band_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`band_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'Lewis Family'),(2,'Adult Choir'),(3,'7-9th Choir');
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `Event_Type_ID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Event_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Opener'),(2,'Prelude'),(3,'Welcome'),(4,'Scripture Reading'),(5,'Cong. Song'),(6,'Prayer'),(7,'Offertory'),(8,'Choir'),(9,'Special Music'),(10,'Message'),(11,'Closing Song'),(12,'Postlude'),(13,'Lord\'s Supper'),(14,'Prayer/Announcements');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fills_role`
--

DROP TABLE IF EXISTS `fills_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fills_role` (
  `Person_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  `Role_Type` char(1) NOT NULL,
  `Confirmed` char(1) NOT NULL,
  PRIMARY KEY (`Person_ID`,`Service_ID`),
  KEY `Service_ID` (`Service_ID`),
  CONSTRAINT `fills_role_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `fills_role_ibfk_2` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fills_role`
--

LOCK TABLES `fills_role` WRITE;
/*!40000 ALTER TABLE `fills_role` DISABLE KEYS */;
INSERT INTO `fills_role` VALUES (2,1,'O','Y'),(4,47,'S','N'),(4,55,'S','N'),(6,2,'P','Y'),(10,1,'P','Y'),(14,2,'O','Y'),(15,2,'S','Y'),(15,53,'S','N'),(16,1,'S','Y'),(16,50,'S','N'),(16,54,'S','N'),(16,56,'S','N'),(16,59,'S','N');
/*!40000 ALTER TABLE `fills_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_of`
--

DROP TABLE IF EXISTS `member_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_of` (
  `band_ID` int NOT NULL,
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`band_ID`,`Person_ID`),
  KEY `FK_member_of_Person` (`Person_ID`),
  CONSTRAINT `FK_member_of_band` FOREIGN KEY (`band_ID`) REFERENCES `band` (`band_ID`),
  CONSTRAINT `FK_member_of_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_of`
--

LOCK TABLES `member_of` WRITE;
/*!40000 ALTER TABLE `member_of` DISABLE KEYS */;
INSERT INTO `member_of` VALUES (2,7),(1,9),(2,10),(2,13),(3,16),(3,18);
/*!40000 ALTER TABLE `member_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `organist_view`
--

DROP TABLE IF EXISTS `organist_view`;
/*!50001 DROP VIEW IF EXISTS `organist_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `organist_view` AS SELECT 
 1 AS `service_ID`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `Person_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Rebekah','Hawkey','rhawkey@gmail.com'),(2,'Amanda','Bixby','abixby@gmail.com'),(3,'Steve','Lee','slee@gmail.com'),(4,'Robert','Everett','reveret@gmail.com'),(5,'Sam','Martin','smartin@gmail.com'),(6,'Judy','Jackson','jjackson@gmail.com'),(7,'Jon','Avery','javery@gmail.com'),(8,'Sarah','Dobney','sdobney@gmail.com'),(9,'Tomothy','Lewis','tlewis@gmail.com'),(10,'Nathan','Martin','nmartin@gmail.com'),(11,'Stan','Bush','sbush@gmail.com'),(12,'Holly','Fordham','hfordham@gmail.com'),(13,'Cyndi','Wright','cwright@gmail.com'),(14,'Ed','Jackson','ejackson@gmail.com'),(15,'Jason','Boyle','jboyle@gmail.com'),(16,'Alan','Kennedy','akennedy@gmail.com'),(18,'Stephan','Griggs','sgriggs@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pianist_view`
--

DROP TABLE IF EXISTS `pianist_view`;
/*!50001 DROP VIEW IF EXISTS `pianist_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pianist_view` AS SELECT 
 1 AS `service_ID`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `Service_ID` int NOT NULL AUTO_INCREMENT,
  `Svc_DateTime` datetime(6) NOT NULL,
  `Theme_Event` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Service_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'2019-10-03 10:30:00.000000','Christmas'),(2,'2019-10-03 17:30:00.000000','Christmas'),(6,'2019-10-10 10:30:00.000000','Christmas'),(47,'2020-05-03 10:30:00.000000','Easter'),(48,'2020-05-03 17:30:00.000000','Easter'),(50,'2020-10-03 10:30:00.000000','Joy Filled Life'),(51,'2020-10-03 17:30:00.000000','Joy Filled Life'),(53,'2020-10-10 10:30:00.000000','Joy Filled Life'),(54,'2020-10-10 17:30:00.000000','Joy Filled Life'),(55,'2019-11-10 17:30:00.000000','Peace on Earth'),(56,'2021-11-18 13:00:00.000000','Peace on Earth'),(57,'2022-10-03 17:30:00.000000','Test1'),(58,'0000-00-00 00:00:00.000000','Test2'),(59,'2022-10-23 17:30:00.000000','Test3');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_item`
--

DROP TABLE IF EXISTS `service_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_item` (
  `Service_Item_ID` int NOT NULL AUTO_INCREMENT,
  `Service_ID` int NOT NULL,
  `Seq_Num` int NOT NULL,
  `Event_Type_ID` int NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Notes` varchar(40) DEFAULT NULL,
  `Confirmed` char(1) NOT NULL,
  `Person_ID` int DEFAULT NULL,
  `band_ID` int DEFAULT NULL,
  `Song_ID` int DEFAULT NULL,
  PRIMARY KEY (`Service_Item_ID`),
  KEY `FK_service_event_band` (`band_ID`),
  KEY `FK_service_event_EventType` (`Event_Type_ID`),
  KEY `FK_service_event_Person` (`Person_ID`),
  KEY `FK_service_event_Service` (`Service_ID`),
  KEY `FK_service_event_Song` (`Song_ID`),
  CONSTRAINT `FK_service_event_band` FOREIGN KEY (`band_ID`) REFERENCES `band` (`band_ID`),
  CONSTRAINT `FK_service_event_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `FK_service_event_Service` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`),
  CONSTRAINT `FK_service_event_Song` FOREIGN KEY (`Song_ID`) REFERENCES `song` (`song_id`),
  CONSTRAINT `FK_service_item_event_type` FOREIGN KEY (`Event_Type_ID`) REFERENCES `event_type` (`Event_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_item`
--

LOCK TABLES `service_item` WRITE;
/*!40000 ALTER TABLE `service_item` DISABLE KEYS */;
INSERT INTO `service_item` VALUES (1,1,1,1,'It is Well','flute','Y',1,NULL,NULL),(2,1,2,2,NULL,NULL,'Y',2,NULL,NULL),(3,1,3,3,NULL,NULL,'Y',3,NULL,NULL),(4,1,4,2,NULL,NULL,'Y',2,NULL,NULL),(5,1,5,4,NULL,NULL,'Y',3,NULL,NULL),(6,1,6,5,NULL,NULL,'Y',NULL,NULL,2),(7,1,7,6,NULL,NULL,'Y',4,NULL,NULL),(8,1,8,5,NULL,NULL,'Y',NULL,NULL,3),(9,1,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(10,1,10,8,NULL,NULL,'Y',NULL,2,5),(11,1,11,5,NULL,NULL,'Y',NULL,NULL,6),(12,1,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(13,1,13,10,NULL,NULL,'Y',4,NULL,NULL),(14,1,14,11,NULL,NULL,'Y',NULL,NULL,8),(15,1,15,12,NULL,NULL,'Y',2,NULL,NULL),(16,2,1,2,NULL,NULL,'Y',10,NULL,NULL),(17,2,2,6,NULL,NULL,'N',3,NULL,NULL),(18,2,3,5,NULL,NULL,'Y',NULL,NULL,9),(19,2,4,5,NULL,NULL,'Y',NULL,NULL,10),(21,2,5,5,NULL,NULL,'Y',NULL,NULL,13),(22,2,6,5,NULL,NULL,'Y',NULL,NULL,14),(23,2,7,14,NULL,NULL,'Y',11,NULL,NULL),(33,6,1,1,NULL,NULL,'N',2,NULL,NULL),(34,6,2,5,NULL,NULL,'Y',NULL,NULL,6),(114,47,1,1,NULL,NULL,'N',NULL,NULL,NULL),(115,47,2,2,NULL,NULL,'N',NULL,NULL,NULL),(116,47,3,3,NULL,NULL,'N',NULL,NULL,NULL),(117,47,4,2,NULL,NULL,'N',NULL,NULL,NULL),(118,47,5,4,NULL,NULL,'N',NULL,NULL,NULL),(119,47,6,5,NULL,NULL,'N',NULL,NULL,NULL),(120,47,7,6,NULL,NULL,'N',NULL,NULL,NULL),(121,47,8,5,NULL,NULL,'N',NULL,NULL,NULL),(122,47,9,7,NULL,NULL,'N',NULL,NULL,NULL),(123,47,10,8,NULL,NULL,'N',NULL,NULL,NULL),(124,47,11,5,NULL,NULL,'N',NULL,NULL,NULL),(125,47,12,9,NULL,NULL,'N',NULL,NULL,NULL),(126,47,13,10,NULL,NULL,'N',NULL,NULL,NULL),(127,47,14,11,NULL,NULL,'N',NULL,NULL,NULL),(128,47,15,12,NULL,NULL,'N',NULL,NULL,NULL),(129,48,1,2,NULL,NULL,'N',NULL,NULL,NULL),(130,48,2,6,NULL,NULL,'N',NULL,NULL,NULL),(131,48,3,5,NULL,NULL,'N',NULL,NULL,NULL),(132,48,4,5,NULL,NULL,'N',NULL,NULL,NULL),(133,48,5,5,NULL,NULL,'N',NULL,NULL,NULL),(134,48,6,5,NULL,NULL,'N',NULL,NULL,NULL),(135,48,7,14,NULL,NULL,'N',NULL,NULL,NULL),(151,50,1,1,NULL,NULL,'N',NULL,NULL,NULL),(152,50,2,2,NULL,NULL,'N',NULL,NULL,NULL),(153,50,3,3,NULL,NULL,'N',NULL,NULL,NULL),(154,50,4,2,NULL,NULL,'N',NULL,NULL,NULL),(155,50,5,4,NULL,NULL,'N',NULL,NULL,NULL),(156,50,6,5,NULL,NULL,'N',NULL,NULL,NULL),(157,50,7,6,NULL,NULL,'N',NULL,NULL,NULL),(158,50,8,5,NULL,NULL,'N',NULL,NULL,NULL),(159,50,9,7,NULL,NULL,'N',NULL,NULL,NULL),(160,50,10,8,NULL,NULL,'N',NULL,NULL,NULL),(161,50,11,5,NULL,NULL,'N',NULL,NULL,NULL),(162,50,12,9,NULL,NULL,'N',NULL,NULL,NULL),(163,50,13,10,NULL,NULL,'N',NULL,NULL,NULL),(164,50,14,11,NULL,NULL,'N',NULL,NULL,NULL),(165,50,15,12,NULL,NULL,'N',NULL,NULL,NULL),(166,51,1,2,NULL,NULL,'N',NULL,NULL,NULL),(167,51,2,6,NULL,NULL,'N',NULL,NULL,NULL),(168,51,3,5,NULL,NULL,'N',NULL,NULL,NULL),(169,51,4,5,NULL,NULL,'N',NULL,NULL,NULL),(170,51,5,5,NULL,NULL,'N',NULL,NULL,NULL),(171,51,6,5,NULL,NULL,'N',NULL,NULL,NULL),(172,51,7,14,NULL,NULL,'N',NULL,NULL,NULL),(188,53,1,1,NULL,NULL,'N',NULL,NULL,NULL),(189,53,2,2,NULL,NULL,'N',NULL,NULL,NULL),(190,53,3,3,NULL,NULL,'N',NULL,NULL,NULL),(191,53,4,2,NULL,NULL,'N',NULL,NULL,NULL),(192,53,5,4,NULL,NULL,'N',NULL,NULL,NULL),(193,53,6,5,NULL,NULL,'N',NULL,NULL,NULL),(194,53,7,6,NULL,NULL,'N',NULL,NULL,NULL),(195,53,8,5,NULL,NULL,'N',NULL,NULL,NULL),(196,53,9,7,NULL,NULL,'N',NULL,NULL,NULL),(197,53,10,8,NULL,NULL,'N',NULL,NULL,NULL),(198,53,11,5,NULL,NULL,'N',NULL,NULL,NULL),(199,53,12,9,NULL,NULL,'N',NULL,NULL,NULL),(200,53,13,10,NULL,NULL,'N',NULL,NULL,NULL),(201,53,14,11,NULL,NULL,'N',NULL,NULL,NULL),(202,53,15,12,NULL,NULL,'N',NULL,NULL,NULL),(203,54,1,2,NULL,NULL,'N',NULL,NULL,NULL),(204,54,2,6,NULL,NULL,'N',NULL,NULL,NULL),(205,54,3,5,NULL,NULL,'N',NULL,NULL,NULL),(206,54,4,5,NULL,NULL,'N',NULL,NULL,NULL),(207,54,5,5,NULL,NULL,'N',NULL,NULL,NULL),(208,54,6,5,NULL,NULL,'N',NULL,NULL,NULL),(209,54,7,14,NULL,NULL,'N',NULL,NULL,NULL),(210,55,1,2,NULL,NULL,'N',NULL,NULL,NULL),(211,55,2,6,NULL,NULL,'N',NULL,NULL,NULL),(212,55,3,5,NULL,NULL,'N',NULL,NULL,NULL),(213,55,4,5,NULL,NULL,'N',NULL,NULL,NULL),(214,55,5,5,NULL,NULL,'N',NULL,NULL,NULL),(215,55,6,5,NULL,NULL,'N',NULL,NULL,NULL),(216,55,7,14,NULL,NULL,'N',NULL,NULL,NULL),(217,56,1,2,NULL,NULL,'N',NULL,NULL,NULL),(218,56,2,6,NULL,NULL,'N',NULL,NULL,NULL),(219,56,3,5,NULL,NULL,'N',NULL,NULL,NULL),(220,56,4,5,NULL,NULL,'N',NULL,NULL,NULL),(221,56,5,5,NULL,NULL,'N',NULL,NULL,NULL),(222,56,6,5,NULL,NULL,'N',NULL,NULL,NULL),(223,56,7,14,NULL,NULL,'N',NULL,NULL,NULL),(224,57,1,1,NULL,NULL,'N',NULL,NULL,NULL),(225,57,2,2,NULL,NULL,'N',NULL,NULL,NULL),(226,57,3,3,NULL,NULL,'N',NULL,NULL,NULL),(227,57,4,2,NULL,NULL,'N',NULL,NULL,NULL),(228,57,5,4,NULL,NULL,'N',NULL,NULL,NULL),(229,57,6,5,NULL,NULL,'N',NULL,NULL,NULL),(230,57,7,6,NULL,NULL,'N',NULL,NULL,NULL),(231,57,8,5,NULL,NULL,'N',NULL,NULL,NULL),(232,57,9,7,NULL,NULL,'N',NULL,NULL,NULL),(233,57,10,8,NULL,NULL,'N',NULL,NULL,NULL),(234,57,11,5,NULL,NULL,'N',NULL,NULL,NULL),(235,57,12,9,NULL,NULL,'N',NULL,NULL,NULL),(236,57,13,10,NULL,NULL,'N',NULL,NULL,NULL),(237,57,14,11,NULL,NULL,'N',NULL,NULL,NULL),(238,57,15,12,NULL,NULL,'N',NULL,NULL,NULL),(239,58,1,1,NULL,NULL,'N',NULL,NULL,NULL),(240,58,2,2,NULL,NULL,'N',NULL,NULL,NULL),(241,58,3,3,NULL,NULL,'N',NULL,NULL,NULL),(242,58,4,2,NULL,NULL,'N',NULL,NULL,NULL),(243,58,5,4,NULL,NULL,'N',NULL,NULL,NULL),(244,58,6,5,NULL,NULL,'N',NULL,NULL,NULL),(245,58,7,6,NULL,NULL,'N',NULL,NULL,NULL),(246,58,8,5,NULL,NULL,'N',NULL,NULL,NULL),(247,58,9,7,NULL,NULL,'N',NULL,NULL,NULL),(248,58,10,8,NULL,NULL,'N',NULL,NULL,NULL),(249,58,11,5,NULL,NULL,'N',NULL,NULL,NULL),(250,58,12,9,NULL,NULL,'N',NULL,NULL,NULL),(251,58,13,10,NULL,NULL,'N',NULL,NULL,NULL),(252,58,14,11,NULL,NULL,'N',NULL,NULL,NULL),(253,58,15,12,NULL,NULL,'N',NULL,NULL,NULL),(254,59,1,1,NULL,NULL,'N',NULL,NULL,NULL),(255,59,2,2,NULL,NULL,'N',NULL,NULL,NULL),(256,59,3,3,NULL,NULL,'N',NULL,NULL,NULL),(257,59,4,2,NULL,NULL,'N',NULL,NULL,NULL),(258,59,5,4,NULL,NULL,'N',NULL,NULL,NULL),(259,59,6,5,NULL,NULL,'N',NULL,NULL,NULL),(260,59,7,6,NULL,NULL,'N',NULL,NULL,NULL),(261,59,8,5,NULL,NULL,'N',NULL,NULL,NULL),(262,59,9,7,NULL,NULL,'N',NULL,NULL,NULL),(263,59,10,8,NULL,NULL,'N',NULL,NULL,NULL),(264,59,11,5,NULL,NULL,'N',NULL,NULL,NULL),(265,59,12,9,NULL,NULL,'N',NULL,NULL,NULL),(266,59,13,10,NULL,NULL,'N',NULL,NULL,NULL),(267,59,14,11,NULL,NULL,'N',NULL,NULL,NULL),(268,59,15,12,NULL,NULL,'N',NULL,NULL,NULL);
/*!40000 ALTER TABLE `service_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `service_view`
--

DROP TABLE IF EXISTS `service_view`;
/*!50001 DROP VIEW IF EXISTS `service_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `service_view` AS SELECT 
 1 AS `service_ID`,
 1 AS `Svc_DateTime`,
 1 AS `Theme_Event`,
 1 AS `songLeader`,
 1 AS `Organist`,
 1 AS `Pianist`,
 1 AS `Seq_Num`,
 1 AS `Event`,
 1 AS `Title`,
 1 AS `Name`,
 1 AS `Notes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `Song_ID` int NOT NULL AUTO_INCREMENT,
  `Song_Type` char(1) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Hymnbook_Num` varchar(5) DEFAULT NULL,
  `Arranger` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Song_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'C','It is Well',NULL,NULL),(2,'H','My Faith has Found','60',NULL),(3,'H','Hiding in Thee','608',NULL),(4,'C','May the Mind of Christ my Savior',NULL,NULL),(5,'C','If You Search with All Your Hearts',NULL,NULL),(6,'H','Like a River','352',NULL),(7,'C','Jesus, I am Resting',NULL,NULL),(8,'H','For All the Saints','643',NULL),(9,'H','At the Cross','140',NULL),(10,'H','He Died For ME','154',NULL),(13,'H','When I Survey','137',NULL),(14,'H','It is Finished','138',NULL),(15,'H','Jesus Paid It All','390',NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `songleader_list`
--

DROP TABLE IF EXISTS `songleader_list`;
/*!50001 DROP VIEW IF EXISTS `songleader_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songleader_list` AS SELECT 
 1 AS `name`,
 1 AS `Person_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `songleader_view`
--

DROP TABLE IF EXISTS `songleader_view`;
/*!50001 DROP VIEW IF EXISTS `songleader_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songleader_view` AS SELECT 
 1 AS `service_ID`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `unavailable_for`
--

DROP TABLE IF EXISTS `unavailable_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unavailable_for` (
  `Person_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`,`Service_ID`),
  KEY `FK_unavailable_for_Service` (`Service_ID`),
  CONSTRAINT `FK_unavailable_for_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `FK_unavailable_for_Service` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unavailable_for`
--

LOCK TABLES `unavailable_for` WRITE;
/*!40000 ALTER TABLE `unavailable_for` DISABLE KEYS */;
INSERT INTO `unavailable_for` VALUES (6,1),(10,1),(14,1),(10,2),(2,6),(16,6);
/*!40000 ALTER TABLE `unavailable_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'services'
--

--
-- Dumping routines for database 'services'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `create_service`(IN date VARCHAR(50), IN theme VARCHAR(50), IN songleader INT, IN templateID INT, OUT status VARCHAR(50))
BEGIN
	DECLARE time DATETIME;
    DECLARE serviceID INT;
    
    
	SELECT Svc_DateTime INTO time FROM service
	WHERE Svc_DateTime LIKE CONCAT(date,'%')
	LIMIT 1;
    
    
    IF (time IS NULL) THEN
		
		INSERT INTO service (Svc_DateTime, Theme_Event)
        VALUES (date, theme);
        
        
		SELECT LAST_INSERT_ID() INTO serviceID FROM service LIMIT 1;
        
        
        IF (songleader IS NOT NULL) THEN
			INSERT INTO fills_role (Person_ID, Service_ID, Role_Type, Confirmed)
			VALUES (songleader, LAST_INSERT_ID(), 'S', 'N'); 
        END IF;
        
        
        INSERT INTO service_item (Service_ID, Seq_Num, Event_Type_ID, Title, Notes, Confirmed, Person_ID, band_ID, Song_ID)
		SELECT serviceID, Seq_Num, service_item.Event_Type_ID, NULL AS Title, NULL AS Notes, 'N' AS Confirmed, NULL AS Person_ID, NULL AS band_ID, NULL AS Song_ID
		FROM service_item
		WHERE Service_ID = templateID;
        
		SET status = 'SUCCESS';
        SELECT status;
	ELSE
		SET status = 'There is already a service at this time';
        SELECT status;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `organist_view`
--

/*!50001 DROP VIEW IF EXISTS `organist_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `organist_view` AS select `service`.`Service_ID` AS `service_ID`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `Name` from ((`service` left join `fills_role` on((`service`.`Service_ID` = `fills_role`.`Service_ID`))) left join `person` on((`fills_role`.`Person_ID` = `person`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'O') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pianist_view`
--

/*!50001 DROP VIEW IF EXISTS `pianist_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `pianist_view` AS select `service`.`Service_ID` AS `service_ID`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `Name` from ((`service` left join `fills_role` on((`service`.`Service_ID` = `fills_role`.`Service_ID`))) left join `person` on((`fills_role`.`Person_ID` = `person`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'P') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `service_view`
--

/*!50001 DROP VIEW IF EXISTS `service_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `service_view` AS select `service`.`Service_ID` AS `service_ID`,`service`.`Svc_DateTime` AS `Svc_DateTime`,`service`.`Theme_Event` AS `Theme_Event`,`songleader_view`.`Name` AS `songLeader`,`organist_view`.`Name` AS `Organist`,`pianist_view`.`Name` AS `Pianist`,`service_item`.`Seq_Num` AS `Seq_Num`,`event_type`.`Description` AS `Event`,(case when (`service_item`.`Event_Type_ID` = 5) then concat(`song`.`Hymnbook_Num`,' ',`song`.`Title`) when (`service_item`.`Event_Type_ID` = 8) then `song`.`Title` else `service_item`.`Title` end) AS `Title`,(case when (`service_item`.`band_ID` is not null) then `band`.`Name` else concat(`person`.`First_Name`,' ',`person`.`Last_Name`) end) AS `Name`,`service_item`.`Notes` AS `Notes` from ((((((((`service` left join `service_item` on((`service`.`Service_ID` = `service_item`.`Service_ID`))) left join `event_type` on((`service_item`.`Event_Type_ID` = `event_type`.`Event_Type_ID`))) left join `person` on((`service_item`.`Person_ID` = `person`.`Person_ID`))) left join `band` on((`service_item`.`band_ID` = `band`.`band_ID`))) left join `song` on((`service_item`.`Song_ID` = `song`.`Song_ID`))) left join `songleader_view` on((`service`.`Service_ID` = `songleader_view`.`service_ID`))) left join `pianist_view` on((`service`.`Service_ID` = `pianist_view`.`service_ID`))) left join `organist_view` on((`service`.`Service_ID` = `organist_view`.`service_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songleader_list`
--

/*!50001 DROP VIEW IF EXISTS `songleader_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `songleader_list` AS select distinct concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `name`,`person`.`Person_ID` AS `Person_ID` from (`fills_role` left join `person` on((`person`.`Person_ID` = `fills_role`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'S') order by `person`.`Last_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songleader_view`
--

/*!50001 DROP VIEW IF EXISTS `songleader_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `songleader_view` AS select `service`.`Service_ID` AS `service_ID`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `Name` from ((`service` left join `fills_role` on((`service`.`Service_ID` = `fills_role`.`Service_ID`))) left join `person` on((`fills_role`.`Person_ID` = `person`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'S') */;
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

-- Dump completed on 2022-08-20 15:15:39
