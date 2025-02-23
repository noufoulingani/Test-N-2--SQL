CREATE DATABASE  IF NOT EXISTS `study` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `study`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: study
-- ------------------------------------------------------
-- Server version	8.0.41

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

--
-- Temporary view structure for view `geog_sales`
--

DROP TABLE IF EXISTS `geog_sales`;
/*!50001 DROP VIEW IF EXISTS `geog_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `geog_sales` AS SELECT 
 1 AS `DESCRIPTION`,
 1 AS `TOT_SALES`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `IDPRODUCT` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(45) NOT NULL,
  `KG` decimal(3,0) DEFAULT NULL,
  `PRICE` decimal(2,0) DEFAULT NULL,
  `CATEGORY_PRODUCT` varchar(25) NOT NULL,
  PRIMARY KEY (`IDPRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (49,'RACE CAR',1,19,'VEHICLES'),(50,'REMOTE CONTROL TRUCK',1,43,'VEHICLES'),(51,'MOTORCYCLE TOY',1,15,'VEHICLES'),(52,'POLICE CAR',1,23,'VEHICLES'),(53,'FIRE TRUCK',1,30,'VEHICLES'),(54,'AIRPLANE TOY',1,20,'VEHICLES'),(55,'SPIDER-MAN ACTION FIGURE',0,20,'ACTION FIGURE'),(56,'BATMAN ACTION FIGURE',0,23,'ACTION FIGURE'),(57,'IRON MAN ACTION FIGURE',0,25,'ACTION FIGURE'),(58,'CAPTAIN AMERICA FIGURE',0,22,'ACTION FIGURE'),(59,'WONDER WOMAN ACTION FIGURE',0,20,'ACTION FIGURE'),(60,'HULK ACTION FIGURE',1,28,'ACTION FIGURE'),(61,'BARBIE',1,26,'DOLL'),(62,'KEN',0,20,'DOLL'),(63,'BAMBOLE BABY',0,16,'DOLL'),(64,'BABY ALIVE',1,36,'DOLL'),(65,'BARBIE DREAMHOUSE',1,13,'DOLL'),(66,'LITTLE MOMMY',1,23,'DOLL'),(67,'MY FIRST DOLL',0,15,'DOLL'),(68,'POLLY POCKET',0,10,'DOLL'),(69,'DOLLHOUSE FURNITURE',1,55,'DOLL'),(70,'BRATZ DOLL',0,20,'DOLL');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_view`
--

DROP TABLE IF EXISTS `product_view`;
/*!50001 DROP VIEW IF EXISTS `product_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_view` AS SELECT 
 1 AS `IDPRODUCT`,
 1 AS `PRODUCT_NAME`,
 1 AS `CATEGORY_PRODUCT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `COUNTRY` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(45) NOT NULL,
  `NUM_REGION` int NOT NULL,
  PRIMARY KEY (`COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('ALASKA','NORD-OVEST',4),('ARGENTINA','SUD-OVEST',3),('AUSTRALIA','SUD-OVEST',3),('CANADA','NORD-OVEST',4),('CINA','NORTH-EST',1),('FILIPPINE','SUD-EST',2),('GERMANIA','CENTRO',5),('GRECIA','CENTRO',5),('INDONESIA','SUD-EST',2),('ITALIA','CENTRO',5),('LAOS','SUD-EST',2),('MAROCCO','CENTRO',5),('NORVEGIA','NORTH-EST',1),('PERU','SUD-OVEST',3),('PORTOGALLO','CENTRO',5),('RUSSIA','NORTH-EST',1),('STATI UNITI','NORD-OVEST',4),('SVEZIA','NORTH-EST',1),('SVIZZERA','CENTRO',5),('TAIWAN','NORTH-EST',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `IDSALES` int NOT NULL AUTO_INCREMENT,
  `SELLER_NAME` varchar(45) DEFAULT NULL,
  `QUANTITY` varchar(45) DEFAULT NULL,
  `IDPRODUCT` int DEFAULT NULL,
  `COUNTRY` varchar(20) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`IDSALES`),
  UNIQUE KEY `IDSALES` (`IDSALES`),
  KEY `IDPRODUCT` (`IDPRODUCT`),
  KEY `COUNTRY` (`COUNTRY`),
  CONSTRAINT `COUNTRY` FOREIGN KEY (`COUNTRY`) REFERENCES `region` (`COUNTRY`),
  CONSTRAINT `IDPRODUCT` FOREIGN KEY (`IDPRODUCT`) REFERENCES `product` (`IDPRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (69,'John Smith','10',49,'ITALIA','2023-05-09'),(70,'Alice Johnson','5',50,'GERMANIA','2023-04-26'),(71,'Robert Brown','8',51,'AUSTRALIA','2023-03-15'),(72,'Jessica Taylor','6',52,'STATI UNITI','2023-02-01'),(73,'Michael Davis','7',53,'CANADA','2023-01-18'),(74,'Emily Wilson','12',54,'CINA','2022-12-06'),(75,'David Clark','3',55,'ARGENTINA','2022-11-02'),(76,'Sarah Lewis','9',56,'SVIZZERA','2022-10-11'),(77,'William Harris','11',57,'RUSSIA','2022-09-21'),(78,'Sophia Allen','4',58,'FILIPPINE','2022-08-30'),(79,'Daniel Martin','6',59,'TAIWAN','2024-04-10'),(80,'Olivia Rodriguez','5',60,'PORTOGALLO','2024-03-20'),(81,'James Walker','7',61,'NORVEGIA','2024-02-29'),(82,'Charlotte Young','14',62,'SVEZIA','2024-01-12'),(83,'Amelia Taylor','10',64,'GRECIA','2023-12-01'),(84,'Ethan Hall','3',65,'ALASKA','2023-11-07'),(85,'Mason King','4',66,'LAOS','2023-10-10'),(86,'Harper Scott','12',67,'PERU','2023-09-05'),(87,'Liam Adams','9',68,'STATI UNITI','2023-08-16'),(88,'Ava Nelson','6',69,'TAIWAN','2023-07-25'),(89,'Mia Carter','8',70,'FILIPPINE','2023-06-14'),(90,'Noah Perez','5',49,'AUSTRALIA','2023-05-09'),(91,'Eleanor Gonzalez','11',50,'GRECIA','2023-04-26'),(92,'Jack Mitchell','7',51,'CANADA','2023-03-15'),(93,'Isabella Ramirez','15',52,'ITALIA','2023-02-01'),(94,'Zoe Parker','6',53,'PORTOGALLO','2023-01-18'),(95,'Henry Adams','4',54,'GERMANIA','2022-12-06'),(96,'Grace Nelson','9',55,'CINA','2022-11-02'),(97,'Benjamin White','10',56,'MAROCCO','2022-10-11'),(98,'Chloe Evans','5',57,'RUSSIA','2022-09-21'),(99,'Jacob Wright','8',58,'SVEZIA','2022-08-30'),(100,'Jacob VERDI','8',58,'ITALIA','2024-12-20');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `geog_sales`
--

/*!50001 DROP VIEW IF EXISTS `geog_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `geog_sales` AS select `r`.`DESCRIPTION` AS `DESCRIPTION`,(sum(`s`.`QUANTITY`) * avg(`p`.`PRICE`)) AS `TOT_SALES` from ((`sales` `s` left join `region` `r` on((`r`.`COUNTRY` = `s`.`COUNTRY`))) left join `product` `p` on((`s`.`IDPRODUCT` = `p`.`IDPRODUCT`))) group by `r`.`DESCRIPTION` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_view`
--

/*!50001 DROP VIEW IF EXISTS `product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_view` AS select `product`.`IDPRODUCT` AS `IDPRODUCT`,`product`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`product`.`CATEGORY_PRODUCT` AS `CATEGORY_PRODUCT` from `product` */;
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

-- Dump completed on 2025-02-23 16:24:23
