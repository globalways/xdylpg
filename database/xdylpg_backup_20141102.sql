-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: localhost    Database: xdylpg
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ADMACC` varchar(30) NOT NULL,
  `ADMPW` char(32) NOT NULL,
  `ADMAUTH` int(11) unsigned NOT NULL,
  `ADMNAME` varchar(4) NOT NULL,
  `ADMPHO` varchar(30) NOT NULL,
  `ADMTEL` varchar(20) NOT NULL,
  `ADMEMAIL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('d','d',3,'sd','3','f','d'),('d','d',3,'sd','3','f','d'),('fffff','d',3,'sd','3','f','d'),('f','d',3,'sd','3','f','d'),('f','d',3,'sd','3','f','d'),('f','d',3,'sd','3','f','d');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advice`
--

DROP TABLE IF EXISTS `advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advice` (
  `ADVNUM` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ADVCON` varchar(255) NOT NULL COMMENT 'save content as txt file. dabase keep path of txt',
  `ISREAD` tinyint(11) NOT NULL DEFAULT '0' COMMENT '0 stand for hasn''t been readed. ',
  `ADVISER` varchar(10) DEFAULT 'anonymity' COMMENT 'name of adviser',
  `ADVTEL` varchar(20) DEFAULT NULL,
  `ADVMAI` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ADVNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advice`
--

LOCK TABLES `advice` WRITE;
/*!40000 ALTER TABLE `advice` DISABLE KEYS */;
INSERT INTO `advice` VALUES (1,'asdfadsfa',0,'df','sdf','asd'),(2,'ada',0,'da','a','ad'),(3,'adfada',0,'da','asd','asd'),(4,'asdfasd',0,'sdfds','fds','fsd'),(6,'adada',0,'sd','asda','asd');
/*!40000 ALTER TABLE `advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `APPNUM` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `ADMNAME` varchar(4) NOT NULL,
  `ADMTEL` varchar(20) NOT NULL,
  `ADMEMAIL` varchar(30) DEFAULT NULL,
  `ISHANDLE` tinyint(11) NOT NULL,
  PRIMARY KEY (`APPNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='application for signing up';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'DA','fd','sad',0),(2,'汪阳坪2','241341341','onebyte@qq.com',1),(3,'章子的','341341341','asdfa@qqq.com',1);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `AUTHNUM` int(11) unsigned NOT NULL,
  `ADNAME` varchar(10) NOT NULL,
  PRIMARY KEY (`AUTHNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='authority definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'商户账户'),(2,'系统账户');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsnspg`
--

DROP TABLE IF EXISTS `bsnspg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsnspg` (
  `BUSADMNUM` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `BUSNAME` varchar(30) NOT NULL,
  `BUSADDR` varchar(30) NOT NULL,
  `BUSPHONE` varchar(30) NOT NULL,
  `BUSML` varchar(50) NOT NULL,
  `BUSINTR` varchar(255) NOT NULL,
  `BANUM` int(11) NOT NULL,
  `PINYINID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BUSADMNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsnspg`
--

LOCK TABLES `bsnspg` WRITE;
/*!40000 ALTER TABLE `bsnspg` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsnspg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busadm`
--

DROP TABLE IF EXISTS `busadm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busadm` (
  `BUSADMNUM` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ADMACC` varchar(30) DEFAULT NULL,
  `ADMPW` varchar(40) DEFAULT NULL,
  `ADMAUTH` int(11) unsigned DEFAULT NULL,
  `ADMNAME` varchar(4) DEFAULT NULL,
  `ADMTEL` varchar(20) DEFAULT NULL,
  `ADMEMAIL` varchar(30) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  PRIMARY KEY (`BUSADMNUM`),
  KEY `busadmin-auth` (`ADMAUTH`),
  CONSTRAINT `busadmin-auth` FOREIGN KEY (`ADMAUTH`) REFERENCES `auth` (`AUTHNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busadm`
--

LOCK TABLES `busadm` WRITE;
/*!40000 ALTER TABLE `busadm` DISABLE KEYS */;
INSERT INTO `busadm` VALUES (1,'cbinfo','250cf8b51c773f3f8dc8b4be867a9a02',1,'cbin','15828525253','onebyte@qq.com',1),(2,'admin','202cb962ac59075b964b07152d234b70',2,'admi','13413413421','zhagnze@qq.com',1),(3,'admin_ada','27fe076f3f9ad7a444e7c27580d112b7',1,'A3','13413413421','zhagnze@qq.com',1),(4,'shop','202cb962ac59075b964b07152d234b70',1,'张天水','13413413421','zhagnze@tcl.com',1),(5,'admin_ada','27fe076f3f9ad7a444e7c27580d112b7',1,'DA','13413413421','zhagnze@qq.com',1),(34,'wyp','250cf8b51c773f3f8dc8b4be867a9a02',1,'汪阳坪','241341341','onebyte@qq.com',1),(35,'2','250cf8b51c773f3f8dc8b4be867a9a02',2,'汪阳坪2','241341341','onebyte@qq.com',1),(36,'zzd','d2a3dc656364d639deddded0c2a034ec',2,'章子的','341341341','asdfa@qqq.com',1);
/*!40000 ALTER TABLE `busadm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buscat`
--

DROP TABLE IF EXISTS `buscat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buscat` (
  `BCNUM` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `BCNAME` varchar(30) DEFAULT NULL,
  `BCTEM` varchar(255) DEFAULT NULL,
  `BCPNUM` int(11) DEFAULT NULL,
  `BCORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`BCNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buscat`
--

LOCK TABLES `buscat` WRITE;
/*!40000 ALTER TABLE `buscat` DISABLE KEYS */;
INSERT INTO `buscat` VALUES (1,'企业公司','SJtemplate/qygs.jsp',0,1),(2,'商店商铺','SJtemplate/sdsp.jsp',0,2),(3,'生活服务','SJtemplate/shfw.jsp',0,3),(4,'公共单位','SJtemplate/ggdw.jsp',0,4),(5,'美食','SJtemplate/sdsp.jsp',2,1),(7,'农业和养殖业','SJtemplate/qygs.jsp',1,1),(16,'养殖业—进出口','SJtemplate/qygs.jsp',7,1),(17,'养蜂和养蚕','SJtemplate/qygs.jsp',7,2),(18,'食品工业','SJtemplate/qygs.jsp',1,2),(19,'不含酒精的带气饮料','SJtemplate/qygs.jsp',18,2),(20,'不含巧克力的甜食','SJtemplate/qygs.jsp',18,1),(28,'生活服务频道','SJtemplate/shfw.jsp',3,1),(29,'学校','SJtemplate/ggdw.jsp',4,1),(30,'休闲娱乐','SJtemplate/sdsp.jsp',2,2),(31,'农业进出口','SJtemplate/qygs.jsp',7,3),(32,'	 园艺','SJtemplate/qygs.jsp',7,4),(33,'	 家畜','SJtemplate/qygs.jsp',7,5),(34,'家禽、兔子和野味','SJtemplate/qygs.jsp',7,6),(35,'干果','SJtemplate/qygs.jsp',7,7),(36,'改良土壤的肥料和产品','SJtemplate/qygs.jsp',7,8),(37,'植物—具有可纺性纤维的','SJtemplate/qygs.jsp',7,9),(38,'毛皮动物—养殖','SJtemplate/qygs.jsp',7,10),(39,'	 水果','SJtemplate/qygs.jsp',7,11),(40,'渔业—进出口','SJtemplate/qygs.jsp',7,12),(41,' 牛类','SJtemplate/qygs.jsp',7,13),(42,' 猪类','SJtemplate/qygs.jsp',7,14),(43,'秧苗、鳞茎、种籽','SJtemplate/qygs.jsp',7,15),(44,' 粮食谷物','SJtemplate/qygs.jsp',7,16),(45,' 羊类和山羊类','SJtemplate/qygs.jsp',7,17),(46,' 苗圃和林业','SJtemplate/qygs.jsp',7,18),(47,' 蔬菜、根茎类及食用块茎','SJtemplate/qygs.jsp',7,19),(48,' 蛋','SJtemplate/qygs.jsp',7,20),(49,' 贝壳类、甲壳类','SJtemplate/qygs.jsp',7,21),(50,' 马和驴','SJtemplate/qygs.jsp',7,22),(51,' 鱼','SJtemplate/qygs.jsp',7,23),(52,'乳制品','SJtemplate/qygs.jsp',18,3),(53,'冰淇淋和果汁冰糕','SJtemplate/qygs.jsp',18,4),(54,'冷冻和速冻食品','SJtemplate/qygs.jsp',18,5),(55,'川菜','SJtemplate/sdsp.jsp',5,1),(56,'粤菜','SJtemplate/sdsp.jsp',5,2),(57,'湘菜','SJtemplate/sdsp.jsp',5,3),(58,'东北菜','SJtemplate/sdsp.jsp',5,4),(59,'贵州菜','SJtemplate/sdsp.jsp',5,5),(60,'韩国料理','SJtemplate/sdsp.jsp',5,6),(61,'面包甜点','SJtemplate/sdsp.jsp',5,7),(62,'酒吧','SJtemplate/sdsp.jsp',30,1),(63,'电影院','SJtemplate/sdsp.jsp',30,2),(64,'足疗按摩','SJtemplate/sdsp.jsp',30,3),(65,'洗衣店','SJtemplate/shfw.jsp',28,1),(66,'体检中心','SJtemplate/shfw.jsp',28,2),(67,'物流快递','SJtemplate/shfw.jsp',28,3),(68,'电信营业厅','SJtemplate/shfw.jsp',28,4),(69,'高等学校','SJtemplate/ggdw.jsp',29,1),(70,'高中','SJtemplate/ggdw.jsp',29,2),(71,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `buscat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbinfo`
--

DROP TABLE IF EXISTS `cbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbinfo` (
  `COMNUM` int(9) unsigned NOT NULL,
  `BUSADMNUM` int(11) unsigned DEFAULT NULL,
  `BCNUM` int(11) unsigned zerofill DEFAULT NULL COMMENT '商铺类型',
  `BUSNAME` varchar(30) DEFAULT NULL,
  `BUSADDR` varchar(50) DEFAULT NULL,
  `BUSPHONE` varchar(30) DEFAULT NULL,
  `BUSML` varchar(50) DEFAULT NULL,
  `BUSINTR` text,
  `PINYINID` varchar(255) DEFAULT NULL,
  `WEBTITLE` varchar(100) DEFAULT NULL,
  `SUBTITLE` varchar(20) DEFAULT NULL,
  `LOGIMG` varchar(255) DEFAULT NULL,
  `ICOIMG` varchar(255) DEFAULT NULL,
  `POSTCODE` char(6) DEFAULT NULL,
  `CAROUSEL` text,
  `CONTACTS` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `ICPCODE` varchar(30) DEFAULT NULL,
  `WEBDES` varchar(100) DEFAULT NULL,
  `HITS` int(14) unsigned DEFAULT NULL COMMENT '点击量',
  `STATUS` int(1) unsigned DEFAULT NULL COMMENT '是否启用，值0或1(启用）',
  PRIMARY KEY (`COMNUM`),
  KEY `cbinfo-buscat` (`BCNUM`),
  KEY `cbinfo-busadmin` (`BUSADMNUM`),
  CONSTRAINT `cbinfo-busadmin` FOREIGN KEY (`BUSADMNUM`) REFERENCES `busadm` (`BUSADMNUM`),
  CONSTRAINT `cbinfo-buscat` FOREIGN KEY (`BCNUM`) REFERENCES `buscat` (`BCNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbinfo`
--

LOCK TABLES `cbinfo` WRITE;
/*!40000 ALTER TABLE `cbinfo` DISABLE KEYS */;
INSERT INTO `cbinfo` VALUES (121416075,34,00000000017,'杨婵','','','','','dad','','','','','','null','','',NULL,'',0,1),(203453955,35,00000000016,'TCL','是的发生','134134','','','TCL','','','http://127.0.0.1:8080/xdylpg/admin/uploads/3575882c-e569-478e-8c9e-535124bd5535.jpg','http://127.0.0.1:8080/xdylpg/admin/uploads/7566344b-b34c-461c-bc47-54678f6353ba.png','','null','','',NULL,'',0,1),(211139261,1,00000000042,'西南石油养猪场','新都大道8号','15828525253','104.190236,30.830272','西南石油大学位于春哥故里，成都市新都区，适合广大情侣和基友。','swpu2','swpu','-','http://127.0.0.1:8080/xdylpg/ul/u/211139261/li/ac2080c8-7de6-4345-a5c5-5ebebd8b0530.png','http://127.0.0.1:8080/xdylpg/ul/u/211139261/li/5a927943-90cd-42d4-8d30-7c8e1a0463b2.png','610500','[{\'addr\':\'http://127.0.0.1:8080/xdylpg/admin/uploads/c2f6ad8c-1727-4b89-952f-dcfe99637d12.jpg\',\'desc\':\'学校有研究生院[5]、国家大学科技园、[6]国家重点实验室、国家重点学科和院士，联合国援建中国的“中国石油天然气油井完井技术中心”[7]也设在该校。\'},{\'addr\':\'http://127.0.0.1:8080/xdylpg/admin/uploads/3e779192-708c-4816-a5a8-fc627772b5ea.jpg\',\'desc\':\'学校是专业涵盖教育、艺术、经、管、文、法、理、工8大学科门类[2]，油气石化主干学科全国领先，拥有在校研究生5488人[2]、硕士生导师485人、博士生导师105人[2]的多科性大学。\'},{\'addr\':\'http://127.0.0.1:8080/xdylpg/admin/uploads/24091877-6924-4293-aa8b-1c41799c709c.jpg\',\'desc\':\'轮播图片，忘了掀开\'},]','MR.DU','swpu@swpu.edu.cn',NULL,'a',0,1),(360680578,36,00000000001,'广州试采福食品有限公司','广州市荔湾区环翠南路10号4栋首层西面','(020)81615558','114.291071,22.947546','简介','scf','/','/','uploads/dbeedc45-eb61-4847-92b1-d96417b9ef81.png','uploads/e87c3414-f94a-47fe-bc4a-a657ce7f95f3.png','/',NULL,'/','/',NULL,'/',0,1),(415755128,5,00000000019,'城东机械厂','马超东路123号','13413413','','简介','cdjxc','/','/','','','/',NULL,'/','/',NULL,'/',0,1),(884605052,3,00000000016,'安阳方快锅炉有限公司','','','104.094369,30.648134','','','','','','','','null','','',NULL,'',0,1);
/*!40000 ALTER TABLE `cbinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comconsor`
--

DROP TABLE IF EXISTS `comconsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comconsor` (
  `SORNUM` int(11) NOT NULL AUTO_INCREMENT,
  `FATNUM` int(11) DEFAULT NULL,
  `SORORD` int(11) DEFAULT NULL,
  `SORTYPE` int(11) DEFAULT NULL,
  `SORNAME` varchar(255) DEFAULT NULL,
  `SORURL` varchar(255) DEFAULT NULL,
  `ADDTIME` varchar(30) DEFAULT NULL,
  `PTITLE` varchar(255) DEFAULT NULL,
  `PKEYW` varchar(255) DEFAULT NULL,
  `PDESC` varchar(255) DEFAULT NULL,
  `SORPATH` varchar(255) DEFAULT NULL,
  `SORTEM` varchar(255) DEFAULT NULL,
  `CONTEM` varchar(255) DEFAULT NULL,
  `SORFOL` varchar(255) DEFAULT NULL,
  `CONFOL` varchar(255) DEFAULT NULL,
  `SFNAME` varchar(255) DEFAULT NULL,
  `CFNAME` varchar(255) DEFAULT NULL,
  `SORSTA` int(11) DEFAULT NULL,
  `TSNUM` int(11) DEFAULT NULL,
  `SORCON` varchar(255) DEFAULT NULL,
  `EDITIM` datetime DEFAULT NULL,
  `IMGPAT` varchar(255) DEFAULT NULL,
  `INDIMG` varchar(255) DEFAULT NULL,
  `DLURL` varchar(255) DEFAULT NULL,
  `ICOPAT` varchar(255) DEFAULT NULL,
  `ICOIMG` varchar(255) DEFAULT NULL,
  `ISDISPLAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`SORNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comconsor`
--

LOCK TABLES `comconsor` WRITE;
/*!40000 ALTER TABLE `comconsor` DISABLE KEYS */;
INSERT INTO `comconsor` VALUES (16,0,2,2,'新闻中心','',NULL,'新闻中心 - 西南石油大学','','',NULL,'newslist.jsp','news.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,0,3,3,'产品展示','',NULL,NULL,NULL,NULL,NULL,'productlist.jsp','product.jsp','{sitepath}','{sitepath}','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,16,21,2,'公司新闻','',NULL,'公司新闻 - 西南石油大学','null','',NULL,'newslist.jsp','news.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,16,22,2,'行业新闻','',NULL,'行业新闻 - 西南石油大学','null','',NULL,'newslist.jsp','news.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,17,31,3,'实体产品','',NULL,'null','null','',NULL,'productlist.jsp','product.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,17,32,3,'创意概念','',NULL,'null','null','',NULL,'productlist.jsp','product.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,0,4,6,'公司相册','',NULL,NULL,NULL,NULL,NULL,'albumlist.jsp','album.jsp','{sitepath}','{sitepath}','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,22,41,6,'公司场景','',NULL,NULL,NULL,NULL,NULL,'albumlist.jsp','album.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,22,42,6,'公司活动','',NULL,NULL,NULL,NULL,NULL,'albumlist.jsp','album.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,0,5,1,'关于我们','',NULL,NULL,NULL,NULL,NULL,'about.jsp','about.jsp','{sitepath}','','about-{sortid}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,16,23,2,'不是新闻','',NULL,'null','null','',NULL,'newslist.jsp','news.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,26,51,1,'关于我们','',NULL,'null','null','',NULL,'/','about.jsp','{sitepath}/newslist/','{sitepath}/news/','list-{sortid}-{page}',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comconsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companymain`
--

DROP TABLE IF EXISTS `companymain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companymain` (
  `CONTNUM` int(11) NOT NULL,
  `SORNUM` int(11) NOT NULL,
  `COMNUMB` char(10) NOT NULL,
  PRIMARY KEY (`CONTNUM`,`SORNUM`,`COMNUMB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companymain`
--

LOCK TABLES `companymain` WRITE;
/*!40000 ALTER TABLE `companymain` DISABLE KEYS */;
/*!40000 ALTER TABLE `companymain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpcontent`
--

DROP TABLE IF EXISTS `cpcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpcontent` (
  `CONTNUM` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `SORNUMB` int(11) DEFAULT NULL,
  `COMNUM` int(9) unsigned DEFAULT NULL,
  `CONTIT` varchar(255) DEFAULT NULL,
  `CTCOL` varchar(255) DEFAULT NULL,
  `IOLINK` int(11) DEFAULT NULL,
  `OUTLIN` varchar(255) DEFAULT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `CONSOU` varchar(255) DEFAULT NULL,
  `CONTAG` varchar(255) DEFAULT NULL,
  `CONTENT` text COMMENT 'save info as txt',
  `CONSTA` tinyint(1) DEFAULT '0',
  `ISTOP` int(11) DEFAULT NULL,
  `ISREC` int(11) DEFAULT NULL,
  `IINEWS` int(11) DEFAULT NULL,
  `IHLINE` int(11) DEFAULT NULL,
  `CONORD` int(11) DEFAULT NULL,
  `ISGEN` int(11) DEFAULT NULL,
  `VISITS` int(11) DEFAULT NULL,
  `ADDTIME` bigint(20) DEFAULT '0',
  `EDITIM` bigint(20) DEFAULT '0',
  `INDIMG` varchar(255) DEFAULT NULL,
  `DLURL` varchar(255) DEFAULT NULL,
  `PTITLE` varchar(255) DEFAULT NULL,
  `PKEYW` varchar(255) DEFAULT NULL,
  `PDESC` varchar(255) DEFAULT NULL,
  `PFNAME` varchar(255) DEFAULT NULL,
  `TIMER` datetime DEFAULT NULL,
  `TIMSTA` int(11) DEFAULT NULL,
  `PPRI` varchar(255) DEFAULT NULL,
  `PTYPE` varchar(255) DEFAULT NULL,
  `PCOLOR` varchar(255) DEFAULT NULL,
  `PCAT` varchar(255) DEFAULT NULL,
  `SABOUT` varchar(255) DEFAULT NULL,
  `POPRICE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CONTNUM`),
  KEY `cpc-com` (`COMNUM`),
  KEY `cpc-sor` (`SORNUMB`),
  CONSTRAINT `cpc-com` FOREIGN KEY (`COMNUM`) REFERENCES `cbinfo` (`COMNUM`),
  CONSTRAINT `cpc-sor` FOREIGN KEY (`SORNUMB`) REFERENCES `comconsor` (`SORNUM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpcontent`
--

LOCK TABLES `cpcontent` WRITE;
/*!40000 ALTER TABLE `cpcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psu`
--

DROP TABLE IF EXISTS `psu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psu` (
  `UNITNUM` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `BUSADMNUM` int(11) unsigned DEFAULT NULL,
  `BUSNAME` varchar(30) DEFAULT NULL,
  `BUSADDR` varchar(30) DEFAULT NULL,
  `BUSPHONE` varchar(30) DEFAULT NULL,
  `BUSML` varchar(50) DEFAULT NULL,
  `BUSINTR` varchar(255) DEFAULT NULL,
  `PINYINID` varchar(255) DEFAULT NULL,
  `UNITIMG` varchar(256) DEFAULT NULL COMMENT '...',
  `UNITTEM` varchar(255) DEFAULT NULL,
  `BCNUM` int(11) unsigned zerofill DEFAULT NULL COMMENT '商铺类型',
  `HITS` int(14) unsigned DEFAULT NULL COMMENT '点击量',
  `STATUS` int(1) unsigned zerofill DEFAULT '0' COMMENT '是否启用，值0或1(启用）',
  PRIMARY KEY (`UNITNUM`),
  KEY `psu-buscat` (`BCNUM`),
  KEY `psu-busadmin` (`BUSADMNUM`),
  CONSTRAINT `psu-busadmin` FOREIGN KEY (`BUSADMNUM`) REFERENCES `busadm` (`BUSADMNUM`),
  CONSTRAINT `psu-buscat` FOREIGN KEY (`BCNUM`) REFERENCES `buscat` (`BCNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=992213303 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu`
--

LOCK TABLES `psu` WRITE;
/*!40000 ALTER TABLE `psu` DISABLE KEYS */;
INSERT INTO `psu` VALUES (0448276238,1,'天天副食店4','新都大道8号','13141413411','xysss','我和你吻别在狂乱的夜','ttfsd',NULL,'./tempasda',00000000004,0,1),(0473018720,5,'新都修车厂1','马超东路123号','13568211324','......','主要经营各类车维修，销售。','xdxcc',NULL,'....',00000000001,0,1),(0496379225,1,'XXOO6','','','','','',NULL,'....',00000000004,0,0),(0554014555,1,'XXOO7','','','','','',NULL,'....',00000000004,0,0),(0646202809,1,'XXOO1','','','','','',NULL,'....',00000000004,0,0),(0655452573,5,'菜鸟啊。','','','','','',NULL,'',00000000004,0,1),(0690045927,3,'3号管理员','','','','','',NULL,'....',00000000004,0,0),(0700750838,1,'哈哈','','','','','无',NULL,'1',00000000004,0,1),(0712962150,1,'XXOO5','','','','','',NULL,'....',00000000004,0,0),(0795054640,1,'XXOO2','','','','','',NULL,'....',00000000004,0,1),(0903929892,5,'商家名字','地址','联系电话','null','','字母ID',NULL,'模板位置',00000000004,0,1),(0924958691,5,'A1人民医院','大发达','1341341','','撒打发的说法','31413',NULL,'SJtemplate/ggdw.jsp',00000000069,0,1),(0942624392,1,'X1','','','','','无',NULL,'1',00000000004,0,1),(0966372547,1,'你好啊。。。。','','','','','无',NULL,'1',00000000004,0,1),(0975695245,1,'请填写相应资','','','','','无',NULL,'1',00000000004,0,1),(0986030175,1,'我的爱如潮水','再也不愿见你深夜买醉','18782973698','发纵的滋味','再多的苦我也愿意背','他将你我包围',NULL,'哈哈',00000000004,0,1),(0992213302,5,'','','','','','',NULL,'',00000000004,0,1);
/*!40000 ALTER TABLE `psu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `SHOPNUM` int(9) unsigned NOT NULL COMMENT '编号',
  `BUSNAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `PINYINID` varchar(255) DEFAULT '',
  `BUSADMNUM` int(11) unsigned zerofill DEFAULT NULL COMMENT '管理员编号',
  `BUSADDR` varchar(30) DEFAULT '' COMMENT '地址',
  `BUSPHONE` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `BUSINTR` text COMMENT '简介',
  `SHOPNEWS` text COMMENT '新闻活动',
  `BUSML` varchar(50) DEFAULT NULL COMMENT '地图信息',
  `SHOPTEM` varchar(255) DEFAULT NULL COMMENT '模板位置',
  `BCNUM` int(11) unsigned zerofill DEFAULT NULL COMMENT '商铺类型',
  `HITS` int(14) unsigned DEFAULT NULL COMMENT '点击量',
  `STATUS` int(1) unsigned DEFAULT '1' COMMENT '是否启用，值0或1(启用）',
  `LOGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SHOPNUM`),
  KEY `shop-buscat` (`BCNUM`),
  KEY `shop-busadmin` (`BUSADMNUM`),
  CONSTRAINT `shop-busadmin` FOREIGN KEY (`BUSADMNUM`) REFERENCES `busadm` (`BUSADMNUM`),
  CONSTRAINT `shop-buscat` FOREIGN KEY (`BCNUM`) REFERENCES `buscat` (`BCNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (331255499,'夏月湘菜','3423',00000000001,'杨浦区彰武路20号同济联合广场 1楼   33626589','15828525253','我们成立于XXX年，是一家专业做XXXX。主要产品包括 XXX. 在学校附近，刚好去同济玩，离学校很近，饭菜口味还好吧，没什么特色，个人比较喜欢吃这家店的手撕包菜和麻婆豆腐，菜的性价比貌似没有很高吧，服务态度啥的也只能说不怎么好，饭菜量不多，点不是很大，占据了地段优势吧','夏月湘菜!仅售99元,价值160元2-3人超值套餐!麻辣鲜香,精致诱人菜...','104.12254,30.673482','SJtemplate/sdsp.jsp',00000000057,0,1,'http://127.0.0.1:8080/xdylpg/ul/u/331255499/logo/43b2a595-0566-4a4c-8ac5-4ee1cdb09279.PNG'),(435296566,'大大洗衣','2341324',00000000001,'恶趣味圣达菲','324123412','是大发送到发','阿斯顿发大水','','SJtemplate/shfw.jsp',00000000065,0,1,NULL),(448192008,'保利万和国际影城(府青店)','',00000000002,'成华区 府青路二段2号财富又一城5楼(近一环路府青立交桥)','028-83260666','以前常去的一个影院，只是后来搬家了，就很少去那边了。总得来说还是可以的！','','','SJtemplate/sdsp.jsp',00000000063,0,1,NULL),(458261164,'蓝蛙(上海环球金融中心店)','',00000000001,'浦东新区世纪大道100号上海环球金融中心B1楼','68778668','上午、晚上、深夜，店家会“根据时间调节灯光”。白天“蓝蛙”像一家“美式咖啡店”，出品透着老美的“实在”，无论色拉还是汉堡，分量都“超大”，MM们“share一份绝对足够”。晚上则变身“华丽丽”的酒吧，“招牌”蓝色灯光下弥漫开来，一个独饮或两人密语，气氛都“不错”。高峰期“有点吵”，不过不影响“旺盛的人气”啦。','','104.073672,30.663045','SJtemplate/sdsp.jsp',00000000062,0,1,NULL),(518154854,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544667835,'便民菜市（高新区）2','bianm2222',00000000004,'sdfasdfa','13141413411',' 圣达菲23d','的短发发生地方','103.988584,30.761406','SJtemplate/sdsp.jsp',00000000062,0,1,'http://127.0.0.1:8080/xdylpg/ul/u/544667835/li/68e82b5a-24eb-4f24-b2a1-83e0e71983f2.png'),(660863399,'阿玛尼皮草皮具专业洗护','amani',00000000001,'成华区二环路东二段29号SM广场B1楼阿玛尼洗护','13438140999','根据合理的商区、地标和详细的商户分类系统,为你提供成都272910个餐饮美食、婚庆、住宿酒店、美容美发等消费场所,并通过海量亲身消费者的点评聚合,以各种评分、星级的...','根据合理的商区、地标和详细的商户分类系统,为你提供成都272910个餐饮美食、婚庆、住宿酒店、美容美发等消费场所,并通过海量亲身消费者的点评聚合,以各种评分、星级的...','104.084279,30.670196','SJtemplate/shfw.jsp',00000000065,0,1,'http://127.0.0.1:8080/xdylpg/ul/u/660863399/logo/59714be9-ea51-44cd-9f86-9ce041b67942.JPG'),(694163703,'唐妃主题酒吧','tfzt',00000000001,'徐汇区东湖路7号左边胡同左转一楼   54660026','021-54660026','还没去过这么复古的酒吧、附近随便搜了一下搜到的，赞的噢，温馨的酒吧，女孩子都非常的可爱，性格也很开朗，到时间他们还会跳舞噢，适合带朋友来小聚…不错的地方…','现在的酒吧风格还真是多变呀，这家算是走复古唐朝主题，\r\n\r\n迷离的灯光，微醺的杯盏，瞬息穿越的感觉.....','104.296854,31.298354','fsdfs',00000000062,0,1,NULL),(992328756,'申通快递中和营业部','',00000000001,'双流县楠香山附近、瓦子埝内200米','61908669','','','104.090459,30.660318','SJtemplate/shfw.jsp',00000000067,0,1,NULL);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppro`
--

DROP TABLE IF EXISTS `shoppro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppro` (
  `PRONUM` int(14) NOT NULL AUTO_INCREMENT,
  `SHOPNUM` int(9) unsigned DEFAULT NULL,
  `PRONAME` varchar(14) DEFAULT NULL,
  `PROINTR` varchar(50) DEFAULT NULL,
  `PROPRI` varchar(10) DEFAULT NULL,
  `PRONEWPRI` varchar(10) DEFAULT NULL,
  `PROIMG` varchar(255) DEFAULT NULL,
  `PROORDER` int(14) DEFAULT NULL,
  PRIMARY KEY (`PRONUM`),
  KEY `sssdd` (`SHOPNUM`),
  CONSTRAINT `sssdd` FOREIGN KEY (`SHOPNUM`) REFERENCES `shop` (`SHOPNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='ddd';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppro`
--

LOCK TABLES `shoppro` WRITE;
/*!40000 ALTER TABLE `shoppro` DISABLE KEYS */;
INSERT INTO `shoppro` VALUES (1,660863399,'洗洗','打发打发但是多发的萨芬的','31','13','http://127.0.0.1:8080/xdylpg/admin/uploads/72585c26-7fa2-4d26-9b33-3a8dda264c2f.png',1),(2,660863399,'商品2 ','的撒发生的发的说法','34','','http://127.0.0.1:8080/xdylpg/admin/uploads/84acb35e-4643-488e-8914-e3b0deb12b5f.png',2),(3,660863399,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/8cab0249-e14f-42bd-871e-7a7fbdfbe781.png',3),(4,518154854,'圣达菲','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/56180f61-5843-4211-ac15-7238947fd5f9.jpg',1),(5,694163703,'sd','dfadsfasd','dsf','dfd','http://127.0.0.1:8080/xdylpg/admin/uploads/20cd6445-6c69-4cca-9923-1183d7125a84.png',2),(8,331255499,'土豆','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/5328ecd7-f733-4fe7-b25d-be8036f43e9c.jpg',1),(12,331255499,'白菜','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/a61b30a3-d917-4604-9a7c-1940cafbfd4d.jpg',2),(14,331255499,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/35c946cd-52a2-4b0e-bd3d-238cd1d7ae53.jpg',3),(17,331255499,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/16ff8c4f-e63a-4a0b-960b-2604e20e4673.jpg',4),(18,331255499,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/146371a3-d681-475d-aaa0-82049d656184.gif',6),(19,331255499,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/d67863bd-8490-41e2-a796-b28e7ec7993d.png',7),(20,331255499,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/7e45920c-b6d9-4bfc-ad29-72bb56c0cc3d.png',5),(21,435296566,'','','','','http://127.0.0.1:8080/xdylpg/admin/uploads/45262d12-fb0e-401b-9539-3dc9c3b839ca.jpg',1),(22,518154854,'','','','','http://127.0.0.1:8080/xdylpg/ul/u/544667835/pro/9c7f93f6-6594-4c7c-8f4a-958748ad6c89.png',2),(23,544667835,'','','','','http://127.0.0.1:8080/xdylpg/ul/u/544667835/pro/c168a1e3-5917-4594-8cad-a62fc4396ebb.png',1);
/*!40000 ALTER TABLE `shoppro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitimg`
--

DROP TABLE IF EXISTS `unitimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitimg` (
  `IMGNUM` int(11) NOT NULL AUTO_INCREMENT,
  `IMGPATH` varchar(255) DEFAULT NULL,
  `IMGDISC` text,
  `UNITNUM` int(10) unsigned DEFAULT NULL,
  `REALPATH` varchar(255) DEFAULT '',
  PRIMARY KEY (`IMGNUM`),
  KEY `psu-img` (`UNITNUM`),
  CONSTRAINT `psu-img` FOREIGN KEY (`UNITNUM`) REFERENCES `psu` (`UNITNUM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitimg`
--

LOCK TABLES `unitimg` WRITE;
/*!40000 ALTER TABLE `unitimg` DISABLE KEYS */;
INSERT INTO `unitimg` VALUES (32,'http://127.0.0.1:8080/xdylpg/admin/uploads/5a0c2371-9a8b-4ff9-89f6-a0c6bc1a3b43.jpg','圣达菲的算法第三方',924958691,'A:\\Workspaces\\MyEclipse10\\xdylpg\\WebRoot\\admin/http://127.0.0.1:8080/xdylpg/admin/uploads/5a0c2371-9a8b-4ff9-89f6-a0c6bc1a3b43.jpg'),(33,'http://127.0.0.1:8080/xdylpg/admin/uploads/c38db1f5-95c2-4008-a3b6-ea5c55382dbf.JPG','',448276238,'A:\\Workspaces\\MyEclipse10\\xdylpg\\WebRoot\\admin/http://127.0.0.1:8080/xdylpg/admin/uploads/c38db1f5-95c2-4008-a3b6-ea5c55382dbf.JPG');
/*!40000 ALTER TABLE `unitimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcode`
--

DROP TABLE IF EXISTS `vcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `experation` longblob,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcode`
--

LOCK TABLES `vcode` WRITE;
/*!40000 ALTER TABLE `vcode` DISABLE KEYS */;
INSERT INTO `vcode` VALUES (1,'37343d187f6748b6a00a3d09741db9ae','2014-10-18 0:41:30',1),(2,'70d570719afd43d7bd21352a1e84ceaa','2014-10-23 22:40:07',1),(3,'102c9e2c5d834df0a642582cd0679274','2014-10-29 20:23:27',1);
/*!40000 ALTER TABLE `vcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viplist`
--

DROP TABLE IF EXISTS `viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viplist` (
  `LISTNUM` int(11) NOT NULL,
  `PAGNUM` varchar(32) NOT NULL,
  `ADDTIME` datetime NOT NULL,
  `EXPIRE` datetime NOT NULL,
  PRIMARY KEY (`LISTNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='dddd';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viplist`
--

LOCK TABLES `viplist` WRITE;
/*!40000 ALTER TABLE `viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webadm`
--

DROP TABLE IF EXISTS `webadm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webadm` (
  `WEBADMNUM` int(11) NOT NULL,
  `ADMACC` varchar(30) NOT NULL,
  `ADMPW` char(32) NOT NULL,
  `ADMAUTH` int(11) NOT NULL,
  `ADMNAME` varchar(4) NOT NULL,
  `ADMPHO` varchar(30) NOT NULL,
  `ADMTEL` varchar(20) NOT NULL,
  `ADMEMAIL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`WEBADMNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webadm`
--

LOCK TABLES `webadm` WRITE;
/*!40000 ALTER TABLE `webadm` DISABLE KEYS */;
/*!40000 ALTER TABLE `webadm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-02  0:44:56
