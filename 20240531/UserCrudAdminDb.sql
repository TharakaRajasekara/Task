-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: t2cn.cryko06sihac.ap-southeast-1.rds.amazonaws.com    Database: t2c-test
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `deactivated_reason`
--

DROP TABLE IF EXISTS `deactivated_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deactivated_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deactivated_user`
--

DROP TABLE IF EXISTS `deactivated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deactivated_user` (
  `deactivated_user_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reason_id` int NOT NULL,
  `deactivated_date` datetime NOT NULL,
  PRIMARY KEY (`deactivated_user_id`),
  KEY `fk_deactivated_user_user_idx` (`user_id`),
  KEY `fk_deactivated_user_deactivated_reason1_idx` (`reason_id`),
  CONSTRAINT `fk_deactivated_user_deactivated_reason1` FOREIGN KEY (`reason_id`) REFERENCES `deactivated_reason` (`id`),
  CONSTRAINT `fk_deactivated_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropoff_locations`
--

DROP TABLE IF EXISTS `dropoff_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dropoff_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `locations` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropoff_point`
--

DROP TABLE IF EXISTS `dropoff_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dropoff_point` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `points` int NOT NULL,
  `locations_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dropoff_point_user1_idx` (`user_id`),
  KEY `fk_dropoff_point_dropoff_locations1_idx` (`locations_id`),
  CONSTRAINT `fk_dropoff_point_dropoff_locations1` FOREIGN KEY (`locations_id`) REFERENCES `dropoff_locations` (`id`),
  CONSTRAINT `fk_dropoff_point_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `home_point`
--

DROP TABLE IF EXISTS `home_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_point` (
  `hp_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `timeslot_id` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `item_list_id` int NOT NULL,
  PRIMARY KEY (`hp_id`),
  KEY `fk_home_point_user1_idx` (`user_id`),
  KEY `fk_home_point_timeslot1_idx` (`timeslot_id`),
  KEY `fk_home_point_item_list1_idx` (`item_list_id`),
  CONSTRAINT `fk_home_point_item_list1` FOREIGN KEY (`item_list_id`) REFERENCES `item_list` (`id`),
  CONSTRAINT `fk_home_point_timeslot1` FOREIGN KEY (`timeslot_id`) REFERENCES `timeslot` (`id`),
  CONSTRAINT `fk_home_point_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_list`
--

DROP TABLE IF EXISTS `item_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pct` double NOT NULL,
  `papers` double NOT NULL,
  `gbottles` double NOT NULL,
  `books` int NOT NULL,
  `clothes` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_point`
--

DROP TABLE IF EXISTS `machine_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `machine_id` int NOT NULL,
  `points` int NOT NULL,
  `date_time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_machine_point_user1_idx` (`user_id`),
  KEY `fk_machine_point_machine1_idx` (`machine_id`),
  CONSTRAINT `fk_machine_point_machine1` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`),
  CONSTRAINT `fk_machine_point_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redeem`
--

DROP TABLE IF EXISTS `redeem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redeem` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `points` int NOT NULL,
  `locations` varchar(255) NOT NULL,
  `redeem_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_redeem_user1_idx` (`user_id`),
  CONSTRAINT `fk_redeem_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_loc`
--

DROP TABLE IF EXISTS `saved_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_loc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `second_num` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_saved_loc_user1_idx` (`user_id`),
  CONSTRAINT `fk_saved_loc_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `added_date` datetime NOT NULL,
  `support_isuue_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_support_support_isuue1_idx` (`support_isuue_id`),
  KEY `fk_support_user1_idx` (`user_id`),
  CONSTRAINT `fk_support_support_isuue1` FOREIGN KEY (`support_isuue_id`) REFERENCES `support_issue` (`id`),
  CONSTRAINT `fk_support_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_issue`
--

DROP TABLE IF EXISTS `support_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_issue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issue` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `email` varchar(60) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `pfp_link` varchar(255) NOT NULL,
  `available_points` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 't2c-test'
--

--
-- Dumping routines for database 't2c-test'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 10:50:02
