-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerse
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `adminpanel_catagry`
--

DROP TABLE IF EXISTS `adminpanel_catagry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_catagry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `catname` longtext NOT NULL,
  `discount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_catagry`
--

LOCK TABLES `adminpanel_catagry` WRITE;
/*!40000 ALTER TABLE `adminpanel_catagry` DISABLE KEYS */;
INSERT INTO `adminpanel_catagry` VALUES (12,'vegetable',15),(16,'fruits',10);
/*!40000 ALTER TABLE `adminpanel_catagry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_catgry`
--

DROP TABLE IF EXISTS `adminpanel_catgry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_catgry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `catname` longtext NOT NULL DEFAULT (_utf8mb3'True'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_catgry`
--

LOCK TABLES `adminpanel_catgry` WRITE;
/*!40000 ALTER TABLE `adminpanel_catgry` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminpanel_catgry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_coupon`
--

DROP TABLE IF EXISTS `adminpanel_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `couponcode` varchar(20) NOT NULL,
  `discount` int NOT NULL,
  `isactive` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_coupon`
--

LOCK TABLES `adminpanel_coupon` WRITE;
/*!40000 ALTER TABLE `adminpanel_coupon` DISABLE KEYS */;
INSERT INTO `adminpanel_coupon` VALUES (1,'super20',20,1),(2,'super10',10,1),(3,'super50',50,1),(4,'super40',40,1),(5,'super25',25,1),(6,'super60',60,1),(7,'super45',45,1),(8,'spr10',10,1),(9,'sppr10',10,1),(10,'adhil10',10,1),(11,'sps20',20,1),(12,'hai10',10,1),(13,'hh20',20,1),(15,'e20',20,1),(16,'grape10',10,1),(17,'ht10',10,1),(18,'po10',10,1),(19,'po10',10,1),(20,'pp10',10,1),(21,'coupon10',10,1),(22,'abhi10',10,1),(23,'akhil10',10,1),(24,'sps20',20,1);
/*!40000 ALTER TABLE `adminpanel_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_item`
--

DROP TABLE IF EXISTS `adminpanel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `categry_id` bigint NOT NULL,
  `offerprice` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminpanel_item_categry_id_64a46657_fk_adminpanel_catagry_id` (`categry_id`),
  CONSTRAINT `adminpanel_item_categry_id_64a46657_fk_adminpanel_catagry_id` FOREIGN KEY (`categry_id`) REFERENCES `adminpanel_catagry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_item`
--

LOCK TABLES `adminpanel_item` WRITE;
/*!40000 ALTER TABLE `adminpanel_item` DISABLE KEYS */;
INSERT INTO `adminpanel_item` VALUES (17,'Potato',23,'Good for health','uploads/20211227053623pp.png',12,17),(18,'Tomato',55,'Having the size, colour and juiciness of cherries, cherry tomatoes are sweeter to taste than regular varieties. We pick these tomatoes from reputed farmers and store in hygienic conditions to maintain their freshness.','uploads/20211227053803cherrytomato.png',12,46),(19,'Leek',24,'Leek is a long bundle of leaf sheaths with a mild, onion-like taste. In its raw state, the vegetable is crunchy and firm.','uploads/20211227063410leeks.png',12,20),(20,'Yam',32,'Good for health','uploads/20211227075833Yam.png',12,27),(21,'Pumpkin',34,'Good for health','uploads/20211228060058pumpkin-Yellow.jpeg',12,28),(26,'Onion',27,'Good for health','uploads/20211231064246onion.png',12,22),(27,'Ladies finger',45,' It contains potassium, carbs, dietary fiber, vitamin A, calcium, vitamin C, iron, vitamin B6, and magnesium','uploads/20211231064405ladies_finger.jpeg',12,38),(28,'Raddish',54,' It contains nutrients such as sodium, potassium, dietary fiber, calcium, vitamin C, vitamin B6, and magnesium.','uploads/20211231064506Raddish.jpeg',12,45),(31,'Orange',24,'Good for health','uploads/20220108055015orange.jpeg',16,21),(32,'Grapes',45,'Grapes are small ball-like fruits with a thin black outer skin and a soft jelly flesh inside them','uploads/20220108055611grapes.jpeg',16,40),(33,'Lemon',14,'Good for health','uploads/20220108055715lemon.jpeg',16,12),(37,'pine apple',55,'Good for health','uploads/20220109070943pineapple.png',16,49);
/*!40000 ALTER TABLE `adminpanel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_accounts`
--

DROP TABLE IF EXISTS `app_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `app_accounts_user_id_24adb8dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_accounts`
--

LOCK TABLES `app_accounts` WRITE;
/*!40000 ALTER TABLE `app_accounts` DISABLE KEYS */;
INSERT INTO `app_accounts` VALUES (1,6282441936,3),(2,9495736276,4),(3,9400262418,5),(4,9400282418,6),(5,9345672188,7),(6,789123451,8),(7,9289754326,9),(8,7856453342,10),(9,7736873733,11),(10,777888990,12),(11,7596886475,13),(12,994567889,14),(13,9995556677,15),(14,9994445556,16),(15,9992233445,17),(16,8593035173,18);
/*!40000 ALTER TABLE `app_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_address`
--

DROP TABLE IF EXISTS `app_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `Address` longtext NOT NULL,
  `city` varchar(20) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `state` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_address_user_id_b16eb042_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_address_user_id_b16eb042_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_address`
--

LOCK TABLES `app_address` WRITE;
/*!40000 ALTER TABLE `app_address` DISABLE KEYS */;
INSERT INTO `app_address` VALUES (10,'ADHIL','kymalaputhanpura,Mudavoor','ernakulam','686669',3,1,'kerala',6282441936),(12,'Ajmal','kerakekaraHouse','edukki','646845',3,0,'kerala',9495736276),(13,'Akhil','kezhekekarahouse','ernakulam','686669',3,0,'kerala',989997654),(14,'abhishek','kuruvayilhouse','ernakulam','686669',3,0,'kerala',9897969594),(15,'ADHIL','kymalaputhanpura,Mudavoor','ernakulam','686669',11,0,'kerala',6282441936),(16,'Gokulmadhu','kymalaputhanpura,Mudavoor','ernakulam','686669',11,1,'kerala',9400262418),(17,'abhishek','kuruvayilhouse','ernakulam','686669',12,1,'kerala',9897969594),(18,'adhil','A,SNDAS','S,MMNAS','4568',13,1,'SJGD',9400262418),(19,'abhishek','kuruvayilhouse','ernakulam','686669',14,1,'kerala',9897969594),(20,'abhishek','kuruvayilhouse','ernakulam','686669',15,1,'kerala',9897969594),(21,'Gokulmadhu','kymalaputhanpura,Mudavoor','ernakulam','686669',16,1,'kerala',9400262418),(22,'Ajmal','kerakekaraHouse','edukki','646845',17,1,'kerala',9495736276),(29,'Gokulmadhu','kymalaputhanpura,Mudavoor','ernakulam','686669',18,1,'kerala',9400262418),(30,'Gokulmadhu','kymalaputhanpura,Mudavoor','ernakulam','686669',18,0,'kerala',9400262418);
/*!40000 ALTER TABLE `app_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cart`
--

DROP TABLE IF EXISTS `app_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `totalprice` int NOT NULL,
  `discountprice` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_cart_product_id_a4171918_fk_adminpanel_item_id` (`product_id`),
  KEY `app_cart_user_id_2bf07879_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_cart_product_id_a4171918_fk_adminpanel_item_id` FOREIGN KEY (`product_id`) REFERENCES `adminpanel_item` (`id`),
  CONSTRAINT `app_cart_user_id_2bf07879_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cart`
--

LOCK TABLES `app_cart` WRITE;
/*!40000 ALTER TABLE `app_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_couponapplied`
--

DROP TABLE IF EXISTS `app_couponapplied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_couponapplied` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `couponofferprice` int NOT NULL,
  `offerended` tinyint(1) NOT NULL,
  `appliedcoupon_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `placed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_couponapplied_appliedcoupon_id_4bb1d31d_fk_adminpane` (`appliedcoupon_id`),
  KEY `app_couponapplied_user_id_ca054ba1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_couponapplied_appliedcoupon_id_4bb1d31d_fk_adminpane` FOREIGN KEY (`appliedcoupon_id`) REFERENCES `adminpanel_coupon` (`id`),
  CONSTRAINT `app_couponapplied_user_id_ca054ba1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_couponapplied`
--

LOCK TABLES `app_couponapplied` WRITE;
/*!40000 ALTER TABLE `app_couponapplied` DISABLE KEYS */;
INSERT INTO `app_couponapplied` VALUES (1,18,1,10,11,1),(2,41,1,10,11,1),(3,57,1,10,11,1),(4,143,1,11,11,1),(5,24,1,11,11,1),(6,34,1,12,3,1),(7,28,1,1,3,0),(8,28,1,1,3,0),(9,28,1,1,3,0),(10,28,1,1,3,0),(11,28,1,1,3,0),(12,28,1,1,3,0),(13,28,1,1,3,0),(14,28,1,1,3,0),(15,28,1,1,3,0),(16,14,1,6,3,1),(17,21,1,4,3,1),(18,24,1,2,3,0),(19,10,1,6,3,1),(20,16,1,1,11,0),(21,36,1,13,3,0),(22,36,1,13,3,0),(23,36,1,13,3,0),(24,36,1,13,3,0),(25,8,1,6,12,0),(26,30,1,13,12,0),(27,8,1,6,12,0),(28,36,1,10,12,0),(29,54,1,10,12,0),(30,21,1,15,3,0),(31,27,1,16,3,1),(32,27,1,16,3,1),(33,27,1,16,3,1),(34,27,1,16,3,1),(35,27,1,16,3,1),(36,18,1,16,14,1),(37,41,1,17,14,1),(38,16,1,18,14,1),(39,16,1,20,14,0),(40,16,1,20,14,0),(41,16,1,20,14,0),(42,14,1,13,14,0),(43,16,1,13,14,0),(44,16,1,13,14,0),(45,16,1,13,14,0),(46,36,1,13,14,0),(47,21,1,13,14,0),(48,21,1,13,14,0),(49,21,1,13,14,0),(50,17,1,13,14,0),(51,17,1,13,14,0),(52,17,1,13,14,1),(53,14,1,13,15,0),(54,14,1,13,15,1),(55,27,1,21,16,0),(56,27,1,21,16,0),(57,25,1,21,16,1),(58,18,1,6,16,1),(59,18,1,21,3,1),(60,36,1,21,17,0),(61,36,1,21,17,1),(62,18,1,22,3,0),(63,18,1,22,3,1),(64,18,1,23,3,0),(65,41,1,23,3,1),(66,18,1,6,18,0),(67,18,1,6,18,1),(68,13,1,1,3,0);
/*!40000 ALTER TABLE `app_couponapplied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `total` int NOT NULL,
  `mode` varchar(20) NOT NULL,
  `date_added` date NOT NULL,
  `address_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_address_id_781b2239_fk_app_address_id` (`address_id`),
  KEY `app_order_user_id_f25a9fc4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_order_address_id_781b2239_fk_app_address_id` FOREIGN KEY (`address_id`) REFERENCES `app_address` (`id`),
  CONSTRAINT `app_order_user_id_f25a9fc4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (19,'delivered',93,'cod','2021-12-28',10,3),(22,'delivered',97,'cod','2021-12-29',10,3),(23,'dispatched',51,'cod','2021-12-29',10,3),(24,'cancelled',19,'cod','2021-12-29',10,3),(25,'delivered',122,'cod','2021-12-29',10,3),(26,'cancelled',14,'cod','2021-12-29',10,3),(27,'pending',18,'cod','2021-12-29',10,3),(28,'pending',46,'cod','2021-12-29',10,3),(29,'pending',20,'cod','2021-12-30',10,3),(30,'pending',20,'Razorpay','2021-12-30',10,3),(31,'pending',27,'Razorpay','2021-12-30',10,3),(32,'pending',11,'Razorpay','2021-12-30',10,3),(34,'pending',28,'Razorpay','2021-12-30',10,3),(35,'pending',46,'cod','2021-12-30',10,3),(36,'cancelled',11,'cod','2021-12-30',10,3),(37,'pending',46,'paypal','2021-12-30',10,3),(38,'pending',20,'cod','2021-12-30',10,3),(39,'pending',66,'paypal','2021-12-30',10,3),(40,'pending',21,'paypal','2021-12-30',10,3),(41,'pending',36,'cod','2021-12-31',10,3),(42,'pending',18,'paypal','2021-12-31',10,3),(43,'pending',46,'paypal','2021-12-31',10,3),(44,'dispatched',20,'cod','2022-01-01',16,11),(45,'pending',162,'Razorpay','2022-01-01',16,11),(46,'delivered',20,'Razorpay','2022-01-01',16,11),(47,'delivered',57,'cod','2022-01-02',16,11),(48,'delivered',24,'cod','2022-01-02',16,11),(49,'delivered',396,'cod','2022-01-04',16,11),(50,'delivered',716,'cod','2022-01-04',16,11),(51,'pending',46,'Razorpay','2022-01-05',16,11),(52,'pending',34,'cod','2022-01-05',10,3),(53,'pending',28,'cod','2022-01-05',10,3),(54,'pending',45,'Razorpay','2022-01-05',10,3),(55,'delivered',46,'cod','2022-01-05',10,3),(56,'pending',18,'cod','2022-01-05',10,3),(57,'cancelled',72,'Razorpay','2022-01-05',10,3),(58,'pending',36,'cod','2022-01-05',10,3),(59,'pending',10,'cod','2022-01-05',10,3),(60,'pending',22,'cod','2022-01-05',16,11),(61,'pending',20,'Razorpay','2022-01-05',16,11),(62,'pending',99,'cod','2022-01-05',10,3),(63,'cancelled',36,'cod','2022-01-05',10,3),(64,'cancelled',8,'cod','2022-01-05',17,12),(65,'cancelled',46,'cod','2022-01-05',17,12),(66,'cancelled',22,'cod','2022-01-05',17,12),(67,'cancelled',30,'cod','2022-01-05',17,12),(68,'cancelled',45,'cod','2022-01-05',17,12),(69,'cancelled',20,'cod','2022-01-05',17,12),(70,'cancelled',28,'cod','2022-01-05',17,12),(71,'cancelled',76,'cod','2022-01-05',10,3),(72,'pending',38,'cod','2022-01-05',18,13),(73,'pending',20,'Razorpay','2022-01-05',18,13),(74,'pending',46,'cod','2022-01-05',10,3),(75,'pending',18,'cod','2022-01-05',10,3),(76,'pending',21,'cod','2022-01-05',10,3),(77,'pending',27,'cod','2022-01-05',10,3),(78,'pending',27,'cod','2022-01-05',10,3),(79,'pending',27,'cod','2022-01-05',10,3),(80,'pending',18,'cod','2022-01-05',10,3),(81,'pending',46,'cod','2022-01-05',19,14),(82,'pending',20,'cod','2022-01-05',19,14),(83,'pending',16,'cod','2022-01-05',19,14),(84,'pending',14,'cod','2022-01-05',19,14),(85,'pending',36,'cod','2022-01-05',19,14),(86,'pending',21,'cod','2022-01-05',19,14),(87,'pending',17,'cod','2022-01-05',19,14),(88,'pending',14,'cod','2022-01-05',20,15),(89,'pending',46,'cod','2022-01-05',20,15),(90,'pending',46,'cod','2022-01-05',21,16),(91,'pending',25,'cod','2022-01-06',21,16),(92,'pending',77,'cod','2022-01-06',21,16),(93,'pending',66,'Razorpay','2022-01-06',21,16),(94,'pending',18,'Razorpay','2022-01-06',10,3),(95,'pending',27,'cod','2022-01-06',10,3),(96,'pending',92,'paypal','2022-01-06',10,3),(97,'pending',46,'cod','2022-01-06',22,17),(98,'pending',36,'cod','2022-01-06',22,17),(99,'pending',18,'cod','2022-01-07',10,3),(100,'pending',41,'cod','2022-01-07',10,3),(105,'pending',20,'cod','2022-01-07',29,18),(106,'pending',18,'Razorpay','2022-01-07',29,18),(107,'pending',20,'Razorpay','2022-01-07',29,18),(108,'delivered',27,'cod','2022-01-10',10,3);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_ordereditem`
--

DROP TABLE IF EXISTS `app_ordereditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_ordereditem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ordereditem_order_id_e10111ee_fk_app_order_id` (`order_id`),
  KEY `app_ordereditem_product_id_c478e74d_fk_adminpanel_item_id` (`product_id`),
  CONSTRAINT `app_ordereditem_order_id_e10111ee_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`),
  CONSTRAINT `app_ordereditem_product_id_c478e74d_fk_adminpanel_item_id` FOREIGN KEY (`product_id`) REFERENCES `adminpanel_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_ordereditem`
--

LOCK TABLES `app_ordereditem` WRITE;
/*!40000 ALTER TABLE `app_ordereditem` DISABLE KEYS */;
INSERT INTO `app_ordereditem` VALUES (1,1,20,19,17),(2,1,51,19,18),(3,1,22,19,19),(7,1,20,22,17),(8,2,102,22,18),(9,1,51,23,18),(10,1,22,24,19),(11,2,36,25,17),(13,1,28,26,21),(14,1,18,27,17),(15,1,46,28,18),(16,1,20,29,19),(17,1,20,30,19),(18,1,27,31,20),(19,1,28,32,21),(21,1,28,34,21),(22,1,46,35,18),(23,1,28,36,21),(24,1,46,37,18),(25,1,20,38,19),(26,1,46,39,18),(27,1,20,39,19),(30,1,18,42,17),(31,1,46,43,18),(32,1,20,44,19),(33,1,22,44,17),(35,1,20,46,19),(36,1,46,47,18),(37,1,18,47,17),(41,1,46,51,18),(42,1,38,52,27),(43,1,28,53,21),(44,1,45,54,28),(45,1,46,55,18),(46,1,18,56,17),(48,2,36,58,17),(49,1,27,59,20),(50,1,22,60,26),(51,1,20,61,19),(53,1,45,63,28),(54,1,20,64,19),(55,1,46,65,18),(56,1,22,66,26),(57,1,38,67,27),(58,1,45,68,28),(59,1,20,69,19),(60,1,28,70,21),(61,2,76,71,27),(62,1,38,72,27),(63,1,20,73,19),(64,1,46,74,18),(65,1,18,75,17),(66,1,27,76,20),(70,1,18,80,17),(71,1,46,81,18),(72,1,20,82,19),(73,1,18,83,17),(74,1,18,84,17),(75,1,46,85,18),(76,1,27,86,20),(77,1,22,87,26),(78,1,18,88,17),(79,1,46,89,18),(80,1,46,90,18),(81,1,28,91,21),(83,1,46,92,18),(84,1,20,93,19),(85,1,46,93,18),(86,1,20,94,19),(87,1,27,95,26),(88,2,92,96,18),(89,1,46,97,18),(90,2,40,98,19),(91,1,20,99,19),(92,1,46,100,18),(97,1,20,105,19),(98,1,46,106,18),(99,1,20,107,19),(100,1,27,108,20);
/*!40000 ALTER TABLE `app_ordereditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_wishlist`
--

DROP TABLE IF EXISTS `app_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_wishlist_product_id_fc12fbba_fk_adminpanel_item_id` (`product_id`),
  KEY `app_wishlist_user_id_9cab8200_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_wishlist_product_id_fc12fbba_fk_adminpanel_item_id` FOREIGN KEY (`product_id`) REFERENCES `adminpanel_item` (`id`),
  CONSTRAINT `app_wishlist_user_id_9cab8200_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_wishlist`
--

LOCK TABLES `app_wishlist` WRITE;
/*!40000 ALTER TABLE `app_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add account',1,'add_account'),(2,'Can change account',1,'change_account'),(3,'Can delete account',1,'delete_account'),(4,'Can view account',1,'view_account'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add accounts',8,'add_accounts'),(30,'Can change accounts',8,'change_accounts'),(31,'Can delete accounts',8,'delete_accounts'),(32,'Can view accounts',8,'view_accounts'),(33,'Can add products',9,'add_products'),(34,'Can change products',9,'change_products'),(35,'Can delete products',9,'delete_products'),(36,'Can view products',9,'view_products'),(37,'Can add item',10,'add_item'),(38,'Can change item',10,'change_item'),(39,'Can delete item',10,'delete_item'),(40,'Can view item',10,'view_item'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile'),(45,'Can add catgry',12,'add_catgry'),(46,'Can change catgry',12,'change_catgry'),(47,'Can delete catgry',12,'delete_catgry'),(48,'Can view catgry',12,'view_catgry'),(49,'Can add catagry',13,'add_catagry'),(50,'Can change catagry',13,'change_catagry'),(51,'Can delete catagry',13,'delete_catagry'),(52,'Can view catagry',13,'view_catagry'),(53,'Can add address',14,'add_address'),(54,'Can change address',14,'change_address'),(55,'Can delete address',14,'delete_address'),(56,'Can view address',14,'view_address'),(57,'Can add wishlist',15,'add_wishlist'),(58,'Can change wishlist',15,'change_wishlist'),(59,'Can delete wishlist',15,'delete_wishlist'),(60,'Can view wishlist',15,'view_wishlist'),(61,'Can add cart',16,'add_cart'),(62,'Can change cart',16,'change_cart'),(63,'Can delete cart',16,'delete_cart'),(64,'Can view cart',16,'view_cart'),(65,'Can add order',17,'add_order'),(66,'Can change order',17,'change_order'),(67,'Can delete order',17,'delete_order'),(68,'Can view order',17,'view_order'),(69,'Can add ordereditem',18,'add_ordereditem'),(70,'Can change ordereditem',18,'change_ordereditem'),(71,'Can delete ordereditem',18,'delete_ordereditem'),(72,'Can view ordereditem',18,'view_ordereditem'),(73,'Can add coupon',19,'add_coupon'),(74,'Can change coupon',19,'change_coupon'),(75,'Can delete coupon',19,'delete_coupon'),(76,'Can view coupon',19,'view_coupon'),(77,'Can add couponapplied',20,'add_couponapplied'),(78,'Can change couponapplied',20,'change_couponapplied'),(79,'Can delete couponapplied',20,'delete_couponapplied'),(80,'Can view couponapplied',20,'view_couponapplied'),(81,'Can add banner',21,'add_banner'),(82,'Can change banner',21,'change_banner'),(83,'Can delete banner',21,'delete_banner'),(84,'Can view banner',21,'view_banner');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$260000$aEoAtgtALB4lbwegVCnHce$eO8xQ7K6SlhhNnrmqn0++zicgxl4IClw70xrEjyk9zg=','2022-01-11 11:25:06.507050',0,'adhil','','','adhil@gmail.com',0,1,'2021-12-08 04:40:22.790003'),(4,'pbkdf2_sha256$260000$CcTNeh5auOGJfQXveoim3N$HQySnol0b4f1sBcUJlQEJbcpEu0BHGLanUvQZM3uISI=',NULL,0,'abhishek','','','abhi@gmail.com',0,1,'2021-12-08 04:48:54.620654'),(5,'pbkdf2_sha256$260000$kRPTlhXooddoPtg66woWf8$uC8Pz5uaftyQKR/GhUjtiz7ciZx67oQKlb2/viM73Lg=',NULL,1,'admin','','','admin@gmail.com',0,1,'2021-12-08 06:45:25.841451'),(6,'pbkdf2_sha256$260000$xZepZ52tmYWOvMp7tWosnB$zsQXhmUvS42kwtOiKp5GIQ9jTDlLvdS5lXuNcJb7/Ho=',NULL,0,'ameen','','','ameen@gmail.com',0,1,'2021-12-09 09:27:45.783336'),(7,'pbkdf2_sha256$260000$718ZNv1usS5M3VQl5XpILs$5chIWLoLZMHSm/b6txkpjF6S+8DUr3OYCINVAJ3yaMM=',NULL,0,'ashik','','','ashik@gmail.com',0,1,'2021-12-10 15:22:39.951609'),(8,'pbkdf2_sha256$260000$TsmaR3RexveSiymiWIX6nz$KWVVs90qA7pF40JIchoa6DwHPFz91tFOn8gMENpQ9Nw=',NULL,0,'gokul','','','gokul@gmail.com',0,1,'2021-12-12 03:40:49.527334'),(9,'pbkdf2_sha256$260000$9ewTEa4KMQR1u1baRkT9Rg$1i0DP5vLr4uTAQse74RmSXoPhqyft2eYZrSN67HtJok=',NULL,0,'arif','','','arif@gmail.com',0,1,'2021-12-13 07:56:32.581463'),(10,'pbkdf2_sha256$260000$mnejGdFPjuuLhjEHlNdzZi$oVwaxwAF6D2bgozjY+6VWBqdixyPM5XkTjTqS2VYYEM=',NULL,0,'rafeeq','','','rafeeq@gmail.com',0,1,'2021-12-24 12:27:11.206489'),(11,'pbkdf2_sha256$260000$Jz9mF0pYZhi9tL2AlNwvPK$hK9VjLJnwqGkkgMxJXLDmeWHFeOgjTLJq+3sxr2f5m0=','2022-01-05 10:03:38.412919',0,'sharath','','','sharath@gmail.com',0,1,'2022-01-01 12:36:25.624135'),(12,'pbkdf2_sha256$260000$JKJxLniwVX9tazPZDeUOTe$19A/AqncAP4iYMowLraZczkz+se/OiVEQpsTRVdXmx8=','2022-01-05 10:34:09.869891',0,'jolsna','','','jolsna@gmail.com',0,1,'2022-01-05 10:15:34.046871'),(13,'pbkdf2_sha256$260000$LbAJ5n2GXOXGklkj1KTixC$T+sGvCqE+XzuDUDGk/J9E0wZwFG3f+XBR6goqVeFk0s=',NULL,0,'mansoor','','','mansoor@gmail.com',0,1,'2022-01-05 10:58:04.711635'),(14,'pbkdf2_sha256$260000$jWyfs7ilreU6xFpDZMdVGj$tIEUJFjYoIqGr0NysInb7pp8Wv8PFc3tU2Erd4mV0yI=',NULL,0,'abhilash','','','abhilash@gmail.com',0,1,'2022-01-05 11:41:02.569685'),(15,'pbkdf2_sha256$260000$D4VJfZZDOp5UD41e1sb7Ru$E0RD3tgaVxCSIiOk9/anUpCgeBStyJ/R/d5NiDUoGXg=',NULL,0,'joe','','','joe@gmail.com',0,1,'2022-01-05 12:17:11.755158'),(16,'pbkdf2_sha256$260000$uj7I3EUNHbFGRvFm3M3VVe$lX+yqxkWw6RYZmhwo0J5JJT2B+1LzDwJ1zAk79zxYFc=',NULL,0,'kabir','','','kabir@gmail.com',0,1,'2022-01-05 12:19:05.741479'),(17,'pbkdf2_sha256$260000$G6rud1HNGkiAj91wq51WoF$F99LdXwYZdPoN1G7uWAOgAG7mdGNQhJAIx6j7OPQDPE=',NULL,0,'anna','','','anna123@gmail.com',0,1,'2022-01-06 10:44:17.529557'),(18,'pbkdf2_sha256$260000$TNpeOXwuTgJZ7FWl7LdPdK$w+RGVN74zw+1VRbQAAxfvzvtHDlw+m0FINrfRKA6Te8=',NULL,0,'abhi','','','abhijith@gmail.com',0,1,'2022-01-07 06:28:09.059902');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(13,'adminpanel','catagry'),(12,'adminpanel','catgry'),(19,'adminpanel','coupon'),(10,'adminpanel','item'),(9,'adminpanel','products'),(1,'app','account'),(8,'app','accounts'),(14,'app','address'),(16,'app','cart'),(20,'app','couponapplied'),(17,'app','order'),(18,'app','ordereditem'),(15,'app','wishlist'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(11,'otp','profile'),(21,'product','banner'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-12-07 07:49:03.610703'),(2,'auth','0001_initial','2021-12-07 07:49:05.337798'),(3,'admin','0001_initial','2021-12-07 07:49:05.703069'),(4,'admin','0002_logentry_remove_auto_add','2021-12-07 07:49:05.726228'),(5,'admin','0003_logentry_add_action_flag_choices','2021-12-07 07:49:05.742540'),(6,'app','0001_initial','2021-12-07 07:49:05.817116'),(7,'app','0002_rename_usersignup_create_user','2021-12-07 07:49:05.881894'),(8,'app','0003_auto_20211206_1039','2021-12-07 07:49:05.996911'),(9,'app','0004_alter_usersignup_name','2021-12-07 07:49:06.319989'),(10,'app','0005_alter_usersignup_name','2021-12-07 07:49:06.556264'),(11,'app','0006_delete_usersignup','2021-12-07 07:49:06.594187'),(12,'app','0007_account','2021-12-07 07:49:06.809692'),(13,'app','0008_auto_20211207_0723','2021-12-07 07:49:07.492385'),(14,'app','0009_auto_20211207_0726','2021-12-07 07:49:07.699270'),(15,'app','0010_auto_20211207_0732','2021-12-07 07:49:07.885890'),(16,'app','0011_auto_20211207_0732','2021-12-07 07:49:08.456183'),(17,'contenttypes','0002_remove_content_type_name','2021-12-07 07:49:08.704178'),(18,'auth','0002_alter_permission_name_max_length','2021-12-07 07:49:08.855893'),(19,'auth','0003_alter_user_email_max_length','2021-12-07 07:49:08.917610'),(20,'auth','0004_alter_user_username_opts','2021-12-07 07:49:08.934584'),(21,'auth','0005_alter_user_last_login_null','2021-12-07 07:49:09.065579'),(22,'auth','0006_require_contenttypes_0002','2021-12-07 07:49:09.073859'),(23,'auth','0007_alter_validators_add_error_messages','2021-12-07 07:49:09.095560'),(24,'auth','0008_alter_user_username_max_length','2021-12-07 07:49:09.281640'),(25,'auth','0009_alter_user_last_name_max_length','2021-12-07 07:49:09.434423'),(26,'auth','0010_alter_group_name_max_length','2021-12-07 07:49:09.483462'),(27,'auth','0011_update_proxy_permissions','2021-12-07 07:49:09.503454'),(28,'auth','0012_alter_user_first_name_max_length','2021-12-07 07:49:09.662132'),(29,'sessions','0001_initial','2021-12-07 07:49:09.774481'),(30,'app','0012_auto_20211207_0756','2021-12-07 07:56:19.156055'),(31,'app','0013_account_date_joined','2021-12-07 08:01:09.573225'),(32,'app','0014_account_is_admin','2021-12-07 08:02:07.636166'),(33,'app','0015_account_is_active','2021-12-07 08:02:41.881285'),(34,'app','0016_alter_account_phone','2021-12-07 08:14:05.301062'),(35,'app','0017_auto_20211207_1102','2021-12-07 11:03:00.230865'),(36,'app','0018_auto_20211207_1128','2021-12-07 11:28:21.621280'),(37,'app','0019_alter_account_email','2021-12-07 11:43:31.398359'),(38,'app','0020_alter_account_email','2021-12-07 12:06:19.332926'),(39,'app','0021_auto_20211208_0432','2021-12-08 04:32:09.292706'),(40,'adminpanel','0001_initial','2021-12-08 11:42:52.291122'),(41,'app','0022_alter_accounts_phone','2021-12-08 23:14:30.337232'),(42,'adminpanel','0002_auto_20211208_2356','2021-12-08 23:56:59.756536'),(43,'adminpanel','0003_alter_products_image','2021-12-09 00:04:50.496853'),(44,'adminpanel','0004_alter_products_image','2021-12-09 02:55:21.598437'),(45,'adminpanel','0005_delete_products','2021-12-09 03:15:56.910739'),(46,'adminpanel','0006_item','2021-12-09 03:27:27.694940'),(47,'adminpanel','0007_remove_item_discount','2021-12-09 04:37:44.975477'),(48,'adminpanel','0008_item_category','2021-12-09 04:42:01.795213'),(49,'otp','0001_initial','2021-12-09 13:16:57.233887'),(50,'adminpanel','0009_catgry','2021-12-12 04:10:54.900773'),(51,'adminpanel','0010_catgry_categoryname','2021-12-12 05:22:21.985022'),(52,'adminpanel','0011_remove_catgry_categoryname','2021-12-12 05:36:37.987667'),(53,'adminpanel','0012_catgry_catname','2021-12-12 11:39:39.255263'),(54,'adminpanel','0008_auto_20211213_1111','2021-12-13 11:11:09.424945'),(55,'adminpanel','0009_auto_20211213_1121','2021-12-13 11:21:10.012790'),(56,'adminpanel','0010_remove_catagry_category','2021-12-13 12:43:54.011507'),(57,'adminpanel','0011_remove_item_category','2021-12-13 12:45:26.880582'),(58,'adminpanel','0012_item_categry','2021-12-13 12:48:16.596586'),(59,'adminpanel','0013_auto_20211213_1326','2021-12-13 13:26:20.099382'),(60,'app','0023_address','2021-12-15 03:31:21.663907'),(61,'app','0024_address_is_active','2021-12-15 03:43:17.726453'),(62,'app','0025_address_state','2021-12-15 03:54:52.607882'),(63,'app','0026_wishlist','2021-12-15 08:49:31.396404'),(64,'app','0027_wishlist_user','2021-12-15 09:27:27.714290'),(65,'app','0028_cart','2021-12-15 16:10:25.604073'),(66,'app','0029_auto_20211216_0505','2021-12-16 05:05:37.321138'),(67,'adminpanel','0014_alter_item_price','2021-12-16 06:44:53.184835'),(68,'adminpanel','0015_auto_20211220_0513','2021-12-20 05:14:20.509594'),(69,'app','0030_address_phone','2021-12-20 10:46:11.364231'),(70,'app','0031_order','2021-12-21 10:31:42.772716'),(71,'app','0032_ordereditem','2021-12-21 11:16:34.074338'),(72,'adminpanel','0016_item_offerprice','2021-12-27 05:14:45.878594'),(73,'adminpanel','0017_alter_item_offerprice','2021-12-27 05:25:19.721462'),(74,'adminpanel','0018_alter_item_offerprice','2021-12-27 05:35:31.191089'),(75,'adminpanel','0019_catagry_discount','2021-12-27 06:44:59.404510'),(76,'app','0033_ordereditem_user','2021-12-28 05:20:39.912034'),(77,'app','0034_alter_ordereditem_user','2021-12-28 05:20:39.935378'),(78,'app','0035_remove_ordereditem_user','2021-12-28 05:20:40.108845'),(79,'app','0036_auto_20211222_1028','2021-12-28 05:20:40.624081'),(80,'app','0037_cart_offerprice','2021-12-28 05:20:40.763385'),(81,'app','0038_auto_20211227_0944','2021-12-28 05:20:41.196698'),(82,'app','0039_remove_cart_offerprice','2021-12-28 05:20:41.359507'),(83,'app','0040_cart_discountprice','2021-12-28 05:20:41.444392'),(84,'app','0041_remove_cart_discountprice','2021-12-28 05:20:41.595087'),(85,'app','0042_cart_discountprice','2021-12-28 05:22:23.005004'),(86,'adminpanel','0020_coupon','2021-12-28 06:33:43.145635'),(87,'app','0043_couponapplied','2021-12-29 04:03:20.670312'),(88,'app','0044_couponapplied_placed','2022-01-02 07:22:02.301300'),(89,'adminpanel','0021_alter_item_price','2022-01-05 08:59:02.874906'),(90,'product','0001_initial','2022-01-07 11:53:53.776631');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1k7g3obln907g66br0ri7em76pzf8ls5','eyJ1c2VyIjp0cnVlfQ:1mx2B4:JUTEgbDPqFaaesktWm19kk2DhMqU5qpx2uJug84DdEk','2021-12-28 07:24:46.259656'),('8l0uup5h2r30d267qqbw8smss0padoja','.eJxVjMsOgyAQRf-FdUNGVAa7arrvN5iBAaFVTHysmv57MXHj9pxz71fsq1_EXRDHND6GidIo3TyJm-hp32J_6D5xKeors-Q-Ph-C35SHuazytiQrj0SedpWvmf34PNvLQaQ1lrWzDKbRgCFoi7X2XACyrq0F1YIzyKgNQNChK6RqjFcVm05hgNASit8f99RADw:1n62iQ:2jRaWPCcRucxWl_4k3y27GSBcYPtXaQaxUldyfD9WTA','2022-01-22 03:48:26.502246'),('kxx80evhgmm5khnw76tbaia5409rn1id','.eJwdy8sKwyAQheF3mbUEjE0NrvomZaJSBXXECyGUvnunXX7n57yhBir-WWY-fAMDWqv7rpVWCgTM_t96wIYjPF4ZY1osZU5n7CHFPjhLzT7mVehkrRuLmvs9NykAXY4FzGjTC7A0K7HW27ILqAmtd2Ck_HwBaUkqBg:1n4xHe:-QK-gYA9aAeiix1Cy2qjeSbawQZvYClkrW-Xf0XL4Qo','2022-01-19 03:48:18.109891'),('qcg7rjwv1szi9qj6vw8hpw4r6ua0k3ow','.eJxVjMsOgyAUBf_lrg1BREBXTff9BgNcEFqFxseq6b8XGzduZ-acD7xDTm5I-2zcAj0IphjnddcIqEDjHBP027K7Cvb1H2gMcbqNs44TsXku1aD3LQyHHiKWorkyo-3LpUPgU6cxl1XalmjIkZDTruSR0U33s70cBL2GsrYGqeKCSu-FkY1wWIBE0RhDWUutkiiFotQL3xVSc-VYjapj0lPfagnfH5JFTH8:1n7FH0:8IPIfFmpU3vVhTC0r27PO_V-14bxoMs2Td6qstUwd7A','2022-01-25 11:25:06.562033'),('ul95lp8nuui0eetu7re68giad2smo184','.eJxVj0EOgyAURO_CuiGAAtpV033PYD78j9iqJKCrpncvJm7czrw3yXzZXiizOysRMmzxMS4wzdynhd3YAPsWhwMYJqyMlNfQgf_QejT4hnVMVVu3PDl-IPxsC38lpPl5speBCCVWW_QCSflWg1MWm2A1KtAkjEUtqPOdod6ElgRRgw2CNUar4IJsTYcWoI6mjMcNI39_wjBFGA:1n53FX:xwwvi5QB8TbFCp6cr92zhO_G8uwOWEa9hVa2_IpV-hk','2022-01-19 10:10:31.137217');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_profile`
--

DROP TABLE IF EXISTS `otp_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp` varchar(10) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `otp_profile_user_id_c19c827d_fk_app_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `app_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_profile`
--

LOCK TABLES `otp_profile` WRITE;
/*!40000 ALTER TABLE `otp_profile` DISABLE KEYS */;
INSERT INTO `otp_profile` VALUES (2,'7146',1);
/*!40000 ALTER TABLE `otp_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_banner`
--

DROP TABLE IF EXISTS `product_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_banner`
--

LOCK TABLES `product_banner` WRITE;
/*!40000 ALTER TABLE `product_banner` DISABLE KEYS */;
INSERT INTO `product_banner` VALUES (8,'banner/20220107121957banner2.jpeg'),(12,'banner/20220108035529banner2.jpeg');
/*!40000 ALTER TABLE `product_banner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-13 12:30:21
