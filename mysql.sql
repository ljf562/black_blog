-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES (NULL,0,'','','',0,1,'2020-03-24 15:25:32.820875',1,'sdf','pbkdf2_sha256$150000$OyHLi4Vn8TcZ$PXR/Kzf4dUgcpLOl/nD0bydN3saIyrbV6DMI1eJr9FM='),('2020-03-24 17:19:50.530550',0,'','','',0,1,'2020-03-24 15:25:41.519132',2,'hello','pbkdf2_sha256$150000$dP9QzONZLgZ8$bzmTzNOC80ChVTv60YGnxsoutGOkyS9nRGnZwxM5ty0='),(NULL,0,'','','',0,1,'2020-03-24 15:27:34.453509',3,'Admin','pbkdf2_sha256$150000$ryKWqKaf9gV2$XLUZ/XGFV/u8vRqP2A/+6vCkr43KAOJmKWmWTJPxOck=');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminuser_groups`
--

DROP TABLE IF EXISTS `adminuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminuser_groups_adminuser_id_group_id_c0e1876b_uniq` (`adminuser_id`,`group_id`),
  KEY `adminuser_groups_group_id_15c9f1b9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `adminuser_groups_adminuser_id_23e87301_fk_adminuser_uid` FOREIGN KEY (`adminuser_id`) REFERENCES `adminuser` (`uid`),
  CONSTRAINT `adminuser_groups_group_id_15c9f1b9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser_groups`
--

