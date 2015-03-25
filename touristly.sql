-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: touristly
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Flights','2014-03-30 16:09:10','2014-03-30 16:09:10'),(2,'Hotels','2014-03-30 16:09:10','2014-03-30 16:09:10'),(3,'Deals','2014-03-30 16:09:10','2014-03-30 16:09:10'),(4,'Shopping','2014-03-30 16:09:10','2014-03-30 16:09:10'),(5,'Souveniers','2014-03-30 16:09:10','2014-03-30 16:09:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (2,'Sara','Mak','saramak88@hotmail.com','How does this site work? ','2014-03-31 03:00:18','2014-03-31 03:00:18');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FeedId` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (3,5,'Kuala Lumpur','2014-04-01 04:07:05','2014-04-01 04:07:05'),(4,6,'New KL ','2014-04-01 04:36:26','2014-04-01 04:36:26');
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) DEFAULT NULL,
  `IsAdmin` tinyint(1) DEFAULT NULL,
  `IsSponsor` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Subtitle` varchar(255) DEFAULT NULL,
  `IsPublished` tinyint(1) DEFAULT NULL,
  `Description` text,
  `slug` varchar(255) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `Blurb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_feeds_on_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (5,'2',1,1,'2014-03-31 05:29:13','2014-04-10 05:08:19',1,'/uploads/gallery/image/9/klbg.jpg','Kuala Lumpur ','Malaysia ',1,'<h5 class=\"MsoNormal\" style=\"text-align: justify;\">A perfect blend of the old and the new, there is only one city that comes to mind that offers cultural versatility, a melting pot of delectable cuisines, sensational shopping experience and booming nightlife, Kuala Lumpur.</h5>\r\n<h5 class=\"MsoNormal\" style=\"text-align: justify;\">Whether it is for work or play Kuala Lumpur is the place to be. Explore a city that is filled with culture and heritage laced with a blanket of modern infrastructure. Discover many of Kuala Lumpur&rsquo;s hidden gems where you will get a dose of the various cultures and traditions oozing out of the city&rsquo;s many historic streets and buildings. A sight not to be missed will be the way in which the city skyline lights up the night sky which such wonder and splendour, it is truly a scenic view that will take your breath away.</h5>','kuala-lumpur',3.152857,101.686599,'Kuala Lumpur');
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_lists`
--

DROP TABLE IF EXISTS `friend_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `FriendUserId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_lists`
--

LOCK TABLES `friend_lists` WRITE;
/*!40000 ALTER TABLE `friend_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`) USING BTREE,
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`) USING BTREE,
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`) USING BTREE,
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendly_id_slugs`
--

LOCK TABLES `friendly_id_slugs` WRITE;
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `feeid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (9,'klbg',NULL,NULL,'klbg.jpg','2014-04-01 18:01:15','2014-04-01 18:01:15'),(14,'Kuala Lumpur Feed',5,NULL,'shutterstock_81698569.jpg','2014-04-08 11:33:53','2014-04-10 05:06:32'),(17,'Blue Aquarium - Sub 1 ',5,1,'2.jpg','2014-04-09 04:48:04','2014-04-09 04:48:04'),(18,'Blue Aquarium - Sub 2 ',5,1,'9.jpg','2014-04-09 04:48:41','2014-04-09 04:48:41'),(20,'Blue Aquarium - Sub 4 ',5,1,'15.jpg','2014-04-09 04:50:19','2014-04-09 04:50:19'),(21,'Blue Aquarium - Sub 5 ',5,1,'8.jpg','2014-04-09 04:50:51','2014-04-09 04:50:51'),(22,'Blue Aquarium - Sub 3 ',5,1,'6.jpg','2014-04-09 05:01:11','2014-04-09 05:01:11');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invited_to_trips`
--

DROP TABLE IF EXISTS `invited_to_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invited_to_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InviterId` int(11) DEFAULT NULL,
  `InviteeId` int(11) DEFAULT NULL,
  `NonMemberInviteeId` varchar(255) DEFAULT NULL,
  `TripId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invited_to_trips`
--

