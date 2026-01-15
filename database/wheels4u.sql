-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: vehicle_new
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bikes`
--

DROP TABLE IF EXISTS `bikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bikes` (
  `bikeId` int NOT NULL AUTO_INCREMENT,
  `bikeimg` varchar(100) DEFAULT NULL,
  `bikeName` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `plateNumber` varchar(50) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `mileage` decimal(8,2) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bikeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bikes`
--

LOCK TABLES `bikes` WRITE;
/*!40000 ALTER TABLE `bikes` DISABLE KEYS */;
INSERT INTO `bikes` VALUES (5,'b1.jpg','Ninja 400','Kawasaki','Sport','EX400','Red','MBK-1020',2021,12000.00,25000.00,'Available'),(6,'b2.jpeg','CBR500R','Honda','Sport','CBR500R','Black','MBK-3345',2020,12000.00,20000.00,'Booked'),(7,'b3.png','Electra Glide','Harley-Davidson','Touring','Glide','Green','MBK-7452',2023,15000.00,28000.00,'Available'),(8,'b4.jpeg','MT-07','Yamaha','Naked','MT-07','Blue','MBK-8888',2018,9000.00,18000.00,'Booked'),(9,'b5.jpeg','Pulsar 220F','Bajaj','Commuter','220F','White','MBK-1122',2021,8000.00,21000.00,'Booked'),(10,'b8.jpeg','Hness CB350','Honda','Cruiser','DLX Pro','Black','MBK-4400',2022,22000.00,28000.00,'Available'),(11,'b7.jpeg','Xpulse 200','Hero','Adventure','Xpulse','White','SDK-8524',2017,18000.00,25000.00,'Available'),(12,'b9.jpeg','R15 V4','Yamaha','Cruiser','Stellar','Black','GFR-4763',2021,19000.00,24000.00,'Booked');
/*!40000 ALTER TABLE `bikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buses` (
  `busId` int NOT NULL AUTO_INCREMENT,
  `busimg` varchar(100) DEFAULT NULL,
  `busName` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `plateNumber` varchar(50) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `mileage` decimal(8,2) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`busId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (4,'bus1.jpeg','Coaster','Toyota','Mini','XZB50','White','BUS-4586',2022,42000.00,38000.00,'Available'),(5,'bus2.jpeg','Ashok Leyland Viking','Ashok Leyland','City','Viking','White','DGT-4326',2021,21000.00,35000.00,'Booked'),(6,'bus3.jpg','Isuzu Journey','Isuzu','Mini','M26','Blue','ABD-8697',2017,25000.00,38000.00,'Available'),(7,'bus4.jpeg','Tata Starbus','Tata','City','LP 410/31','Blue','SGA-8645',2015,21000.00,31000.00,'Available'),(8,'bus5.jpg','Marcopolo Ideale','Tata Marcopolo','Coach','B11R','Orange','GTH-4120',2021,14520.00,25000.00,'Available'),(9,'bus8.jpg','Rosa Mini Bus','Mitsubishi','Mini','BE64DG','Pink','GTH-4852',2022,13000.00,30000.00,'Available'),(10,'bus9.jpeg','Fuso Aero Midi','Mitsubishi','Midi','ME17D','Green','GTH-5245',2023,20000.00,34000.00,'Booked');
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `carId` int NOT NULL AUTO_INCREMENT,
  `carimg` varchar(100) DEFAULT NULL,
  `carName` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `plateNumber` varchar(50) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `mileage` decimal(8,2) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (10,'c1.jpg','C-Class C300','Mercedes-Benz','Sedan','C300','White','MBZ-3101',2024,18000.00,45000.00,'Available'),(11,'c2.jpg','Corolla X','Toyota','Sedan','XLi','Blue','CAB-3456',2020,35000.00,40000.00,'Available'),(12,'c3.jpeg','E-Class E200','Mercedes-Benz','SUV','E200','Red','MBZ-1120',2021,9000.00,48000.00,'Available'),(13,'c4.jpg','A4 Premium','Audi','Sedan','Premium','White','LAD-7788',2019,15000.00,38000.00,'Booked'),(14,'c5.jpg','Civic Turbo','Honda','Sedan','Turbo','Blue','CBB-1289',2020,22000.00,28000.00,'Available'),(15,'c6.png','X3 xDrive30i','BMW','SUV','xDrive30i','Yellow','LCB-3001',2022,19000.00,50000.00,'Available'),(16,'c7.jpg','Altima SL','Nissan','Sedan','SL','Red','EAB-9988',2014,47000.00,25000.00,'Available'),(17,'c8.jpeg','Elantra','Hyundai','Sedan','SE','Black','BCB-5489',2016,27000.00,34000.00,'Booked');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Himasha Rasanjalee','0745876954','hima@gmail.com','abcdefgh1','2026-01-11 01:57:19'),(2,'Kaveesha Divyanjali','0712345678','kavee@gmail.com','abcdefgh1','2026-01-14 21:28:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vans`
--

DROP TABLE IF EXISTS `vans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vans` (
  `vanId` int NOT NULL AUTO_INCREMENT,
  `vanimg` varchar(100) DEFAULT NULL,
  `vanName` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `plateNumber` varchar(50) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `mileage` decimal(8,2) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vanId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vans`
--

LOCK TABLES `vans` WRITE;
/*!40000 ALTER TABLE `vans` DISABLE KEYS */;
INSERT INTO `vans` VALUES (4,'v1.jpg','Hiace Premium','Toyota','Passenger','GL','White','WEN-1456',2020,55000.00,45000.00,'Available'),(5,'v2.jpg','NV350 Caravan ','Nissan','Passenger','DX','Yellow','RTU-4821',2021,48000.00,35000.00,'Booked'),(6,'v3.jpeg','Transit','Ford','Cargo','350 HD','White','KLM-2458',2023,19000.00,33000.00,'Booked'),(7,'v5.jpeg','Evalia','Nissan','Passenger','Shuttle','Black','VAN-8762',2019,25000.00,38000.00,'Available'),(8,'v4.jpeg','Eeco','Maruti Suzuki','Cargo','CNG Cargo','Blue','TRN-4582',2022,20000.00,36000.00,'Available'),(9,'v10.jpeg','Sienna LE','Toyota','Passenger','LE','Black','DTR-2356',2024,12800.00,28000.00,'Booked');
/*!40000 ALTER TABLE `vans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-15  7:08:55