LOCK TABLES `adminuser_groups` WRITE;
/*!40000 ALTER TABLE `adminuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminuser_user_permissions`
--

DROP TABLE IF EXISTS `adminuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminuser_user_permissio_adminuser_id_permission__a8cc52e9_uniq` (`adminuser_id`,`permission_id`),
  KEY `adminuser_user_permi_permission_id_9c097573_fk_auth_perm` (`permission_id`),
  CONSTRAINT `adminuser_user_permi_adminuser_id_dd81dfcf_fk_adminuser` FOREIGN KEY (`adminuser_id`) REFERENCES `adminuser` (`uid`),
  CONSTRAINT `adminuser_user_permi_permission_id_9c097573_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser_user_permissions`
--

LOCK TABLES `adminuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `adminuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `replies` int(11) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `cid` (`cid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (3,'农业农村部：推动农资企业复工复产 切实做好农资保供','央视网消息：当前，春耕备耕从南到北逐渐展开，为做好疫情防控期间的农资供应，保障春耕生产，农业农村部昨天（28日）印发《通知》，要求各地根据疫情防控分区分级精准施策要求，划小管控单元，采取差别化措施，努力做到疫情防控、春耕备耕“两手抓”“两不误”，做到春耕未动、农资先行，突出解决农资运销“最后一公里”问题，保障春耕农资供应。','2020-03-02 10:42:27',2,1,NULL,'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg'),(6,'总书记指挥这场人民战争——不负人民','面对这一场世所罕见、突如其来、异常凶猛的新冠肺炎疫情，习近平总书记始终把人民生命安全和身体健康放在第一位，带领全党全军全国人民沉着应对危机、果断处置危机、科学防控危机，忧人民之所忧、想人民之所想，及时制定疫情防控战略策略，凝聚起全中国人民奋起抗疫的磅礴力量。','2020-03-07 16:35:33',3,4,NULL,'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg'),(8,'欢迎来到中国，我们在这里','hell咯分开时间段计科驾驶的开发卡洛斯的方块加水电费asdfk','2020-03-22 20:33:39',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(9,'当地时间3月21日19:30分，中国6人专家医疗队抵达#塞尔维亚#，随着专机带来的有中国政府紧急筹集的十几吨物资，包括呼吸机、口罩、试剂盒等防疫物资。',NULL,'2020-03-22 15:18:11',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(10,'意大利专家：高度疑似新冠病毒或于去年底已在意北部出现',NULL,'2020-03-22 15:22:58',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(11,'hello,2020年华为三星等急推5G手机 备战疫情后换机潮',NULL,'2020-03-22 16:47:50',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(12,'华为三星等急推5G手机 备战疫情后换机潮',NULL,'2020-03-22 19:33:51',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(13,'华为三星等急推5G手机 备战疫情后换机潮','对手机、电脑、平板等电子产品来说，虽然关乎性能的因素很多，但是处理器仍然是最重要的。目前三星、华为和苹果三大手机厂商，目前也是全球排在前三的手机厂商，都有自己的处理器。华为的麒麟芯片和苹果A系列芯片，性能都非常强大。而华为的顶级性能代表麒麟990 5G芯片，不仅用于5G折叠旗舰手机华为Mate Xs上，也搭载在5G旗舰平板华为MatePad Pro 5G上，无疑让这款最强性能5G平板成为外媒关注的焦点','2020-03-22 20:34:29',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(14,'我是华为三星等急推5G手机 备战疫情后换机潮',NULL,'2020-03-22 19:38:21',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(15,'华为三星等急推5G手机 备战疫情后换机潮',NULL,'2020-03-22 19:42:18',1,NULL,NULL,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg'),(16,'美国主播悲愤：中国专家都这么说了，我们政府还不急','眼看着美国确诊病例数位居全球第三、政府的政策又慢吞吞，自己的同事还因此去世，美国MSNBC主持人雷切尔·玛多（Rachel Maddow）在节目中一度语塞，看起来要哭了……','2020-03-24 19:15:10',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add article',6,'add_article'),(22,'Can change article',6,'change_article'),(23,'Can delete article',6,'delete_article'),(24,'Can view article',6,'view_article'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add mark',8,'add_mark'),(30,'Can change mark',8,'change_mark'),(31,'Can delete mark',8,'delete_mark'),(32,'Can view mark',8,'view_mark'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add adminuser',11,'add_adminuser'),(42,'Can change adminuser',11,'change_adminuser'),(43,'Can delete adminuser',11,'delete_adminuser'),(44,'Can view adminuser',11,'view_adminuser'),(45,'Can add captcha store',12,'add_captchastore'),(46,'Can change captcha store',12,'change_captchastore'),(47,'Can delete captcha store',12,'delete_captchastore'),(48,'Can view captcha store',12,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (1,'1*5=','5','224c33fda41a2251f23d0ce00c3058c56eb167ee','2020-03-24 15:53:21.666122'),(2,'7*9=','63','8cfa2a5b371bb084d5c36a5b39ccefc7b9ecc34d','2020-03-24 15:53:25.090205'),(3,'9+5=','14','2213488a16445fa7bc1fbe928df9c6219d00ab19','2020-03-24 15:53:26.949394'),(4,'9+2=','11','5ea2cadaf148657d80640f2c70cdcf787162cde5','2020-03-24 15:53:27.933554'),(5,'2-1=','1','d31022427d9d5c83adfdb1625cd7ae5fa18ccd12','2020-03-24 15:59:45.588393'),(6,'7*10=','70','92dd491720b7d7360c92c5fe635f4f0ce5b911af','2020-03-24 16:00:49.132964'),(7,'4+5=','9','f35aed08d0b31886e6418a92b5c0818517d6f2df','2020-03-24 16:01:00.418634'),(8,'5*1=','5','2654d34d6e6b8865c0af0c1c1a3bb7252f1ab6e5','2020-03-24 16:01:26.246571'),(9,'10*2=','20','07b98f9b2efead02ebe951ce00139bdae8cee4a4','2020-03-24 16:01:41.258951'),(10,'1+1=','2','384a9c4463f57ba55fc16bc111be94affc347d47','2020-03-24 16:03:27.325335'),(11,'10+10=','20','c553dfd0d78ab0cc2655e1466c8123ee7bb3e362','2020-03-24 16:05:16.407705'),(12,'10*5=','50','a8ff5c5e8d609e0fc3a42a4663f1f85f6c8feecd','2020-03-24 16:05:18.717841'),(13,'3*10=','30','697196e1a17e8dc8d793446ca6295cde06bfb99a','2020-03-24 16:09:07.122650'),(14,'3*5=','15','a33841b2d928c6408d9ef0192aabbfae8db8069f','2020-03-24 16:09:08.300047'),(15,'5*10=','50','84576e540fd936792851426aa221c83089425c37','2020-03-24 16:09:18.973705'),(16,'3+10=','13','66a87136547013228e73d06b37f5c377c0468378','2020-03-24 16:11:28.584084'),(17,'7-2=','5','3bb639d67779fdf01ff52169b1a17726c6c72062','2020-03-24 16:11:40.318699'),(18,'7+8=','15','43e80efe19da028019d4b84a8946d7797b063663','2020-03-24 16:12:26.764603'),(19,'4+10=','14','ee153a409c698e5ea95d6ae0bea1f042ddb1a80e','2020-03-24 16:13:36.190711'),(20,'6*1=','6','c508f845d1ea07a57ea1ae5743335120c26fd420','2020-03-24 16:14:09.654664'),(21,'8+2=','10','28f0a0a01ea50225889efcf5165efac821bdad60','2020-03-24 16:15:11.980653'),(22,'8*7=','56','31067b57d66c30ac4ed1f18563f3a99569cb253d','2020-03-24 16:15:12.232509'),(23,'10*6=','60','3c71cbb08e8b4e944c9da982263e52d91d732452','2020-03-24 16:15:21.665220'),(24,'4-1=','3','5ec95285d2e428c3fb27e3a3f731055a3a36cf00','2020-03-24 16:15:21.895103'),(25,'2-1=','1','09f49d013e22494a166039efbd4e9c0711c10582','2020-03-24 16:15:26.431625'),(26,'4*10=','40','7d820e7657a42c05fd93020cc9df0e92e69d9c28','2020-03-24 16:15:26.667478'),(27,'9+4=','13','fdbc028bfdde023b450a763265e8d36783bd5748','2020-03-24 16:18:09.875027'),(28,'3*8=','24','9ffd7defd2719017975c4851bfbabe6dd6068dda','2020-03-24 16:18:10.025941'),(29,'5*7=','35','cd5a95d155723a112c50cc2edd9c8b8f27d1feb0','2020-03-24 16:22:34.888278'),(30,'7+1=','8','e409556a0b377bd3bedc60263b9a985e36f67092','2020-03-24 16:25:50.647808'),(31,'2*3=','6','572ab19da5e40780fa86eac94bf32943d3e9cb89','2020-03-24 16:25:50.879827'),(32,'3*5=','15','ace2929ddee0cd3e44243d98c2e97644803c7b7d','2020-03-24 16:25:54.902411'),(33,'10*2=','20','dca444306b618ab52892d3a06e6b5d6e05ec6e7d','2020-03-24 16:25:55.066357'),(34,'7*9=','63','9afa1b438952161c6fe13a182d4d40f529d4215d','2020-03-24 16:25:55.952213'),(35,'4-2=','2','3792666a47aff9d734f51fb23ee45ff202ef546d','2020-03-24 16:25:56.099273'),(36,'3+1=','4','5be1dba2e330801ec30d8704cfcf01d3a2108111','2020-03-24 16:25:57.481502'),(37,'5*4=','20','33eb1c88351adbe7fab1d26cb50e59f9a814e938','2020-03-24 16:25:58.337085'),(38,'4+9=','13','17a7ec30492a61caf22cd986fe9c0e64fd2e5708','2020-03-24 16:25:58.560236'),(39,'5*1=','5','b35b45e1d406d99ce0b18d7385db7d63420e3434','2020-03-24 16:27:21.778929'),(40,'2*6=','12','ac98dc9e88538d8f7d059e0ada5e262acf7cf844','2020-03-24 16:27:21.949838'),(41,'10-9=','1','b0c05d21361cf9d97c37f0f5ac1b885ce22d6c9a','2020-03-24 16:27:23.662510'),(42,'9-3=','6','00bbbb0ee878d2d6d9cd7a2bcfcc8b37bb64d1d9','2020-03-24 16:27:23.792438'),(43,'5+4=','9','95be2f19c0f01e98a9ca98524dda9265f843013b','2020-03-24 16:27:24.735785'),(44,'9*9=','81','a99e8e946e21ac8518d8422165fc62fb5afa9829','2020-03-24 16:27:24.947724'),(45,'3*10=','30','2718bdf6a26d11e5ff3b22518936a65a55fffd12','2020-03-24 16:27:25.995403'),(46,'9*10=','90','32102befba0a65bcee72ea929de1cfd323277bb1','2020-03-24 16:27:26.203284'),(47,'2+6=','8','87ad190ddc35f74299b7023ab2f959d2441ca2c1','2020-03-24 16:27:27.295385'),(48,'9+10=','19','dc0d625cad46a66ee3bdc07f4bd3d2772bfaca2e','2020-03-24 16:27:27.500252'),(49,'3-2=','1','5bb9e14919ccf6da422f883fde88220ede405876','2020-03-24 16:27:40.734936'),(50,'1+7=','8','f43da8eddf53cf9848f1daabf5e0aaa61f54a1b4','2020-03-24 16:28:21.575914'),(51,'10-10=','0','a3224db3867b7a5a37e6242f2fd5e3f56f5f1d7b','2020-03-24 16:28:21.908047'),(52,'1*8=','8','958db7bef30bb12690e4a0683c2c2ea5921e423f','2020-03-24 16:28:40.713109'),(53,'10-6=','4','734ee591457a347c55c84d9c192f503730ce197b','2020-03-24 16:28:42.149975'),(54,'8-8=','0','a59a20703d251aea0076d96c2005466531d4bb76','2020-03-24 16:28:42.301954'),(55,'2+6=','8','73cc24c62679c19c47dc7fd05e38ff57bb995f2a','2020-03-24 16:30:49.390923'),(56,'9-2=','7','f6959a996dc9c50ce3ea51afedef314028ac0bc1','2020-03-24 16:30:53.118361'),(57,'8-7=','1','882a51faa75c27f3d291f0cce8c612ce312ce0e2','2020-03-24 16:35:27.167896'),(58,'6+10=','16','2af886b99755215eb6ef33b16a5c9ddd55d86678','2020-03-24 16:35:32.258139'),(59,'3-2=','1','d3e20dc3478d65f3e0faf111b1e14c3891482024','2020-03-24 16:35:50.350680'),(60,'9-2=','7','ead2928d22a9ce919d7fc3b3f3be5422601cef4f','2020-03-24 16:36:07.212026'),(61,'10-7=','3','8a805ebd99d76cab34f0ea6f7f2fa35486fcefa9','2020-03-24 16:37:38.080847'),(62,'5*1=','5','343d645f2e95f25eaff0f250e9d4f171fb6582c4','2020-03-24 16:37:46.655781'),(63,'5*5=','25','6a14a4a2367243973b0770c9b5349054fc3e0ac8','2020-03-24 16:39:37.635577'),(64,'2*10=','20','fdc1443fcbb3ed3695f68fa7e64d39840e854a42','2020-03-24 16:46:01.418051'),(65,'5*3=','15','f183434327b77ef445608a5f934b3a2507c0fdfe','2020-03-24 17:14:33.839238'),(66,'8-5=','3','0a5694aded0ab1cbb3f1bb7476142d0618a0dfc3','2020-03-24 17:14:44.595837'),(67,'10-9=','1','f9a432d32ed6d4e8dae18c8b7ee56b509ea6f309','2020-03-24 17:15:50.985079'),(68,'3+9=','12','2f2e0676914ca4d592a713ee88bb07855b9d17ac','2020-03-24 17:16:38.355392'),(69,'1*9=','9','5006a9e5121f8aa0c884ef418b23860009d43176','2020-03-24 17:16:49.746423'),(70,'9+7=','16','bec3df7cf725f426b583fa6de31edb488339b473','2020-03-24 17:20:31.377778'),(71,'7+6=','13','9d6e69996455e179fe8c0942c0067b6fe0d1f811','2020-03-24 17:20:40.356527'),(72,'7-5=','2','2a2a515e4b459b7e713084a921b6ae2f2993f349','2020-03-24 17:21:16.595041'),(73,'6*5=','30','9907995e5362e9f3cf024d403a8b0b64d72de4f7','2020-03-24 17:21:36.501586');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'python',NULL),(2,'技术文章',NULL),(3,'随笔感想',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_adminuser_uid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_adminuser_uid` FOREIGN KEY (`user_id`) REFERENCES `adminuser` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'App','adminuser'),(6,'App','article'),(7,'App','category'),(8,'App','mark'),(9,'App','tag'),(10,'App','user'),(3,'auth','group'),(2,'auth','permission'),(12,'captcha','captchastore'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-24 15:18:59.193536'),(2,'contenttypes','0002_remove_content_type_name','2020-03-24 15:19:00.280924'),(3,'auth','0001_initial','2020-03-24 15:19:01.769737'),(4,'auth','0002_alter_permission_name_max_length','2020-03-24 15:19:06.023963'),(5,'auth','0003_alter_user_email_max_length','2020-03-24 15:19:06.117919'),(6,'auth','0004_alter_user_username_opts','2020-03-24 15:19:06.183906'),(7,'auth','0005_alter_user_last_login_null','2020-03-24 15:19:06.211902'),(8,'auth','0006_require_contenttypes_0002','2020-03-24 15:19:06.245880'),(9,'auth','0007_alter_validators_add_error_messages','2020-03-24 15:19:06.278869'),(10,'auth','0008_alter_user_username_max_length','2020-03-24 15:19:06.350828'),(11,'auth','0009_alter_user_last_name_max_length','2020-03-24 15:19:06.402798'),(12,'auth','0010_alter_group_name_max_length','2020-03-24 15:19:07.120251'),(13,'auth','0011_update_proxy_permissions','2020-03-24 15:19:07.164414'),(14,'App','0001_initial','2020-03-24 15:19:54.225519'),(15,'admin','0001_initial','2020-03-24 15:19:58.748339'),(16,'admin','0002_logentry_remove_auto_add','2020-03-24 15:20:00.263023'),(17,'admin','0003_logentry_add_action_flag_choices','2020-03-24 15:20:00.322958'),(18,'captcha','0001_initial','2020-03-24 15:20:00.775840'),(19,'sessions','0001_initial','2020-03-24 15:20:01.039150');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'不错继续努力','2020-03-06 23:15:34',1),(2,'那些经常出现在报纸、杂志、新闻头条的公众人物，还是一出生就拥有别人一生想要追求的地位、财富，又或者是凭借着自己的努力最终创就一番事业的人','2020-03-05 23:16:23',2),(3,'hello阿斯蒂芬拉水电费','2020-03-07 02:57:04',NULL),(4,'我是谁','2020-03-07 02:57:24',NULL),(5,'你是','2020-03-07 03:00:33',NULL);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (2,'话题',3),(7,'支援，团结',9),(8,'抗疫',10),(9,'爱心',10),(10,'心情',11),(11,'语言',11),(12,'快乐',11),(13,'心情',12),(14,'语言',12),(17,'心情',14),(18,'语言',14),(19,'心情',15),(20,'语言',15),(28,'hello',8),(29,'欢迎',8),(30,'心情',13),(31,'语言',13),(32,'疫情',16);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `portrait` varchar(300) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `isforbid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'张三','123','10086','10086@163.com',NULL,'2020-03-02 09:25:08',NULL),(2,'李四','123','1008612','1008612@163.com',NULL,'2020-03-02 09:26:52',NULL),(3,'王五','123','10086123','10086123@163.com',NULL,'2020-03-02 09:27:49',NULL),(4,'林俊帆','40bd001563085fc35165329ea1ff5c5ecbdbbeef','13763068652',NULL,NULL,NULL,0),(5,'hello','40bd001563085fc35165329ea1ff5c5ecbdbbeef','15768624780',NULL,NULL,NULL,0),(6,'钱七','51eac6b471a284d3341d8c0c63d0f1a286262a18','13763068652',NULL,NULL,NULL,0),(7,'小白','40bd001563085fc35165329ea1ff5c5ecbdbbeef','15768624780',NULL,NULL,NULL,0),(8,'小品','40bd001563085fc35165329ea1ff5c5ecbdbbeef','15768624780',NULL,NULL,NULL,0),(9,'hello99','456','15768624780',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-25  1:36:10