LOCK TABLES `invited_to_trips` WRITE;
/*!40000 ALTER TABLE `invited_to_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `invited_to_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itineraries`
--

DROP TABLE IF EXISTS `itineraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itineraries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `TripId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraries`
--

LOCK TABLES `itineraries` WRITE;
/*!40000 ALTER TABLE `itineraries` DISABLE KEYS */;
INSERT INTO `itineraries` VALUES (1,9,4,78,'2014-03-30 16:09:11','2014-03-30 16:09:11'),(2,9,4,78,'2014-03-30 16:09:11','2014-03-30 16:09:11'),(3,9,4,78,'2014-03-30 16:09:11','2014-03-30 16:09:11'),(4,9,4,78,'2014-03-30 16:09:11','2014-03-30 16:09:11'),(5,1,1,5,'2014-03-31 03:59:41','2014-03-31 03:59:41'),(7,2,1,10,'2014-04-01 08:17:16','2014-04-01 08:17:16'),(8,2,1,10,'2014-04-01 08:17:16','2014-04-01 08:17:16'),(9,2,1,10,'2014-04-01 09:18:40','2014-04-01 09:18:40'),(10,4,1,18,'2014-04-08 10:57:00','2014-04-08 10:57:00'),(13,5,1,26,'2014-04-08 15:27:35','2014-04-08 15:27:35'),(14,2,1,29,'2014-04-09 09:53:37','2014-04-09 09:53:37');
/*!40000 ALTER TABLE `itineraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `ContactPhone` varchar(255) DEFAULT NULL,
  `MobilePhone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'Bob Smith','Mr','Walmart','1','Malaysia','1','1','bobsmith@walmart.com','1','2014-03-30 16:09:11','2014-03-30 16:09:11'),(2,'Wishable','Mr','Wishable','Wishable','Malaysia','011 1111 111','011 1111 111','Wishable','1','2014-03-30 16:09:11','2014-03-30 16:09:11');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `PaymentId` varchar(255) DEFAULT NULL,
  `PaymentPortal` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `PayerId` varchar(255) DEFAULT NULL,
  `GatewayPrice` decimal(10,0) DEFAULT NULL,
  `GatewayCurrency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,NULL,NULL,'2014-03-30 16:09:11','2014-03-30 16:09:11',NULL,NULL,NULL),(2,1,NULL,NULL,NULL,'2014-03-30 16:09:11','2014-03-30 16:09:11',NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_feeds`
--

DROP TABLE IF EXISTS `page_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FeedList` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_feeds`
--

LOCK TABLES `page_feeds` WRITE;
/*!40000 ALTER TABLE `page_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture_galleries`
--

DROP TABLE IF EXISTS `picture_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `image_uid` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `TargetId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture_galleries`
--

LOCK TABLES `picture_galleries` WRITE;
/*!40000 ALTER TABLE `picture_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preview_sign_ups`
--

DROP TABLE IF EXISTS `preview_sign_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preview_sign_ups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preview_sign_ups`
--

LOCK TABLES `preview_sign_ups` WRITE;
/*!40000 ALTER TABLE `preview_sign_ups` DISABLE KEYS */;
INSERT INTO `preview_sign_ups` VALUES (3,'lpy.yen@gmail.com','2014-03-31 02:57:35','2014-03-31 02:57:35'),(4,'saramak88@hotmail.com','2014-03-31 02:57:41','2014-03-31 02:57:41'),(5,'tanseken@gmail.com','2014-03-31 02:57:48','2014-03-31 02:57:48'),(6,'rasheed@tarbush.com.my','2014-04-02 04:22:31','2014-04-02 04:22:31'),(7,'mrjefe@gmail.com','2014-04-02 05:22:44','2014-04-02 05:22:44'),(8,'aaron.sarma@gmail.com','2014-04-02 07:56:02','2014-04-02 07:56:02'),(9,'robertsolanes@hotmail.com','2014-04-02 10:51:15','2014-04-02 10:51:15'),(10,'zc-kh@hotmail.com','2014-04-03 06:57:02','2014-04-03 06:57:02'),(11,'farabf33@gmail.com','2014-04-03 07:10:19','2014-04-03 07:10:19');
/*!40000 ALTER TABLE `preview_sign_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_feeds`
--

DROP TABLE IF EXISTS `product_in_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_in_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `feedid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_feeds`
--

LOCK TABLES `product_in_feeds` WRITE;
/*!40000 ALTER TABLE `product_in_feeds` DISABLE KEYS */;
INSERT INTO `product_in_feeds` VALUES (1,2,5,'2014-03-30 16:09:11','2014-04-01 04:08:26'),(2,1,5,'2014-03-30 16:09:11','2014-04-01 04:08:31'),(4,3,5,'2014-03-30 16:09:11','2014-04-01 04:08:41'),(8,1,6,'2014-04-01 04:40:48','2014-04-01 04:40:48');
/*!40000 ALTER TABLE `product_in_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_lists`
--

DROP TABLE IF EXISTS `product_price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Price` decimal(10,0) DEFAULT NULL,
  `DayOfYear` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_lists`
--

LOCK TABLES `product_price_lists` WRITE;
/*!40000 ALTER TABLE `product_price_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_price_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `TargetURL` varchar(255) DEFAULT NULL,
  `Wants` int(11) DEFAULT NULL,
  `CreatedByUserId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `Currency` varchar(255) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `IsPublished` tinyint(1) DEFAULT NULL,
  `MerchantId` varchar(255) DEFAULT NULL,
  `SKUId` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `DestinationId` int(11) DEFAULT NULL,
  `Description` text,
  `Highlights` text,
  `Condition` text,
  `BasePrice` decimal(10,0) DEFAULT NULL,
  `DiscountPercentage` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `IsInfinite` tinyint(1) DEFAULT NULL,
  `Blurb` varchar(255) DEFAULT NULL,
  `Widget1` text,
  `Widget2` text,
  `ValidityStart` datetime DEFAULT NULL,
  `ValidityEnd` datetime DEFAULT NULL,
  `Address` text,
  `LocationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_products_on_slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Blue Coral Aquarium, Kuala Lumpur ','Blue Coral Aquarium ','/uploads/gallery/image/9/klbg.jpg','',NULL,1,'2014-03-30 16:09:11','2014-04-11 08:13:01','myr',20,1,'2','','3','2014-04-09 00:00:00','2014-04-22 00:00:00',4,'<p style=\"text-align: justify;\">At a loss on how to entertain your friends? Let us solve the dilemma&hellip; Enhance your outings and get closer with the underwater world. Step into the coolest aqua tropical rainforest aquarium in Kuala Lumpur!&nbsp;</p>\r\n<p style=\"text-align: justify;\">At Blue Coral Aquarium in KL Tower, come face to face with more than thousands of sea creatures living pleasantly under the ambience of rainforest concept in the Taman Bukit Nanas neighbourhood also known as the tropical forest bushes reserve. With coral fishes of different species such as Blueface Angelfish, Parrot Fish, Anthias Fish, Clown Fishes, Orbiculate Batfish and more, get an underwater adventure without even having to get in the water.</p>\r\n<p style=\"text-align: justify;\">Then, satisfy your appetite at the 360 degrees revolving restaurant in KL Tower, where you can feast eyes on the nostalgic menu and dine amid the quaint ambience. Follow this up by shopping in the Blur Coral Souvenir Shop where you get to use your free RM5 cash voucher.&nbsp;</p>\r\n<p style=\"text-align: justify;\">All the above from only RM8 per person!! Now isn&rsquo;t that a deal? Get it now and explore the enchanting sea world from another perspective!</p>','<ul>\r\n<li>Encounter sea creatures from Fiji, Hawaii, the Caribbean and more.</li>\r\n<li>Approx. 20-minute tour of fishes and sea stars moving through colourful corals in the rainforest-themed interiors.</li>\r\n<li>Video recording and photography allowed.&nbsp;</li>\r\n<li>Free admission for children aged 3 and below.</li>\r\n<li>Bookings for school tours, company trips, or group tours available. Call to enquire.</li>\r\n</ul>','<ul>\r\n<li>Redemption Period: 6 Jun 2013 - 31 Jul 2013</li>\r\n<li>No bookings required</li>\r\n<li>Unlimited purchase of vouchers per person</li>\r\n<li>May buy &amp; use many</li>\r\n<li>Original price per person is based on Blue Coral Aquarium\'s introductory price</li>\r\n<li>Voucher for 3 &amp; 5 people must be redeemed together</li>\r\n<li>Customers are allowed to bring their own camera but video recording is strictly not allowed</li>\r\n<li>Printed Touristly voucher is required upon redemption for verification purposes</li>\r\n<li>Cash vouchers cannot be combined &amp; is not valid with on-going promotions / discounts</li>\r\n<li>Cash vouchers are only valid for t-shirts at the Blue Coral souvenir shop (limit 1 cash voucher per t-shirt)</li>\r\n<li>For inquiries, kindly call Blue Coral Aquarium at 03-2026 2252 / email admin@bluecoralaquarium.my</li>\r\n</ul>',40,50,'blue-coral',1,'<p class=\"MsoNormal\"><span style=\"font-size: 1.875em;\">Come face to face with more than thousands of sea creatures, go under the sea at one of the world\'s tallest building&nbsp;</span></p>','<div id=\"TA_selfserveprop505\" class=\"TA_selfserveprop\">\r\n<ul id=\"bu95dD\" class=\"TA_links QSvPv4zSZMx\">\r\n<li id=\"sUey4SQcn5um\" class=\"f6P4TII\">\r\n<a target=\"_blank\" href=\"http://www.tripadvisor.com/\"><img src=\"http://www.tripadvisor.com/img/cdsi/img2/branding/150_logo-11900-2.png\" alt=\"TripAdvisor\"/></a>\r\n</li>\r\n</ul>\r\n</div>\r\n<script src=\"http://www.jscache.com/wejs?wtype=selfserveprop&amp;uniq=505&amp;locationId=4662787&amp;lang=en_US&amp;rating=true&amp;nreviews=0&amp;writereviewlink=false&amp;popIdx=true&amp;iswide=false&amp;border=false\"></script>\r\n','<iframe width=\"225\" height=\"210\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=aqua+blue+aquarium+kuala+lumpur&amp;aq=&amp;sll=35.532226,-95.712891&amp;sspn=40.933482,42.451172&amp;ie=UTF8&amp;hq=aqua+blue+aquarium+kuala+lumpur&amp;hnear=&amp;radius=15000&amp;ll=3.152439,101.703647&amp;spn=0.099241,0.082912&amp;t=m&amp;z=13&amp;iwloc=A&amp;cid=9860901996096234556&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=aqua+blue+aquarium+kuala+lumpur&amp;aq=&amp;sll=35.532226,-95.712891&amp;sspn=40.933482,42.451172&amp;ie=UTF8&amp;hq=aqua+blue+aquarium+kuala+lumpur&amp;hnear=&amp;radius=15000&amp;ll=3.152439,101.703647&amp;spn=0.099241,0.082912&amp;t=m&amp;z=13&amp;iwloc=A&amp;cid=9860901996096234556\" style=\"color:#0000FF;text-align:left\">View Larger Map</a></small>',NULL,NULL,'<p><span style=\"font-size: 0.9em;\">Lot GF-02, Menara Kuala Lumpur,</span><br /><span style=\"font-size: 0.9em;\">No.2 Jalan Punchak,</span><br /><span style=\"font-size: 0.9em;\">Off Jalan P. Ramlee, </span><br /><span style=\"font-size: 0.9em;\">Kuala Lumpur.&nbsp;</span></p>\r\n<p><span style=\"font-size: 0.9em;\">For enquiries: 03-2026 2252 or visit the&nbsp;<a href=\"http://www.bluecoralaquarium.my/contact.php.\" target=\"_blank\">Website<br /></a>For bookings for school tours, company trips, or group tours:</span><br /><span style=\"font-size: 0.9em;\">Call 012-382 3596 / 018-228 1931 or&nbsp;<a href=\"mailto:anniechee@bluecoralaquarium\" target=\"_blank\">Email</a></span></p>','Blue Coral Aquarium @ KL Tower'),(2,'Thaipusam','Cultural holiday','/uploads/gallery/image/7/shutterstock_141600259.jpg','http://www.tourism.gov.my/en/my/web-page/experiences',NULL,1,'2014-03-30 16:09:11','2014-04-01 04:09:38','myr',15,0,'2','','','2014-01-01 00:00:00','2015-01-01 00:00:00',3,'<p>Thaipusam \"Thaipoosam\" (Tamil: தைப்பூசம், Taippūcam ?)is a Hindu festival celebrated mostly by the Tamil community on the full moon in the Tamil month of Thai (January/February). It is mainly observed in countries where there is a significant presence of Tamil community such as India, Sri Lanka, Malaysia,[1] Mauritius[2] Singapore, Indonesia, Thailand and Myanmar[3] The word Thaipusam is a combination of the name of the month, Thai, and the name of a star, Pusam. This particular star is at its highest point during the festival. The festival commemorates the occasion when Parvati gave Murugan a Vel \"spear\" so he could vanquish the evil demon Soorapadman. There is a misconception among people that Thaipusam marks Murugan\'s birthday; however, it is believed that Vaikhasi Vishakam, which falls in the Vaikhasi month (May/June), is Murugan\'s birthday.[4]</p>','','',30,50,'thaipusam',1,'','','',NULL,NULL,NULL,NULL),(3,'Monkey forest','Buy stuff','/uploads/gallery/image/7/shutterstock_141600259.jpg','http://www.dailymail.co.uk/travel/article-616475/Shopping-bargains-New-York-despite-sterling-slump.html',2,1,'2014-03-30 16:09:11','2014-04-01 04:09:47','myr',20,0,'2','','','2014-01-01 00:00:00','2015-01-01 00:00:00',3,'<p>Tourist development in Padangtegal village basically uses tourist cultural concept. That concept is chosen with consideration, that this village has art and culture potential. Moreover, both things are used as the main appeal for making tourists come to Padangtegal and one of interesting place to visit is monkey forest area. Because of that reason, that is why every steps to develop of tourist industry which is hoped to care our art and culture also make these as village assets. Furthermore, there is a moral responsibility to have policies for using our art and culture potentials, take as examples, for using Balinese style in architecture, souvenir and promotion goods.</p>','','',30,33,'monkey-forest',1,'','','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140329082642'),('20140330090732'),('20140330175845'),('20140331084633'),('20140401182321'),('20140405005748'),('20140405090739'),('20140405090816'),('20140410203738'),('20140411033545');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trending_tags`
--

DROP TABLE IF EXISTS `trending_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trending_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tags` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trending_tags`
--

LOCK TABLES `trending_tags` WRITE;
/*!40000 ALTER TABLE `trending_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `trending_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `feedid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `TripCreator` int(11) DEFAULT NULL,
  `DestinationId` varchar(255) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,9,3,'2014-03-30 16:09:11','2014-03-30 16:09:11',9,'2','2014-04-10 00:00:00','2014-04-14 00:00:00'),(2,9,3,'2014-03-30 16:09:11','2014-03-30 16:09:11',9,'2','2014-03-03 00:00:00','2014-03-29 00:00:00'),(3,9,3,'2014-03-30 16:09:11','2014-03-30 16:09:11',9,'2','2014-03-04 00:00:00','2014-03-14 00:00:00'),(7,2,6,'2014-04-01 04:37:59','2014-04-01 04:37:59',2,'4','2014-04-03 00:00:00','2014-04-04 00:00:00'),(8,5,6,'2014-04-01 04:57:01','2014-04-01 04:57:01',5,'4','2014-04-28 00:00:00','2014-05-03 00:00:00'),(9,5,6,'2014-04-01 04:58:30','2014-04-01 04:58:30',5,'4','2014-05-02 00:00:00','2014-05-03 00:00:00'),(10,2,5,'2014-04-01 08:16:12','2014-04-01 08:16:12',2,'3','2014-04-03 00:00:00','2014-04-05 00:00:00'),(11,1,5,'2014-04-01 20:32:01','2014-04-01 20:32:01',1,NULL,'2014-04-01 00:00:00','2014-04-15 00:00:00'),(12,1,5,'2014-04-01 20:33:41','2014-04-01 20:33:41',1,NULL,'2014-04-01 00:00:00','2014-04-09 00:00:00'),(13,2,5,'2014-04-02 03:54:08','2014-04-02 03:54:08',2,NULL,'2014-04-02 00:00:00','2014-04-04 00:00:00'),(14,2,5,'2014-04-02 04:58:23','2014-04-02 04:58:23',2,NULL,'2014-04-08 00:00:00','2014-04-09 00:00:00'),(15,4,5,'2014-04-02 07:57:45','2014-04-02 07:57:45',4,NULL,'2013-12-02 00:00:00','2014-01-08 00:00:00'),(16,4,5,'2014-04-02 10:13:53','2014-04-02 10:13:53',4,NULL,'2014-04-09 00:00:00','2014-04-21 00:00:00'),(17,4,5,'2014-04-02 14:54:43','2014-04-02 14:54:43',4,NULL,'2014-04-16 00:00:00','2014-04-29 00:00:00'),(18,4,5,'2014-04-03 11:28:02','2014-04-03 11:28:02',4,NULL,'2014-04-24 00:00:00','2014-05-05 00:00:00'),(19,5,5,'2014-04-03 12:00:50','2014-04-03 12:00:50',5,NULL,'2014-04-22 00:00:00','2014-04-25 00:00:00'),(20,5,5,'2014-04-07 03:20:01','2014-04-07 03:20:01',5,NULL,'2014-04-16 00:00:00','2014-04-18 00:00:00'),(21,5,5,'2014-04-07 03:25:02','2014-04-08 09:44:25',5,NULL,'2014-04-12 00:00:00','2014-05-22 00:00:00'),(22,2,5,'2014-04-08 10:18:42','2014-04-08 10:18:42',2,NULL,'2014-04-09 00:00:00','2014-04-15 00:00:00'),(23,2,5,'2014-04-08 10:38:25','2014-04-08 10:38:25',2,NULL,'2014-04-16 00:00:00','2014-04-23 00:00:00'),(24,2,5,'2014-04-08 11:01:43','2014-04-08 11:01:43',2,NULL,'2014-04-16 00:00:00','2014-04-18 00:00:00'),(25,1,5,'2014-04-08 11:41:02','2014-04-08 11:41:02',1,NULL,'2014-04-16 00:00:00','2014-04-30 00:00:00'),(26,5,5,'2014-04-08 15:18:05','2014-04-08 15:18:05',5,NULL,'2014-04-24 00:00:00','2014-05-09 00:00:00'),(27,1,5,'2014-04-09 01:17:04','2014-04-09 01:17:04',1,NULL,'2014-04-03 00:00:00','2014-04-17 00:00:00'),(28,2,5,'2014-04-09 08:29:03','2014-04-09 08:29:03',2,NULL,'2014-04-10 00:00:00','2014-04-12 00:00:00'),(29,2,5,'2014-04-09 09:24:25','2014-04-09 09:24:25',2,NULL,'2014-04-11 00:00:00','2014-04-14 00:00:00'),(30,1,5,'2014-04-11 02:35:14','2014-04-11 02:35:14',1,NULL,'2014-04-16 00:00:00','2014-04-18 00:00:00'),(31,1,5,'2014-04-11 05:44:50','2014-04-11 05:44:50',1,NULL,'2014-05-01 00:00:00','2014-05-10 00:00:00');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `StreetAddr` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Zipcode` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Income` int(11) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `IsReceiveWeekly` tinyint(1) DEFAULT NULL,
  `IsReceiveTripUpdate` tinyint(1) DEFAULT NULL,
  `IsReceiveTripUserUpdate` tinyint(1) DEFAULT NULL,
  `IsReceivePromo` tinyint(1) DEFAULT NULL,
  `Credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,NULL,NULL,NULL,'uacbrvu_fallerson_1394718618@tfbnw.net',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-30 16:09:11','2014-03-30 16:09:11',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_shopping_carts`
--

DROP TABLE IF EXISTS `user_shopping_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_shopping_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `isshow` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `IsBought` tinyint(1) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `VoucherCode` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `TripId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_shopping_carts`
--

LOCK TABLES `user_shopping_carts` WRITE;
/*!40000 ALTER TABLE `user_shopping_carts` DISABLE KEYS */;
INSERT INTO `user_shopping_carts` VALUES (1,9,4,1,'2014-03-30 16:09:11','2014-03-30 16:09:11',0,'Monkey forest',20.00,NULL,2,NULL,78),(2,1,1,1,'2014-03-31 03:59:41','2014-03-31 03:59:41',0,'Shopping',20.00,NULL,1,NULL,5),(3,5,1,0,'2014-04-01 04:57:21','2014-04-01 04:58:13',0,'Elephants',20.00,NULL,1,NULL,8),(4,2,1,1,'2014-04-01 08:17:16','2014-04-01 09:18:40',0,'Elephants',20.00,NULL,3,NULL,10),(5,4,1,1,'2014-04-08 10:57:00','2014-04-08 10:57:00',0,'Blue Coral Aquarium, Kuala Lumpur ',20.00,NULL,1,NULL,18),(6,5,1,0,'2014-04-08 15:18:49','2014-04-08 15:18:57',0,'Blue Coral Aquarium, Kuala Lumpur ',20.00,NULL,1,NULL,26),(7,5,1,0,'2014-04-08 15:27:24','2014-04-08 15:27:42',0,'Blue Coral Aquarium, Kuala Lumpur ',20.00,NULL,2,NULL,26),(8,2,1,1,'2014-04-09 09:53:37','2014-04-09 09:53:37',0,'Blue Coral Aquarium, Kuala Lumpur ',20.00,NULL,1,NULL,29);
/*!40000 ALTER TABLE `user_shopping_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wants`
--

DROP TABLE IF EXISTS `user_wants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wants`
--

LOCK TABLES `user_wants` WRITE;
/*!40000 ALTER TABLE `user_wants` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tzuchjeh@gmail.com','$2a$10$1Iyo0O5mYADwD5E0ZY60Cuq/LSx5M3K1ITy9/3rbIRZXPElpuYUK2',NULL,NULL,NULL,75,'2014-04-12 17:33:33','2014-04-11 05:44:19','124.195.129.112','124.195.129.112','2014-03-30 16:09:10','2014-04-12 17:33:33',NULL,1,NULL,NULL),(2,'saramak628811@gmail.com','$2a$10$FXLiA0tI8r2zke2bs5zDzeoSyWPwlp0GihVSuAQvSbmRoqv2wTEgK',NULL,NULL,NULL,12,'2014-04-11 02:28:54','2014-04-10 03:17:19','175.136.218.133','175.136.218.133','2014-03-30 16:09:10','2014-04-11 02:28:54',NULL,1,NULL,NULL),(3,'aaron.sarma@gmail.com','$2a$10$bSHeLmRt7uri8zNVYG88eutPJvQ2LT1GMj21Sr9IpIfihg/Be9dcq',NULL,NULL,NULL,1,'2014-02-27 08:58:18','2014-02-27 08:58:18','127.0.0.1','127.0.0.1','2014-03-30 16:09:10','2014-03-30 16:09:10',NULL,1,NULL,NULL),(4,'anrisuzuki@outlook.com','$2a$10$FcTygafanBjFdl5MoWDxzuUiJ.8k0BpvzXgme1ssikb9KQuPiHsWe',NULL,NULL,NULL,5,'2014-04-07 03:21:04','2014-04-02 10:12:47','175.136.204.222','60.54.37.68','2014-03-30 16:09:10','2014-04-07 03:21:04',NULL,NULL,NULL,NULL),(5,'tanseken@gmail.com','$2a$10$Kwtqvb66kVoL103uwPsEKOYhg.O6L14vLAdcdhfT7P5TdhFCIH10C',NULL,NULL,NULL,11,'2014-04-11 06:44:55','2014-04-11 01:07:09','175.136.218.133','175.136.218.133','2014-03-30 16:09:10','2014-04-11 06:44:55',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-13 14:10:15
