-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: scms_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `a_driver`
--

DROP TABLE IF EXISTS `a_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_driver` (
  `userName` varchar(255) NOT NULL,
  `permit_id` varchar(255) NOT NULL,
  PRIMARY KEY (`userName`),
  CONSTRAINT `a_driver_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `employee` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_driver`
--

LOCK TABLES `a_driver` WRITE;
/*!40000 ALTER TABLE `a_driver` DISABLE KEYS */;
INSERT INTO `a_driver` VALUES ('anika91','B910322'),('buddhika94','B940802'),('chamara9201','B920126'),('chathuranga9421','B942108'),('eranda9210','B921020'),('eranda9434','B943417'),('harindra93','B930709'),('harini86','B860808'),('harsha92','B920703'),('hasini9429','B942911'),('isuru9427','B942704'),('kalpana9518','B951817'),('mahanuwa9437','B943718'),('malshani9422','B942220'),('manjula9424','B942425'),('nadeesha9111','B911101'),('nirosha9430','B943032'),('piumi9207','B920719'),('prabath9433','B943313'),('prasanna9414','B941414'),('prasanna9438','B943814'),('priyantha9306','B930623'),('rangana9404','B940424'),('sanduni9317','B931726'),('thilan9426','B942608'),('thushara9215','B921512'),('vidaruv9423','B942320');
/*!40000 ALTER TABLE `a_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_driver_roster`
--

DROP TABLE IF EXISTS `a_driver_roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_driver_roster` (
  `a_driver_id` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `working_hours` time DEFAULT NULL,
  `previous_work` tinyint(1) DEFAULT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`a_driver_id`,`start_date`,`time`),
  CONSTRAINT `a_driver_roster_ibfk_1` FOREIGN KEY (`a_driver_id`) REFERENCES `a_driver` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_driver_roster`
--

LOCK TABLES `a_driver_roster` WRITE;
/*!40000 ALTER TABLE `a_driver_roster` DISABLE KEYS */;
INSERT INTO `a_driver_roster` VALUES ('anika91','2023-11-02',NULL,NULL,'07:10:45'),('buddhika94','2022-10-08','01:20:00',NULL,'13:30:00'),('buddhika94','2023-11-03','01:55:00',NULL,'13:50:00'),('chamara9201','2023-09-06','02:30:00',NULL,'08:30:00'),('chamara9201','2023-11-02',NULL,NULL,'09:28:36'),('chathuranga9421','2022-05-15','01:25:00',NULL,'14:40:00'),('chathuranga9421','2023-11-02',NULL,NULL,'10:54:19'),('eranda9210','2023-11-02',NULL,NULL,'11:15:03'),('eranda9434','2022-02-25','01:25:00',NULL,'11:30:00'),('eranda9434','2023-04-22','00:35:00',NULL,'13:20:00'),('eranda9434','2023-11-02',NULL,NULL,'12:48:52'),('harindra93','2023-11-02','01:55:00',NULL,'07:23:00'),('harini86','2022-04-30','03:20:00',NULL,'10:40:00'),('harini86','2023-11-02',NULL,NULL,'14:23:54'),('harini86','2023-11-04','01:40:00',NULL,'10:00:00'),('harsha92','2023-11-02',NULL,NULL,'15:37:42'),('hasini9429','2023-11-02',NULL,NULL,'16:42:09'),('isuru9427','2023-01-31','01:10:00',NULL,'09:30:00'),('isuru9427','2023-11-02',NULL,NULL,'17:51:36'),('kalpana9518','2022-05-20','05:40:00',NULL,'12:00:00'),('kalpana9518','2023-11-02',NULL,NULL,'18:34:28'),('mahanuwa9437','2023-11-02',NULL,NULL,'19:58:17'),('malshani9422','2023-11-02',NULL,NULL,'20:22:45'),('manjula9424','2023-11-02',NULL,NULL,'21:39:56'),('nadeesha9111','2022-02-28','02:45:00',NULL,'11:00:00'),('nadeesha9111','2023-11-02',NULL,NULL,'22:05:33'),('nirosha9430','2023-11-02',NULL,NULL,'23:12:08'),('piumi9207','2023-11-02',NULL,NULL,'07:56:42'),('prabath9433','2022-10-19','02:30:00',NULL,'10:30:00'),('prabath9433','2023-11-02',NULL,NULL,'08:35:14'),('prasanna9414','2023-07-05','02:30:00',NULL,'10:00:00'),('prasanna9414','2023-11-02',NULL,NULL,'09:46:27'),('prasanna9438','2023-06-05','03:20:00',NULL,'10:00:00'),('prasanna9438','2023-11-02',NULL,NULL,'10:38:15'),('priyantha9306','2023-11-02',NULL,NULL,'11:59:02'),('rangana9404','2023-11-02',NULL,NULL,'12:23:44'),('sanduni9317','2023-11-02',NULL,NULL,'13:47:39'),('thilan9426','2023-09-08','01:45:00',NULL,'09:40:00'),('thilan9426','2023-11-02',NULL,NULL,'14:04:59'),('thushara9215','2023-11-02',NULL,NULL,'15:25:31'),('vidaruv9423','2023-03-25','02:30:00',NULL,'12:00:00'),('vidaruv9423','2023-11-02',NULL,NULL,'16:48:14'),('vidaruv9423','2023-11-04','02:00:00',NULL,'10:00:00');
/*!40000 ALTER TABLE `a_driver_roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('anika_fernando','Anika','Fernando','456 Beach Road, Galle','0762345678','anika.fernando@example.com','Anikaabc@1990','1990-09-25'),('chaminda_jayasinghe','Chaminda','Jayasinghe','567 Green Valley, Nuwara Eliya','0706789012','chaminda.jayasinghe@example.com','Chaminda@1993','1993-04-30'),('deepika_raja','Deepika','Rajapakse','432 Mountain View, Hambantota','0721234567','deepika.rajapakse@example.com','Deepika@19963456','1996-10-03'),('ishara_bandara','Ishara','Bandara','101 River View Road, Matara','0724567890','ishara.bandara@example.com','Ishara@1992','1992-11-08'),('malini_gunawardana','Malini','Gunawardana','234 Park Lane, Negombo','0745678901','malini.gunawardana@example.com','Malini@6yhk1985','1985-07-19'),('nalin_mendis','Nalin','Mendis','678 Forest Lane, Badulla','0789012345','nalin.mendis@example.com','Nalin@1987','1987-01-28'),('priyantha_samara','Priyantha','Samarasinghe','890 Palm Grove, Anuradhapura','0717890123','priyantha.samarasinghe@example.com','Priyanhdgtha@1991','1991-12-17'),('ravi_perera','Ravi','Perera','789 Hillside Avenue, Kandy','0783456789','ravi.perera@example.com','Ravi@1988','1988-03-12'),('sujith_silva','Sujith','Silva','123 Main Street, Colombo','0711234567','sujith.silva@example.com','Sujitth6h@1995','1995-06-15'),('thilini_rana','Thilini','Ranasinghe','345 Lakeside Drive, Ratnapura','0768901234','thilini.ranasinghe@example.com','Thilini@19978u4','1994-08-05');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `admin_details`
--

DROP TABLE IF EXISTS `admin_details`;
/*!50001 DROP VIEW IF EXISTS `admin_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin_details` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `address`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `DOB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allorderdetails`
--

DROP TABLE IF EXISTS `allorderdetails`;
/*!50001 DROP VIEW IF EXISTS `allorderdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allorderdetails` AS SELECT 
 1 AS `order_id`,
 1 AS `date`,
 1 AS `customer_id`,
 1 AS `delivery_address`,
 1 AS `route_id`,
 1 AS `state`,
 1 AS `product_id`,
 1 AS `quantity`,
 1 AS `sent_quantity`,
 1 AS `capacity`,
 1 AS `name`,
 1 AS `unit_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coordinator`
--

DROP TABLE IF EXISTS `coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinator` (
  `user_name` varchar(10) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `coordinator_chk_1` CHECK ((`type` in (_utf8mb4'train_coordinator',_utf8mb4'truck_coordinator')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinator`
--

LOCK TABLES `coordinator` WRITE;
/*!40000 ALTER TABLE `coordinator` DISABLE KEYS */;
INSERT INTO `coordinator` VALUES ('anuradhaf','Anuradha','Fernando','789, Negombo Road, Negombo','0774567890','anuradha.fernando@email.com','AnuradhaPass789','1986-03-10','Truck_Coordinator'),('chamarisi','Chamari','Silva','456, Galle Road, Kandy','0763456789','chamari.silva@email.com','ChamariPass456','1988-07-22','Train_Coordinator'),('dinukaw','Dinuka','Wijeratne','234, High Street, Galle','0725678901','dinuka.wijeratne@email.com','DinukaPass234','1990-04-02','Train_Coordinator'),('harindrag','Harindra','Gunasekara','567, Beach Road, Hikkaduwa','0756789012','harindra.gunasekara@email.com','HarindraPass567','1993-02-11','Truck_Coordinator'),('imaraw','Imara','Weerasinghe','567, Beach Road, Hikkaduwa','0756789012','imara.weerasinghe@email.com','ImaraPass567','1993-01-12','Train_Coordinator'),('isuriguna','Isuri','Gunawardena','456, Galle Road, Kandy','0763456789','isuri.gunawardena@email.com','IsuriPass456','1992-06-18','Truck_Coordinator'),('kavinduli','Kavindu','Liyanage','456, Galle Road, Kandy','0763456789','kavindu.liyanage@email.com','KavinduPass456','1991-06-29','Train_Coordinator'),('kusalpere','Kusal','Perera','123, Main Street, Colombo','0712345678','kusal.perera@email.com','KusalPass123','1990-05-15','Truck_Coordinator'),('menakaran','Menaka','Ranasinghe','789, Negombo Road, Negombo','0774567890','menaka.ranasinghe@email.com','MenakaPass789','1988-09-14','Truck_Coordinator'),('niroshank','Niroshan','Karunaratne','789, Negombo Road, Negombo','0774567890','niroshan.karunaratne@email.com','NiroshanPass789','1994-04-25','Train_Coordinator'),('pasinduja','Pasindu','Jayasinghe','123, Main Street, Colombo','0712345678','pasindu.jayasinghe@email.com','PasinduPass123','1992-03-20','Truck_Coordinator'),('roshanraj','Roshan','Rajapakse','234, High Street, Galle','0725678901','roshan.rajapakse@email.com','RoshanPass234','1985-11-02','Train_Coordinator'),('sahanmendi','Sahan','Mendis','123, Main Street, Colombo','0712345678','sahan.mendis@email.com','SahanPass123','1989-12-05','Train_Coordinator'),('sandunija','Sanduni','Jayawardena','567, Beach Road, Hikkaduwa','0756789012','sanduni.jayawardena@email.com','SanduniPass567','1991-08-14','Truck_Coordinator'),('tharinduds','Tharindu','De Silva','234, High Street, Galle','0725678901','tharindu.desilva@email.com','TharinduPass234','1987-09-30','Truck_Coordinator');
/*!40000 ALTER TABLE `coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `route_id` varchar(5) NOT NULL,
  `state` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `cust_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cust_order_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order`
--

LOCK TABLES `cust_order` WRITE;
/*!40000 ALTER TABLE `cust_order` DISABLE KEYS */;
INSERT INTO `cust_order` VALUES (1,'2023-09-02 00:00:00','Cust000001','123, Main Street, Colombo','R0001','delivered'),(2,'2023-09-03 00:00:00','Cust000002','456, Park Avenue, Kandy','R0003','delivered'),(3,'2022-10-15 13:15:37','Cust000004','101, Beach Road, Negombo','R0005','delivered'),(4,'2022-10-04 13:15:37','Cust000005','222, Lake View Lane, Nuwara Eliya','R0013','delivered'),(5,'2022-05-10 13:15:37','Cust000006','333, River Side Drive, Hambantota','R0017','delivered'),(6,'2022-05-18 13:15:37','Cust000007','444, Forest Road, Anuradhapura','R0009','delivered'),(7,'2022-02-20 13:15:37','Cust000008','555, Tea Estate Road, Ratnapura','R0008','delivered'),(8,'2022-02-24 13:15:37','Cust000009','666, Coconut Lane, Matara','R0017','delivered'),(9,'2022-04-25 13:15:37','Cust000010','777, Banana Street, Jaffna','R0010','delivered'),(10,'2023-01-28 13:15:37','Cust000011','888, Pine Avenue, Trincomalee','R0020','delivered'),(11,'2023-10-30 13:15:37','Cust000012','999, Mango Grove, Polonnaruwa','R0019','delivered'),(12,'2023-04-21 13:15:37','Cust000013','1001, Coconut Road, Batticaloa','R0018','delivered'),(24,'2023-10-30 18:22:09','Cust000001','colombo - 09','R0002','delivered'),(25,'2023-06-30 18:27:40','Cust000001','negambo','R0005','delivered'),(29,'2023-06-03 00:00:00','Cust000003','789, Hillside Road, Galle','R0007','delivered'),(30,'2023-03-30 19:13:25','Cust000001','kandy','R0004','progress'),(31,'2023-03-22 08:34:33','Cust000001','horabh','R0004','progress'),(32,'2023-03-25 13:15:37','Cust000002','Horana','R0001','delivered');
/*!40000 ALTER TABLE `cust_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `DOB` date NOT NULL,
  `type` varchar(225) DEFAULT NULL,
  `password` varchar(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Cust000001','Sahan','Chathura','123, Main Street, Colombo','0711234567','sahan.chathura@example.com','1990-05-15','Retailer','Sahan@123',NULL),('Cust000002','Dilini','Perera','456, Park Avenue, Kandy','0772345678','dilini.perera@example.com','1985-11-28','Wholesaler','Dilini#456',NULL),('Cust000003','Thilak','Gunaratne','789, Hillside Road, Galle','0763456789','thilak.gunaratne@example.com','1992-09-03','Retailer','Thilak$789',NULL),('Cust000004','Malaka','Silva','101, Beach Road, Negombo','0784567890','malaka.silva@example.com','1988-07-14','Retailer','Malaka&456',NULL),('Cust000005','Pooja','Rathnayake','222, Lake View Lane, Nuwara Eliya','0725678901','pooja.rathnayake@example.com','1995-03-20','Wholesaler','Pooja201',NULL),('Cust000006','Tharaka','Fernando','333, River Side Drive, Hambantota','0716789012','tharaka.fernando@example.com','1991-12-10','End Customer','Thara#123',NULL),('Cust000007','Ruwan','Bandara','444, Forest Road, Anuradhapura','0777890123','ruwan.bandara@example.com','1987-06-25','Retailer','Ruwa*78',NULL),('Cust000008','Nimasha','Rajapakse','555, Tea Estate Road, Ratnapura','0768901234','nimasha.rajapakse@example.com','1994-08-08','Wholesaler','Nimas*34',NULL),('Cust000009','Nadeesha','De Silva','666, Coconut Lane, Matara','0789012345','nadeesha.desilva@example.com','1989-04-18','End Customer','Nadees*3',NULL),('Cust000010','Sachith','Munasinghe','777, Banana Street, Jaffna','0720123456','sachith.munasinghe@example.com','1993-02-01','End Customer','Sachit#2',NULL),('Cust000011','Sanjeewa','Rodrigo','888, Pine Avenue, Trincomalee','0711234567','sanjeewa.rodrigo@example.com','1997-10-05','Retailer','Sanja@56',NULL),('Cust000012','Kavisha','Wijesekara','999, Mango Grove, Polonnaruwa','0772345678','kavisha.wijesekara@example.com','1986-11-15','Retailer','Kavisha9',NULL),('Cust000013','Sampath','Herath','1001, Coconut Road, Batticaloa','0763456789','sampath.herath@example.com','1996-09-26','End Customer','Samh*012',NULL),('Cust000014','Sanduni','Gunasekara','1111, Palm Lane, Kalutara','0784567890','sanduni.gunasekara@example.com','1990-07-02','Retailer','Sandu90',NULL),('Cust000015','Dhanuka','Perumal','1222, Orchid Street, Kurunegala','0725678901','dhanuka.perumal@example.com','1993-05-30','Retailer','Dhan*201',NULL),('Cust000016','Thilini','Samaraweera','1333, Jasmine Avenue, Ampara','0716789012','thilini.samaraweera@example.com','1998-01-07','Wholesaler','Thii#123',NULL),('Cust000017','Ruchira','Senanayake','1444, Lily Drive, Dambulla','0777890123','ruchira.senanayake@example.com','1994-12-12','End Customer','Ruch123',NULL),('Cust000018','Harsha','Madushani','1555, Rose Road, Badulla','0768901234','harsha.madushani@example.com','1985-04-25','Retailer','Hars56',NULL),('Cust000019','Lakith','Karunaratne','1666, Sunflower Lane, Polgahawela','0789012345','lakith.karunaratne@example.com','1989-08-30','End Customer','Lakh#345',NULL),('Cust000020','Yashodha','Dissanayake','1777, Tulip Street, Kalpitiya','0720123456','yashodha.dissanayake@example.com','1992-03-14','Wholesaler','Yasha#123',NULL),('Cust000021','Dinesh','Peiris','1888, Violet Road, Negombo','0711234567','dinesh.peiris@example.com','1996-11-20','Retailer','Din*567',NULL),('Cust000022','Isuru','Bandara','1999, Iris Lane, Galle','0772345678','isuru.bandara@example.com','1991-07-09','Retailer','Isuru7',NULL),('Cust000023','Nuwani','Thilakarathna','2001, Rosewood Street, Anuradhapura','0763456789','nuwani.thilakarathna@example.com','1995-09-08','End Customer','Nuwa89',NULL),('Cust000024','Manoj','Wickramaratne','2111, Lotus Lane, Kandy','0784567890','manoj.wickramaratne@example.com','1987-04-03','Retailer','Mano90',NULL),('Cust000025','Rasika','Wijewardena','2222, Hibiscus Drive, Colombo','0725678901','rasika.wijewardena@example.com','1994-01-15','End Customer','Rasi01',NULL),('Cust000026','Thilak','Ekanayake','2333, Orchid Lane, Nuwara Eliya','0716789012','thilak.ekanayake@example.com','1993-12-30','Wholesaler','Thak#012',NULL),('Cust000027','Anusha','Mendis','2444, Jasmine Road, Hambantota','0777890123','anusha.mendis@example.com','1990-05-05','Retailer','Anush23',NULL),('Cust000028','Uditha','Dhananjaya','2555, Sunflower Street, Ratnapura','0768901234','uditha.dhananjaya@example.com','1988-09-18','Wholesaler','Uda*234',NULL),('Cust000029','Nishantha','Ranasinghe','2666, Marigold Lane, Matara','0789012345','nishantha.ranasinghe@example.com','1997-07-12','End Customer','Nitha@24',NULL),('Cust000030','Madushan','Pathirana','2777, Rose Bush Road, Trincomalee','0720123456','madushan.pathirana@example.com','1995-11-05','Retailer','Maan@456',NULL),('Cust000031','Tharushi','Fernando','2888, Lavender Drive, Badulla','0711234567','tharushi.fernando@example.com','1990-04-28','Wholesaler','Thahi#67',NULL),('Cust000032','Kasuni','Jayawardena','2999, Azalea Street, Polonnaruwa','0772345678','kasuni.jayawardena@example.com','1993-02-20','Retailer','Kasu#78',NULL),('Cust000033','Chamari','Ratnayake','3001, Magnolia Lane, Anuradhapura','0763456789','chamari.ratnayake@example.com','1996-10-15','End Customer','Cari#78',NULL),('Cust000034','Niroshan','Amarasinghe','3111, Camellia Road, Colombo','0784567890','niroshan.amarasinghe@example.com','1991-09-28','Retailer','Nin#890',NULL),('Cust000035','Devinda','Wickrama','3222, Bluebell Drive, Galle','0725678901','devinda.wickrama@example.com','1987-06-02','Retailer','Dda#201',NULL),('Cust000036','Chinthaka','Weerasinghe','3333, Tulip Lane, Kandy','0716789012','chinthaka.weerasinghe@example.com','1994-03-30','Wholesaler','Chinth#012',NULL),('Cust000037','Gayan','Silva','3444, Aster Street, Matara','0777890123','gayan.silva@example.com','1992-07-22','End Customer','Gaya23',NULL),('Cust000038','Malsha','Premasiri','3555, Daisy Road, Hambantota','0768901234','malsha.premasiri@example.com','1988-08-15','Retailer','Mala@234',NULL),('Cust000039','Hasith','Perera','3666, Violet Lane, Jaffna','0789012345','hasith.perera@example.com','1995-11-12','Retailer','Hasit45',NULL),('Cust000040','Kaveesha','Senaviratne','3777, Lavender Lane, Dambulla','0720123456','kaveesha.senaviratne@example.com','1989-01-30','Retailer','Kava#345',NULL),('Cust000041','Udara','Gunawardana','3888, Marigold Street, Kalutara','0711234567','udara.gunawardana@example.com','1991-05-22','Retailer','Ud#567',NULL),('Cust000042','Shehani','Lokuge','3999, Rose Bush Drive, Ampara','0772345678','shehani.lokuge@example.com','1993-12-25','Wholesaler','Shni#678',NULL),('Cust000043','Sampath','Dissanayake','4001, Magnolia Street, Badulla','0763456789','sampath.dissanayake@example.com','1985-09-10','End Customer','Samp789',NULL),('Cust000044','Nilmini','Ratnayake','4111, Camellia Lane, Kurunegala','0784567890','nilmini.ratnayake@example.com','1996-02-28','Retailer','mini#890',NULL),('Cust000045','Thushari','Abeywardana','4222, Bluebell Road, Polgahawela','0725678901','thushari.abeywardana@example.com','1990-12-03','Wholesaler','Thus01',NULL),('Cust000046','Malindu','Ranaweera','4333, Tulip Road, Polonnaruwa','0716789012','malindu.ranaweera@example.com','1993-07-05','End Customer','Madu#02',NULL),('Cust000047','Sachin','Ranasinghe','4444, Aster Lane, Anuradhapura','0777890123','sachin.ranasinghe@example.com','1991-04-18','Retailer','Shin#23',NULL),('Cust000048','Lakshan','Hewage','4555, Daisy Lane, Colombo','0768901234','lakshan.hewage@example.com','1989-08-30','Retailer','Lhan#24',NULL),('Cust000049','Madhushan','Wickramasuriya','4666, Violet Road, Galle','0789012345','madhushan.wickramasuriya@example.com','1995-11-12','Retailer','Mn#345',NULL),('Cust000050','Sachitha','Perera','4777, Lavender Street, Matara','0720123456','sachitha.perera@example.com','1991-05-22','End Customer','Saa#567',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_details` AS SELECT 
 1 AS `customer_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `address`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `DOB`,
 1 AS `type`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `userName` varchar(255) NOT NULL,
  `liciene_id` varchar(255) NOT NULL,
  PRIMARY KEY (`userName`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `employee` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES ('arjuna91','B910308'),('asandi9505','B950503'),('chamara81','B810825'),('chamara9439','B943955'),('chaminda9428','B942822'),('chathura90','B900526'),('darshana89','B890420'),('dilhani89','B890501'),('dinuka92','B920405'),('ishara91','B910606'),('kushan9219','B921932'),('lakmal9420','B942042'),('mahanuwa9513','B951315'),('nadeesha9435','B943535'),('nimal9103','B910345'),('prabath9409','B940934'),('samudra9116','B911616'),('sandaruwan9431','B943131'),('supun9302','B930202'),('tharindra9312','B931212'),('tharindra9436','B943635'),('udara9108','B910843'),('udara9432','B943239');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_roster`
--

DROP TABLE IF EXISTS `driver_roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_roster` (
  `driver_id` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `working_hours` time DEFAULT NULL,
  `previous_work` tinyint(1) DEFAULT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`driver_id`,`start_date`,`time`),
  CONSTRAINT `driver_roster_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_roster`
--

LOCK TABLES `driver_roster` WRITE;
/*!40000 ALTER TABLE `driver_roster` DISABLE KEYS */;
INSERT INTO `driver_roster` VALUES ('arjuna91','2023-09-08','01:45:00',NULL,'09:40:00'),('arjuna91','2023-11-02',NULL,NULL,'07:15:30'),('asandi9505','2023-11-02',NULL,NULL,'08:42:18'),('asandi9505','2023-11-04','01:40:00',NULL,'10:00:00'),('chamara81','2023-11-02','01:55:00',NULL,'07:23:00'),('chamara81','2023-11-02',NULL,NULL,'09:31:56'),('chamara9439','2023-11-02',NULL,NULL,'10:59:24'),('chaminda9428','2023-09-06','02:30:00',NULL,'08:30:00'),('chaminda9428','2023-11-02',NULL,NULL,'11:47:53'),('chathura90','2023-11-02',NULL,NULL,'12:59:11'),('chathura90','2023-11-03','01:55:00',NULL,'13:50:00'),('darshana89','2022-05-15','01:25:00',NULL,'14:40:00'),('darshana89','2023-11-02',NULL,NULL,'14:37:42'),('dilhani89','2022-02-25','01:25:00',NULL,'11:30:00'),('dilhani89','2022-02-28','02:45:00',NULL,'11:00:00'),('dilhani89','2023-04-22','00:35:00',NULL,'13:20:00'),('dilhani89','2023-06-05','03:20:00',NULL,'10:00:00'),('dilhani89','2023-11-02',NULL,NULL,'15:08:29'),('dinuka92','2022-04-30','03:20:00',NULL,'10:40:00'),('dinuka92','2022-05-20','05:40:00',NULL,'12:00:00'),('dinuka92','2023-01-31','01:10:00',NULL,'09:30:00'),('dinuka92','2023-11-02',NULL,NULL,'16:54:05'),('ishara91','2023-11-02',NULL,NULL,'17:26:39'),('kushan9219','2023-11-02',NULL,NULL,'18:43:52'),('lakmal9420','2023-03-25','02:30:00',NULL,'12:00:00'),('lakmal9420','2023-11-02',NULL,NULL,'19:27:14'),('mahanuwa9513','2023-11-02',NULL,NULL,'20:14:36'),('nadeesha9435','2023-11-02',NULL,NULL,'21:05:48'),('nimal9103','2023-11-02',NULL,NULL,'22:11:09'),('prabath9409','2023-11-02',NULL,NULL,'23:30:42'),('samudra9116','2023-11-02',NULL,NULL,'07:46:57'),('sandaruwan9431','2023-11-02',NULL,NULL,'08:55:21'),('supun9302','2022-10-19','02:30:00',NULL,'10:30:00'),('supun9302','2023-07-05','02:30:00',NULL,'10:00:00'),('supun9302','2023-11-02',NULL,NULL,'09:25:04'),('tharindra9312','2023-11-02',NULL,NULL,'10:37:59'),('tharindra9436','2023-11-02',NULL,NULL,'11:29:12'),('tharindra9436','2023-11-04','02:00:00',NULL,'10:00:00'),('udara9108','2022-10-08','01:20:00',NULL,'13:30:00'),('udara9108','2023-11-02',NULL,NULL,'12:54:31'),('udara9432','2023-11-02',NULL,NULL,'13:17:45');
/*!40000 ALTER TABLE `driver_roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `NIC` varchar(50) NOT NULL,
  `store_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `employee_idx` (`userName`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `employee_chk_1` CHECK ((`type` in (_utf8mb4'Driver',_utf8mb4'A_Driver')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Amila','Gayan','1991-08-14',58300.00,'amila9425','Amila91Pass','A_Driver','910814345678','S001'),('Anika','Fernando','1991-03-22',60000.00,'anika91','SecurePass1','A_Driver','910322456789','S001'),('Arjuna','Wijeratne','1991-03-08',50000.00,'arjuna91','ArjunaPass606','Driver','910308654321','S002'),('Asandi','Gayani','1995-03-16',52700.00,'asandi9505','Asandi95Pass','Driver','951032345678','S005'),('Buddhika','Ranasinghe','1994-08-02',60000.00,'buddhika94','BuddhikaPass323','A_Driver','940802789012','S002'),('Chamara','Mendis','1981-08-25',50000.00,'chamara81','Access789','Driver','810825654321','S001'),('Chamara','Buddhika','1992-05-15',55500.00,'chamara9201','Chama92Pass','A_Driver','921052345678','S001'),('Chamara','Buddhika','1992-04-03',56400.00,'chamara9439','Chama94Pass','Driver','920403456789','S002'),('Chaminda','Anuradha','1992-12-19',57900.00,'chaminda9428','Chamind92Pass','Driver','921219345678','S001'),('Chathura','Gunasekara','1990-05-26',50000.00,'chathura90','ChathuraPass010','Driver','900526654321','S002'),('Chathuranga','Dinusha','1991-03-23',55400.00,'chathuranga9421','Chathura91Pass','A_Driver','910323345678','S003'),('Darshana','Bandara','1989-04-20',50000.00,'darshana89','DarshanaPass212','Driver','890420123456','S003'),('Dilhani','Bandara','1989-05-01',50000.00,'dilhani89','DilhaniPass222','Driver','890501123456','S004'),('Dinuka','Gunawardena','1992-04-05',50000.00,'dinuka92','SecurePass456','Driver','920405674567','S005'),('Eranda','Sajini','1992-10-05',51900.00,'eranda9210','Eranda92Pass','A_Driver','921005345678','S003'),('Eranda','Sajini','1992-06-24',51800.00,'eranda9434','Eranda92Pass','A_Driver','920624345678','S004'),('Harindra','De Silva','1993-07-09',60000.00,'harindra93','HarindraPass919','A_Driver','930709890123','S004'),('Harini','Ekanayake','1986-08-08',60000.00,'harini86','HariniPass101','A_Driver','860808890123','S005'),('Harsha','Jayawardena','1992-07-03',60000.00,'harsha92','HarshaPass111','A_Driver','920703789012','S004'),('Hasini','Charith','1991-10-07',59100.00,'hasini9429','Hasini91Pass','A_Driver','911007345678','S003'),('Ishara','Gunaratne','1991-06-06',50000.00,'ishara91','IsharaPass123','Driver','910606654321','S005'),('Isuru','Kavindu','1995-04-05',56700.00,'isuru9427','Isuru95Pass','A_Driver','950405345678','S005'),('Kalpana','Sajith','1995-05-29',51600.00,'kalpana9518','Kalpana95Pass','A_Driver','950529345678','S005'),('Kushan','Rashmika','1992-09-17',56200.00,'kushan9219','Kushan92Pass','Driver','920917345678','S003'),('Lakmal','Sandeepa','1994-08-07',59500.00,'lakmal9420','Lakmal94Pass','Driver','940807345678','S001'),('Mahanuwa','Lahiru','1995-07-11',59200.00,'mahanuwa9437','Mahanuwa95Pass','A_Driver','950711345678','S005'),('Mahanuwa','Lahiru','1995-01-14',59200.00,'mahanuwa9513','Mahanuwa95Pass','Driver','950114345678','S002'),('Malshani','Kasun','1993-04-11',53200.00,'malshani9422','Malshani93Pass','A_Driver','930411345678','S005'),('Manjula','Imasha','1992-01-30',57100.00,'manjula9424','Manjula92Pass','A_Driver','920130345678','S002'),('Nadeesha','Rananjoo','1991-06-18',55700.00,'nadeesha9111','Nadeesha91Pass','A_Driver','910618345678','S004'),('Nadeesha','Rananjoo','1993-01-31',57200.00,'nadeesha9435','Nadeesha91Pass','Driver','930131345678','S002'),('Nimal','Amila','1991-11-02',58600.00,'nimal9103','Nimal91Pass','Driver','911112345678','S002'),('Nirosha','Roshan','1993-07-28',53500.00,'nirosha9430','Nirosha93Pass','A_Driver','930728345678','S004'),('Piumi','Malsha','1992-08-12',54100.00,'piumi9207','Piumi92Pass','A_Driver','920822345678','S005'),('Prabath','Kamani','1994-06-21',56300.00,'prabath9409','Prabath94Pass','Driver','940622345678','S002'),('Prabath','Kamani','1991-09-16',56900.00,'prabath9433','Prabath91Pass','A_Driver','910916345678','S003'),('Prasanna','Nishanthi','1994-09-27',53800.00,'prasanna9414','Prasanna94Pass','A_Driver','940927345678','S003'),('Prasanna','Nishanthi','1991-02-15',52200.00,'prasanna9438','Prasanna91Pass','A_Driver','910215345678','S004'),('Priyantha','Sudarshana','1993-12-25',59800.00,'priyantha9306','Priyantha93Pass','A_Driver','931232345678','S002'),('Rangana','Dilani','1994-07-08',53400.00,'rangana9404','Ranga94Pass','A_Driver','941072345678','S004'),('Samudra','Upeksha','1991-12-04',58400.00,'samudra9116','Samudra91Pass','Driver','911204345678','S005'),('Sandaruwan','Tharindu','1994-03-09',54800.00,'sandaruwan9431','Sandaruw94Pass','Driver','940309345678','S005'),('Sanduni','Roshan','1993-02-02',54600.00,'sanduni9317','Sanduni93Pass','A_Driver','930202345678','S004'),('Supun','Sampath','1993-09-20',57200.00,'supun9302','Supun93Pass','Driver','931092345678','S003'),('Tharindra','Viraj','1993-03-10',57400.00,'tharindra9312','Tharindra93Pass','Driver','930310345678','S001'),('Tharindra','Viraj','1994-05-26',53300.00,'tharindra9436','Tharindra94Pass','Driver','940526345678','S001'),('Thilan','Devindi','1994-02-13',51500.00,'thilan9426','Thilan94Pass','A_Driver','940213345678','S002'),('Thushara','Tharushi','1992-07-19',52500.00,'thushara9215','Thushara92Pass','A_Driver','920719345678','S004'),('Udara','Wasantha','1991-04-30',55900.00,'udara9108','Udara91Pass','Driver','910422345678','S002'),('Udara','Wasantha','1995-08-28',55600.00,'udara9432','Udara95Pass','Driver','950828345678','S001'),('Vidaruv','Ishani','1995-06-25',54900.00,'vidaruv9423','Vidaruv95Pass','A_Driver','950625345678','S001');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `geta_driverdata`
--

DROP TABLE IF EXISTS `geta_driverdata`;
/*!50001 DROP VIEW IF EXISTS `geta_driverdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `geta_driverdata` AS SELECT 
 1 AS `userName`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `store_id`,
 1 AS `DOB`,
 1 AS `salary`,
 1 AS `type`,
 1 AS `NIC`,
 1 AS `permit_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getdriverdata`
--

DROP TABLE IF EXISTS `getdriverdata`;
/*!50001 DROP VIEW IF EXISTS `getdriverdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getdriverdata` AS SELECT 
 1 AS `userName`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `store_id`,
 1 AS `DOB`,
 1 AS `salary`,
 1 AS `type`,
 1 AS `NIC`,
 1 AS `liciene_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `income`
--

DROP TABLE IF EXISTS `income`;
/*!50001 DROP VIEW IF EXISTS `income`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `income` AS SELECT 
 1 AS `order_id`,
 1 AS `total_price`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_ordered_products`
--

DROP TABLE IF EXISTS `most_ordered_products`;
/*!50001 DROP VIEW IF EXISTS `most_ordered_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_ordered_products` AS SELECT 
 1 AS `order_year`,
 1 AS `name`,
 1 AS `total_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_product_list`
--

DROP TABLE IF EXISTS `order_product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_list` (
  `order_id` int NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  `sent_quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_product_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_list`
--

LOCK TABLES `order_product_list` WRITE;
/*!40000 ALTER TABLE `order_product_list` DISABLE KEYS */;
INSERT INTO `order_product_list` VALUES (1,'Prod000003',50,100),(2,'Prod000005',60,90),(3,'Prod000004',4,8),(3,'Prod000012',5,10),(3,'Prod000018',1,2),(4,'Prod000019',10,20),(4,'Prod000028',8,16),(5,'Prod000008',2,4),(5,'Prod000014',10,20),(5,'Prod000032',3,6),(6,'Prod000010',9,18),(6,'Prod000012',5,10),(7,'Prod000028',4,8),(7,'Prod000032',6,12),(7,'Prod000038',10,20),(7,'Prod000041',20,40),(8,'Prod000044',50,100),(9,'Prod000038',2,4),(9,'Prod000040',11,22),(10,'Prod000012',9,18),(10,'Prod000028',5,10),(10,'Prod000034',30,60),(11,'Prod000015',4,4),(11,'Prod000046',10,10),(12,'Prod000008',5,10),(12,'Prod000043',5,10),(12,'Prod000048',6,12),(24,'Prod000001',1,1),(24,'Prod000002',2,4),(24,'Prod000005',1,2),(25,'Prod000005',1,1),(25,'Prod000006',2,2),(29,'Prod000040',100,200),(30,'Prod000001',1,2),(30,'Prod000005',2,4),(31,'Prod000001',3,6),(31,'Prod000002',1,2),(31,'Prod000009',1,2),(32,'Prod000001',2,4),(32,'Prod000003',1,2);
/*!40000 ALTER TABLE `order_product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_revenue`
--

DROP TABLE IF EXISTS `order_revenue`;
/*!50001 DROP VIEW IF EXISTS `order_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_revenue` AS SELECT 
 1 AS `order_id`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_tot_price`
--

DROP TABLE IF EXISTS `order_tot_price`;
/*!50001 DROP VIEW IF EXISTS `order_tot_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_tot_price` AS SELECT 
 1 AS `order_id`,
 1 AS `tot_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!50001 DROP VIEW IF EXISTS `orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_id`,
 1 AS `quantity`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `capacity` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Prod000001','Smartphone',34999.99,100,'A sleek and powerful smartphone with high-resolution display, fast processor, ample storage, and advanced security features. Stay connected with 4G LTE, Wi-Fi, and Bluetooth. Perfect for tech-savvy users.'),('Prod000002','Laptop',59999.99,75,'A high-performance laptop with a stunning display, lightweight design, and long battery life. Ideal for work and play, with ample storage for your files and multimedia.'),('Prod000003','Refrigerator',42999.99,50,'A spacious and energy-efficient refrigerator to keep your food fresh and organized. Features advanced cooling technology and adjustable shelves for convenience.'),('Prod000004','Washing Machine',29999.99,120,'Efficient washing machine with various wash cycles for all your laundry needs. Save time and energy with this user-friendly appliance.'),('Prod000005','Television',25999.99,200,'Immerse yourself in stunning visuals with this high-definition television. It offers a range of smart features and connectivity options for an enhanced entertainment experience.'),('Prod000006','Microwave Oven',8999.99,60,'Convenient microwave oven with various cooking modes. Quickly prepare and heat up your meals. Compact and user-friendly design for your kitchen.'),('Prod000007','Coffee Maker',3499.99,90,'Start your day with the perfect cup of coffee from this easy-to-use coffee maker. Brew your favorite blends quickly and enjoy the aroma.'),('Prod000008','Toaster',1999.99,110,'Efficient toaster that makes your breakfast routine a breeze. It toasts your bread or bagels to perfection with various settings.'),('Prod000009','Blender',2999.99,45,'Powerful blender for all your culinary creations. Blend smoothies, soups, and more with ease. Durable and reliable.'),('Prod000010','Hair Dryer',1999.99,80,'Quick and efficient hair dryer for a perfect hair day every day. Multiple heat and speed settings for your styling needs.'),('Prod000011','Vacuum Cleaner',4999.99,55,'Powerful vacuum cleaner for efficient cleaning. Keep your home dust-free with various attachments and settings.'),('Prod000012','Digital Camera',17999.99,70,'High-resolution digital camera for capturing stunning photos and videos. Explore a range of shooting modes for creative photography.'),('Prod000013','Gaming Console',25999.99,40,'Gaming console for immersive gaming experiences. Enjoy a wide selection of games and entertainment options.'),('Prod000014','Lawn Mower',9499.99,130,'Lawn mower for maintaining a well-groomed lawn. Features easy operation and adjustable cutting heights for a pristine yard.'),('Prod000015','Drill Machine',2999.99,95,'Versatile drill machine for a variety of drilling and fastening tasks. Ideal for DIY projects and professional use.'),('Prod000016','Bicycle',13999.99,60,'Durable and reliable bicycle for commuting and recreation. Ride with comfort and style on various terrains.'),('Prod000017','Treadmill',42999.99,75,'Treadmill for a convenient indoor workout. Stay active and monitor your progress with built-in features.'),('Prod000018','Headphones',3999.99,60,'High-quality headphones for an immersive audio experience. Enjoy your favorite music and podcasts with clear and crisp sound.'),('Prod000019','Air Conditioner',55999.99,85,'Air conditioner for cooling and dehumidifying your living space. Create a comfortable environment during hot days.'),('Prod000020','Tablet',23999.99,100,'Tablet for on-the-go computing and entertainment. Stay connected, browse, and work with a lightweight and versatile device.'),('Prod000021','Smartwatch',8999.99,70,'Stay connected and track your activities with a stylish smartwatch. Monitor your health, receive notifications, and more.'),('Prod000024','Sunglasses',1499.99,75,'Protect your eyes with stylish sunglasses. Stay fashionable and shield your eyes from harmful UV rays.'),('Prod000025','Furniture',5799.99,60,'Enhance your living space with quality furniture. Choose from a wide range of designs and styles to suit your decor.'),('Prod000026','Watch',10999.99,100,'Keep time with a classic watch. A timeless accessory that complements your style.'),('Prod000027','Jewelry',7999.99,70,'Adorn yourself with exquisite jewelry. Find stunning pieces to enhance your elegance and charm.'),('Prod000028','Shoes',3299.99,45,'Step out in style with comfortable and fashionable shoes. Choose from a variety of designs for every occasion.'),('Prod000029','Handbag',2299.99,120,'Carry your essentials in a stylish handbag. Stay organized and fashionable with this versatile accessory.'),('Prod000030','Perfume',1999.99,90,'Discover your signature scent with a fine perfume. Enhance your presence with a captivating fragrance.'),('Prod000031','Coffee Beans',599.99,40,'Savor the rich flavors of freshly roasted coffee beans. Brew a perfect cup of coffee at home.'),('Prod000032','Tea Leaves',799.99,130,'Enjoy a soothing and aromatic tea experience with high-quality tea leaves. Discover a variety of flavors and blends.'),('Prod000033','Wine',1299.99,60,'Indulge in a fine selection of wines. Find the perfect bottle to complement your meals and celebrations.'),('Prod000034','Chocolate',299.99,85,'Delight in the sweetness of premium chocolate. A treat for your taste buds and a perfect gift.'),('Prod000035','Baby Diapers',499.99,110,'Keep your baby comfortable and dry with high-quality baby diapers. Ensure your little one stays happy and content.'),('Prod000036','Pet Food',999.99,75,'Keep your pets well-fed and happy with a variety of nutritious pet food options. Choose the best for your furry friends.'),('Prod000037','Books',899.99,55,'Immerse yourself in the world of literature with a diverse selection of books. Explore different genres and authors to expand your horizons.'),('Prod000038','Office Chair',3499.99,70,'Enhance your workspace with a comfortable and ergonomic office chair. Ideal for long hours of work or study, providing the support you need.'),('Prod000039','Power Tools',3999.99,60,'Complete your DIY projects with a versatile set of power tools. These tools are a must-have for various home improvement tasks and projects.'),('Prod000040','Sports Equipment',1999.99,85,'Stay active and enjoy sports with quality sports equipment. Find the right gear for your favorite sports and activities to stay fit and have fun.'),('Prod000041','Kitchen Appliances',9999.99,100,'Upgrade your kitchen with versatile kitchen appliances. These appliances make cooking and meal preparation a breeze.'),('Prod000042','Garden Tools',1799.99,120,'Maintain your garden with quality garden tools. Keep your outdoor space looking its best with these reliable tools.'),('Prod000043','Cosmetics',1299.99,95,'Enhance your beauty and skincare routine with a variety of cosmetics. Find the perfect makeup products and skincare solutions for your needs.'),('Prod000044','Health Supplements',899.99,70,'Support your well-being with a range of health supplements. These supplements are designed to help you maintain a healthy lifestyle.'),('Prod000045','Clothing',2499.99,120,'Upgrade your wardrobe with stylish clothing. Find the latest fashion trends and classic styles for every occasion.'),('Prod000046','Cookware',3999.99,55,'Equip your kitchen with high-quality cookware. These cookware sets are designed to make cooking and food preparation a breeze.'),('Prod000047','Backpack',1499.99,100,'Carry your essentials in a stylish backpack. Stay organized and fashionable with this versatile accessory.'),('Prod000048','Bed Linen',1299.99,85,'Enhance your bedroom with cozy bed linen. Find a variety of options to suit your comfort and style preferences.'),('Prod000049','Home Decor',1999.99,60,'Decorate your home with beautiful home decor items. Add a personal touch to your living space with these unique and stylish pieces.'),('Prod000050','Toys',599.99,70,'Inspire creativity and play with a diverse range of toys. Find toys for kids of all ages to encourage learning and fun.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` varchar(5) NOT NULL,
  `max_time` time NOT NULL,
  `store_id` varchar(5) NOT NULL,
  `destination` varchar(255) NOT NULL,
  PRIMARY KEY (`route_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES ('R0001','02:30:00','S001','Dehiwala-Mount Lavinia'),('R0002','02:00:00','S001','Moratuwa'),('R0003','01:45:00','S002','Peradeniya'),('R0004','01:55:00','S002','Katugastota'),('R0005','02:30:00','S003','Seeduwa'),('R0006','03:15:00','S003','Katunayake'),('R0007','03:20:00','S004','Unawatuna'),('R0008','02:45:00','S004','Hikkaduwa'),('R0009','05:40:00','S005','Point Pedro'),('R0010','03:20:00','S005','Chavakachcheri'),('R0011','01:10:00','S001','Wellawatte'),('R0012','00:45:00','S001','Ratmalana'),('R0013','01:20:00','S002','Kegalle'),('R0014','00:55:00','S002','Gampola'),('R0015','01:30:00','S003','Ja-Ela'),('R0016','00:50:00','S003','Minuwangoda'),('R0017','01:25:00','S004','Weligama'),('R0018','00:35:00','S004','Ambalangoda'),('R0019','01:40:00','S005','Kankesanthurai'),('R0020','01:10:00','S005','Kilinochchi');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `route_sales`
--

DROP TABLE IF EXISTS `route_sales`;
/*!50001 DROP VIEW IF EXISTS `route_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `route_sales` AS SELECT 
 1 AS `route_id`,
 1 AS `order_id`,
 1 AS `tot_price`,
 1 AS `store_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES ('S001','LankaMart','Colombo','123 Galle Road, Colombo 03'),('S002','Kandy Supermart','Kandy','456 Peradeniya Road, Kandy'),('S003','Negombo Fresh Mart','Negombo','789 Main Street, Negombo'),('S004','Galle Mega Mart','Galle','345 Havelock Road, Galle'),('S005','Jaffna Superstore','Jaffna','678 Stanley Road, Jaffna');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `store_id` varchar(5) NOT NULL,
  `train_capacity` int NOT NULL,
  PRIMARY KEY (`train_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES ('TR002','Southern Breeze','Galle','11:15:00','16:30:00','S003',6000),('TR003','Coastal Cruiser','Matara','10:45:00','15:15:00','S004',5000),('TR004','Northern Star','Jaffna','14:00:00','20:30:00','S005',7500),('TR005','Tropical Express','Colombo','07:30:00','11:30:00','S001',5000),('TR006','Ocean View','Negombo','10:00:00','14:15:00','S002',7500),('TR007','Beachcomber','Galle','12:45:00','17:00:00','S003',5500),('TR008','Island Hopper','Matara','10:15:00','14:45:00','S004',9000),('TR009','Sunset Serenity','Jaffna','15:30:00','21:00:00','S005',6400),('TR010','Coastal Express','Galle','08:15:00','12:30:00','S004',5500),('TR011','Hill Country Hopper','Kandy','10:00:00','14:45:00','S005',4500),('TR012','Eastern Breeze','Batticaloa','07:30:00','11:15:00','S001',6000);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_coordinator`
--

DROP TABLE IF EXISTS `train_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_coordinator` (
  `user_name` varchar(10) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `train_coordinator_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `coordinator` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_coordinator`
--

LOCK TABLES `train_coordinator` WRITE;
/*!40000 ALTER TABLE `train_coordinator` DISABLE KEYS */;
INSERT INTO `train_coordinator` VALUES ('chamarisi'),('dinukaw'),('imaraw'),('kavinduli'),('niroshank'),('roshanraj'),('sahanmendi');
/*!40000 ALTER TABLE `train_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `train_coordinator_details`
--

DROP TABLE IF EXISTS `train_coordinator_details`;
/*!50001 DROP VIEW IF EXISTS `train_coordinator_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_coordinator_details` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `address`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `DOB`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `train_token`
--

DROP TABLE IF EXISTS `train_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_token` (
  `token_Id` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `trip_id` int NOT NULL,
  `curr_capacity` int DEFAULT NULL,
  PRIMARY KEY (`token_Id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `train_token_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `train_trip` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_token`
--

LOCK TABLES `train_token` WRITE;
/*!40000 ALTER TABLE `train_token` DISABLE KEYS */;
INSERT INTO `train_token` VALUES (1,'2023-09-03',1,100),(2,'2023-09-04',2,200),(3,'2022-10-16',3,0),(4,'2022-10-02',4,50),(5,'2022-05-12',5,400),(6,'2022-05-19',6,100),(7,'2022-02-21',7,15),(8,'2022-02-25',8,200),(9,'2022-04-28',9,250),(10,'2023-01-29',10,300),(11,'2023-10-30',11,100),(12,'2023-04-22',12,110),(24,'2023-10-30',24,0),(25,'2023-06-30',25,20),(29,'2023-06-04',29,50),(30,'2023-03-30',30,100),(31,'2023-03-24',31,200),(32,'2023-03-27',32,150),(56,'2023-10-30',24,0),(57,'2023-06-30',25,0),(58,'2023-06-04',29,0),(59,'2023-03-30',30,0),(60,'2023-03-24',31,0),(61,'2023-03-27',32,0);
/*!40000 ALTER TABLE `train_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_token_items`
--

DROP TABLE IF EXISTS `train_token_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_token_items` (
  `token_Id` int NOT NULL,
  `add_quantity` int DEFAULT NULL,
  `order_Id` int NOT NULL,
  `product_id` varchar(10) NOT NULL,
  PRIMARY KEY (`token_Id`,`order_Id`,`product_id`),
  KEY `order_Id` (`order_Id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `train_token_items_ibfk_1` FOREIGN KEY (`token_Id`) REFERENCES `train_token` (`token_Id`),
  CONSTRAINT `train_token_items_ibfk_2` FOREIGN KEY (`order_Id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `train_token_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_token_items`
--

LOCK TABLES `train_token_items` WRITE;
/*!40000 ALTER TABLE `train_token_items` DISABLE KEYS */;
INSERT INTO `train_token_items` VALUES (1,50,1,'Prod000003'),(2,60,2,'Prod000005'),(3,4,3,'Prod000004'),(3,5,3,'Prod000012'),(3,1,3,'Prod000018'),(4,10,4,'Prod000019'),(4,8,4,'Prod000028'),(5,2,5,'Prod000008'),(5,10,5,'Prod000014'),(5,3,5,'Prod000032'),(6,9,6,'Prod000010'),(6,5,6,'Prod000012'),(7,4,7,'Prod000028'),(7,6,7,'Prod000032'),(7,10,7,'Prod000038'),(7,20,7,'Prod000041'),(8,50,8,'Prod000044'),(9,2,9,'Prod000038'),(9,11,9,'Prod000040'),(10,9,10,'Prod000012'),(10,5,10,'Prod000028'),(10,30,10,'Prod000034'),(11,4,11,'Prod000015'),(11,10,11,'Prod000046'),(12,5,12,'Prod000008'),(12,5,12,'Prod000043'),(12,6,12,'Prod000048'),(24,2,24,'Prod000002'),(24,1,24,'Prod000005'),(25,1,25,'Prod000005'),(25,2,25,'Prod000006'),(29,100,29,'Prod000040'),(30,1,30,'Prod000001'),(30,2,30,'Prod000005'),(31,3,31,'Prod000001'),(31,1,31,'Prod000002'),(31,1,31,'Prod000009'),(32,2,32,'Prod000001'),(32,1,32,'Prod000003');
/*!40000 ALTER TABLE `train_token_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `train_token_view`
--

DROP TABLE IF EXISTS `train_token_view`;
/*!50001 DROP VIEW IF EXISTS `train_token_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_token_view` AS SELECT 
 1 AS `token_Id`,
 1 AS `Date`,
 1 AS `trip_id`,
 1 AS `curr_capacity`,
 1 AS `train_id`,
 1 AS `name`,
 1 AS `destination`,
 1 AS `start_time`,
 1 AS `arrival_time`,
 1 AS `store_id`,
 1 AS `train_capacity`,
 1 AS `trip_start_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `train_trip`
--

DROP TABLE IF EXISTS `train_trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_trip` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `train_id` varchar(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `start_time` time NOT NULL,
  PRIMARY KEY (`trip_id`,`Date`,`start_time`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `train_trip_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_trip`
--

LOCK TABLES `train_trip` WRITE;
/*!40000 ALTER TABLE `train_trip` DISABLE KEYS */;
INSERT INTO `train_trip` VALUES (3,'TR002','2022-10-16','11:15:00'),(5,'TR003','2022-05-12','10:45:00'),(9,'TR004','2022-04-28','14:00:00'),(1,'TR005','2023-09-03','07:30:00'),(24,'TR005','2023-10-30','07:30:00'),(32,'TR005','2023-03-27','07:30:00'),(2,'TR006','2023-09-04','10:00:00'),(4,'TR006','2022-10-02','10:00:00'),(6,'TR006','2022-05-19','10:00:00'),(31,'TR006','2023-03-24','10:00:00'),(25,'TR007','2023-06-30','12:45:00'),(8,'TR008','2022-02-25','12:45:00'),(10,'TR009','2023-01-29','15:30:00'),(7,'TR010','2022-02-21','08:15:00'),(12,'TR010','2023-04-22','08:15:00'),(29,'TR010','2023-06-04','08:15:00'),(11,'TR011','2023-10-30','10:00:00'),(30,'TR011','2023-03-30','10:00:00');
/*!40000 ALTER TABLE `train_trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truck_id` int NOT NULL,
  `number_plate` varchar(10) NOT NULL,
  `manufacture_date` date DEFAULT NULL,
  `Model` varchar(100) NOT NULL,
  `store_id` varchar(5) NOT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`truck_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,'SE-347634','1980-03-20','Hendria','S001','Tendria'),(2,'XX-123456','2000-05-15','Truckster','S002','TruckCo'),(3,'AB-789012','2015-11-10','CargoMax','S003','CargoMaster'),(4,'CD-246810','2010-07-25','CargoKing','S004','TruckMasters'),(5,'EF-112233','2021-02-18','HaulerPro','S005','ProHaul'),(6,'GH-556677','2019-09-04','MegaHaul','S001','MegaTech'),(7,'IJ-991122','2005-12-30','CargoPlus','S002','CargoTech'),(8,'KL-334455','2018-04-11','TruckX','S003','TruckXpress'),(9,'MN-777777','2017-06-14','CargoMaster','S004','CargoTech'),(11,'QR-445566','2022-01-29','TruckPro','S001','ProTruck'),(12,'ST-889900','2013-08-07','CargoKing','S002','KingCargo'),(13,'UV-112211','2014-11-16','HaulMaster','S003','MasterHaul'),(14,'WX-001100','2007-03-26','TruckMax','S004','MaxTruck'),(15,'YZ-555555','2011-05-08','CargoTech','S005','TechCargo'),(16,'AB-223344','2019-07-12','HaulTech','S001','TechHaul'),(17,'CD-667788','2017-12-09','TruckCo','S002','CoTruck'),(18,'EF-991122','2018-04-03','CargoMasters','S003','MastersCargo'),(19,'GH-334455','2016-11-21','CargoExpress','S004','ExpressCargo'),(20,'IJ-223344','2020-09-15','HaulerKing','S005','KingHaul');
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_coordinator`
--

DROP TABLE IF EXISTS `truck_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_coordinator` (
  `user_name` varchar(10) NOT NULL,
  `store_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `truck_coordinator_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `coordinator` (`user_name`),
  CONSTRAINT `truck_coordinator_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_coordinator`
--

LOCK TABLES `truck_coordinator` WRITE;
/*!40000 ALTER TABLE `truck_coordinator` DISABLE KEYS */;
INSERT INTO `truck_coordinator` VALUES ('anuradhaf','S001'),('pasinduja','S001'),('harindrag','S002'),('tharinduds','S002'),('isuriguna','S003'),('sandunija','S003'),('kusalpere','S004'),('menakaran','S005');
/*!40000 ALTER TABLE `truck_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `truck_coordinator_details`
--

DROP TABLE IF EXISTS `truck_coordinator_details`;
/*!50001 DROP VIEW IF EXISTS `truck_coordinator_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `truck_coordinator_details` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `store_id`,
 1 AS `address`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `DOB`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `truck_schedule`
--

DROP TABLE IF EXISTS `truck_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `truck_id` int DEFAULT NULL,
  `driver_id` varchar(255) DEFAULT NULL,
  `a_driver_id` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `route_id` varchar(5) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `truck_id` (`truck_id`),
  KEY `a_driver_id` (`a_driver_id`),
  KEY `route_id` (`route_id`),
  KEY `fk_driver` (`driver_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `fk_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`userName`),
  CONSTRAINT `truck_schedule_ibfk_1` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`),
  CONSTRAINT `truck_schedule_ibfk_4` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `truck_schedule_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_schedule`
--

LOCK TABLES `truck_schedule` WRITE;
/*!40000 ALTER TABLE `truck_schedule` DISABLE KEYS */;
INSERT INTO `truck_schedule` VALUES (1,6,'chaminda9428','chamara9201','08:30:00','2023-09-06','R0001',1),(2,12,'arjuna91','thilan9426','09:40:00','2023-09-08','R0003',2),(3,18,'supun9302','prabath9433','10:30:00','2022-10-19','R0005',3),(4,12,'udara9108','buddhika94','13:30:00','2022-10-08','R0013',4),(5,8,'darshana89','chathuranga9421','14:40:00','2022-05-15','R0017',5),(6,15,'dinuka92','kalpana9518','12:00:00','2022-05-20','R0009',6),(7,14,'dilhani89','nadeesha9111','11:00:00','2022-02-28','R0008',7),(8,19,'dilhani89','eranda9434','11:30:00','2022-02-25','R0017',8),(9,20,'dinuka92','harini86','10:40:00','2022-04-30','R0010',9),(10,15,'dinuka92','isuru9427','09:30:00','2023-01-31','R0020',10),(11,5,'asandi9505','harini86','10:00:00','2023-11-04','R0019',11),(12,9,'dilhani89','eranda9434','13:20:00','2023-04-22','R0018',12),(24,11,'tharindra9436','vidaruv9423','10:00:00','2023-11-04','R0002',24),(25,13,'supun9302','prasanna9414','10:00:00','2023-07-05','R0005',25),(29,14,'dilhani89','prasanna9438','10:00:00','2023-06-05','R0007',29),(32,1,'lakmal9420','vidaruv9423','12:00:00','2023-03-25','R0001',32),(73,2,'chamara81','harindra93','07:23:00','2023-11-02','R0004',30),(74,7,'chathura90','buddhika94','13:50:00','2023-11-03','R0004',31);
/*!40000 ALTER TABLE `truck_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `truckschedulewithroutedetails`
--

DROP TABLE IF EXISTS `truckschedulewithroutedetails`;
/*!50001 DROP VIEW IF EXISTS `truckschedulewithroutedetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `truckschedulewithroutedetails` AS SELECT 
 1 AS `schedule_id`,
 1 AS `Date`,
 1 AS `route_id`,
 1 AS `time`,
 1 AS `destination`,
 1 AS `endTime`,
 1 AS `truck_id`,
 1 AS `driver_id`,
 1 AS `a_driver_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `weeklyworkhours_a_drivers`
--

DROP TABLE IF EXISTS `weeklyworkhours_a_drivers`;
/*!50001 DROP VIEW IF EXISTS `weeklyworkhours_a_drivers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `weeklyworkhours_a_drivers` AS SELECT 
 1 AS `a_driver_id`,
 1 AS `year`,
 1 AS `week_number`,
 1 AS `total_work_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `weeklyworkhours_drivers`
--

DROP TABLE IF EXISTS `weeklyworkhours_drivers`;
/*!50001 DROP VIEW IF EXISTS `weeklyworkhours_drivers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `weeklyworkhours_drivers` AS SELECT 
 1 AS `driver_id`,
 1 AS `year`,
 1 AS `week_number`,
 1 AS `total_work_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `workhours_trucks`
--

DROP TABLE IF EXISTS `workhours_trucks`;
/*!50001 DROP VIEW IF EXISTS `workhours_trucks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `workhours_trucks` AS SELECT 
 1 AS `truck_id`,
 1 AS `year`,
 1 AS `total_work_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `admin_details`
--

/*!50001 DROP VIEW IF EXISTS `admin_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_details` AS select `admin`.`user_name` AS `user_name`,`admin`.`first_name` AS `first_name`,`admin`.`last_name` AS `last_name`,`admin`.`address` AS `address`,`admin`.`phone_number` AS `phone_number`,`admin`.`email` AS `email`,`admin`.`DOB` AS `DOB` from `admin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allorderdetails`
--

/*!50001 DROP VIEW IF EXISTS `allorderdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allorderdetails` AS select `o`.`order_id` AS `order_id`,`o`.`date` AS `date`,`o`.`customer_id` AS `customer_id`,`o`.`delivery_address` AS `delivery_address`,`o`.`route_id` AS `route_id`,`o`.`state` AS `state`,`ol`.`product_id` AS `product_id`,`ol`.`quantity` AS `quantity`,`ol`.`sent_quantity` AS `sent_quantity`,`p`.`capacity` AS `capacity`,`p`.`name` AS `name`,`p`.`unit_price` AS `unit_price` from ((`cust_order` `o` join `order_product_list` `ol` on((`ol`.`order_id` = `o`.`order_id`))) join `product` `p` on((`ol`.`product_id` = `p`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_details`
--

/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_details` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`first_name` AS `first_name`,`customer`.`last_name` AS `last_name`,`customer`.`address` AS `address`,`customer`.`phone_number` AS `phone_number`,`customer`.`email` AS `email`,`customer`.`DOB` AS `DOB`,`customer`.`type` AS `type`,`customer`.`image` AS `image` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `geta_driverdata`
--

/*!50001 DROP VIEW IF EXISTS `geta_driverdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `geta_driverdata` AS select `e`.`userName` AS `userName`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`store_id` AS `store_id`,`e`.`DOB` AS `DOB`,`e`.`salary` AS `salary`,`e`.`type` AS `type`,`e`.`NIC` AS `NIC`,`ad`.`permit_id` AS `permit_id` from (`a_driver` `ad` join `employee` `e` on((`ad`.`userName` = `e`.`userName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getdriverdata`
--

/*!50001 DROP VIEW IF EXISTS `getdriverdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getdriverdata` AS select `e`.`userName` AS `userName`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`store_id` AS `store_id`,`e`.`DOB` AS `DOB`,`e`.`salary` AS `salary`,`e`.`type` AS `type`,`e`.`NIC` AS `NIC`,`d`.`liciene_id` AS `liciene_id` from (`driver` `d` join `employee` `e` on((`d`.`userName` = `e`.`userName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `income`
--

/*!50001 DROP VIEW IF EXISTS `income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `income` AS select `c`.`order_id` AS `order_id`,`o`.`total_price` AS `total_price`,`c`.`date` AS `date` from (`cust_order` `c` left join `order_revenue` `o` on((`c`.`order_id` = `o`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_ordered_products`
--

/*!50001 DROP VIEW IF EXISTS `most_ordered_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_ordered_products` AS select year(`co`.`date`) AS `order_year`,`p`.`name` AS `name`,sum(`opl`.`quantity`) AS `total_quantity` from ((`cust_order` `co` join `order_product_list` `opl` on((`co`.`order_id` = `opl`.`order_id`))) join `product` `p` on((`p`.`product_id` = `opl`.`product_id`))) group by `co`.`order_id`,`order_year`,`p`.`name` order by `total_quantity` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_revenue`
--

/*!50001 DROP VIEW IF EXISTS `order_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_revenue` AS select `opl`.`order_id` AS `order_id`,(`p`.`unit_price` * `opl`.`quantity`) AS `total_price` from (`order_product_list` `opl` left join `product` `p` on((`opl`.`product_id` = `p`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_tot_price`
--

/*!50001 DROP VIEW IF EXISTS `order_tot_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_tot_price` AS select `order_revenue`.`order_id` AS `order_id`,sum(`order_revenue`.`total_price`) AS `tot_price` from `order_revenue` group by `order_revenue`.`order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders`
--

/*!50001 DROP VIEW IF EXISTS `orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders` AS select `c_o`.`order_id` AS `order_id`,`c_o`.`customer_id` AS `customer_id`,`o_p_l`.`quantity` AS `quantity`,`p`.`name` AS `name` from ((`cust_order` `c_o` join `order_product_list` `o_p_l` on((`c_o`.`order_id` = `o_p_l`.`order_id`))) join `product` `p` on((`o_p_l`.`product_id` = `p`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `route_sales`
--

/*!50001 DROP VIEW IF EXISTS `route_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `route_sales` AS select `ts`.`route_id` AS `route_id`,`ts`.`order_id` AS `order_id`,`ot`.`tot_price` AS `tot_price`,`r`.`store_id` AS `store_id` from ((`truck_schedule` `ts` join `order_tot_price` `ot` on((`ot`.`order_id` = `ts`.`order_id`))) join `route` `r` on((`r`.`route_id` = `ts`.`route_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `train_coordinator_details`
--

/*!50001 DROP VIEW IF EXISTS `train_coordinator_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_coordinator_details` AS select `coordinator`.`user_name` AS `user_name`,`coordinator`.`first_name` AS `first_name`,`coordinator`.`last_name` AS `last_name`,`coordinator`.`address` AS `address`,`coordinator`.`phone_number` AS `phone_number`,`coordinator`.`email` AS `email`,`coordinator`.`DOB` AS `DOB`,`coordinator`.`type` AS `type` from `coordinator` where `coordinator`.`user_name` in (select `train_coordinator`.`user_name` from `train_coordinator`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `train_token_view`
--

/*!50001 DROP VIEW IF EXISTS `train_token_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_token_view` AS select `tt`.`token_Id` AS `token_Id`,`tt`.`Date` AS `Date`,`tt`.`trip_id` AS `trip_id`,`tt`.`curr_capacity` AS `curr_capacity`,`t`.`train_id` AS `train_id`,`t`.`name` AS `name`,`t`.`destination` AS `destination`,`t`.`start_time` AS `start_time`,`t`.`arrival_time` AS `arrival_time`,`t`.`store_id` AS `store_id`,`t`.`train_capacity` AS `train_capacity`,`tr`.`start_time` AS `trip_start_time` from ((`train_token` `tt` join `train_trip` `tr` on((`tt`.`trip_id` = `tr`.`trip_id`))) join `train` `t` on((`tr`.`train_id` = `t`.`train_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `truck_coordinator_details`
--

/*!50001 DROP VIEW IF EXISTS `truck_coordinator_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `truck_coordinator_details` AS select `tc`.`user_name` AS `user_name`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`tc`.`store_id` AS `store_id`,`c`.`address` AS `address`,`c`.`phone_number` AS `phone_number`,`c`.`email` AS `email`,`c`.`DOB` AS `DOB`,`c`.`type` AS `type` from (`truck_coordinator` `tc` join `coordinator` `c` on((`tc`.`user_name` = `c`.`user_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `truckschedulewithroutedetails`
--

/*!50001 DROP VIEW IF EXISTS `truckschedulewithroutedetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `truckschedulewithroutedetails` AS select `ts`.`schedule_id` AS `schedule_id`,`ts`.`Date` AS `Date`,`ts`.`route_id` AS `route_id`,`ts`.`time` AS `time`,`r`.`destination` AS `destination`,cast((`ts`.`time` + `r`.`max_time`) as time) AS `endTime`,`ts`.`truck_id` AS `truck_id`,`ts`.`driver_id` AS `driver_id`,`ts`.`a_driver_id` AS `a_driver_id` from (`truck_schedule` `ts` join `route` `r` on((`r`.`route_id` = `ts`.`route_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `weeklyworkhours_a_drivers`
--

/*!50001 DROP VIEW IF EXISTS `weeklyworkhours_a_drivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `weeklyworkhours_a_drivers` AS select `a_driver_roster`.`a_driver_id` AS `a_driver_id`,year(`a_driver_roster`.`start_date`) AS `year`,week(`a_driver_roster`.`start_date`,0) AS `week_number`,(sum(time_to_sec(`a_driver_roster`.`working_hours`)) / 3600) AS `total_work_hours` from `a_driver_roster` group by `a_driver_roster`.`a_driver_id`,`year`,`week_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `weeklyworkhours_drivers`
--

/*!50001 DROP VIEW IF EXISTS `weeklyworkhours_drivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `weeklyworkhours_drivers` AS select `driver_roster`.`driver_id` AS `driver_id`,year(`driver_roster`.`start_date`) AS `year`,week(`driver_roster`.`start_date`,0) AS `week_number`,(sum(time_to_sec(`driver_roster`.`working_hours`)) / 3600) AS `total_work_hours` from `driver_roster` group by `driver_roster`.`driver_id`,`year`,`week_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `workhours_trucks`
--

/*!50001 DROP VIEW IF EXISTS `workhours_trucks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `workhours_trucks` AS select `truck_schedule`.`truck_id` AS `truck_id`,year(`truck_schedule`.`Date`) AS `year`,(sum(time_to_sec(`route`.`max_time`)) / 3600) AS `total_work_hours` from (`truck_schedule` join `route` on((`truck_schedule`.`route_id` = `route`.`route_id`))) group by `truck_schedule`.`truck_id`,`year` */;
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

-- Dump completed on 2023-10-31 10:50:31
