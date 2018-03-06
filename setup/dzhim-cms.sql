-- MySQL dump 10.16  Distrib 10.2.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dzhim_cms
-- ------------------------------------------------------
-- Server version	10.2.12-MariaDB-10.2.12+maria~xenial-log

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
-- Table structure for table `dzhim__file`
--

DROP TABLE IF EXISTS `dzhim__file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `path` varchar(250) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__file`
--

LOCK TABLES `dzhim__file` WRITE;
/*!40000 ALTER TABLE `dzhim__file` DISABLE KEYS */;
/*!40000 ALTER TABLE `dzhim__file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__ip`
--

DROP TABLE IF EXISTS `dzhim__ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__ip` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `status` enum('allowed','blocked') NOT NULL DEFAULT 'allowed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__ip`
--

LOCK TABLES `dzhim__ip` WRITE;
/*!40000 ALTER TABLE `dzhim__ip` DISABLE KEYS */;
INSERT INTO `dzhim__ip` VALUES (1,'127.0.0.1','allowed');
/*!40000 ALTER TABLE `dzhim__ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__lang`
--

DROP TABLE IF EXISTS `dzhim__lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__lang` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `three_char` varchar(10) NOT NULL,
  `two_char` varchar(10) NOT NULL,
  `title` varchar(250) NOT NULL,
  `status` enum('active','inactive','dont_show_in_menu') NOT NULL DEFAULT 'inactive',
  `is_def` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`three_char`),
  UNIQUE KEY `three_char` (`three_char`),
  UNIQUE KEY `two_char` (`two_char`),
  KEY `weight` (`weight`),
  KEY `is_def` (`is_def`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__lang`
--

LOCK TABLES `dzhim__lang` WRITE;
/*!40000 ALTER TABLE `dzhim__lang` DISABLE KEYS */;
INSERT INTO `dzhim__lang` VALUES (1,'lat','lv','Latviešu','active',0,3),(2,'eng','en','English','active',1,2),(3,'ina','in','Inactive','inactive',0,4);
/*!40000 ALTER TABLE `dzhim__lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__layout`
--

DROP TABLE IF EXISTS `dzhim__layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__layout` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` enum('pub','core') NOT NULL DEFAULT 'pub',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__layout`
--

LOCK TABLES `dzhim__layout` WRITE;
/*!40000 ALTER TABLE `dzhim__layout` DISABLE KEYS */;
INSERT INTO `dzhim__layout` VALUES (1,'def','Default','pub'),(2,'admin','Admin','core'),(3,'cat','Categories','core'),(6,'login','','core'),(7,'dark',NULL,'pub');
/*!40000 ALTER TABLE `dzhim__layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__mod_in`
--

DROP TABLE IF EXISTS `dzhim__mod_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__mod_in` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` enum('pub','core') NOT NULL DEFAULT 'pub',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__mod_in`
--

LOCK TABLES `dzhim__mod_in` WRITE;
/*!40000 ALTER TABLE `dzhim__mod_in` DISABLE KEYS */;
INSERT INTO `dzhim__mod_in` VALUES (1,'static','pub'),(2,'partner','pub'),(3,'gallery','pub'),(4,'products','pub'),(7,'project','pub'),(11,'test','pub');
/*!40000 ALTER TABLE `dzhim__mod_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__mod_out`
--

DROP TABLE IF EXISTS `dzhim__mod_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__mod_out` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` enum('pub','core') NOT NULL DEFAULT 'pub',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__mod_out`
--

LOCK TABLES `dzhim__mod_out` WRITE;
/*!40000 ALTER TABLE `dzhim__mod_out` DISABLE KEYS */;
INSERT INTO `dzhim__mod_out` VALUES (1,'startpage','pub'),(3,'file','core'),(4,'footer_about','pub'),(5,'footer_links','pub'),(6,'footer_logo','pub'),(7,'head_lang_menu','pub'),(8,'head_cat_menu','pub'),(9,'admin','core'),(10,'contacts','pub'),(11,'products','pub'),(12,'static','pub'),(13,'head_tabs','core'),(14,'transl','core'),(15,'mod','core'),(16,'cat','core'),(17,'gallery','pub'),(18,'partner','pub'),(19,'cat_edit_list','core'),(20,'cat_settings','core'),(21,'cat_content_one','core'),(22,'cat_content_list','core'),(23,'cat_content','core'),(26,'cat_content_menu','core'),(27,'ui','core'),(28,'cat_lang','core'),(29,'cat_lang_menu','core'),(30,'transl_list','core'),(31,'transl_one','core'),(32,'subcat','pub'),(33,'footer_fmw_info','core'),(39,'project','pub'),(41,'layout','core'),(43,'login','core'),(46,'test','pub'),(47,'usr','core'),(48,'usr_list','core'),(49,'usr_one','core');
/*!40000 ALTER TABLE `dzhim__mod_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__msg`
--

DROP TABLE IF EXISTS `dzhim__msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__msg`
--

LOCK TABLES `dzhim__msg` WRITE;
/*!40000 ALTER TABLE `dzhim__msg` DISABLE KEYS */;
INSERT INTO `dzhim__msg` VALUES (1,'logout','Logout',1),(2,'add_lang','Add language',1),(3,'load','Load',1),(4,'settings','Settings',1),(5,'content','Content',1),(6,'delete','Delete',1),(7,'do_you_want_del','Do you really want to delete?',1),(8,'add','Add',1),(9,'id','ID',1),(10,'f_content','Formated text',1),(11,'cat_id','Category',1),(12,'dev_by','Developed by',1),(13,'title','Ttitle',1),(14,'status','Status',1),(15,'in_mod','Input module',1),(16,'out_mod','Output module',1),(17,'layout_templ','Layout template',1),(18,'def_cat_for_lang','Language\'s default category',1),(19,'up','Up',1),(20,'down','Down',1),(21,'preview','Preview',1),(22,'save','Save',1),(23,'name','Name',1),(24,'cancel','Cancel',1),(25,'f_lat','LAT',1),(26,'url','URL',1),(27,'img','Image',1),(28,'new_lang','New lang',1),(29,'lang_three_char','3 char code',1),(30,'two_char','2 char code',1),(31,'def_lang','Default language',1),(32,'active','Active',1),(33,'inactive','Inactive',1),(34,'do_not_show_in_menu','Do not show in menu',1),(35,'hide','Hide',1),(36,'descr','Description',1),(37,'descr','Description',2),(38,'products','Products',1),(39,'products','Products',2),(40,'projects','Projects',1),(41,'projects','Projects',2),(42,'partners','Partners',1),(43,'partners','Partners',2),(44,'albums','Albums',1),(45,'albums','Albums',2),(46,'f_eng','ENG',2),(47,'f_eng','ENG',1),(50,'price','<p>Price</p>\r\n',2),(51,'price','<p>Price</p>\r\n',1),(76,'footer_translation','<p>Translate me in the admin panel</p>\r\n',2),(77,'footer_translation','<p>Iztulko mani admin panelī</p>\r\n',1),(78,'email','E-mail',2),(79,'email','E-mail',1),(80,'surname','Surname',2),(81,'surname','Surname',1),(82,'tries_left','Tries left',2),(83,'tries_left','Tries left',1),(84,'last_login_time','Last login time',2),(85,'last_login_time','Last login time',1),(86,'last_ip','Last IP',2),(87,'last_ip','Last IP',1),(88,'blocked','Blocked',2),(89,'blocked','Blocked',1),(90,'pw','Password',2),(91,'pw','Password',1);
/*!40000 ALTER TABLE `dzhim__msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__st`
--

DROP TABLE IF EXISTS `dzhim__st`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__st` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `dir` varchar(250) DEFAULT NULL,
  `in` smallint(10) unsigned DEFAULT NULL,
  `out` smallint(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `type` enum('pub','core') NOT NULL DEFAULT 'pub',
  `layout_id` tinyint(4) unsigned DEFAULT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT 1,
  `lang_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `level` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `is_def` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir_index` (`dir`),
  KEY `in` (`in`),
  KEY `out` (`out`),
  KEY `layout_id` (`layout_id`),
  KEY `lang_id` (`lang_id`),
  CONSTRAINT `dzhim__st_ibfk_1` FOREIGN KEY (`in`) REFERENCES `dzhim__mod_in` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dzhim__st_ibfk_2` FOREIGN KEY (`out`) REFERENCES `dzhim__mod_out` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dzhim__st_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `dzhim__layout` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__st`
--

LOCK TABLES `dzhim__st` WRITE;
/*!40000 ALTER TABLE `dzhim__st` DISABLE KEYS */;
INSERT INTO `dzhim__st` VALUES (1,NULL,'Sākums','/lat',1,1,'active','pub',1,1,1,1,0),(19,NULL,'Home','/eng',1,1,'active','pub',1,1,2,1,1),(20,19,'Partners','/eng/partners',2,18,'active','pub',1,3,2,2,0),(21,19,'Products','/eng/products',NULL,32,'active','pub',1,1,2,2,0),(22,19,'About us','/eng/about-us',1,12,'active','pub',1,5,2,2,0),(23,19,'Projects','/eng/projects',7,39,'active','pub',1,4,2,2,0),(24,19,'Contacts','/eng/contacts',1,10,'active','pub',7,6,2,2,0),(25,19,'Gallery','/eng/gallery',3,17,'active','pub',1,2,2,2,0),(26,21,'Product category A','/eng/products/product-category-a',4,11,'active','pub',1,1,2,3,0),(27,21,'Product category B','/eng/products/product-category-b',4,11,'active','pub',1,2,2,3,0),(28,1,'Produkti','/lat/produkti',NULL,32,'active','pub',1,1,1,2,0),(29,1,'Partneri','/lat/partneri',2,18,'active','pub',1,2,1,2,1),(30,1,'Galerija','/lat/galerija',3,17,'active','pub',1,3,1,2,0),(31,1,'Projekti','/lat/projekti',7,39,'active','pub',1,4,1,2,0),(32,1,'Par mums','/lat/par-mums',1,12,'active','pub',1,5,1,2,0),(33,1,'Kontakti','/lat/kontakti',1,10,'active','pub',7,6,1,2,0),(34,28,'Produktu kategorija A','/lat/produkti/produktu-kategorija-a',4,11,'active','pub',1,1,1,3,0),(35,28,'Produktu kategorija B','/lat/produkti/produktu-kategorija-b',4,11,'active','pub',1,2,1,3,0),(36,19,'Inactive','/eng/inactive',7,18,'inactive','pub',1,7,2,2,0),(37,NULL,'Startpage','/ina',1,1,'inactive','pub',1,1,3,1,1);
/*!40000 ALTER TABLE `dzhim__st` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__st_core`
--

DROP TABLE IF EXISTS `dzhim__st_core`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__st_core` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `dir` varchar(250) DEFAULT NULL,
  `in` smallint(10) unsigned DEFAULT NULL,
  `out` smallint(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `type` enum('pub','core') NOT NULL DEFAULT 'pub',
  `layout_id` tinyint(4) unsigned DEFAULT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT 1,
  `lang_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir_index` (`dir`),
  KEY `in` (`in`),
  KEY `out` (`out`),
  KEY `layout_id` (`layout_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__st_core`
--

LOCK TABLES `dzhim__st_core` WRITE;
/*!40000 ALTER TABLE `dzhim__st_core` DISABLE KEYS */;
INSERT INTO `dzhim__st_core` VALUES (1,NULL,'Dzhim CMS','/admin',NULL,9,'active','core',2,1,1),(2,NULL,'File','/dl',NULL,3,'active','core',1,1,1),(3,1,'Translations','/admin/transl',NULL,14,'active','core',2,2,1),(4,1,'Modules','/admin/mod',NULL,15,'active','core',2,3,1),(5,1,'Categories','/admin/cat',NULL,16,'active','core',3,1,1),(6,5,'Settings','/admin/cat/settings',NULL,20,'active','core',3,1,1),(7,5,'Content','/admin/cat/content',NULL,23,'active','core',3,1,1),(8,7,'Edit item','/admin/cat/content/one',NULL,21,'active','core',3,1,1),(9,7,'List','/admin/cat/content/list',NULL,22,'inactive','core',3,1,1),(15,NULL,'UI','/admin/ui',NULL,27,'active','core',3,1,1),(16,5,'Language','/admin/cat/lang',NULL,28,'active','core',3,1,1),(21,3,'Translations','/admin/transl/list',NULL,30,'active','core',2,1,1),(22,NULL,'Edit translation','/admin/transl/one',NULL,31,'active','core',2,1,1),(23,1,'Layout','/admin/layout',NULL,41,'active','core',2,4,1),(24,1,'Login','/admin/login',NULL,43,'inactive','core',6,6,1),(25,1,'Users','/admin/usr',NULL,47,'active','core',2,5,1),(26,25,'Users','/admin/usr/list',NULL,48,'active','core',2,1,1),(27,25,'Users','/admin/usr/one',NULL,49,'active','core',2,1,1);
/*!40000 ALTER TABLE `dzhim__st_core` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim__usr`
--

DROP TABLE IF EXISTS `dzhim__usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim__usr` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `status` enum('active','blocked','inactive') NOT NULL DEFAULT 'inactive',
  `pw` varchar(250) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `hash` varchar(250) DEFAULT NULL,
  `tries_left` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login_time` int(10) unsigned DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `last_conn_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `surname` (`surname`),
  KEY `hash` (`hash`),
  KEY `tries_left` (`tries_left`),
  KEY `created` (`created`),
  KEY `last_login_time` (`last_login_time`),
  KEY `last_login_ip` (`last_ip`),
  KEY `last_conn_time` (`last_conn_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim__usr`
--

LOCK TABLES `dzhim__usr` WRITE;
/*!40000 ALTER TABLE `dzhim__usr` DISABLE KEYS */;
INSERT INTO `dzhim__usr` VALUES (1,'admin@dzhim-cms.local','active','$6$rounds=5000$9e77b57fe9cf7ebd$Rid6/LbwfE8H1KnuRAHDXjpFj6FgEXAmH9Og6MsU1hnTmfmG5YORTPfJD.M515DTAqNYXQiflgUIFXCy9IrB9/','','admin@dzhim-cms.local','',5,'2013-04-29 18:16:25',1519660547,'127.0.0.1',1519660547);
/*!40000 ALTER TABLE `dzhim__usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_gallery`
--

DROP TABLE IF EXISTS `dzhim_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_gallery` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `dzhim_gallery_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `dzhim__st` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_gallery`
--

LOCK TABLES `dzhim_gallery` WRITE;
/*!40000 ALTER TABLE `dzhim_gallery` DISABLE KEYS */;
INSERT INTO `dzhim_gallery` VALUES (3,'Album A','/res/image/a.png',25),(4,'Album B','/res/image/b.png',25),(5,'Album C','/res/image/c.png',25),(6,'Albums A','/res/image/a.png',30),(7,'Albums B','/res/image/b.png',30),(8,'Albums C','/res/image/c.png',30);
/*!40000 ALTER TABLE `dzhim_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_gallery_item`
--

DROP TABLE IF EXISTS `dzhim_gallery_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_gallery_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `descr` text DEFAULT NULL,
  `img` varchar(250) NOT NULL,
  `gallery_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_id` (`gallery_id`),
  CONSTRAINT `dzhim_gallery_item_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `dzhim_gallery` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_gallery_item`
--

LOCK TABLES `dzhim_gallery_item` WRITE;
/*!40000 ALTER TABLE `dzhim_gallery_item` DISABLE KEYS */;
INSERT INTO `dzhim_gallery_item` VALUES (1,'Album A \\ Pic C','				Pic C descr				.','/res/image/c.png',3),(2,'Album A \\ Pic B','			Pic B descr.','/res/image/b.png',3),(3,'Album A \\ Pic A','Pic A descr.','/res/image/a.png',3),(7,'Album B / Pic A','							Pic A descr.\r\n					','/res/image/a.png',4),(8,'Album B / Pic B','							Pic B descr.\r\n					','/res/image/b.png',4),(9,'Album B / Pic C','							Pic A descr.\r\n					','/res/image/c.png',4),(10,'Album C / Pic C','Pic C descr.			','/res/image/c.png',5),(11,'Album C / Pic B','Pic A descr.			','/res/image/a.png',5),(12,'Album C / Pic B','Pic B descr.			','/res/image/b.png',5),(16,'Albums A / Attēls C','Attēla C apraksts.							','/res/image/c.png',6),(17,'Albums A / Attēls B','Attēla B apraksts.\r\n					','/res/image/b.png',6),(18,'Albums A / Attēls A','Attēla A apraksts.\r\n					','/res/image/a.png',6),(19,'Albums B / Attēls A','Attēla A apraksts.','/res/image/a.png',7),(20,'Albums B / Attēls B','Attēla B apraksts.','/res/image/b.png',7),(21,'Albums B / Attēls C','Attēla C apraksts.','/res/image/c.png',7);
/*!40000 ALTER TABLE `dzhim_gallery_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_partner`
--

DROP TABLE IF EXISTS `dzhim_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_partner` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `img` varchar(250) DEFAULT NULL,
  `f_content` text DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `dzhim_partner_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `dzhim__st` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_partner`
--

LOCK TABLES `dzhim_partner` WRITE;
/*!40000 ALTER TABLE `dzhim_partner` DISABLE KEYS */;
INSERT INTO `dzhim_partner` VALUES (1,'Partner A','/res/image/partner/a.png','<h1>H1 Partner A</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+a',20),(2,'Partner B','/res/image/partner/b.png','<h1>H1 Partner B</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime,&nbsp;deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime,&nbsp;deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit&nbsp;amet</strong>,&nbsp;<em>ITALIC&nbsp;consectetur&nbsp;adnus, quod opus&nbsp;sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt,&nbsp;mors&nbsp;est&nbsp;oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+b',20),(3,'Partner C','/res/image/partner/c.png','<h1>H1 Partner C</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime,&nbsp;deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime,&nbsp;deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit&nbsp;amet</strong>,&nbsp;<em>ITALIC&nbsp;consectetur&nbsp;adnus, quod opus&nbsp;sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt,&nbsp;mors&nbsp;est&nbsp;oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+c',20),(5,'Partneris A','/res/image/partner/a.png','<h1>H1 Partner A</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+a',29),(6,'Partneris B','/res/image/partner/b.png','<h1>H1 Partneris B</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+b',29),(7,'Partneris C','/res/image/partner/c.png','<h1>H1 Partneris C</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=partner+c',29);
/*!40000 ALTER TABLE `dzhim_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_product`
--

DROP TABLE IF EXISTS `dzhim_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_product` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `f_content` text DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL COMMENT 'Informational price.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `cat_id` (`cat_id`),
  KEY `active` (`active`),
  CONSTRAINT `dzhim_product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `dzhim__st` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_product`
--

LOCK TABLES `dzhim_product` WRITE;
/*!40000 ALTER TABLE `dzhim_product` DISABLE KEYS */;
INSERT INTO `dzhim_product` VALUES (1,'Product A','<h1>H1 Product A</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/a.png',1,26,'5 $'),(2,'Product B','<h1>H1 Product B</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/b.png',1,26,'10 $'),(3,'Product C','<h1>H1 Product C</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime,&nbsp;deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime,&nbsp;deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit&nbsp;amet</strong>,&nbsp;<em>ITALIC&nbsp;consectetur&nbsp;adnus, quod opus&nbsp;sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt,&nbsp;mors&nbsp;est&nbsp;oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/c.png',1,26,'-'),(4,'Product category B / Product A','<h1>H1 Product category B / Product A</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/a.png',1,27,'-'),(5,'Product category B / Product B','<h1>H1 Product category B / Product B</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/b.png',1,27,NULL),(6,'Product category B / Product C','<h1>H1 Product category B / Product C</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/c.png',1,27,'Sold out'),(7,'Produkts A','<h1>H1 Produkts A</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/a.png',1,34,'4 €'),(8,'Produkts B','<h1>H1 Produkts B</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/b.png',1,34,'9 €'),(9,'Produkts C','<h1>H1 Produkts C</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/c.png',1,34,'20 €'),(10,'Produktu kategorija B / Produkts A','<h1>H1 Produktu kategorija B / Produkts A</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/a.png',1,35,'5 €'),(11,'Produktu kategorija B / Produkts B','<h1>H1 Produktu kategorija B / Produkts B</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/b.png',1,35,'Izpārdots'),(12,'Produktu kategorija B / Produkts C','<h1>H1 Produktu kategorija B / Produkts C</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','/res/image/product/c.png',1,35,'Pieejams no 27. augusta.');
/*!40000 ALTER TABLE `dzhim_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_project`
--

DROP TABLE IF EXISTS `dzhim_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_project` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `f_content` text DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `dzhim_project_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `dzhim__st` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_project`
--

LOCK TABLES `dzhim_project` WRITE;
/*!40000 ALTER TABLE `dzhim_project` DISABLE KEYS */;
INSERT INTO `dzhim_project` VALUES (2,'Project A','<h1>H1 Project A</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+A',23,'/res/image/project/a.png'),(3,'Project B','<h1>H1 Project B</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+B',23,'/res/image/project/b.png'),(4,'Project C','<h1>H1 Project C</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime,&nbsp;deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime,&nbsp;deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit&nbsp;amet</strong>,&nbsp;<em>ITALIC&nbsp;consectetur&nbsp;adnus, quod opus&nbsp;sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+C',23,'/res/image/project/c.png'),(5,'Projekts A','<h1>H1 Projekts A</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+A',31,'/res/image/project/a.png'),(6,'Projekts B','<h1>H1 Projekts B</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+B',31,'/res/image/project/b.png'),(7,'Projekts C','<h1>H1 Projekts C</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n','https://www.google.lv/search?q=project+C',31,'/res/image/project/c.png');
/*!40000 ALTER TABLE `dzhim_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dzhim_static`
--

DROP TABLE IF EXISTS `dzhim_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzhim_static` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `f_content` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `cat_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `cat_id` (`cat_id`),
  KEY `active` (`active`),
  CONSTRAINT `dzhim_static_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `dzhim__st` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzhim_static`
--

LOCK TABLES `dzhim_static` WRITE;
/*!40000 ALTER TABLE `dzhim_static` DISABLE KEYS */;
INSERT INTO `dzhim_static` VALUES (1,'Text','<h1>H1 Text</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,22),(2,'Inactive draft','<h1>H1 Inactive Draft.</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime,&nbsp;deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime,&nbsp;deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit&nbsp;amet</strong>,&nbsp;<em>ITALIC&nbsp;consectetur&nbsp;adnus, quod opus&nbsp;sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt,&nbsp;mors&nbsp;est&nbsp;oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',0,22),(3,'Contacts','<h1>H1 Contacts</h1>\r\n\r\n<h2>H2 Formatted, rich text example.</h2>\r\n\r\n<h3>H3 Tecum optime, deinde.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,24),(4,'Welcome','<h3>H3 Tecum optime, deinde.&nbsp;</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,19),(5,'Laipni lūdzam','<h3>H3 Formatēta teksta paraugs</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,1),(6,'Par mums','<h1>H1 Par mums</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<ul>\r\n	<li>Namt, mors est oppetenda.</li>\r\n	<li>Quamquam non negatis nos intellegere quid sit voluptas, sed quid ille dicat.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Cum ageremus, inquit, vitae beatum et eundem supremum diem, scribebamus haec.</li>\r\n	<li>Nulla profecto est, quin suam vim retineat a primo ad extremum.</li>\r\n</ol>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,32),(7,'Kontakti','<h1>H1 Kontakti</h1>\r\n\r\n<h2>H2 Formatēta teksta paraugs</h2>\r\n\r\n<h3>H3 Tecum optime, deinde etiam cum mediocri amico.</h3>\r\n\r\n<p>H4&nbsp;<a href=\"https://loripsum.net/\" target=\"_blank\">Rich text lorem ipsum generator</a>&nbsp;Tecum optime, deinde.</p>\r\n\r\n<p>P&nbsp;<strong>BOLD Lorem ipsum dolor sit amet</strong>,&nbsp;<em>ITALIC consectetur adnus, quod opus sapientiae?</em></p>\r\n\r\n<blockquote>QUOTE Cum efficere non possit ut cuiquam, qui ipse sr.</blockquote>\r\n',1,33),(8,'Inactive Startpage','<p>This page / language is still under construction.</p>\r\n',1,37);
/*!40000 ALTER TABLE `dzhim_static` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-26 18:53:08
