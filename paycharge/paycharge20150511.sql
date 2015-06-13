-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paycharge
-- ------------------------------------------------------
-- Server version	5.5.43-0+deb8u1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current` tinyint(1) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'100','Bruce Luft',''),(2,1,'101','Becky Sue Bewley',''),(3,1,'102','Patricia Sullins',''),(4,1,'103','Rashelle Payton',''),(5,1,'200','Ronald Elisson, Jr.',''),(6,1,'201','Joseph Bradfield',''),(7,1,'202','Erica Terrell',''),(8,1,'203','Susan Kastner',''),(9,1,'104','Lourdes Chavez, Angel Renteria',''),(10,1,'105','Patricia Pichardo, employee',''),(12,1,'107','Diego Ramirez-Guzman',''),(13,1,'108','Teri Patri',''),(14,1,'109','Sharon Pezzimenti',''),(15,1,'110','Lynandrea J. Wayerski',''),(16,1,'111','Emiliano Ramirez',''),(17,1,'204','Roderick Roundtree',''),(18,1,'205','Manuel Garduno',''),(19,1,'206','GustavaSuarezMariaDeloera',''),(20,1,'207','Kiu Ung',''),(21,1,'208','Theresa Gouveia Rhonda Hooker',''),(22,1,'209','Edward Turner',''),(23,1,'210','Haby Sy, Omar Ding',''),(24,1,'211','Jose Flores, employee',''),(26,1,'113','Manuel Lopez, Melissa Lopez',''),(28,1,'115','Wendy Granados',''),(29,1,'116','Gregorio Lizaso',''),(30,1,'117','John Lee, Nickie Lee',''),(31,1,'118','William Kirchner',''),(32,1,'119','Eleanor Simmons',''),(33,1,'212','Skye Johnson',''),(34,1,'213','Billy Neal',''),(35,1,'214','Donna Riley',''),(38,1,'217','Jose M. Garcia',''),(39,1,'218','Denise Domingos',''),(40,1,'219','Jordyn Miller',''),(41,1,'120','Marcian Escala ',''),(42,1,'121','Angel DeLaGarza',''),(43,1,'122','Leroy Ball',''),(44,1,'123','Carlos Vasquez-Rodriguez',''),(45,1,'220','Alan Figliolia',''),(46,1,'221','Darran Wells',''),(47,1,'222','Nicole Louise Perron',''),(48,1,'223','Marco Lopez',''),(49,1,'124','Jennyrose Ginalyn Ebora, Evalyn Tole',''),(50,1,'125','Nurys Rodriguez',''),(51,1,'126','Georgia Brown',''),(52,1,'127','Juliana Dychioco',''),(53,1,'128','Brenda Trujillo',''),(54,1,'129','Brenda Cabrejos',''),(55,1,'130','Virginia Bernal',''),(56,1,'131','Synthia Mosley',''),(57,1,'224','Jose Molinero',''),(58,1,'225','Christopher Thomas Miles',''),(59,1,'226','Gilbert Baca Carina Gonzalez',''),(60,1,'227','Shamese Peebles',''),(61,1,'228','Edwin Yvonne Larsen',''),(62,1,'229','Marleen Uso Anna Maria Pacheco',''),(63,1,'230','Adrian Gonzalez',''),(64,1,'231','Dario Pinto',''),(65,1,'132','Asalia Rivera-Gonzalez, Andrea Rivera',''),(66,1,'133','Christina Grant',''),(67,1,'134','Crystal Magallanes',''),(68,1,'135','Damien Watts',''),(69,1,'232','Lukoki G. Mabela',''),(70,1,'233','Mitchell Lee Kemper',''),(71,1,'234','Stacey Shell',''),(72,1,'235','Jessica Champa',''),(73,1,'136','John Hunt',''),(74,1,'137','Eric Camarillo',''),(75,1,'138','Blanca Galdamez',''),(76,1,'139','Brandon Liane Cabral',''),(77,1,'140','Christina M. Del Toro',''),(78,1,'141','Carlos Fletes-Medina',''),(79,1,'142','Juan Pablo Ocampo',''),(80,1,'143','Nick Costello',''),(81,1,'236','Emanuella Lewis',''),(82,1,'237','Tyler W. Weiss',''),(83,1,'238','Janinka Jamie McGovern',''),(84,1,'239','Ramon Rubalcava-Flores',''),(85,1,'240','Wyatt Fuqua',''),(86,1,'241','Kenneth Coon Lori Jurman',''),(87,1,'242','Miracle I. Anyanwu',''),(88,1,'243','Angie Freeman',''),(89,1,'144','Michael Diamond',''),(90,1,'145','William Rawson',''),(91,1,'146','Maria Uvera',''),(92,1,'147','Patricia Quinn',''),(93,1,'148','Amy L. Stovall',''),(94,1,'149','Christine Drew',''),(95,1,'150','Jeffrey Pangilinan',''),(96,1,'151','David Hernandez, Jr.',''),(97,1,'244','Robert Linda Vogel',''),(98,1,'245','Randy Lynn Combs, Kim Mortensen',''),(99,1,'246','Doroide & Maria E. Genebroso',''),(100,1,'247','Benjamin Douzat',''),(101,1,'248','Marco Orozco',''),(102,1,'249','Peggy Duran, Herbert \"Ray\" Wilson',''),(103,1,'250','Jesus Ernesto',''),(104,1,'251','Thomas Harrison',''),(105,1,'152','Peter Moon',''),(106,1,'153','Jesus Martinez',''),(107,1,'154','Richard Rzepka',''),(108,1,'155','Robert Section',''),(109,1,'156','Gaylynn Scatton Ana Santos',''),(110,1,'157','Scott Trickler',''),(111,1,'158','Eric Scott',''),(112,1,'159','Gerardo Palafox, Deanna Wallace',''),(113,1,'252','WilliamKneenXiaoyiKneen',''),(114,1,'253','Tyler M. Smith',''),(115,1,'254','Jorge Gonzalez',''),(116,1,'255','Matthew Godreau, Marielle Moran',''),(117,1,'256','Lisa Alain',''),(118,1,'257','Keanna Kane',''),(119,1,'258','Nicolas Perez',''),(120,1,'259','Cynthia Smith',''),(121,1,'160','Luis F. Dunn-Gomez',''),(122,1,'161','Velia Hernandez',''),(123,1,'162','Irma Vargas',''),(124,1,'163','Philip A. Costarella',''),(125,1,'164','Matt Hoffman, Audra Wilson',''),(126,1,'165','Gina Vereb',''),(127,1,'166','Virgina Lee Mark McBride',''),(128,1,'167','Marlene Skaggs',''),(129,1,'260','Nancy Seales Kane',''),(130,1,'261','Jennell Cooper',''),(131,1,'262','Nestor Pinto',''),(132,1,'263','Melanio Remedio',''),(133,1,'264','Ian Henley',''),(134,1,'265','Geneone Berkley',''),(135,1,'266','Juakyeen Ridgeway',''),(136,1,'267','Gary L. Myers',''),(137,1,'168','Grennan Crocker Tyrone Felder',''),(138,1,'169','Charlotte Blanche',''),(139,1,'170','Wanda Briggs',''),(140,1,'171','Mary Schultz',''),(141,1,'172','Monique Nivela',''),(142,1,'173','Mark Bundy',''),(143,1,'174','James Charles',''),(144,1,'175','Danielle Bell',''),(145,1,'268','Michael J. Burns',''),(146,1,'269','Steven Lagarde',''),(147,1,'270','LaBrenda Henley',''),(148,1,'271','Ana Vargas-Machuca',''),(149,1,'272','Jeromy Stone ',''),(150,1,'273','Michael Borucki',''),(151,1,'274','Aaron Hord Jonathon Nelson',''),(152,1,'275','Dorian Hansrote',''),(153,1,'176','Teresa Quniteros',''),(154,1,'177','Benito Delgado',''),(155,1,'178','Lourdes Ibarra',''),(156,1,'179','MiriamValenzuelaGriseldaMejia',''),(157,1,'180','Lora Van Dusen',''),(158,1,'181','Julie, Melody Dufour',''),(159,1,'182','Bhob Peligro',''),(160,1,'183','Jennifer Michael Clark',''),(161,1,'276','FranciscoArreola-MartinezMartha',''),(162,1,'277','CaseyDusenberyNatalieCKhoulis',''),(163,1,'278','LuzSanchezSamierCotto-Sarceno',''),(164,1,'279','Isabel Cuautle',''),(165,1,'280','KimberlyGrovesGarretteEastep',''),(166,1,'281','Claudio Rojas-Perez',''),(167,1,'282','David Puterbaugh ',''),(168,1,'283','Otto Gonzalez, Ricardo Reyes',''),(169,1,'184','Mattie Dufriend',''),(170,1,'185','VincentVonKeislerMarileneMarque',''),(171,1,'186','Vickie Sullins',''),(172,1,'187','Hilario S. Soto',''),(173,1,'188','Hugo Alamillo',''),(174,1,'189','Israel Rodriguez',''),(175,1,'190','Timothy Sullivan, Leandra Paine',''),(176,1,'191','Ana Martinez',''),(177,1,'284','Jonie Dixon',''),(178,1,'285','Erich Schulte Marina Veiga',''),(179,1,'286','Miguel A. Salguero',''),(180,1,'287','David Saenphansuri',''),(181,1,'288','Robert Morales',''),(182,1,'289','BrittanyPalafox, AlyssaCruz',''),(183,1,'290','Jason Alexander',''),(184,1,'291','AmauryMorales-ReyesYamirka',''),(185,1,'192','Nubia Arellano',''),(186,1,'193','Tony Hrenko Karma Maliar',''),(187,1,'194','William, Carla Slocum',''),(188,1,'195','Sarah Whipple',''),(189,1,'196','Claudette Guillen',''),(190,1,'197','Sherry Hendon',''),(191,1,'198','Karen Dragna',''),(192,1,'199','Kish Scarberry Ciara Yancy',''),(193,1,'292','Eric, Nova Santos',''),(194,1,'293','Michael E. Jordan Porsha Toombs',''),(195,1,'294','JacobArmijoSamanthaHenderson',''),(196,1,'295','Jonathon A. Deutsch',''),(197,1,'296','Michele R. Martinez',''),(198,1,'297','Michelle Geason, Juanita Owens',''),(199,1,'298','Adrianne Simpson','');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acct_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cash` decimal(8,2) NOT NULL,
  `tender` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `wf` varchar(255) NOT NULL COMMENT 'for charges only',
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
INSERT INTO `ledger` VALUES (1,1,'2015-06-12 02:24:56',625.00,'','','RENT#201506','Rent charged for Jun 2015'),(2,2,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(3,3,'2015-06-12 02:24:56',605.00,'','','RENT#201506','Rent charged for Jun 2015'),(4,4,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(5,5,'2015-06-12 02:24:56',585.00,'','','RENT#201506','Rent charged for Jun 2015'),(6,6,'2015-06-12 02:24:56',610.00,'','','RENT#201506','Rent charged for Jun 2015'),(7,7,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(8,8,'2015-06-12 02:24:56',730.00,'','','RENT#201506','Rent charged for Jun 2015'),(9,9,'2015-06-12 02:24:56',750.00,'','','RENT#201506','Rent charged for Jun 2015'),(10,12,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(11,13,'2015-06-12 02:24:56',830.00,'','','RENT#201506','Rent charged for Jun 2015'),(12,14,'2015-06-12 02:24:56',785.00,'','','RENT#201506','Rent charged for Jun 2015'),(13,15,'2015-06-12 02:24:56',745.00,'','','RENT#201506','Rent charged for Jun 2015'),(14,16,'2015-06-12 02:24:56',765.00,'','','RENT#201506','Rent charged for Jun 2015'),(15,17,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(16,18,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(17,19,'2015-06-12 02:24:56',775.00,'','','RENT#201506','Rent charged for Jun 2015'),(18,20,'2015-06-12 02:24:56',750.00,'','','RENT#201506','Rent charged for Jun 2015'),(19,21,'2015-06-12 02:24:56',795.00,'','','RENT#201506','Rent charged for Jun 2015'),(20,22,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(21,23,'2015-06-12 02:24:56',800.00,'','','RENT#201506','Rent charged for Jun 2015'),(22,26,'2015-06-12 02:24:56',565.00,'','','RENT#201506','Rent charged for Jun 2015'),(23,28,'2015-06-12 02:24:56',610.00,'','','RENT#201506','Rent charged for Jun 2015'),(24,29,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(25,30,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(26,31,'2015-06-12 02:24:56',625.00,'','','RENT#201506','Rent charged for Jun 2015'),(27,32,'2015-06-12 02:24:56',585.00,'','','RENT#201506','Rent charged for Jun 2015'),(28,33,'2015-06-12 02:24:56',605.00,'','','RENT#201506','Rent charged for Jun 2015'),(29,34,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(30,35,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(31,38,'2015-06-12 02:24:56',575.00,'','','RENT#201506','Rent charged for Jun 2015'),(32,39,'2015-06-12 02:24:56',600.00,'','','RENT#201506','Rent charged for Jun 2015'),(33,40,'2015-06-12 02:24:56',600.00,'','','RENT#201506','Rent charged for Jun 2015'),(34,41,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(35,42,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(36,43,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(37,44,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(38,45,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(39,46,'2015-06-12 02:24:56',605.00,'','','RENT#201506','Rent charged for Jun 2015'),(40,47,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(41,48,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(42,49,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(43,50,'2015-06-12 02:24:56',825.00,'','','RENT#201506','Rent charged for Jun 2015'),(44,51,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(45,52,'2015-06-12 02:24:56',850.00,'','','RENT#201506','Rent charged for Jun 2015'),(46,53,'2015-06-12 02:24:56',790.00,'','','RENT#201506','Rent charged for Jun 2015'),(47,54,'2015-06-12 02:24:56',745.00,'','','RENT#201506','Rent charged for Jun 2015'),(48,55,'2015-06-12 02:24:56',800.00,'','','RENT#201506','Rent charged for Jun 2015'),(49,56,'2015-06-12 02:24:56',825.00,'','','RENT#201506','Rent charged for Jun 2015'),(50,57,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(51,58,'2015-06-12 02:24:56',860.00,'','','RENT#201506','Rent charged for Jun 2015'),(52,59,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(53,60,'2015-06-12 02:24:56',775.00,'','','RENT#201506','Rent charged for Jun 2015'),(54,61,'2015-06-12 02:24:56',795.00,'','','RENT#201506','Rent charged for Jun 2015'),(55,62,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(56,63,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(57,64,'2015-06-12 02:24:56',790.00,'','','RENT#201506','Rent charged for Jun 2015'),(58,65,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(59,66,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(60,67,'2015-06-12 02:24:56',610.00,'','','RENT#201506','Rent charged for Jun 2015'),(61,68,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(62,69,'2015-06-12 02:24:56',565.00,'','','RENT#201506','Rent charged for Jun 2015'),(63,70,'2015-06-12 02:24:56',600.00,'','','RENT#201506','Rent charged for Jun 2015'),(64,71,'2015-06-12 02:24:56',615.00,'','','RENT#201506','Rent charged for Jun 2015'),(65,72,'2015-06-12 02:24:56',625.00,'','','RENT#201506','Rent charged for Jun 2015'),(66,73,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(67,74,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(68,75,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(69,76,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(70,77,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(71,78,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(72,79,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(73,80,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(74,81,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(75,82,'2015-06-12 02:24:56',620.00,'','','RENT#201506','Rent charged for Jun 2015'),(76,83,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(77,84,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(78,85,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(79,86,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(80,87,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(81,88,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(82,89,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(83,90,'2015-06-12 02:24:56',590.00,'','','RENT#201506','Rent charged for Jun 2015'),(84,91,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(85,92,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(86,93,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(87,94,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(88,95,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(89,96,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(90,97,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(91,98,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(92,99,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(93,100,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(94,101,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(95,102,'2015-06-12 02:24:56',665.00,'','','RENT#201506','Rent charged for Jun 2015'),(96,103,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(97,104,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(98,105,'2015-06-12 02:24:56',685.00,'','','RENT#201506','Rent charged for Jun 2015'),(99,106,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(100,107,'2015-06-12 02:24:56',740.00,'','','RENT#201506','Rent charged for Jun 2015'),(101,108,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(102,109,'2015-06-12 02:24:56',575.00,'','','RENT#201506','Rent charged for Jun 2015'),(103,110,'2015-06-12 02:24:56',700.00,'','','RENT#201506','Rent charged for Jun 2015'),(104,111,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(105,112,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(106,113,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(107,114,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(108,115,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(109,116,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(110,117,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(111,118,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(112,119,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(113,120,'2015-06-12 02:24:56',700.00,'','','RENT#201506','Rent charged for Jun 2015'),(114,121,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(115,122,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(116,123,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(117,124,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(118,125,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(119,126,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(120,127,'2015-06-12 02:24:56',780.00,'','','RENT#201506','Rent charged for Jun 2015'),(121,128,'2015-06-12 02:24:56',785.00,'','','RENT#201506','Rent charged for Jun 2015'),(122,129,'2015-06-12 02:24:56',790.00,'','','RENT#201506','Rent charged for Jun 2015'),(123,130,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(124,131,'2015-06-12 02:24:56',790.00,'','','RENT#201506','Rent charged for Jun 2015'),(125,132,'2015-06-12 02:24:56',865.00,'','','RENT#201506','Rent charged for Jun 2015'),(126,133,'2015-06-12 02:24:56',775.00,'','','RENT#201506','Rent charged for Jun 2015'),(127,134,'2015-06-12 02:24:56',785.00,'','','RENT#201506','Rent charged for Jun 2015'),(128,135,'2015-06-12 02:24:56',775.00,'','','RENT#201506','Rent charged for Jun 2015'),(129,136,'2015-06-12 02:24:56',770.00,'','','RENT#201506','Rent charged for Jun 2015'),(130,137,'2015-06-12 02:24:56',640.00,'','','RENT#201506','Rent charged for Jun 2015'),(131,138,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(132,139,'2015-06-12 02:24:56',575.00,'','','RENT#201506','Rent charged for Jun 2015'),(133,140,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(134,141,'2015-06-12 02:24:56',645.00,'','','RENT#201506','Rent charged for Jun 2015'),(135,142,'2015-06-12 02:24:56',625.00,'','','RENT#201506','Rent charged for Jun 2015'),(136,143,'2015-06-12 02:24:56',654.00,'','','RENT#201506','Rent charged for Jun 2015'),(137,144,'2015-06-12 02:24:56',575.00,'','','RENT#201506','Rent charged for Jun 2015'),(138,145,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(139,146,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(140,147,'2015-06-12 02:24:56',595.00,'','','RENT#201506','Rent charged for Jun 2015'),(141,148,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(142,149,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(143,150,'2015-06-12 02:24:56',635.00,'','','RENT#201506','Rent charged for Jun 2015'),(144,151,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(145,152,'2015-06-12 02:24:56',630.00,'','','RENT#201506','Rent charged for Jun 2015'),(146,153,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(147,154,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(148,155,'2015-06-12 02:24:56',699.00,'','','RENT#201506','Rent charged for Jun 2015'),(149,156,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(150,157,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(151,158,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(152,159,'2015-06-12 02:24:56',695.00,'','','RENT#201506','Rent charged for Jun 2015'),(153,160,'2015-06-12 02:24:56',735.00,'','','RENT#201506','Rent charged for Jun 2015'),(154,161,'2015-06-12 02:24:56',695.00,'','','RENT#201506','Rent charged for Jun 2015'),(155,162,'2015-06-12 02:24:56',675.00,'','','RENT#201506','Rent charged for Jun 2015'),(156,163,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(157,164,'2015-06-12 02:24:56',750.00,'','','RENT#201506','Rent charged for Jun 2015'),(158,165,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(159,166,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(160,167,'2015-06-12 02:24:56',730.00,'','','RENT#201506','Rent charged for Jun 2015'),(161,168,'2015-06-12 02:24:56',715.00,'','','RENT#201506','Rent charged for Jun 2015'),(162,169,'2015-06-12 02:24:56',705.00,'','','RENT#201506','Rent charged for Jun 2015'),(163,170,'2015-06-12 02:24:56',685.00,'','','RENT#201506','Rent charged for Jun 2015'),(164,171,'2015-06-12 02:24:56',740.00,'','','RENT#201506','Rent charged for Jun 2015'),(165,172,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(166,173,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(167,174,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(168,175,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(169,176,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(170,177,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(171,178,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(172,179,'2015-06-12 02:24:56',685.00,'','','RENT#201506','Rent charged for Jun 2015'),(173,180,'2015-06-12 02:24:56',685.00,'','','RENT#201506','Rent charged for Jun 2015'),(174,181,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(175,182,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(176,183,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(177,184,'2015-06-12 02:24:56',740.00,'','','RENT#201506','Rent charged for Jun 2015'),(178,185,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(179,186,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(180,187,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(181,188,'2015-06-12 02:24:56',735.00,'','','RENT#201506','Rent charged for Jun 2015'),(182,189,'2015-06-12 02:24:56',685.00,'','','RENT#201506','Rent charged for Jun 2015'),(183,190,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(184,191,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(185,192,'2015-06-12 02:24:56',720.00,'','','RENT#201506','Rent charged for Jun 2015'),(186,193,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(187,194,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(188,195,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(189,196,'2015-06-12 02:24:56',715.00,'','','RENT#201506','Rent charged for Jun 2015'),(190,197,'2015-06-12 02:24:56',710.00,'','','RENT#201506','Rent charged for Jun 2015'),(191,198,'2015-06-12 02:24:56',725.00,'','','RENT#201506','Rent charged for Jun 2015'),(192,199,'2015-06-12 02:24:56',760.00,'','','RENT#201506','Rent charged for Jun 2015'),(193,2,'2015-06-12 02:41:54',292.00,'','','',''),(194,78,'2015-06-12 02:42:02',983.00,'','','','fsalkd'),(195,156,'2015-06-12 02:42:09',273.00,'','','',''),(196,199,'2015-06-12 02:42:18',284.22,'','','','asdlkfj'),(197,199,'2015-06-12 02:51:56',555.00,'','','','dfsd'),(198,199,'2015-06-12 02:54:07',559.00,'','','','dfs'),(199,4,'2015-06-12 05:30:00',-393.00,'cash','','','asdlk'),(200,51,'2015-06-12 05:58:00',-800.00,'cash','','','lolll happy birthday');
/*!40000 ALTER TABLE `ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pardons`
--

DROP TABLE IF EXISTS `pardons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pardons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acct_id` int(11) NOT NULL,
  `lf_stop` date NOT NULL,
  `expiry` date NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pardons`
--

LOCK TABLES `pardons` WRITE;
/*!40000 ALTER TABLE `pardons` DISABLE KEYS */;
INSERT INTO `pardons` VALUES (3,22,'2015-06-11','2015-06-30','adslk'),(4,13,'2015-06-19','2015-06-30','asdfadsfa'),(5,17,'2015-06-13','2015-06-30','lkdl'),(6,3,'2015-06-08','2015-06-30','asldk');
/*!40000 ALTER TABLE `pardons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurring`
--

DROP TABLE IF EXISTS `recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acct_id` int(11) NOT NULL,
  `cash` decimal(8,2) NOT NULL,
  `wf` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurring`
--

LOCK TABLES `recurring` WRITE;
/*!40000 ALTER TABLE `recurring` DISABLE KEYS */;
INSERT INTO `recurring` VALUES (3,2,640.00,''),(4,3,605.00,''),(5,4,645.00,''),(6,5,585.00,''),(7,6,610.00,''),(8,7,635.00,''),(9,8,730.00,''),(10,9,750.00,''),(11,10,0.00,''),(12,12,780.00,''),(13,13,830.00,''),(14,14,785.00,''),(15,15,745.00,''),(16,16,765.00,''),(17,17,770.00,''),(18,18,780.00,''),(19,19,775.00,''),(20,20,750.00,''),(21,21,795.00,''),(22,22,770.00,''),(23,23,800.00,''),(24,24,0.00,''),(25,26,565.00,''),(26,28,610.00,''),(27,29,595.00,''),(28,30,615.00,''),(29,31,625.00,''),(30,32,585.00,''),(31,33,605.00,''),(32,34,615.00,''),(33,35,615.00,''),(34,38,575.00,''),(35,39,600.00,''),(36,40,600.00,''),(37,41,645.00,''),(38,42,640.00,''),(39,43,595.00,''),(40,44,645.00,''),(41,45,640.00,''),(42,46,605.00,''),(43,47,630.00,''),(44,48,645.00,''),(45,49,780.00,''),(46,50,825.00,''),(47,51,780.00,''),(48,52,850.00,''),(49,53,790.00,''),(50,54,745.00,''),(51,55,800.00,''),(52,56,825.00,''),(53,57,770.00,''),(54,58,860.00,''),(55,59,770.00,''),(56,60,775.00,''),(57,61,795.00,''),(58,62,770.00,''),(59,63,770.00,''),(60,64,790.00,''),(61,65,645.00,''),(62,66,615.00,''),(63,67,610.00,''),(64,68,615.00,''),(65,69,565.00,''),(66,70,600.00,''),(67,71,615.00,''),(68,72,625.00,''),(69,73,630.00,''),(70,74,640.00,''),(71,75,640.00,''),(72,76,640.00,''),(73,77,640.00,''),(74,78,640.00,''),(75,79,640.00,''),(76,80,645.00,''),(77,81,635.00,''),(78,82,620.00,''),(79,83,630.00,''),(80,84,630.00,''),(81,85,595.00,''),(82,86,645.00,''),(83,87,630.00,''),(84,88,720.00,''),(85,89,640.00,''),(86,90,590.00,''),(87,91,645.00,''),(88,92,640.00,''),(89,93,640.00,''),(90,94,640.00,''),(91,95,645.00,''),(92,96,645.00,''),(93,97,630.00,''),(94,98,595.00,''),(95,99,595.00,''),(96,100,645.00,''),(97,101,630.00,''),(98,102,665.00,''),(99,103,645.00,''),(100,104,720.00,''),(101,105,685.00,''),(102,106,645.00,''),(103,107,740.00,''),(104,108,645.00,''),(105,109,575.00,''),(106,110,700.00,''),(107,111,595.00,''),(108,112,640.00,''),(109,113,635.00,''),(110,114,630.00,''),(111,115,630.00,''),(112,116,635.00,''),(113,117,630.00,''),(114,118,630.00,''),(115,119,630.00,''),(116,120,700.00,''),(117,121,780.00,''),(118,122,760.00,''),(119,123,780.00,''),(120,124,780.00,''),(121,125,780.00,''),(122,126,780.00,''),(123,127,780.00,''),(124,128,785.00,''),(125,129,790.00,''),(126,130,770.00,''),(127,131,790.00,''),(128,132,865.00,''),(129,133,775.00,''),(130,134,785.00,''),(131,135,775.00,''),(132,136,770.00,''),(133,137,640.00,''),(134,138,645.00,''),(135,139,575.00,''),(136,140,645.00,''),(137,141,645.00,''),(138,142,625.00,''),(139,143,654.00,''),(140,144,575.00,''),(141,145,595.00,''),(142,146,595.00,''),(143,147,595.00,''),(144,148,635.00,''),(145,149,630.00,''),(146,150,635.00,''),(147,151,630.00,''),(148,152,630.00,''),(149,153,720.00,''),(150,154,720.00,''),(151,155,699.00,''),(152,156,720.00,''),(153,157,725.00,''),(154,158,760.00,''),(155,159,695.00,''),(156,160,735.00,''),(157,161,695.00,''),(158,162,675.00,''),(159,163,710.00,''),(160,164,750.00,''),(161,165,710.00,''),(162,166,710.00,''),(163,167,730.00,''),(164,168,715.00,''),(165,169,705.00,''),(166,170,685.00,''),(167,171,740.00,''),(168,172,720.00,''),(169,173,725.00,''),(170,174,760.00,''),(171,175,760.00,''),(172,176,725.00,''),(173,177,710.00,''),(174,178,710.00,''),(175,179,685.00,''),(176,180,685.00,''),(177,181,710.00,''),(178,182,710.00,''),(179,183,710.00,''),(180,184,740.00,''),(181,185,725.00,''),(182,186,720.00,''),(183,187,710.00,''),(184,188,735.00,''),(185,189,685.00,''),(186,190,720.00,''),(187,191,760.00,''),(188,192,720.00,''),(189,193,725.00,''),(190,194,710.00,''),(191,195,710.00,''),(192,196,715.00,''),(193,197,710.00,''),(194,198,725.00,''),(195,199,760.00,''),(196,1,625.00,'');
/*!40000 ALTER TABLE `recurring` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-12  9:27:23
