-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: localhost    Database: transportation
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `cityID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'New York'),(2,'Chicago'),(3,'Kalamazoo'),(4,'Los Angeles'),(5,'San Francisco');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeID` int(11) NOT NULL,
  `vehicleID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `routeID` (`routeID`),
  KEY `vehicleID` (`vehicleID`),
  CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`routeID`) REFERENCES `routes` (`routeID`),
  CONSTRAINT `connection_ibfk_2` FOREIGN KEY (`vehicleID`) REFERENCES `vehicles` (`vehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` VALUES (1,1,2),(2,1,3),(3,1,4),(4,11,2),(5,11,3),(6,11,4),(7,2,2),(8,2,3),(9,2,4),(10,12,2),(11,12,3),(12,12,4),(13,3,3),(14,3,4),(15,4,3),(16,4,4),(17,14,3),(18,14,4),(19,17,3),(20,17,4),(21,5,1),(22,5,2),(23,5,3),(24,13,1),(25,13,2),(26,13,3),(27,6,3),(28,6,4),(29,15,3),(30,15,4),(31,7,3),(32,7,4),(33,18,3),(34,18,4),(35,8,2),(36,8,4),(37,16,2),(38,16,4),(39,9,2),(40,9,4),(41,19,2),(42,19,4),(43,10,1),(44,10,2),(45,10,3),(46,10,4),(47,20,1),(48,20,2),(49,20,3),(50,20,4);
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `routes` (
  `routeID` int(11) NOT NULL AUTO_INCREMENT,
  `cityFrom` int(11) NOT NULL,
  `cityTo` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`routeID`),
  KEY `cityFrom` (`cityFrom`),
  KEY `cityTo` (`cityTo`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`cityFrom`) REFERENCES `cities` (`cityID`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`cityTo`) REFERENCES `cities` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,1,2,800),(2,1,3,750),(3,1,4,2800),(4,1,5,2900),(5,2,3,150),(6,2,4,2020),(7,2,5,2130),(8,3,4,2260),(9,3,5,2270),(10,4,5,400),(11,2,1,800),(12,3,1,750),(13,3,2,150),(14,4,1,2800),(15,4,2,2020),(16,4,3,2260),(17,5,1,2900),(18,5,2,2130),(19,5,3,2270),(20,5,4,400);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicles` (
  `vehicleID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `speed` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`vehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Bus',60,5),(2,'Train',90,4),(3,'Car',75,1),(4,'Flight',575,10);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-11 21:13:50
