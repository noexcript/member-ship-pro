-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
-- 
-- Host: localhost    Database: members_v2
----------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 
-- Table structure for table `banlist`
-- 
use db_member;

DROP TABLE IF EXISTS `banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('IP','Email') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'IP',
  `comment` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ban_ip` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `banlist` WRITE;
/*!40000 ALTER TABLE `banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `banlist` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `cart`
-- 

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `membership_id` int unsigned NOT NULL DEFAULT '0',
  `coupon_id` int unsigned NOT NULL DEFAULT '0',
  `tax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totaltax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `originalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `cart_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_membership` (`membership_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `cart`
-- 

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,3,0,0.00,0.00,0.00,6.99,6.99,6.99,NULL,NULL,'2024-07-29 18:33:03');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `countries`
-- 

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `abbr` varchar(2) NOT NULL,
  `name` varchar(70) NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `home` tinyint unsigned NOT NULL DEFAULT '0',
  `vat` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `sorting` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `abbrv` (`abbr`)
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `countries`
-- 

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',1,0,1.25,0),(2,'AL','Albania',1,0,0.00,0),(3,'DZ','Algeria',1,0,0.50,0),(4,'AS','American Samoa',1,0,0.00,0),(5,'AD','Andorra',1,0,0.00,0),(6,'AO','Angola',1,0,0.00,0),(7,'AI','Anguilla',1,0,0.00,0),(8,'AQ','Antarctica',1,0,0.00,0),(9,'AG','Antigua and Barbuda',1,0,0.00,0),(10,'AR','Argentina',1,0,0.00,0),(11,'AM','Armenia',1,0,0.00,0),(12,'AW','Aruba',1,0,0.00,0),(13,'AU','Australia',1,0,0.00,0),(14,'AT','Austria',1,0,0.00,0),(15,'AZ','Azerbaijan',1,0,0.00,0),(16,'BS','Bahamas',1,0,0.00,0),(17,'BH','Bahrain',1,0,0.00,0),(18,'BD','Bangladesh',1,0,0.00,0),(19,'BB','Barbados',1,0,0.00,0),(20,'BY','Belarus',1,0,0.00,0),(21,'BE','Belgium',1,0,0.00,0),(22,'BZ','Belize',1,0,0.00,0),(23,'BJ','Benin',1,0,0.00,0),(24,'BM','Bermuda',1,0,0.00,0),(25,'BT','Bhutan',1,0,0.00,0),(26,'BO','Bolivia',1,0,0.00,0),(27,'BA','Bosnia and Herzegowina',1,0,0.00,0),(28,'BW','Botswana',1,0,0.00,0),(29,'BV','Bouvet Island',1,0,0.00,0),(30,'BR','Brazil',1,0,0.00,0),(31,'IO','British Indian Ocean Territory',1,0,0.00,0),(32,'VG','British Virgin Islands',1,0,0.00,0),(33,'BN','Brunei Darussalam',1,0,0.00,0),(34,'BG','Bulgaria',1,0,0.00,0),(35,'BF','Burkina Faso',1,0,0.00,0),(36,'BI','Burundi',1,0,0.00,0),(37,'KH','Cambodia',1,0,0.00,0),(38,'CM','Cameroon',1,0,0.00,0),(39,'CA','Canada',1,1,13.00,1000),(40,'CV','Cape Verde',1,0,0.00,0),(41,'KY','Cayman Islands',1,0,0.00,0),(42,'CF','Central African Republic',1,0,0.00,0),(43,'TD','Chad',1,0,0.00,0),(44,'CL','Chile',1,0,0.00,0),(45,'CN','China',1,0,0.00,0),(46,'CX','Christmas Island',1,0,0.00,0),(47,'CC','Cocos (Keeling) Islands',1,0,0.00,0),(48,'CO','Colombia',1,0,0.00,0),(49,'KM','Comoros',1,0,0.00,0),(50,'CG','Congo',1,0,0.00,0),(51,'CK','Cook Islands',1,0,0.00,0),(52,'CR','Costa Rica',1,0,0.00,0),(53,'CI','Cote D\'ivoire',1,0,0.00,0),(54,'HR','Croatia',1,0,0.00,0),(55,'CU','Cuba',1,0,0.00,0),(56,'CY','Cyprus',1,0,0.00,0),(57,'CZ','Czech Republic',1,0,0.00,0),(58,'DK','Denmark',1,0,0.00,0),(59,'DJ','Djibouti',1,0,0.00,0),(60,'DM','Dominica',1,0,0.00,0),(61,'DO','Dominican Republic',1,0,0.00,0),(62,'TP','East Timor',1,0,0.00,0),(63,'EC','Ecuador',1,0,0.00,0),(64,'EG','Egypt',1,0,0.00,0),(65,'SV','El Salvador',1,0,0.00,0),(66,'GQ','Equatorial Guinea',1,0,0.00,0),(67,'ER','Eritrea',1,0,0.00,0),(68,'EE','Estonia',1,0,0.00,0),(69,'ET','Ethiopia',1,0,0.00,0),(70,'FK','Falkland Islands (Malvinas)',1,0,0.00,0),(71,'FO','Faroe Islands',1,0,0.00,0),(72,'FJ','Fiji',1,0,0.00,0),(73,'FI','Finland',1,0,0.00,0),(74,'FR','France',1,0,0.00,0),(75,'GF','French Guiana',1,0,0.00,0),(76,'PF','French Polynesia',1,0,0.00,0),(77,'TF','French Southern Territories',1,0,0.00,0),(78,'GA','Gabon',1,0,0.00,0),(79,'GM','Gambia',1,0,0.00,0),(80,'GE','Georgia',1,0,0.00,0),(81,'DE','Germany',1,0,0.00,0),(82,'GH','Ghana',1,0,0.00,0),(83,'GI','Gibraltar',1,0,0.00,0),(84,'GR','Greece',1,0,0.00,0),(85,'GL','Greenland',1,0,0.00,0),(86,'GD','Grenada',1,0,0.00,0),(87,'GP','Guadeloupe',1,0,0.00,0),(88,'GU','Guam',1,0,0.00,0),(89,'GT','Guatemala',1,0,0.00,0),(90,'GN','Guinea',1,0,0.00,0),(91,'GW','Guinea-Bissau',1,0,0.00,0),(92,'GY','Guyana',1,0,0.00,0),(93,'HT','Haiti',1,0,0.00,0),(94,'HM','Heard and McDonald Islands',1,0,0.00,0),(95,'HN','Honduras',1,0,0.00,0),(96,'HK','Hong Kong',1,0,0.00,0),(97,'HU','Hungary',1,0,0.00,0),(98,'IS','Iceland',1,0,0.00,0),(99,'IN','India',1,0,0.00,0),(100,'ID','Indonesia',1,0,0.00,0),(101,'IQ','Iraq',1,0,0.00,0),(102,'IE','Ireland',1,0,0.00,0),(103,'IR','Islamic Republic of Iran',1,0,0.00,0),(104,'IL','Israel',1,0,0.00,0),(105,'IT','Italy',1,0,0.00,0),(106,'JM','Jamaica',1,0,0.00,0),(107,'JP','Japan',1,0,0.00,0),(108,'JO','Jordan',1,0,0.00,0),(109,'KZ','Kazakhstan',1,0,0.00,0),(110,'KE','Kenya',1,0,0.00,0),(111,'KI','Kiribati',1,0,0.00,0),(112,'KP','Korea, Dem. Peoples Rep of',1,0,0.00,0),(113,'KR','Korea, Republic of',1,0,0.00,0),(114,'KW','Kuwait',1,0,0.00,0),(115,'KG','Kyrgyzstan',1,0,0.00,0),(116,'LA','Laos',1,0,0.00,0),(117,'LV','Latvia',1,0,0.00,0),(118,'LB','Lebanon',1,0,0.00,0),(119,'LS','Lesotho',1,0,0.00,0),(120,'LR','Liberia',1,0,0.00,0),(121,'LY','Libyan Arab Jamahiriya',1,0,0.00,0),(122,'LI','Liechtenstein',1,0,0.00,0),(123,'LT','Lithuania',1,0,0.00,0),(124,'LU','Luxembourg',1,0,0.00,0),(125,'MO','Macau',1,0,0.00,0),(126,'MK','Macedonia',1,0,0.00,0),(127,'MG','Madagascar',1,0,0.00,0),(128,'MW','Malawi',1,0,0.00,0),(129,'MY','Malaysia',1,0,0.00,0),(130,'MV','Maldives',1,0,0.00,0),(131,'ML','Mali',1,0,0.00,0),(132,'MT','Malta',1,0,0.00,0),(133,'MH','Marshall Islands',1,0,0.00,0),(134,'MQ','Martinique',1,0,0.00,0),(135,'MR','Mauritania',1,0,0.00,0),(136,'MU','Mauritius',1,0,0.00,0),(137,'YT','Mayotte',1,0,0.00,0),(138,'MX','Mexico',1,0,0.00,0),(139,'FM','Micronesia',1,0,0.00,0),(140,'MD','Moldova, Republic of',1,0,0.00,0),(141,'MC','Monaco',1,0,0.00,0),(142,'MN','Mongolia',1,0,0.00,0),(143,'MS','Montserrat',1,0,0.00,0),(144,'MA','Morocco',1,0,0.00,0),(145,'MZ','Mozambique',1,0,0.00,0),(146,'MM','Myanmar',1,0,0.00,0),(147,'NA','Namibia',1,0,0.00,0),(148,'NR','Nauru',1,0,0.00,0),(149,'NP','Nepal',1,0,0.00,0),(150,'NL','Netherlands',1,0,0.00,0),(151,'AN','Netherlands Antilles',1,0,0.00,0),(152,'NC','New Caledonia',1,0,0.00,0),(153,'NZ','New Zealand',1,0,0.00,0),(154,'NI','Nicaragua',1,0,0.00,0),(155,'NE','Niger',1,0,0.00,0),(156,'NG','Nigeria',1,0,0.00,0),(157,'NU','Niue',1,0,0.00,0),(158,'NF','Norfolk Island',1,0,0.00,0),(159,'MP','Northern Mariana Islands',1,0,0.00,0),(160,'NO','Norway',1,0,0.00,0),(161,'OM','Oman',1,0,0.00,0),(162,'PK','Pakistan',1,0,0.00,0),(163,'PW','Palau',1,0,0.00,0),(164,'PA','Panama',1,0,0.00,0),(165,'PG','Papua New Guinea',1,0,0.00,0),(166,'PY','Paraguay',1,0,0.00,0),(167,'PE','Peru',1,0,0.00,0),(168,'PH','Philippines',1,0,0.00,0),(169,'PN','Pitcairn',1,0,0.00,0),(170,'PL','Poland',1,0,0.00,0),(171,'PT','Portugal',1,0,0.00,0),(172,'PR','Puerto Rico',1,0,0.00,0),(173,'QA','Qatar',1,0,0.00,0),(174,'RE','Reunion',1,0,0.00,0),(175,'RO','Romania',1,0,0.00,0),(176,'RU','Russian Federation',1,0,0.00,0),(177,'RW','Rwanda',1,0,0.00,0),(178,'LC','Saint Lucia',1,0,0.00,0),(179,'WS','Samoa',1,0,0.00,0),(180,'SM','San Marino',1,0,0.00,0),(181,'ST','Sao Tome and Principe',1,0,0.00,0),(182,'SA','Saudi Arabia',1,0,0.00,0),(183,'SN','Senegal',1,0,0.00,0),(184,'RS','Serbia',1,0,0.00,0),(185,'SC','Seychelles',1,0,0.00,0),(186,'SL','Sierra Leone',1,0,0.00,0),(187,'SG','Singapore',1,0,0.00,0),(188,'SK','Slovakia',1,0,0.00,0),(189,'SI','Slovenia',1,0,0.00,0),(190,'SB','Solomon Islands',1,0,0.00,0),(191,'SO','Somalia',1,0,0.00,0),(192,'ZA','South Africa',1,0,0.00,0),(193,'ES','Spain',1,0,0.00,0),(194,'LK','Sri Lanka',1,0,0.00,0),(195,'SH','St. Helena',1,0,0.00,0),(196,'KN','St. Kitts and Nevis',1,0,0.00,0),(197,'PM','St. Pierre and Miquelon',1,0,0.00,0),(198,'VC','St. Vincent and the Grenadines',1,0,0.00,0),(199,'SD','Sudan',1,0,0.00,0),(200,'SR','Suriname',1,0,0.00,0),(201,'SJ','Svalbard and Jan Mayen Islands',1,0,0.00,0),(202,'SZ','Swaziland',1,0,0.00,0),(203,'SE','Sweden',1,0,0.00,0),(204,'CH','Switzerland',1,0,0.00,0),(205,'SY','Syrian Arab Republic',1,0,0.00,0),(206,'TW','Taiwan',1,0,0.00,0),(207,'TJ','Tajikistan',1,0,0.00,0),(208,'TZ','Tanzania, United Republic of',1,0,0.00,0),(209,'TH','Thailand',1,0,0.00,0),(210,'TG','Togo',1,0,0.00,0),(211,'TK','Tokelau',1,0,0.00,0),(212,'TO','Tonga',1,0,0.00,0),(213,'TT','Trinidad and Tobago',1,0,0.00,0),(214,'TN','Tunisia',1,0,0.00,0),(215,'TR','Turkey',1,0,0.00,0),(216,'TM','Turkmenistan',1,0,0.00,0),(217,'TC','Turks and Caicos Islands',1,0,0.00,0),(218,'TV','Tuvalu',1,0,0.00,0),(219,'UG','Uganda',1,0,0.00,0),(220,'UA','Ukraine',1,0,0.00,0),(221,'AE','United Arab Emirates',1,0,0.00,0),(222,'GB','United Kingdom (GB)',1,0,23.00,999),(224,'US','United States',1,0,7.50,998),(225,'VI','United States Virgin Islands',1,0,0.00,0),(226,'UY','Uruguay',1,0,0.00,0),(227,'UZ','Uzbekistan',1,0,0.00,0),(228,'VU','Vanuatu',1,0,0.00,0),(229,'VA','Vatican City State',1,0,0.00,0),(230,'VE','Venezuela',1,0,0.00,0),(231,'VN','Vietnam',1,0,0.00,0),(232,'WF','Wallis And Futuna Islands',1,0,0.00,0),(233,'EH','Western Sahara',1,0,0.00,0),(234,'YE','Yemen',1,0,0.00,0),(235,'ZR','Zaire',1,0,0.00,0),(236,'ZM','Zambia',1,0,0.00,0),(237,'ZW','Zimbabwe',1,0,0.00,0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `coupons`
-- 

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(30) NOT NULL,
  `discount` smallint unsigned NOT NULL DEFAULT '0',
  `type` enum('p','a') NOT NULL DEFAULT 'p',
  `membership_id` varchar(50) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `coupons`
-- 

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'10 percent off','12345',10,'p','3,5','2016-05-12 20:21:27',1),(2,'10 Dollars off','45678',4,'a','2,3,4,5,1','2016-08-19 15:38:04',1);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `cronjobs`
-- 

DROP TABLE IF EXISTS `cronjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronjobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `membership_id` int unsigned NOT NULL DEFAULT '0',
  `stripe_customer` varchar(60) NOT NULL,
  `stripe_pm` varchar(80) NOT NULL,
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `renewal` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_membership_id` (`membership_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `cronjobs`
-- 

LOCK TABLES `cronjobs` WRITE;
/*!40000 ALTER TABLE `cronjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronjobs` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `custom_fields`
-- 

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `tooltip` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `required` tinyint unsigned NOT NULL DEFAULT '0',
  `section` varchar(30) DEFAULT NULL,
  `sorting` int unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `custom_fields`
-- 

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `downloads`
-- 

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(60) NOT NULL,
  `name` varchar(80) NOT NULL,
  `filesize` int unsigned NOT NULL,
  `extension` varchar(4) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `fileaccess` varchar(24) NOT NULL DEFAULT '0' COMMENT '0 = all',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `downloads`
-- 

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `email_templates`
-- 

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `help` tinytext,
  `body` text NOT NULL,
  `type` enum('news','mailer') DEFAULT 'mailer',
  `typeid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `email_templates`
-- 

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'Registration Email','Please verify your email','This template is used to send Registration Verification Email, when Configuration Registration Verification is set to YES','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"e036b6jq8u1u\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"4q0ezesrmapj\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"background: #EFF8FF; border-radius: 12px; padding:14px\">The administrator of this site has requested all new accounts to be activated by the users who created them thus your account is currently inactive. To activate your account, please visit the link below.</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\">Activate your account</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"3f06iim5p7u3\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"ger80dm1r3v7\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"5zmro5phptef\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','regMail'),(2,'Welcome Mail From Admin','You have been registered','This template is used to send welcome email, when user is added by administrator','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"nx5t5w9hxjjw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"tdillwcpct3m\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You\'re now a member of [SITE_NAME].</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nhnhstrwuw40\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"imaq57xdbyr5\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"icgjxbn8ed8f\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','regMailAdmin'),(3,'Default Newsletter','Newsletter','This is a default newsletter template','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"t3awwxkkek38\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_envelope.svg\" style=\"width:170px\" data-image=\"y21lpynr8eyi\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">[ATTACHMENT] </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left;\">Newsletter content goes here...  </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"o4y1qq9ya3u9\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"5vic7v3epyz7\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"v4leysp717al\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','newsletter'),(4,'Single Email','Single User Email','This template is used to email single user','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"1nga2mnv0u9a\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"yz7ot90jjgsr\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]</p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\"> Your message goes here... </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"o9qwfphwdsqc\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"9rwzrav4kwxv\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"8s5vfq2ueb93\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','singleMail'),(5,'Forgot Password Admin','Password Reset','This template is used for retrieving lost admin password','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"k1zba5ll6zwg\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_password.svg\" style=\"width:170px\" data-image=\"w7w4byt2ycsc\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">it seems that you or someone requested a new password for you. </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">We have generated a new password, as requested. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to password reset page</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nbt21yllo1i5\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"t5dq2gjz0vm2\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"od5705rjhb5w\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','adminPassReset'),(6,'Forgot Password User','Password Reset','This template is used for retrieving lost user password','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"cuabtjclmfqw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_password.svg\" style=\"width:170px\" data-image=\"th79hxnb3ati\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">it seems that you or someone requested a new password for you. </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">We have generated a new password, as requested. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to password reset page</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"dug5xsfwxhzo\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"ilyvv0fxmi4d\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"ebgqwv983ozo\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','userPassReset'),(7,'Welcome Email','Welcome','This template is used to welcome newly registered user when Configuration->Registration Verification and Configuration->Auto Registration are both set to YES','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"nx5t5w9hxjjw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"tdillwcpct3m\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You\'re now a member of [SITE_NAME].</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nhnhstrwuw40\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"imaq57xdbyr5\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"icgjxbn8ed8f\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','welcomeEmail'),(8,'Registration Pending','Registration Verification Pending','This template is used to send Registration Verification Email, when Configuration->Auto Registration is set to NO','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"k374krla5wrr\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"qra15dri8k2f\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"background: #EFF8FF; border-radius: 12px; padding:14px\">The administrator of this site has requested all new accounts to be activated manually. Your account is currently pending verification process. You will be notify once its activated.</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"rts6uvekmpb1\"></a>\r\n<a href=\"https://facebook.com/[FB]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"e6p1ivhp3ujq\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"yow3f4jrns6h\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','regMailPending'),(9,'Notify Admin','New User Registration','This template is used to notify admin of new registration when Configuration->Registration Notification is set to YES','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"xf2oy38egsxw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_user.svg\" style=\"width:170px\" data-image=\"stbk9ea9r33z\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have a new user registration. </p>\r\n				<p style=\"margin-bottom:2px; color:#7E8299\">You can login into your admin panel to view details:</p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Email: [EMAIL]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Name: [NAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"qvzy4b14h1mx\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"2wlhqz3dz3be\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"oj7fgnvph7jm\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','notifyAdmin'),(10,'Contact Request','Contact Inquiry','This template is used to send default Contact Request Form','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"ywpos41bfvx0\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_envelope.svg\" style=\"width:170px\" data-image=\"kciweuwcn8dp\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have a new contact request: </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">From: [NAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Email: [EMAIL] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Telephone: [PHONE] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Subject: [MAILSUBJECT] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP] </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left;\"> [MESSAGE] </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"sg1gbyqyjz48\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"6qccmsconfri\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"xvyiw16bmplc\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','contact'),(11,'Transaction Completed Admin','Payment Completed','This template is used to notify administrator on successful payment transaction','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"338z2e6crnf7\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_payment.svg\" style=\"width:170px\" data-image=\"51hzxn30s9q5\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have received new payment following: </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [NAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Membership: [ITEMNAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Price: [PRICE]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Status: [STATUS]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Processor: [PP]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"x4z9u3sx4rup\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"vcads5ej3eme\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"n51e4y5e3st0\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','payComplete'),(12,'Transaction Completed User','Payment Completed','This template is used to notify user on successful payment transaction','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"338z2e6crnf7\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_payment.svg\" style=\"width:170px\" data-image=\"51hzxn30s9q5\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Your payment has been completed successfully: </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Membership: [ITEMNAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Price: [PRICE]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">VAT/TAX: [TAX]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Discount: [COUPON]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Status: [STATUS]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Processor: [PP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"x4z9u3sx4rup\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"vcads5ej3eme\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"n51e4y5e3st0\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','payCompleteUser'),(13,'Membership Expired','Membership Has Expired','This template is used to notify user when membership is about to expire a day before. ','<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"96wzboz0ihr4\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_membership.svg\" style=\"width:170px\" data-image=\"snecu3fz98bu\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#F44336\">Your current membership has expired! </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">Please login to your user panel to extend or upgrade your membership.. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"gj75tx95851x\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"0yrtm40v9wm8\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"lz2511lnq040\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>','mailer','memExpired');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `gateways`
-- 

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `dir` varchar(30) NOT NULL,
  `live` tinyint unsigned NOT NULL DEFAULT '1',
  `extra_txt` varchar(120) DEFAULT NULL,
  `extra_txt2` varchar(120) DEFAULT NULL,
  `extra_txt3` varchar(120) DEFAULT NULL,
  `extra` varchar(120) NOT NULL,
  `extra2` varchar(120) DEFAULT NULL,
  `extra3` varchar(120) DEFAULT NULL,
  `is_recurring` tinyint unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `gateways`
-- 

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,'paypal','PayPal','paypal',1,'Paypal Email Address','Currency Code','Not in Use','user@paypal','CAD','',1,1),(2,'skrill','Skrill','skrill',1,'Skrill Email Address','Currency Code','Secret Passphrase','secrey','EUR','skrill',1,1),(3,'stripe','Stripe','stripe',1,'Stripe Secret Key','Currency Code','','sk_test_','CAD','pk_test_',1,1),(4,'payfast','PayFast','payfast',1,'Merchant ID','Merchant Key','PassPhrase','1616','sdgsdg','Alex0208alex',1,1),(6,'ideal','iDeal','ideal',1,'API Key','Currency Code','Not in Use','test_','EUR','',0,1),(7,'offline','Offline','offline',1,'Currency Code','Not in Use','Not in Use','CAD','','',0,1),(8,'razorpay','RazorPay','razorpay',1,'Api Key','Currency Code','Secret Key','rzp_test_','INR','13456',0,1),(9,'paystack','PayStack','paystack',1,'Secret Key','Currency Code','Public Key','sk_test_','ZAR','pk_test_',0,1);
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `memberships`
-- 

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `body` text,
  `price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `days` smallint unsigned NOT NULL DEFAULT '0',
  `period` varchar(1) NOT NULL DEFAULT 'D',
  `recurring` tinyint unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(40) DEFAULT NULL,
  `private` tinyint unsigned NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sorting` smallint unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `memberships`
-- 

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,'Trial','This is 7 days membership','<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 2 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>',0.00,7,'D',0,NULL,0,'2023-02-28 05:24:24',1,1),(2,'Bronze','This is 30 days basic membership','<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 20 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>',2.99,1,'M',1,'bronze.svg',0,'2023-02-28 05:24:24',3,1),(3,'Gold','This is 90 days basic membership','<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 40 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>',6.99,90,'D',0,'gold.svg',0,'2023-02-28 05:24:24',4,1),(4,'Platinum','Platinum Yearly Subscription','<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 10 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>',149.99,1,'Y',0,'platinum.svg',0,'2023-02-28 05:24:24',5,1),(5,'Silver','This is 7 days basic membership.','<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 20 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>',1.99,1,'W',0,'silver.svg',1,'2023-02-28 05:24:24',2,1);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `news`
-- 

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `author` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `news`
-- 

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Welcome to our Client Area!','<p>We are pleased to announce the new release of fully responsive Membership Manager Pro v 4.0</p>','Web Master','2023-07-05 17:30:14',1),(2,'New Version Update','<p>We are pleased to announce the new release of fully responsive Membership Manager Pro v 4.50</p>','Web Master','2023-07-02 17:30:19',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `pages`
-- 

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `body` longtext,
  `page_type` varchar(15) NOT NULL DEFAULT 'normal',
  `membership_id` varchar(20) NOT NULL DEFAULT '0',
  `keywords` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_hide` tinyint unsigned NOT NULL DEFAULT '0',
  `sorting` tinyint unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `pages`
-- 

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (4,'Membership Page','membership-page','<h4>This is a membership protected page, and you have access to it.</h4>\r\n<p>Our team works on global, cross-functional projects that are at the \r\n   heart of what we do at Front. As a member of the business strategy team,\r\n   you will deliver insights that drive decision-making, execution, and \r\n   investments for our most critical initiatives.\r\n</p>\r\n<p>The role will be driving \r\n   strategic plans, analyzing business performance and implementing \r\n   operational improvements to scale the business. Success requires \r\n   analytical savvy, problem-solving sophistication and a dedication to \r\n   making the highest impact.\r\n</p>\r\n<p>We are looking for humble, hardworking and \r\n   collaborative individuals that can think on their feet and thrive in a \r\n   fast-paced environment.\r\n</p>\r\n<p>We are a lean team, which \r\n   will provide you opportunities to present directly to our senior \r\n   leaders. Your impact will be felt immediately!\r\n</p>\r\n','membership','2,3,4','','','2021-06-01 10:13:40',1,2,1),(3,'About','about','<div class=\"row big-gutters justify-center\">\r\n            <div class=\"columns screen-60 tablet-100 mobile-100 phone-100 center-align\">\r\n               <h1>About</h1>\r\n               <p class=\"lead\">We cut through complexity, empowering businesses to challenge the status quo, create unlimited opportunities – and change the world.</p>\r\n            </div>\r\n         </div>\r\n<div class=\"margin-big-bottom\">\r\n            <figure class=\"wojo fluid image\">\r\n               <img src=\"[SITEURL]/uploads/img11.jpg\" alt=\"image Description\" class=\"rounded\" data-image=\"hgd8iqa6yysx\">\r\n            </figure>\r\n         </div>\r\n<div class=\"row big-gutters\">\r\n            <div class=\"columns mobile-100 phone-100\">\r\n               <h4>Work environment</h4>\r\n               <p>Only by seeking out diverse talent around the globe and by creating an inclusive workplace can we access the breadth of skills, abilities and creativity that we need to create exceptional and innovative products and services for our customers.</p>\r\n               <p>We strongly believe that an inclusive working environment enables everyone to realise their full potential and to deliver outstanding service to our customers. We continually strive to use all the experiences that our employees bring with them to influence and shape our decision-making process.</p>\r\n               <p>We are an equal opportunities employer and we aim to recruit, train and promote based on individual aptitudes and skills.</p>\r\n            </div>\r\n\r\n            <div class=\"columns mobile-100 phone-100\">\r\n               <div class=\"wojo very relaxed list\">\r\n                  <div class=\"item\">\r\n                     <i class=\"icon building\"></i>\r\n                     <div class=\"content\"><h5>High quality Co-Living spaces</h5>\r\n                        <p>Our fully furnished spaces are designed and purpose-built with Co-Living in mind, featuring high-end finishes and amenities that go far beyond traditional apartment buildings.</p>\r\n                     </div>\r\n                  </div>\r\n                  <div class=\"item\">\r\n                     <i class=\"icon shield\"></i>\r\n                     <div class=\"content\"><h5>Simple and all-inclusive</h5>\r\n                        <p>We worry about the details so that our residents don\'t have to. From our online application process to simple, all-inclusive billing we aim to make the living experience as effortless as possible.</p>\r\n                     </div>\r\n                  </div>\r\n               </div>\r\n            </div>\r\n         </div>\r\n<div class=\"row gutters justify-center\">\r\n            <div class=\"columns center-align\">\r\n               <figure class=\"wojo normal image\">\r\n                  <img src=\"[SITEURL]/uploads/plane.svg\" alt=\"image Description\" class=\"rounded\" data-image=\"xi35io17ewjj\">\r\n               </figure>\r\n            </div>\r\n         </div>\r\n<div class=\"row big-gutters justify-center\">\r\n            <div class=\"columns center-align screen-70 tablet-100 mobile-100 phone-100\">\r\n               <h3>We\'re always looking for talented freelancers to work with. Get in touch if you think you’d be a good fit!</h3>\r\n            </div>\r\n         </div>','normal','','','','2021-06-01 10:13:51',0,3,1),(1,'Home','home-page','\r\n   <div class=\"row gutters\">\r\n      <div class=\"columns center-align\"><span class=\"wojo simple label\">Small business solutions</span></div>\r\n   </div>\r\n   <div class=\"row gutters\">\r\n      <div class=\"columns center-align\"><h1>Turn online shoppers into <span class=\"text-color-primary\">lifetime customers</span></h1></div>\r\n   </div>\r\n\r\n\r\n         <div class=\"rounded-big bg-color-secondary\">\r\n            <div class=\"row align-middle\">\r\n               <div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\r\n                  <div class=\"padding-large\">\r\n                     <div class=\"margin-bottom\">\r\n                        <h3 class=\"text-color-white margin-bottom\">Drive maximum customer-satisfaction</h3>\r\n                        <p class=\"text-color-white dimmed-text-more\">Connect with your customers better by giving them an excellent post-purchase experience. Engage customers, reduce queries and build trust with automated tracking notifications and custom branded tracking page.</p>\r\n                     </div>\r\n                     <ul class=\"wojo styled check list\">\r\n                        <li class=\"item text-color-white\">Customize labels, packaging</li>\r\n                        <li class=\"item text-color-white\">Custom branded tracking page</li>\r\n                        <li class=\"item text-color-white\">FREE Email &amp; SMS notifications</li>\r\n                     </ul>\r\n                     <div class=\"margin-top\">\r\n                        <a class=\"wojo primary right button\">Learn more\r\n                           <i class=\"icon arrow right\"></i>\r\n                        </a>\r\n                     </div>\r\n                  </div>\r\n               </div>\r\n               <div class=\"columns screen-60 tablet-50 mobile-100 phone-100 right-align\">\r\n                  <div class=\"relative zindex1 padding-large\">\r\n                     <img class=\"rounded-big\" src=\"[SITEURL]/uploads/img2.jpg\" alt=\"Image Description\">\r\n                     <div class=\"absolute zindex2 position-left position-bottom max-width400 margin-huge-bottom margin-huge-left tablet-hide phone-hide mobile-hide\">\r\n                        <img class=\"rounded-big\" src=\"[SITEURL]/uploads/img5.png\" alt=\"Image Description\">\r\n                     </div>\r\n                     <figure class=\"absolute zindex2 position-right position-top max-width200 margin-right margin-top phone-hide mobile-hide\">\r\n                        <img src=\"[SITEURL]/uploads/dots-warning.svg\" alt=\"Image Description\">\r\n                     </figure>\r\n                  </div>\r\n               </div>\r\n            </div>\r\n         </div>\r\n         <div class=\"padding-big-vertical\">\r\n            <div class=\"row gutters justify-center\">\r\n               <div class=\"columns screen-60 tablet-80 mobile-100 phone-100 center-align\"><h3>Solo, agency or team? We’ve got you covered.</h3></div>\r\n            </div>\r\n         </div>\r\n','home','0',NULL,NULL,'2023-07-15 05:09:53',0,1,1),(2,'Contact','contact','<div class=\"row big-gutters\">\r\n   <div class=\"columns center-align\"><h2>How can we help?</h2></div>\r\n</div>\r\n<div class=\"row gutters\">\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Pre-visit inquiries</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M24.25 17.12v-1A8.25 8.25 0 0 0 16 7.82a8.48 8.48 0 0 0-8.25 8.48v.81A1.87 1.87 0 0 0 5.93 19v3.3a1.88 1.88 0 0 0 1.87 1.88h1a1.88 1.88 0 0 0 1.88-1.87V19a1.88 1.88 0 0 0-1.88-1.87h-.05v-.83A7.47 7.47 0 0 1 16 8.82a7.25 7.25 0 0 1 7.24 7.25v1h-.09A1.88 1.88 0 0 0 21.28 19v3.3a1.88 1.88 0 0 0 1.88 1.88h1a1.88 1.88 0 0 0 1.88-1.87V19a1.87 1.87 0 0 0-1.79-1.88Zm-15.41 1a.88.88 0 0 1 .88.88v3.3a.88.88 0 0 1-.87.88h-1a.88.88 0 0 1-.87-.87V19a.88.88 0 0 1 .88-.87h1Zm16.23 4.18a.88.88 0 0 1-.87.88h-1a.88.88 0 0 1-.87-.87V19a.88.88 0 0 1 .88-.87h1a.88.88 0 0 1 .88.88Z\"/>\r\n               <path d=\"M16 16a4.11 4.11 0 1 0 4.11 4.11A4.11 4.11 0 0 0 16 16Zm0 7.21a3.11 3.11 0 1 1 3.11-3.11A3.11 3.11 0 0 1 16 23.18Z\"/>\r\n               <path d=\"M16 20.44a.5.5 0 0 0 .5-.5v-1.57a.5.5 0 0 0-1 0v1.57a.5.5 0 0 0 .5.5zm0 .38a.5.5 0 0 0-.5.5v.45a.5.5 0 0 0 1 0v-.45a.5.5 0 0 0-.5-.5z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 6:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               support@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354876\r\n         </a>\r\n      </div>\r\n   </div>\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Billing questions</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M24.71 5.92H11.83a1.29 1.29 0 0 0-1.29 1.28v5.47H7.2A1.29 1.29 0 0 0 5.92 14v9.33a1.28 1.28 0 0 0 1.28 1.24h3.24a.3.3 0 0 1 .14 0L13 26a1.32 1.32 0 0 0 .64.17 1.27 1.27 0 0 0 .64-.17l2.42-1.4a.3.3 0 0 1 .15 0h3.23a1.29 1.29 0 0 0 1.29-1.28v-5.48h3.33a1.29 1.29 0 0 0 1.3-1.31V7.2a1.29 1.29 0 0 0-1.29-1.28Zm-4.62 17.65h-3.23a1.3 1.3 0 0 0-.65.18l-2.42 1.4a.3.3 0 0 1-.29 0l-2.42-1.4a1.3 1.3 0 0 0-.64-.18H7.2a.28.28 0 0 1-.28-.28V14a.28.28 0 0 1 .28-.29h3.34v2.86a1.29 1.29 0 0 0 1.29 1.29h3.23a.28.28 0 0 1 .14 0l2.42 1.4a1.28 1.28 0 0 0 1.29 0l1.47-.85v4.88a.29.29 0 0 1-.29.28Zm4.91-7a.29.29 0 0 1-.29.29h-3.23a1.27 1.27 0 0 0-.64.17l-2.43 1.4a.28.28 0 0 1-.28 0L15.71 17a1.29 1.29 0 0 0-.64-.17h-3.24a.29.29 0 0 1-.29-.29V7.2a.29.29 0 0 1 .29-.29h12.88a.29.29 0 0 1 .29.29Z\"/>\r\n               <path d=\"M16.08 11.67H15a.5.5 0 0 0 0 1h1.12a.5.5 0 0 0 0-1zm2.75 0h-1.12a.5.5 0 0 0 0 1h1.13a.5.5 0 0 0 0-1zm2.76 0h-1.13a.5.5 0 0 0 0 1h1.13a.5.5 0 1 0 0-1z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 5:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               biling@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354877\r\n         </a>\r\n      </div>\r\n   </div>\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Sales questions</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M8.84 15.75H7.75a1.35 1.35 0 0 0-1.32 1.36v3.32a1.37 1.37 0 0 0 1.37 1.38h1a1.37 1.37 0 0 0 1.38-1.37v-3.32a1.37 1.37 0 0 0-1.34-1.37zm15.41.01h-1.09a1.37 1.37 0 0 0-1.38 1.37v3.32a1.37 1.37 0 0 0 1.38 1.37h1.09a1.35 1.35 0 0 0 1.32-1.36v-3.34a1.35 1.35 0 0 0-1.32-1.36zm-3.12-6.68a7.17 7.17 0 0 1 2.12 5.13v1h1v-1A8.26 8.26 0 0 0 16 6a8.48 8.48 0 0 0-8.26 8.48v.82h1v-.81A7.47 7.47 0 0 1 16 7a7.19 7.19 0 0 1 5.13 2.08zm2.12 13.23v1.08A1.65 1.65 0 0 1 21.6 25h-4.86a.5.5 0 0 0 0 1h4.86a2.65 2.65 0 0 0 2.65-2.65V22.3h-1z\"/>\r\n               <path d=\"M17.76 20.93h1.78a.43.43 0 0 0 .46-.43v-5.13a.43.43 0 0 0-.43-.43h-7.11a.43.43 0 0 0-.43.43v5.13a.43.43 0 0 0 .43.43h1.78a.39.39 0 0 1 .21.06l1.33.77a.49.49 0 0 0 .44 0l1.33-.76a.39.39 0 0 1 .21-.07Zm-2.58-2.43h-1.12a.5.5 0 0 1 0-1h1.12a.5.5 0 0 1 0 1Zm1.14-.5a.5.5 0 0 1 .5-.5h1.12a.5.5 0 0 1 0 1h-1.12a.5.5 0 0 1-.5-.5Z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 6:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               sales@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354879\r\n         </a>\r\n      </div>\r\n   </div>\r\n</div>','contact','0',NULL,NULL,'2023-07-15 05:10:22',0,4,1),(6,'Privacy','privacy','<p>\r\n        1.     <strong>Introduction</strong></p>\r\n<p>\r\n        1.1    We are  committed to safeguarding the privacy of [our website visitors and service  users].</p>\r\n<p>\r\n        1.2    This policy  applies where we are acting as a data controller with respect to the personal  data of [our website visitors and service users]; in other words, where we  determine the purposes and means of the processing of that personal data.</p>\r\n<p>\r\n        1.3    We use  cookies on our website. Insofar as those cookies are not strictly necessary for  the provision of [our website and services], we will ask you to consent to our  use of cookies when you first visit our website.</p>\r\n<p>\r\n        1.4    Our website  incorporates privacy controls which affect how we will process your personal  data. By using the privacy controls, you can [specify whether you would like to  receive direct marketing communications and limit the publication of your  information]. You can access the privacy controls via <em>[URL]</em>.</p>\r\n<p>\r\n        1.5    In this  policy, \"we\", \"us\" and \"our\" refer to <em>[data  controller name]</em>.[ For more information about us, see Section 13.]<br></p>','privacy','','','','2023-07-16 11:55:13',0,5,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `payments`
-- 

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(50) DEFAULT NULL,
  `membership_id` int unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `rate_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` varchar(4) DEFAULT NULL,
  `pp` varchar(20) NOT NULL DEFAULT 'Stripe',
  `ip` varbinary(16) DEFAULT '000.000.000.000',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_membership` (`membership_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `payments`
-- 

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'txn_4rX4ydAuaWCC3h',1,2,5.99,0.00,0.00,5.99,'USD','Stripe','181.129.184.180','2016-07-11 12:20:12',1),(2,'txn_4rX4ydAuaWCC3h',4,3,9.99,0.00,0.00,9.99,'USD','PayPal','158.233.20.216','2016-05-10 03:38:15',1),(3,'txn_4rX4ydAuaWCC3h',4,4,19.99,0.00,0.00,19.99,'USD','Ideal','194.141.14.224','2016-06-17 03:11:22',1),(4,'txn_4rX4ydAuaWCC3h',2,5,49.99,0.00,0.00,49.99,'USD','2Checkout','96.186.181.70','2016-05-30 15:40:47',1),(5,'txn_4rX4ydAuaWCC3h',3,6,5.99,0.00,0.00,5.99,'USD','Authorize.net','33.147.193.164','2016-03-26 05:02:24',1),(6,'txn_4rX4ydAuaWCC3h',1,7,9.99,0.00,0.00,9.99,'USD','PayPal','88.59.10.81','2016-06-13 13:34:14',1),(7,'txn_4rX4ydAuaWCC3h',1,8,19.99,0.00,0.00,19.99,'USD','PayPal','27.145.174.24','2016-03-25 17:45:44',1),(8,'txn_4rX4ydAuaWCC3h',1,9,49.99,0.00,0.00,49.99,'USD','PayPal','128.164.177.74','2016-07-06 07:34:34',1),(9,'txn_4rX4ydAuaWCC3h',1,10,5.99,0.00,0.00,5.99,'USD','PayPal','121.196.218.135','2016-03-27 21:27:34',1),(10,'txn_4rX4ydAuaWCC3h',2,11,9.99,0.00,0.00,9.99,'USD','PayPal','237.200.148.212','2016-08-22 00:27:01',1),(11,'txn_4rX4ydAuaWCC3h',3,12,19.99,0.00,0.00,19.99,'USD','Stripe','50.182.246.202','2016-02-21 17:48:17',1),(12,'txn_4rX4ydAuaWCC3h',4,13,49.99,0.00,0.00,49.99,'USD','Stripe','218.77.236.235','2016-02-18 02:58:22',1),(13,'txn_4rX4ydAuaWCC3h',3,14,5.99,0.00,0.00,5.99,'USD','Stripe','163.160.227.38','2016-06-25 01:43:19',1),(14,'txn_4rX4ydAuaWCC3h',1,15,9.99,0.00,0.00,9.99,'USD','Ideal','129.121.141.239','2016-02-05 04:50:25',1),(15,'txn_4rX4ydAuaWCC3h',2,16,19.99,0.00,0.00,19.99,'USD','Ideal','76.131.33.77','2016-03-04 18:56:14',1),(16,'txn_4rX4ydAuaWCC3h',3,17,49.99,0.00,0.00,49.99,'USD','Ideal','206.12.140.116','2016-06-12 10:41:01',1),(17,'txn_4rX4ydAuaWCC3h',4,21,5.99,0.00,0.00,5.99,'USD','Ideal','37.77.193.187','2016-02-13 05:32:37',1),(18,'txn_4rX4ydAuaWCC3h',3,2,9.99,0.00,0.00,9.99,'USD','Ideal','230.224.179.98','2016-05-30 14:18:09',1),(19,'txn_4rX4ydAuaWCC3h',3,3,19.99,0.00,0.00,19.99,'USD','2Checkout','185.83.36.33','2016-06-26 06:45:12',1),(20,'txn_4rX4ydAuaWCC3h',1,4,49.99,0.00,0.00,49.99,'USD','2Checkout','136.29.84.164','2016-04-24 02:28:47',1),(21,'txn_4rX4ydAuaWCC3h',4,5,5.99,0.00,0.00,5.99,'USD','2Checkout','142.190.92.206','2016-01-26 15:56:57',1),(22,'txn_4rX4ydAuaWCC3h',2,6,9.99,0.00,0.00,9.99,'USD','2Checkout','115.232.232.162','2016-03-22 08:16:49',1),(23,'txn_4rX4ydAuaWCC3h',4,7,19.99,0.00,0.00,19.99,'USD','2Checkout','146.97.28.41','2016-04-19 01:23:47',1),(24,'txn_4rX4ydAuaWCC3h',3,8,49.99,0.00,0.00,49.99,'USD','Authorize.net','34.240.96.38','2016-07-08 14:40:45',1),(25,'txn_4rX4ydAuaWCC3h',4,9,5.99,0.00,0.00,5.99,'USD','Authorize.net','163.108.198.195','2016-02-11 02:10:09',1),(26,'txn_4rX4ydAuaWCC3h',4,10,9.99,0.00,0.00,9.99,'USD','Authorize.net','226.95.25.145','2016-05-23 01:39:56',1),(27,'txn_4rX4ydAuaWCC3h',3,11,19.99,0.00,0.00,19.99,'USD','Authorize.net','83.172.80.137','2016-06-15 05:54:14',1),(28,'txn_4rX4ydAuaWCC3h',3,12,49.99,0.00,0.00,49.99,'USD','Authorize.net','164.97.132.132','2016-04-10 18:35:59',1),(29,'txn_4rX4ydAuaWCC3h',3,13,5.99,0.00,0.00,5.99,'USD','Stripe','21.191.176.28','2016-03-15 01:24:47',1),(30,'txn_4rX4ydAuaWCC3h',2,14,9.99,0.00,0.00,9.99,'USD','Stripe','82.148.38.127','2016-01-06 22:01:09',1),(31,'txn_4rX4ydAuaWCC3h',2,15,19.99,0.00,0.00,19.99,'USD','Stripe','76.218.241.15','2016-05-18 17:57:44',1),(32,'txn_4rX4ydAuaWCC3h',3,16,49.99,0.00,0.00,49.99,'USD','Stripe','228.189.0.172','2016-06-22 12:22:21',1),(33,'txn_4rX4ydAuaWCC3h',1,17,5.99,0.00,0.00,5.99,'USD','Stripe','224.37.35.27','2016-06-21 13:29:49',1),(34,'txn_4rX4ydAuaWCC3h',2,21,9.99,0.00,0.00,9.99,'USD','PayPal','94.132.216.227','2016-04-01 08:33:34',1),(35,'txn_4rX4ydAuaWCC3h',4,2,19.99,0.00,0.00,19.99,'USD','PayPal','133.5.150.47','2016-01-12 00:24:05',1),(36,'txn_4rX4ydAuaWCC3h',2,3,49.99,0.00,0.00,49.99,'USD','PayPal','220.9.44.232','2016-04-07 15:33:20',1),(37,'txn_4rX4ydAuaWCC3h',2,4,5.99,0.00,0.00,5.99,'USD','PayPal','12.89.155.142','2016-05-12 09:34:46',1),(38,'txn_4rX4ydAuaWCC3h',3,5,9.99,0.00,0.00,9.99,'USD','PayPal','179.37.41.11','2016-04-24 11:42:54',1),(39,'txn_4rX4ydAuaWCC3h',2,6,19.99,0.00,0.00,19.99,'USD','2Checkout','198.90.9.116','2016-07-05 04:32:25',1),(40,'txn_4rX4ydAuaWCC3h',3,7,49.99,0.00,0.00,49.99,'USD','2Checkout','192.160.82.117','2016-02-15 19:26:12',1),(41,'txn_4rX4ydAuaWCC3h',1,8,5.99,0.00,0.00,5.99,'USD','2Checkout','38.63.172.14','2016-01-10 02:10:48',1),(42,'txn_4rX4ydAuaWCC3h',2,9,9.99,0.00,0.00,9.99,'USD','2Checkout','153.196.187.89','2016-04-14 21:25:12',1),(43,'txn_4rX4ydAuaWCC3h',2,10,19.99,0.00,0.00,19.99,'USD','2Checkout','148.228.144.173','2016-06-01 08:49:27',1),(44,'txn_4rX4ydAuaWCC3h',1,11,49.99,0.00,0.00,49.99,'USD','Ideal','224.207.80.223','2016-06-08 01:02:57',1),(45,'txn_4rX4ydAuaWCC3h',2,12,5.99,0.00,0.00,5.99,'USD','Ideal','192.173.248.253','2016-03-26 16:16:25',1),(46,'txn_4rX4ydAuaWCC3h',2,13,9.99,0.00,3.99,9.99,'USD','Ideal','17.235.229.83','2016-08-21 15:10:03',1),(47,'txn_4rX4ydAuaWCC3h',4,14,19.99,0.00,0.00,19.99,'USD','Ideal','81.143.255.252','2016-06-03 01:09:05',1),(48,'txn_4rX4ydAuaWCC3h',3,15,49.99,0.00,0.00,49.99,'USD','Ideal','141.220.96.80','2016-06-11 14:03:36',1),(49,'txn_4rX4ydAuaWCC3h',4,16,5.99,0.00,0.00,5.99,'USD','Payfast','229.153.72.68','2016-05-28 01:14:27',1),(50,'txn_4rX4ydAuaWCC3h',1,17,9.99,0.00,0.00,9.99,'USD','Payfast','126.221.75.41','2016-04-12 07:03:58',1),(51,'txn_4rX4ydAuaWCC3h',4,21,14.99,0.00,5.00,14.99,'USD','Payfast','90.85.225.0','2016-01-14 21:01:45',1),(52,'txn_4rX4ydAuaWCC3h',4,2,49.99,0.00,0.00,49.99,'USD','Payfast','17.184.168.1','2016-05-02 03:13:03',1),(53,'txn_4rX4ydAuaWCC3h',4,3,5.99,0.00,0.00,5.99,'USD','Payfast','141.118.158.195','2016-03-15 08:22:24',1),(54,'txn_4rX4ydAuaWCC3h',2,4,9.99,0.00,0.00,9.99,'USD','Payfast','194.66.205.153','2016-06-21 01:39:40',1),(55,'txn_4rX4ydAuaWCC3h',2,5,19.99,0.00,0.00,19.99,'USD','PayPal','220.139.199.93','2016-01-24 05:34:30',1),(56,'txn_4rX4ydAuaWCC3h',3,6,49.99,0.00,0.00,49.99,'USD','PayPal','2.238.251.56','2016-01-15 07:41:07',1),(57,'txn_4rX4ydAuaWCC3h',4,7,5.99,0.00,0.00,5.99,'USD','PayPal','49.116.26.163','2016-04-28 16:00:23',1),(58,'txn_4rX4ydAuaWCC3h',3,8,9.99,0.00,0.00,9.99,'USD','PayPal','130.178.232.75','2016-04-24 22:22:41',1),(59,'txn_4rX4ydAuaWCC3h',1,9,19.99,0.00,0.00,19.99,'USD','PayPal','49.9.82.72','2016-02-18 08:55:42',1),(60,'txn_4rX4ydAuaWCC3h',2,10,49.99,0.00,0.00,49.99,'USD','PayPal','20.227.144.73','2016-04-18 22:56:18',1),(61,'txn_4rX4ydAuaWCC3h',3,11,5.99,0.00,0.00,5.99,'USD','Stripe','21.66.44.195','2016-02-19 03:43:55',1),(62,'txn_4rX4ydAuaWCC3h',2,12,9.99,0.00,0.00,9.99,'USD','Stripe','26.154.49.252','2016-06-12 00:11:29',1),(63,'txn_4rX4ydAuaWCC3h',3,13,19.99,0.00,0.00,19.99,'USD','Stripe','18.218.140.112','2016-04-26 10:55:26',1),(64,'txn_4rX4ydAuaWCC3h',3,14,49.99,0.00,0.00,49.99,'USD','Stripe','54.128.203.71','2016-06-28 11:22:23',1),(65,'txn_4rX4ydAuaWCC3h',4,15,5.99,0.00,0.00,5.99,'USD','Stripe','229.191.33.60','2016-08-21 13:47:14',1),(66,'txn_4rX4ydAuaWCC3h',4,16,9.99,0.00,0.00,9.99,'USD','2Checkout','166.250.255.176','2016-06-05 05:57:15',1),(67,'txn_4rX4ydAuaWCC3h',3,17,19.99,0.00,0.00,19.99,'USD','2Checkout','150.64.211.112','2016-05-06 22:52:13',1),(68,'txn_4rX4ydAuaWCC3h',2,21,49.99,0.00,0.00,49.99,'USD','2Checkout','189.235.139.7','2016-04-25 18:35:07',1),(69,'txn_4rX4ydAuaWCC3h',1,2,5.99,0.00,0.00,5.99,'USD','2Checkout','104.103.83.155','2016-03-28 03:29:11',1),(70,'txn_4rX4ydAuaWCC3h',1,3,9.99,0.00,0.00,9.99,'USD','2Checkout','128.183.242.247','2016-05-22 01:14:58',1),(71,'txn_4rX4ydAuaWCC3h',4,4,19.99,0.00,0.00,19.99,'USD','Stripe','164.99.236.175','2016-07-05 05:44:22',1),(72,'txn_4rX4ydAuaWCC3h',4,5,49.99,0.00,0.00,49.99,'USD','Stripe','139.23.98.15','2016-03-29 16:10:32',1),(73,'txn_4rX4ydAuaWCC3h',2,6,5.99,0.00,0.00,5.99,'USD','Stripe','50.231.130.103','2016-05-01 05:46:16',1),(74,'txn_4rX4ydAuaWCC3h',4,7,9.99,0.00,0.00,9.99,'USD','Stripe','102.44.161.103','2016-05-29 04:44:22',1),(75,'txn_4rX4ydAuaWCC3h',2,8,19.99,0.00,0.00,19.99,'USD','2Checkout','8.221.161.208','2016-04-19 04:43:36',1),(76,'txn_4rX4ydAuaWCC3h',2,9,49.99,0.00,0.00,49.99,'USD','2Checkout','96.92.25.176','2016-03-01 02:18:15',1),(77,'txn_4rX4ydAuaWCC3h',4,10,5.99,0.00,0.00,5.99,'USD','2Checkout','86.94.118.27','2016-03-22 12:50:15',1),(78,'txn_4rX4ydAuaWCC3h',2,11,9.99,0.00,0.00,9.99,'USD','2Checkout','212.60.9.21','2016-02-07 16:01:32',1),(79,'txn_4rX4ydAuaWCC3h',2,12,19.99,0.00,0.00,19.99,'USD','2Checkout','86.230.89.10','2016-04-01 03:46:53',1),(80,'txn_4rX4ydAuaWCC3h',3,13,49.99,0.00,0.00,49.99,'USD','Stripe','73.88.31.102','2016-06-26 23:31:46',1),(81,'txn_4rX4ydAuaWCC3h',4,14,5.99,0.00,0.00,5.99,'USD','Stripe','43.26.159.147','2016-01-13 06:15:42',1),(82,'txn_4rX4ydAuaWCC3h',2,15,9.99,0.00,0.00,9.99,'USD','Stripe','41.19.155.251','2016-01-14 22:10:50',1),(83,'txn_4rX4ydAuaWCC3h',4,16,19.99,0.00,0.00,19.99,'USD','Stripe','145.52.83.56','2016-07-01 21:32:15',1),(84,'txn_4rX4ydAuaWCC3h',3,17,49.99,0.00,0.00,49.99,'USD','Stripe','236.92.14.214','2016-05-27 01:15:02',1),(85,'txn_4rX4ydAuaWCC3h',3,21,5.99,0.00,0.00,5.99,'USD','Stripe','221.183.168.14','2016-03-19 19:31:19',1),(86,'txn_4rX4ydAuaWCC3h',4,2,9.99,0.00,0.00,9.99,'USD','Stripe','24.151.76.70','2016-05-20 18:13:10',1),(87,'txn_4rX4ydAuaWCC3h',4,3,19.99,0.00,0.00,19.99,'USD','Stripe','144.201.220.34','2016-03-14 03:14:42',1),(88,'txn_4rX4ydAuaWCC3h',4,4,49.99,0.00,0.00,49.99,'USD','Stripe','229.133.224.51','2016-05-09 06:32:40',1),(89,'txn_4rX4ydAuaWCC3h',4,5,5.99,0.00,0.00,5.99,'USD','Stripe','104.216.87.223','2016-05-10 11:31:38',1),(90,'txn_4rX4ydAuaWCC3h',1,6,9.99,0.00,0.00,9.99,'USD','Stripe','46.212.97.229','2016-02-01 03:33:07',1),(91,'txn_4rX4ydAuaWCC3h',2,7,19.99,0.00,0.00,19.99,'USD','Stripe','220.46.114.135','2016-06-20 11:20:21',1),(92,'txn_4rX4ydAuaWCC3h',2,8,49.99,2.99,0.00,49.99,'USD','Stripe','16.223.187.78','2016-08-21 19:01:11',1),(93,'txn_4rX4ydAuaWCC3h',1,9,5.99,0.00,0.00,5.99,'USD','Stripe','44.169.223.48','2016-06-07 21:46:55',1),(94,'txn_4rX4ydAuaWCC3h',4,10,9.99,0.00,0.00,9.99,'USD','Stripe','138.137.161.253','2016-04-17 07:01:26',1),(95,'txn_4rX4ydAuaWCC3h',3,11,19.99,0.00,0.00,19.99,'USD','Stripe','174.251.40.95','2016-01-25 03:42:45',1),(96,'txn_4rX4ydAuaWCC3h',2,12,49.99,0.00,0.00,49.99,'USD','Stripe','243.13.252.35','2016-05-26 00:22:23',1),(97,'txn_4rX4ydAuaWCC3h',3,13,5.99,0.00,0.00,5.99,'USD','Stripe','240.79.189.180','2016-03-27 13:38:15',1),(98,'txn_4rX4ydAuaWCC3h',3,14,9.99,0.00,0.00,9.99,'USD','Stripe','128.152.170.164','2016-05-16 05:10:21',1),(99,'txn_4rX4ydAuaWCC3h',4,15,19.99,0.00,0.00,19.99,'USD','Stripe','96.166.155.215','2016-05-19 02:58:45',1),(100,'txn_4rX4ydAuaWCC3h',2,16,49.99,0.00,0.00,49.99,'USD','Stripe','213.144.173.87','2016-06-08 01:55:50',1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `privileges`
-- 

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `mode` varchar(8) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `privileges`
-- 

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'manage_users','Manage Users','Permission to add/edit/delete users','manage','Users'),(2,'manage_files','Manage Files','Permission to access File Manager','manage','Files'),(3,'manage_pages','Manage Pages','Permission to Add/edit/delete pages','manage','Pages'),(4,'manage_menus','Manage Menus','Permission to Add/edit and delete menus','manage','Menus'),(5,'manage_email','Manage Email Templates','Permission to modify email templates','manage','Emails'),(6,'manage_languages','Manage Language Phrases','Permission to modify language phrases','manage','Languages'),(7,'manage_backup','Manage Database Backups','Permission to create backups and restore','manage','Backups'),(8,'manage_memberships','Manage Memberships','Permission to manage memberships','manage','Memberships'),(9,'edit_user','Edit Users','Permission to edit user','edit','Users'),(10,'add_user','Add User','Permission to add users','add','Users'),(11,'delete_user','Delete Users','Permission to delete users','delete','Users'),(12,'manage_coupons','Manage Coupons','Permission to Add/Edit and delete coupons','manage','Coupons'),(13,'manage_fields','Mange Fileds','Permission to Add/edit and delete custom fields','manage','Fields'),(14,'manage_news','Manage News','Permission to Add/edit and delete news','manage','News'),(15,'manage_newsletter','Manage Newsletter','Permission to send newsletter and emails','manage','Newsletter');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `role_privileges`
-- 

DROP TABLE IF EXISTS `role_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privileges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rid` int unsigned NOT NULL DEFAULT '0',
  `pid` int unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx` (`rid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `role_privileges`
-- 

LOCK TABLES `role_privileges` WRITE;
/*!40000 ALTER TABLE `role_privileges` DISABLE KEYS */;
INSERT INTO `role_privileges` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,0),(4,1,2,1),(5,2,2,1),(6,3,2,1),(7,1,3,1),(8,2,3,1),(9,3,3,1),(10,1,4,1),(11,2,4,1),(12,3,4,1),(13,1,5,1),(14,2,5,1),(15,3,5,0),(16,1,6,1),(17,2,6,1),(18,3,6,1),(19,1,7,1),(20,2,7,1),(21,3,7,0),(22,1,8,1),(23,2,8,1),(24,3,8,0),(25,1,9,1),(26,2,9,1),(27,3,9,0),(28,1,10,1),(29,2,10,1),(30,3,10,0),(31,1,11,1),(32,2,11,1),(33,3,11,0),(34,1,12,1),(35,2,12,1),(36,3,12,1),(37,1,13,1),(38,2,13,1),(39,3,13,0),(40,1,14,1),(41,2,14,1),(42,3,14,1),(43,1,15,1),(44,2,15,1),(45,3,15,0);
/*!40000 ALTER TABLE `role_privileges` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `roles`
-- 

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `roles`
-- 

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'owner','badge','Site Owner','Site Owner is the owner of the site, has all privileges and could not be removed.'),(2,'staff','trophy','Staff Member','The \"Staff\" members  is required to assist the Owner, has different privileges and may be created by Site Owner.'),(3,'editor','note','Editor','The &#34;Editor&#34; is required to assist the Staff Members, has different privileges and may be created by Site Owner.');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `settings`
-- 

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `company` varchar(50) NOT NULL,
  `site_email` varchar(80) NOT NULL,
  `psite_email` varchar(80) DEFAULT NULL,
  `site_dir` varchar(100) DEFAULT NULL,
  `reg_allowed` tinyint unsigned NOT NULL DEFAULT '1',
  `reg_verify` tinyint unsigned NOT NULL DEFAULT '0',
  `notify_admin` tinyint unsigned NOT NULL DEFAULT '0',
  `auto_verify` tinyint unsigned NOT NULL DEFAULT '0',
  `perpage` tinyint unsigned NOT NULL DEFAULT '12',
  `backup` varchar(60) DEFAULT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `plogo` varchar(40) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `enable_tax` tinyint unsigned NOT NULL DEFAULT '0',
  `tax_rate` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `long_date` varchar(50) DEFAULT NULL,
  `short_date` varchar(50) DEFAULT NULL,
  `time_format` varchar(20) DEFAULT NULL,
  `calendar_date` varchar(30) DEFAULT NULL,
  `dtz` varchar(80) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `eucookie` tinyint unsigned NOT NULL DEFAULT '0',
  `one_login` tinyint unsigned NOT NULL DEFAULT '0',
  `weekstart` tinyint unsigned NOT NULL DEFAULT '0',
  `inv_info` text,
  `inv_note` text,
  `offline_info` text,
  `social_media` blob,
  `page_slugs` blob,
  `enable_dmembership` tinyint unsigned NOT NULL DEFAULT '0',
  `dmembership` smallint unsigned NOT NULL DEFAULT '0',
  `file_dir` varchar(100) DEFAULT NULL,
  `mailer` enum('SMTP','SMAIL') NOT NULL DEFAULT 'SMTP',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(50) DEFAULT NULL,
  `smtp_pass` varchar(50) DEFAULT NULL,
  `smtp_port` varchar(6) DEFAULT NULL,
  `is_ssl` tinyint unsigned NOT NULL DEFAULT '0',
  `sendmail` varchar(150) DEFAULT NULL,
  `wojon` decimal(4,2) unsigned NOT NULL DEFAULT '1.00',
  `wojov` decimal(4,2) unsigned NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `settings`
-- 

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Your Company Name','site@mail.com','','members',1,1,0,0,12,'08-Jul-2023_04-39-04.sql','logo.svg','print_logo.svg','CAD',0,0.00,'MMMM dd, yyyy hh:mm a','dd MMM yyyy','HH:mm','dd-mm-yyyy','America/Toronto','en_CA','en',0,0,0,'<p><strong>ABC Company Pty Ltd</strong><br>123 Burke Street, Toronto ON, CANADA<br>Tel : (416) 1234-5678, Fax : (416) 1234-5679, Email : sales@abc-company.com<br>Web Site : www.abc-company.com</p>','<p>TERMS & CONDITIONS<br>1. Interest may be levied on overdue accounts. <br>2. Goods sold are not returnable or refundable</p>','<p>Instructions for offline payments...</p>','{\"facebook\":\"facebook_page\",\"twitter\":\"twitter_page\"}','{\"home\":[{\"page_type\":\"home\"}],\"contact\":[{\"page_type\":\"contact\"}],\"privacy\":[{\"page_type\":\"privacy\"}]}',0,0,'/home/downloads/','SMTP','in-v3.mailjet.com','123','456','587',0,'sendmail path',1.00,5.00);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `trash`
-- 

DROP TABLE IF EXISTS `trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trash` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent` varchar(15) DEFAULT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  `dataset` blob,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `trash`
-- 

LOCK TABLES `trash` WRITE;
/*!40000 ALTER TABLE `trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `trash` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `user_custom_fields`
-- 

DROP TABLE IF EXISTS `user_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(40) DEFAULT NULL,
  `field_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_field` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `user_custom_fields`
-- 

LOCK TABLES `user_custom_fields` WRITE;
/*!40000 ALTER TABLE `user_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `user_memberships`
-- 

DROP TABLE IF EXISTS `user_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_memberships` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `membership_id` int unsigned NOT NULL DEFAULT '0',
  `activated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expire` timestamp NULL DEFAULT NULL,
  `recurring` tinyint unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 = expired, 1 = active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `user_memberships`
-- 

LOCK TABLES `user_memberships` WRITE;
/*!40000 ALTER TABLE `user_memberships` DISABLE KEYS */;
INSERT INTO `user_memberships` VALUES (1,85,20,4,'2016-07-03 19:57:38','2016-10-27 04:48:32',1,1),(2,106,20,2,'2020-01-17 18:15:56','2020-02-17 18:15:56',1,1),(3,107,3,5,'2020-06-23 21:29:47','2020-06-30 21:29:47',0,1),(4,108,10,5,'2020-06-23 21:36:21','2020-06-30 21:36:21',0,1);
/*!40000 ALTER TABLE `user_memberships` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `membership_id` int unsigned NOT NULL DEFAULT '0',
  `mem_expire` varchar(20) DEFAULT NULL,
  `hash` varchar(70) NOT NULL,
  `token` varchar(40) NOT NULL DEFAULT '0',
  `userlevel` tinyint unsigned NOT NULL DEFAULT '1',
  `sesid` varchar(80) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'member',
  `trial_used` tinyint unsigned NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT '000.000.000.000',
  `login_info` varchar(150) DEFAULT NULL,
  `login_status` tinyint unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `user_files` varchar(150) NOT NULL DEFAULT '0',
  `notes` tinytext,
  `newsletter` tinyint unsigned NOT NULL DEFAULT '1',
  `stripe_cus` varchar(100) DEFAULT NULL,
  `stripe_pm` varchar(80) DEFAULT NULL,
  `custom_fields` varchar(200) DEFAULT NULL,
  `active` enum('y','n','t','b') NOT NULL DEFAULT 'n',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `users`
-- 

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Web','Master','site@mail.com',0,NULL,'$2y$10$QCl3.tuOlxnq4zyR2EDPp.gGzynvJW9V5sc3SjgFbo5VneSckUoOS','0',9,'0','owner',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'y','2024-07-29 15:11:28'),(2,'Hello World','Noah',NULL,'noexcript@gmail.com',0,NULL,'$2y$10$gdG54tRap/zD.X1Jz.ACduxhlgSXNSvXFbo6l39k7YB1V07wMDmE2','1553233',1,'0','member',0,NULL,'000.000.000.000',NULL,0,'AVT_8HK3kvlAcK3m.jpg','+244937613303','Luanda','Luanda',NULL,'Luan','CARD_qlcbImtIzAX8.pdf',NULL,1,NULL,NULL,NULL,'n','2024-07-29 15:19:37'),(3,'Hello World',NULL,NULL,'noe.atuto@gmail.com',0,NULL,'$2y$10$dbTlylotsxO8FY7Fj1yfsuvDOiJtjm5FpG5taHu1CF3Q4CdMtpEnS','7716711',1,'0','member',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'n','2024-07-29 15:30:41'),(4,'Hello World',NULL,NULL,'noe.tuto@gmail.com',0,NULL,'$2y$10$iKNKwHCV/LtYWUdo6Nj0Y.XQpIuuPSdXPKcHl/W4O7AjFvITt2yty','7868159',1,'0','member',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'n','2024-07-29 15:45:07'),(5,'Hell World',NULL,NULL,'noe.aatuto@gmail.com',0,NULL,'$2y$10$79PeN3feiMnWEN8okLvZBeFWZHxqj9fiXsPu2qJp.jn.MPzXvjany','7969135',1,'0','member',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'n','2024-07-29 15:54:12'),(6,'Helo World',NULL,NULL,'francisco.fa720@gmail.com',1,'2024-08-05 14:31:16','$2y$10$ksp/avEpiq5kr57OyNQH1.28zHw045CE3Uy1UtZ/OmPw8UYCrNX8C','2892467',1,'d337dc43994eb0a837063d21689c74a8bddb60a7','member',0,'2024-08-01 23:08:43','::1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'y','2024-07-29 16:38:40'),(7,'DevxJs',NULL,NULL,'patrick@gmail.com',0,NULL,'$2y$10$J/sQumR5kQCCMRIBnbvHYuTDt.79onmtlRNQDTsI60xZm9Gl/WxCi','9179127',1,'0','member',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'y','2024-08-02 02:46:58'),(8,'MauroK',NULL,NULL,'mauro@gmail.com',0,NULL,'$2y$10$0ZWpud2vv10SRuD2EN/Vde4WVUej6BL40qsmsVevnQvgJudMPSYQy','1515697',1,'0','member',0,NULL,'000.000.000.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'y','2024-08-02 02:47:57'),(9,'adilson','Noah Magalhaes',NULL,'devxjs@gmail.com',0,NULL,'$2y$10$yAm706LvGoI99oHvi3uzne1EWk3UREsJ83Ce1PhD7WQBc59eapKym','5736926',1,'1a5dd880d84e165d19f5de76422e382cdfae6145','member',0,'2024-08-01 23:23:42','::1',NULL,0,NULL,'+2449376133','Luanda','Luanda',NULL,NULL,'0',NULL,1,NULL,NULL,NULL,'y','2024-08-02 03:14:33');
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

-- Dump completed on 2024-08-02  6:19:30
