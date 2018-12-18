-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: canchas
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Banco de Crédito del Perú'),(2,'Interbank'),(3,'BBVA'),(4,'Scotiabank');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'banner1','vuTxgZLEkzRjSLiyTYHqdKKixlVrHqhQClIEgbelazhRjqDhJp.png'),(2,'banner2','HkDGigRUENXwoiSuaSmnWqFmeBzninsJGstAsJVaUXMvYCgyTR.png'),(3,'banner3','wgPsuXxzcdcimzlyemklkCiNiLlfkoACHOLXXhgrMUvIwGpYtJ.png'),(4,'banner4','rWHUKuhKcDctkrolRFoWKonbqnkMmVkttOqppueQPiOfTQqanF.png'),(7,'banner5','QGoGupCdFPemfMZAhFpNheTMLgpitNtVCzxHSgPUjButboVEJk.png');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_correlations`
--

DROP TABLE IF EXISTS `client_correlations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_correlations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20180002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_correlations`
--

LOCK TABLES `client_correlations` WRITE;
/*!40000 ALTER TABLE `client_correlations` DISABLE KEYS */;
INSERT INTO `client_correlations` VALUES (1),(2),(3),(4),(5),(6),(7),(20180000),(20180001);
/*!40000 ALTER TABLE `client_correlations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_states`
--

DROP TABLE IF EXISTS `client_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_states`
--

LOCK TABLES `client_states` WRITE;
/*!40000 ALTER TABLE `client_states` DISABLE KEYS */;
INSERT INTO `client_states` VALUES (1,'Activo'),(2,'Suspendido'),(3,'En Remodelaciones');
/*!40000 ALTER TABLE `client_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `address` varchar(80) NOT NULL,
  `logo_url` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `account` varchar(25) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `client_state_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Pepe Valdivia','Calle Mariano Pacajlkds','MPjLNSLFQDhOFzXkqjWZHPsRZeBLUUAudzChBHJlxVEwXAoFNG.png','XD',123,31,'192803812903','0912831902',58,1265,2,1),(2,'PEp','asdfadsf','MZYLNZlvmmiJjfWRCHZggCTwwngEDmiOgIgOWwWsjROzKstbDa.png','afdaskjfa',12,32,'12312','312312',58,9,3,1),(3,'Pepe Valdivia','Calle Mariano Pacajlkds','MPjLNSLFQDhOFzXkqjWZHPsRZeBLUUAudzChBHJlxVEwXAoFNG.png','XD',123,31,'192803812903','0912831902',58,1265,1,1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_services`
--

DROP TABLE IF EXISTS `clients_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `clients_services_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clients_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_services`
--

LOCK TABLES `clients_services` WRITE;
/*!40000 ALTER TABLE `clients_services` DISABLE KEYS */;
INSERT INTO `clients_services` VALUES (1,3,1),(4,3,5),(5,1,1),(6,1,3),(7,1,2),(8,1,4);
/*!40000 ALTER TABLE `clients_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Amazonas'),(2,'Ancash'),(3,'Apurimac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Callao'),(8,'Cuzco'),(9,'Huancavelica'),(10,'Huánuco'),(11,'Ica'),(12,'Junin'),(13,'La Libertad'),(14,'Lambayeque'),(15,'Lima'),(16,'Loreto'),(17,'Madre de Dios'),(18,'Moquegua'),(19,'Pasco'),(20,'Piura'),(21,'Puno'),(22,'San Martín'),(23,'Tacna'),(24,'Tumbes'),(25,'Ucayali');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Chachapoyas',1,NULL,NULL),(2,'Asuncion',1,NULL,NULL),(3,'Balsas',1,NULL,NULL),(4,'Cheto',1,NULL,NULL),(5,'Chiliquin',1,NULL,NULL),(6,'Chuquibamba',1,NULL,NULL),(7,'Granada',1,NULL,NULL),(8,'Huancas',1,NULL,NULL),(9,'La Jalca',1,NULL,NULL),(10,'Leimebamba',1,NULL,NULL),(11,'Levanto',1,NULL,NULL),(12,'Magdalena',1,NULL,NULL),(13,'Mariscal Castilla',1,NULL,NULL),(14,'Molinopampa',1,NULL,NULL),(15,'Montevideo',1,NULL,NULL),(16,'Olleros',1,NULL,NULL),(17,'Quinjalca',1,NULL,NULL),(18,'San Francisco De Daguas',1,NULL,NULL),(19,'San Isidro De Maino',1,NULL,NULL),(20,'Soloco',1,NULL,NULL),(21,'Sonche',1,NULL,NULL),(22,'La Peca',2,NULL,NULL),(23,'Aramango',2,NULL,NULL),(24,'Copallin',2,NULL,NULL),(25,'El Parco',2,NULL,NULL),(26,'Imaza',2,NULL,NULL),(27,'Jumbilla',3,NULL,NULL),(28,'Chisquilla',3,NULL,NULL),(29,'Churuja',3,NULL,NULL),(30,'Corosha',3,NULL,NULL),(31,'Cuispes',3,NULL,NULL),(32,'Florida',3,NULL,NULL),(33,'Jazan',3,NULL,NULL),(37,'Valera',3,NULL,NULL),(38,'Yambrasbamba',3,NULL,NULL),(39,'Nieva',4,NULL,NULL),(40,'El Cenepa',4,NULL,NULL),(41,'Rio Santiago',4,NULL,NULL),(42,'Lamud',5,NULL,NULL),(43,'Camporredondo',5,NULL,NULL),(44,'Cocabamba',5,NULL,NULL),(45,'Colcamar',5,NULL,NULL),(46,'Conila',5,NULL,NULL),(47,'Inguilpata',5,NULL,NULL),(48,'Longuita',5,NULL,NULL),(49,'Lonya Chico',5,NULL,NULL),(50,'Luya',5,NULL,NULL),(51,'Luya Viejo',5,NULL,NULL),(52,'Maria',5,NULL,NULL),(53,'Ocalli',5,NULL,NULL),(54,'Ocumal',5,NULL,NULL),(55,'Pisuquia',5,NULL,NULL),(56,'Providencia',5,NULL,NULL),(57,'San Cristobal',5,NULL,NULL),(58,'San Francisco Del Yeso',5,NULL,NULL),(59,'San Jeronimo',5,NULL,NULL),(60,'San Juan De Lopecancha',5,NULL,NULL),(61,'Santa Catalina',5,NULL,NULL),(62,'Santo Tomas',5,NULL,NULL),(63,'Tingo',5,NULL,NULL),(64,'Trita',5,NULL,NULL),(65,'San Nicolas',6,NULL,NULL),(66,'Chirimoto',6,NULL,NULL),(67,'Cochamal',6,NULL,NULL),(68,'Huambo',6,NULL,NULL),(69,'Limabamba',6,NULL,NULL),(70,'Longar',6,NULL,NULL),(71,'Mariscal Benavides',6,NULL,NULL),(72,'Milpuc',6,NULL,NULL),(73,'Omia',6,NULL,NULL),(74,'Santa Rosa',6,NULL,NULL),(75,'Totora',6,NULL,NULL),(76,'Vista Alegre',6,NULL,NULL),(77,'Bagua Grande',7,NULL,NULL),(78,'Cajaruro',7,NULL,NULL),(79,'Cumba',7,NULL,NULL),(80,'El Milagro',7,NULL,NULL),(81,'Jamalca',7,NULL,NULL),(82,'Lonya Grande',7,NULL,NULL),(83,'Yamon',7,NULL,NULL),(84,'Huaraz',8,NULL,NULL),(85,'Cochabamba',8,NULL,NULL),(86,'Colcabamba',8,NULL,NULL),(87,'Huanchay',8,NULL,NULL),(88,'Independencia',8,NULL,NULL),(89,'Jangas',8,NULL,NULL),(90,'La Libertad',8,NULL,NULL),(91,'Olleros',8,NULL,NULL),(92,'Pampas',8,NULL,NULL),(93,'Pariacoto',8,NULL,NULL),(94,'Pira',8,NULL,NULL),(95,'Tarica',8,NULL,NULL),(96,'Aija',9,NULL,NULL),(97,'Coris',9,NULL,NULL),(98,'Huacllan',9,NULL,NULL),(99,'La Merced',9,NULL,NULL),(100,'Succha',9,NULL,NULL),(101,'Llamellin',10,NULL,NULL),(102,'Aczo',10,NULL,NULL),(103,'Chaccho',10,NULL,NULL),(104,'Chingas',10,NULL,NULL),(105,'Mirgas',10,NULL,NULL),(106,'San Juan De Rontoy',10,NULL,NULL),(107,'Chacas',11,NULL,NULL),(108,'Acochaca',11,NULL,NULL),(109,'Chiquian',12,NULL,NULL),(110,'Abelardo Pardo Lezameta',12,NULL,NULL),(111,'Antonio Raymondi',12,NULL,NULL),(112,'Aquia',12,NULL,NULL),(113,'Cajacay',12,NULL,NULL),(114,'Canis',12,NULL,NULL),(115,'Colquioc',12,NULL,NULL),(116,'Huallanca',12,NULL,NULL),(117,'Huasta',12,NULL,NULL),(118,'Huayllacayan',12,NULL,NULL),(119,'La Primavera',12,NULL,NULL),(120,'Mangas',12,NULL,NULL),(121,'Pacllon',12,NULL,NULL),(122,'San Miguel De Corpanqui',12,NULL,NULL),(123,'Ticllos',12,NULL,NULL),(124,'Carhuaz',13,NULL,NULL),(125,'Acopampa',13,NULL,NULL),(126,'Amashca',13,NULL,NULL),(127,'Anta',13,NULL,NULL),(128,'Ataquero',13,NULL,NULL),(129,'Marcara',13,NULL,NULL),(130,'Pariahuanca',13,NULL,NULL),(131,'San Miguel De Aco',13,NULL,NULL),(132,'Shilla',13,NULL,NULL),(133,'Tinco',13,NULL,NULL),(134,'Yungar',13,NULL,NULL),(135,'San Luis',14,NULL,NULL),(136,'San Nicolas',14,NULL,NULL),(137,'Yauya',14,NULL,NULL),(138,'Casma',15,NULL,NULL),(139,'Buena Vista Alta',15,NULL,NULL),(140,'Comandante Noel',15,NULL,NULL),(141,'Yautan',15,NULL,NULL),(142,'Corongo',16,NULL,NULL),(143,'Aco',16,NULL,NULL),(144,'Bambas',16,NULL,NULL),(145,'Cusca',16,NULL,NULL),(146,'La Pampa',16,NULL,NULL),(147,'Yanac',16,NULL,NULL),(148,'Yupan',16,NULL,NULL),(149,'Huari',17,NULL,NULL),(150,'Anra',17,NULL,NULL),(151,'Cajay',17,NULL,NULL),(152,'Chavin De Huantar',17,NULL,NULL),(153,'Huacachi',17,NULL,NULL),(154,'Huacchis',17,NULL,NULL),(155,'Huachis',17,NULL,NULL),(156,'Huantar',17,NULL,NULL),(157,'Masin',17,NULL,NULL),(158,'Paucas',17,NULL,NULL),(159,'Ponto',17,NULL,NULL),(160,'Rahuapampa',17,NULL,NULL),(161,'Rapayan',17,NULL,NULL),(162,'San Marcos',17,NULL,NULL),(163,'San Pedro De Chana',17,NULL,NULL),(164,'Uco',17,NULL,NULL),(165,'Huarmey',18,NULL,NULL),(166,'Cochapeti',18,NULL,NULL),(167,'Culebras',18,NULL,NULL),(168,'Huayan',18,NULL,NULL),(169,'Malvas',18,NULL,NULL),(170,'Caraz',19,NULL,NULL),(171,'Huallanca',19,NULL,NULL),(172,'Huata',19,NULL,NULL),(173,'Huaylas',19,NULL,NULL),(174,'Mato',19,NULL,NULL),(175,'Pamparomas',19,NULL,NULL),(176,'Pueblo Libre',19,NULL,NULL),(177,'Santa Cruz',19,NULL,NULL),(178,'Santo Toribio',19,NULL,NULL),(179,'Yuracmarca',19,NULL,NULL),(180,'Piscobamba',20,NULL,NULL),(181,'Casca',20,NULL,NULL),(182,'Eleazar Guzman Barron',20,NULL,NULL),(183,'Fidel Olivas Escudero',20,NULL,NULL),(184,'Llama',20,NULL,NULL),(185,'Llumpa',20,NULL,NULL),(186,'Lucma',20,NULL,NULL),(187,'Musga',20,NULL,NULL),(188,'Ocros',21,NULL,NULL),(189,'Acas',21,NULL,NULL),(190,'Cajamarquilla',21,NULL,NULL),(191,'Carhuapampa',21,NULL,NULL),(192,'Cochas',21,NULL,NULL),(193,'Congas',21,NULL,NULL),(194,'Llipa',21,NULL,NULL),(195,'San Cristobal De Rajan',21,NULL,NULL),(196,'San Pedro',21,NULL,NULL),(197,'Santiago De Chilcas',21,NULL,NULL),(198,'Cabana',22,NULL,NULL),(199,'Bolognesi',22,NULL,NULL),(200,'Conchucos',22,NULL,NULL),(201,'Huacaschuque',22,NULL,NULL),(202,'Huandoval',22,NULL,NULL),(203,'Lacabamba',22,NULL,NULL),(204,'Llapo',22,NULL,NULL),(205,'Pallasca',22,NULL,NULL),(206,'Pampas',22,NULL,NULL),(207,'Santa Rosa',22,NULL,NULL),(208,'Tauca',22,NULL,NULL),(209,'Pomabamba',23,NULL,NULL),(210,'Huayllan',23,NULL,NULL),(211,'Parobamba',23,NULL,NULL),(212,'Quinuabamba',23,NULL,NULL),(213,'Recuay',24,NULL,NULL),(214,'Catac',24,NULL,NULL),(215,'Cotaparaco',24,NULL,NULL),(216,'Huayllapampa',24,NULL,NULL),(217,'Llacllin',24,NULL,NULL),(218,'Marca',24,NULL,NULL),(219,'Pampas Chico',24,NULL,NULL),(220,'Pararin',24,NULL,NULL),(221,'Tapacocha',24,NULL,NULL),(222,'Ticapampa',24,NULL,NULL),(223,'Chimbote',25,NULL,NULL),(224,'Caceres Del Peru',25,NULL,NULL),(225,'Coishco',25,NULL,NULL),(226,'Macate',25,NULL,NULL),(227,'Moro',25,NULL,NULL),(228,'Nepeña',25,NULL,NULL),(229,'Samanco',25,NULL,NULL),(230,'Santa',25,NULL,NULL),(231,'Nuevo Chimbote',25,NULL,NULL),(232,'Sihuas',26,NULL,NULL),(233,'Acobamba',26,NULL,NULL),(234,'Alfonso Ugarte',26,NULL,NULL),(235,'Cashapampa',26,NULL,NULL),(236,'Chingalpo',26,NULL,NULL),(237,'Huayllabamba',26,NULL,NULL),(238,'Quiches',26,NULL,NULL),(239,'Ragash',26,NULL,NULL),(240,'San Juan',26,NULL,NULL),(241,'Sicsibamba',26,NULL,NULL),(242,'Yungay',27,NULL,NULL),(243,'Cascapara',27,NULL,NULL),(244,'Mancos',27,NULL,NULL),(245,'Matacoto',27,NULL,NULL),(246,'Quillo',27,NULL,NULL),(247,'Ranrahirca',27,NULL,NULL),(248,'Shupluy',27,NULL,NULL),(249,'Yanama',27,NULL,NULL),(250,'Abancay',28,NULL,NULL),(251,'Chacoche',28,NULL,NULL),(252,'Circa',28,NULL,NULL),(253,'Curahuasi',28,NULL,NULL),(254,'Huanipaca',28,NULL,NULL),(255,'Lambrama',28,NULL,NULL),(256,'Pichirhua',28,NULL,NULL),(257,'San Pedro De Cachora',28,NULL,NULL),(258,'Tamburco',28,NULL,NULL),(259,'Andahuaylas',29,NULL,NULL),(260,'Andarapa',29,NULL,NULL),(261,'Chiara',29,NULL,NULL),(262,'Huancarama',29,NULL,NULL),(263,'Huancaray',29,NULL,NULL),(264,'Huayana',29,NULL,NULL),(265,'Kishuara',29,NULL,NULL),(266,'Pacobamba',29,NULL,NULL),(267,'Pacucha',29,NULL,NULL),(268,'Pampachiri',29,NULL,NULL),(269,'Pomacocha',29,NULL,NULL),(270,'San Antonio De Cachi',29,NULL,NULL),(271,'San Jeronimo',29,NULL,NULL),(272,'San Miguel De Chaccrampa',29,NULL,NULL),(273,'Santa Maria De Chicmo',29,NULL,NULL),(274,'Talavera',29,NULL,NULL),(275,'Tumay Huaraca',29,NULL,NULL),(276,'Turpo',29,NULL,NULL),(277,'Kaquiabamba',29,NULL,NULL),(278,'Antabamba',30,NULL,NULL),(279,'El Oro',30,NULL,NULL),(280,'Huaquirca',30,NULL,NULL),(281,'Juan Espinoza Medrano',30,NULL,NULL),(282,'Oropesa',30,NULL,NULL),(283,'Pachaconas',30,NULL,NULL),(284,'Sabaino',30,NULL,NULL),(285,'Chalhuanca',31,NULL,NULL),(286,'Capaya',31,NULL,NULL),(287,'Caraybamba',31,NULL,NULL),(288,'Chapimarca',31,NULL,NULL),(289,'Colcabamba',31,NULL,NULL),(290,'Cotaruse',31,NULL,NULL),(291,'Huayllo',31,NULL,NULL),(292,'Justo Apu Sahuaraura',31,NULL,NULL),(293,'Lucre',31,NULL,NULL),(294,'Pocohuanca',31,NULL,NULL),(295,'San Juan De Chacña',31,NULL,NULL),(296,'Sañayca',31,NULL,NULL),(297,'Soraya',31,NULL,NULL),(298,'Tapairihua',31,NULL,NULL),(299,'Tintay',31,NULL,NULL),(300,'Toraya',31,NULL,NULL),(301,'Yanaca',31,NULL,NULL),(302,'Tambobamba',32,NULL,NULL),(303,'Cotabambas',32,NULL,NULL),(304,'Coyllurqui',32,NULL,NULL),(305,'Haquira',32,NULL,NULL),(306,'Mara',32,NULL,NULL),(307,'Challhuahuacho',32,NULL,NULL),(308,'Chincheros',33,NULL,NULL),(309,'Anco-Huallo',33,NULL,NULL),(310,'Cocharcas',33,NULL,NULL),(311,'Huaccana',33,NULL,NULL),(312,'Ocobamba',33,NULL,NULL),(313,'Ongoy',33,NULL,NULL),(314,'Uranmarca',33,NULL,NULL),(315,'Ranracancha',33,NULL,NULL),(316,'Chuquibambilla',34,NULL,NULL),(317,'Curpahuasi',34,NULL,NULL),(318,'Gamarra',34,NULL,NULL),(319,'Huayllati',34,NULL,NULL),(320,'Mamara',34,NULL,NULL),(321,'Micaela Bastidas',34,NULL,NULL),(322,'Pataypampa',34,NULL,NULL),(323,'Progreso',34,NULL,NULL),(324,'San Antonio',34,NULL,NULL),(325,'Santa Ros a',34,NULL,NULL),(326,'Turpay',34,NULL,NULL),(327,'Vilcabamba',34,NULL,NULL),(328,'Virundo',34,NULL,NULL),(329,'Curasco',34,NULL,NULL),(330,'Arequipa',35,NULL,NULL),(331,'Alto Selva Alegre',35,NULL,NULL),(332,'Cayma',35,NULL,NULL),(333,'Cerro Colorado',35,NULL,NULL),(334,'Characato',35,NULL,NULL),(335,'Chiguata',35,NULL,NULL),(336,'Jacobo Hunter',35,NULL,NULL),(337,'La Joya',35,NULL,NULL),(338,'Mariano Melgar',35,NULL,NULL),(339,'Miraflores',35,NULL,NULL),(340,'Mollebaya',35,NULL,NULL),(341,'Paucarpata',35,NULL,NULL),(342,'Pocsi',35,NULL,NULL),(343,'Polobaya',35,NULL,NULL),(344,'Quequeña',35,NULL,NULL),(345,'Sabandia',35,NULL,NULL),(346,'Sachaca',35,NULL,NULL),(347,'San Juan De Siguas',35,NULL,NULL),(348,'San Juan De Tarucani',35,NULL,NULL),(349,'Santa Isabel De Siguas',35,NULL,NULL),(350,'Santa Rita De Siguas',35,NULL,NULL),(351,'Socabaya',35,NULL,NULL),(352,'Tiabaya',35,NULL,NULL),(353,'Uchumayo',35,NULL,NULL),(354,'Vitor',35,NULL,NULL),(355,'Yanahuara',35,NULL,NULL),(356,'Yarabamba',35,NULL,NULL),(357,'Yura',35,NULL,NULL),(358,'Jose Luis Bustamante Y Rive',35,NULL,NULL),(359,'Camana',36,NULL,NULL),(360,'Jose Maria Quimper',36,NULL,NULL),(361,'Mariano Nicolas Valcarcel',36,NULL,NULL),(362,'Mariscal Caceres',36,NULL,NULL),(363,'Nicolas De Pierola',36,NULL,NULL),(364,'Ocoña',36,NULL,NULL),(365,'Quilca',36,NULL,NULL),(366,'Samuel Pastor',36,NULL,NULL),(367,'Caraveli',37,NULL,NULL),(368,'Acari',37,NULL,NULL),(369,'Atico',37,NULL,NULL),(370,'Atiquipa',37,NULL,NULL),(371,'Bella Union',37,NULL,NULL),(372,'Cahuacho',37,NULL,NULL),(373,'Chala',37,NULL,NULL),(374,'Chaparra',37,NULL,NULL),(375,'Huanuhuanu',37,NULL,NULL),(376,'Jaqui',37,NULL,NULL),(377,'Lomas',37,NULL,NULL),(378,'Quicacha',37,NULL,NULL),(379,'Yauca',37,NULL,NULL),(380,'Aplao',38,NULL,NULL),(381,'Andagua',38,NULL,NULL),(382,'Ayo',38,NULL,NULL),(383,'Chachas',38,NULL,NULL),(384,'Chilcaymarca',38,NULL,NULL),(385,'Choco',38,NULL,NULL),(386,'Huancarqui',38,NULL,NULL),(387,'Machaguay',38,NULL,NULL),(388,'Orcopampa',38,NULL,NULL),(389,'Pampacolca',38,NULL,NULL),(390,'Tipan',38,NULL,NULL),(391,'Uñon',38,NULL,NULL),(392,'Uraca',38,NULL,NULL),(393,'Viraco',38,NULL,NULL),(394,'Chivay',39,NULL,NULL),(395,'Achoma',39,NULL,NULL),(396,'Cabanaconde',39,NULL,NULL),(397,'Callalli',39,NULL,NULL),(398,'Caylloma',39,NULL,NULL),(399,'Coporaque',39,NULL,NULL),(400,'Huambo',39,NULL,NULL),(401,'Huanca',39,NULL,NULL),(402,'Ichupampa',39,NULL,NULL),(403,'Lari',39,NULL,NULL),(404,'Lluta',39,NULL,NULL),(405,'Maca',39,NULL,NULL),(406,'Madrigal',39,NULL,NULL),(407,'San Antonio De Chuca',39,NULL,NULL),(408,'Sibayo',39,NULL,NULL),(409,'Tapay',39,NULL,NULL),(410,'Tisco',39,NULL,NULL),(411,'Tuti',39,NULL,NULL),(412,'Yanque',39,NULL,NULL),(413,'Majes',39,NULL,NULL),(414,'Chuquibamba',40,NULL,NULL),(415,'Andaray',40,NULL,NULL),(416,'Cayarani',40,NULL,NULL),(417,'Chichas',40,NULL,NULL),(418,'Iray',40,NULL,NULL),(419,'Rio Grande',40,NULL,NULL),(420,'Salamanca',40,NULL,NULL),(421,'Yanaquihua',40,NULL,NULL),(422,'Chuquibamba',41,NULL,NULL),(423,'Andaray',41,NULL,NULL),(424,'Cayarani',41,NULL,NULL),(425,'Chichas',41,NULL,NULL),(426,'Iray',41,NULL,NULL),(427,'Rio Grande',41,NULL,NULL),(428,'Salamanca',41,NULL,NULL),(429,'Yanaquihua',41,NULL,NULL),(430,'Cotahuasi',42,NULL,NULL),(431,'Alca',42,NULL,NULL),(432,'Charcana',42,NULL,NULL),(433,'Huaynacotas',42,NULL,NULL),(434,'Pampamarca',42,NULL,NULL),(435,'Puyca',42,NULL,NULL),(436,'Quechualla',42,NULL,NULL),(437,'Sayla',42,NULL,NULL),(438,'Tauria',42,NULL,NULL),(439,'Tomepampa',42,NULL,NULL),(440,'Toro',42,NULL,NULL),(441,'Ayacucho',43,NULL,NULL),(442,'Acocro',43,NULL,NULL),(443,'Acos Vinchos',43,NULL,NULL),(444,'Carmen Alto',43,NULL,NULL),(445,'Chiara',43,NULL,NULL),(446,'Ocros',43,NULL,NULL),(447,'Pacaycasa',43,NULL,NULL),(448,'Quinua',43,NULL,NULL),(449,'San Jose De Ticllas',43,NULL,NULL),(450,'San Juan Bautista',43,NULL,NULL),(451,'Santiago De Pischa',43,NULL,NULL),(452,'Socos',43,NULL,NULL),(453,'Tambillo',43,NULL,NULL),(454,'Vinchos',43,NULL,NULL),(455,'Jesus Nazareno',43,NULL,NULL),(456,'Cangallo',44,NULL,NULL),(457,'Chuschi',44,NULL,NULL),(458,'Los Morochucos',44,NULL,NULL),(459,'Maria Parado De Bellido',44,NULL,NULL),(460,'Paras',44,NULL,NULL),(461,'Totos',44,NULL,NULL),(462,'Sancos',45,NULL,NULL),(463,'Carapo',45,NULL,NULL),(464,'Sacsamarca',45,NULL,NULL),(465,'Santiago De Lucanamarca',45,NULL,NULL),(466,'Huanta',46,NULL,NULL),(467,'Ayahuanco',46,NULL,NULL),(468,'Huamanguilla',46,NULL,NULL),(469,'Iguain',46,NULL,NULL),(470,'Luricocha',46,NULL,NULL),(471,'Santillana',46,NULL,NULL),(472,'Sivia',46,NULL,NULL),(473,'Llochegua',46,NULL,NULL),(474,'San Miguel',47,NULL,NULL),(475,'Anco',47,NULL,NULL),(476,'Ayna',47,NULL,NULL),(477,'Chilcas',47,NULL,NULL),(478,'Chungui',47,NULL,NULL),(479,'Luis Carranza',47,NULL,NULL),(480,'Santa Rosa',47,NULL,NULL),(481,'Tambo',47,NULL,NULL),(482,'Puquio',48,NULL,NULL),(483,'Aucara',48,NULL,NULL),(484,'Cabana',48,NULL,NULL),(485,'Carmen Salcedo',48,NULL,NULL),(486,'Chaviña',48,NULL,NULL),(487,'Chipao',48,NULL,NULL),(488,'Huac-Huas',48,NULL,NULL),(489,'Laramate',48,NULL,NULL),(490,'Leoncio Prado',48,NULL,NULL),(491,'Llauta',48,NULL,NULL),(492,'Lucanas',48,NULL,NULL),(493,'Ocaña',48,NULL,NULL),(494,'Otoca',48,NULL,NULL),(495,'Saisa',48,NULL,NULL),(496,'San Cristobal',48,NULL,NULL),(497,'San Juan',48,NULL,NULL),(498,'San Pedro',48,NULL,NULL),(499,'San Pedro De Palco',48,NULL,NULL),(500,'Sancos',48,NULL,NULL),(501,'Santa Ana De Huaycahuacho',48,NULL,NULL),(502,'Santa Lucia',48,NULL,NULL),(503,'Coracora',49,NULL,NULL),(504,'Chumpi',49,NULL,NULL),(505,'Coronel Castaðeda',49,NULL,NULL),(506,'Pacapausa',49,NULL,NULL),(507,'Pullo',49,NULL,NULL),(508,'Puyusca',49,NULL,NULL),(509,'San Francisco De Ravacayco',49,NULL,NULL),(510,'Upahuacho',49,NULL,NULL),(511,'Pausa',50,NULL,NULL),(512,'Colta',50,NULL,NULL),(513,'Corculla',50,NULL,NULL),(514,'Lampa',50,NULL,NULL),(515,'Marcabamba',50,NULL,NULL),(516,'Oyolo',50,NULL,NULL),(517,'Pararca',50,NULL,NULL),(518,'San Javier De Alpabamba',50,NULL,NULL),(519,'San Jose De Ushua',50,NULL,NULL),(520,'Sara Sara',50,NULL,NULL),(521,'Querobamba',51,NULL,NULL),(522,'Belen',51,NULL,NULL),(523,'Chalcos',51,NULL,NULL),(524,'Chilcayoc',51,NULL,NULL),(525,'Huacaña',51,NULL,NULL),(526,'Morcolla',51,NULL,NULL),(527,'Paico',51,NULL,NULL),(528,'San Pedro De Larcay',51,NULL,NULL),(529,'San Salvador De Quije',51,NULL,NULL),(530,'Santiago De Paucaray',51,NULL,NULL),(531,'Soras',51,NULL,NULL),(532,'Huancapi',52,NULL,NULL),(533,'Alcamenca',52,NULL,NULL),(534,'Apongo',52,NULL,NULL),(535,'Asquipata',52,NULL,NULL),(536,'Canaria',52,NULL,NULL),(537,'Cayara',52,NULL,NULL),(538,'Colca',52,NULL,NULL),(539,'Huamanquiquia',52,NULL,NULL),(540,'Huancaraylla',52,NULL,NULL),(541,'Huaya',52,NULL,NULL),(542,'Sarhua',52,NULL,NULL),(543,'Vilcanchos',52,NULL,NULL),(544,'Vilcas Huaman',53,NULL,NULL),(545,'Accomarca',53,NULL,NULL),(546,'Carhuanca',53,NULL,NULL),(547,'Concepcion',53,NULL,NULL),(548,'Huambalpa',53,NULL,NULL),(549,'Independencia',53,NULL,NULL),(550,'Saurama',53,NULL,NULL),(551,'Vischongo',53,NULL,NULL),(552,'Cajamarca',54,NULL,NULL),(553,'Asuncion',54,NULL,NULL),(554,'Chetilla',54,NULL,NULL),(555,'Cospan',54,NULL,NULL),(556,'Encañada',54,NULL,NULL),(557,'Jesus',54,NULL,NULL),(558,'Llacanora',54,NULL,NULL),(559,'Los Baños Del Inca',54,NULL,NULL),(560,'Magdalena',54,NULL,NULL),(561,'Matara',54,NULL,NULL),(562,'Namora',54,NULL,NULL),(563,'San Juan',54,NULL,NULL),(564,'Cajabamba',55,NULL,NULL),(565,'Cachachi',55,NULL,NULL),(566,'Condebamba',55,NULL,NULL),(567,'Sitacocha',55,NULL,NULL),(568,'Celendin',56,NULL,NULL),(569,'Chumuch',56,NULL,NULL),(570,'Cortegana',56,NULL,NULL),(571,'Huasmin',56,NULL,NULL),(572,'Jorge Chavez',56,NULL,NULL),(573,'Jose Galvez',56,NULL,NULL),(574,'Miguel Iglesias',56,NULL,NULL),(575,'Oxamarca',56,NULL,NULL),(576,'Sorochuco',56,NULL,NULL),(577,'Sucre',56,NULL,NULL),(578,'Utco',56,NULL,NULL),(579,'La Libertad De Pallan',56,NULL,NULL),(580,'Chota',57,NULL,NULL),(581,'Anguia',57,NULL,NULL),(582,'Chadin',57,NULL,NULL),(583,'Chiguirip',57,NULL,NULL),(584,'Chimban',57,NULL,NULL),(585,'Choropampa',57,NULL,NULL),(586,'Cochabamba',57,NULL,NULL),(587,'Conchan',57,NULL,NULL),(588,'Huambos',57,NULL,NULL),(589,'Lajas',57,NULL,NULL),(590,'Llama',57,NULL,NULL),(591,'Miracosta',57,NULL,NULL),(592,'Paccha',57,NULL,NULL),(593,'Pion',57,NULL,NULL),(594,'Querocoto',57,NULL,NULL),(595,'San Juan De Licupis',57,NULL,NULL),(596,'Tacabamba',57,NULL,NULL),(597,'Tocmoche',57,NULL,NULL),(598,'Chalamarca',57,NULL,NULL),(599,'Contumaza',58,NULL,NULL),(600,'Chilete',58,NULL,NULL),(601,'Cupisnique',58,NULL,NULL),(602,'Guzmango',58,NULL,NULL),(603,'San Benito',58,NULL,NULL),(604,'Santa Cruz De Toled',58,NULL,NULL),(605,'Tantarica',58,NULL,NULL),(606,'Yonan',58,NULL,NULL),(607,'Cutervo',59,NULL,NULL),(608,'Callayuc',59,NULL,NULL),(609,'Choros',59,NULL,NULL),(610,'Cujillo',59,NULL,NULL),(611,'La Ramada',59,NULL,NULL),(612,'Pimpingos',59,NULL,NULL),(613,'Querocotillo',59,NULL,NULL),(614,'San Andres De Cutervo',59,NULL,NULL),(615,'San Juan De Cutervo',59,NULL,NULL),(616,'San Luis De Lucma',59,NULL,NULL),(617,'Santa Cruz',59,NULL,NULL),(618,'Santo Domingo De La Capilla',59,NULL,NULL),(619,'Santo Tomas',59,NULL,NULL),(620,'Socota',59,NULL,NULL),(621,'Toribio Casanova',59,NULL,NULL),(622,'Bambamarca',60,NULL,NULL),(623,'Chugur',60,NULL,NULL),(624,'Hualgayoc',60,NULL,NULL),(625,'Jaen',61,NULL,NULL),(626,'Bellavista',61,NULL,NULL),(627,'Chontali',61,NULL,NULL),(628,'Colasay',61,NULL,NULL),(629,'Huabal',61,NULL,NULL),(630,'Las Pirias',61,NULL,NULL),(631,'Pomahuaca',61,NULL,NULL),(632,'Pucara',61,NULL,NULL),(633,'Sallique',61,NULL,NULL),(634,'San Felipe',61,NULL,NULL),(635,'San Jose Del Alto',61,NULL,NULL),(636,'Santa Rosa',61,NULL,NULL),(637,'San Ignacio',62,NULL,NULL),(638,'Chirinos',62,NULL,NULL),(639,'Huarango',62,NULL,NULL),(640,'La Coipa',62,NULL,NULL),(641,'Namballe',62,NULL,NULL),(642,'San Jose De Lourdes',62,NULL,NULL),(643,'Tabaconas',62,NULL,NULL),(644,'Pedro Galvez',63,NULL,NULL),(645,'Chancay',63,NULL,NULL),(646,'Eduardo Villanueva',63,NULL,NULL),(647,'Gregorio Pita',63,NULL,NULL),(648,'Ichocan',63,NULL,NULL),(649,'Jose Manuel Quiroz',63,NULL,NULL),(650,'Jose Sabogal',63,NULL,NULL),(651,'San Miguel',64,NULL,NULL),(652,'Bolivar',64,NULL,NULL),(653,'Calquis',64,NULL,NULL),(654,'Catilluc',64,NULL,NULL),(655,'El Prado',64,NULL,NULL),(656,'La Florida',64,NULL,NULL),(657,'Llapa',64,NULL,NULL),(658,'Nanchoc',64,NULL,NULL),(659,'Niepos',64,NULL,NULL),(660,'San Gregorio',64,NULL,NULL),(661,'San Silvestre De Cochan',64,NULL,NULL),(662,'Tongod',64,NULL,NULL),(663,'Union Agua Blanca',64,NULL,NULL),(664,'San Pablo',65,NULL,NULL),(665,'San Bernardino',65,NULL,NULL),(666,'San Luis',65,NULL,NULL),(667,'Tumbaden',65,NULL,NULL),(668,'Santa Cruz',66,NULL,NULL),(669,'Andabamba',66,NULL,NULL),(670,'Catache',66,NULL,NULL),(671,'Chancaybaños',66,NULL,NULL),(672,'La Esperanza',66,NULL,NULL),(673,'Ninabamba',66,NULL,NULL),(674,'Pulan',66,NULL,NULL),(675,'Saucepampa',66,NULL,NULL),(676,'Sexi',66,NULL,NULL),(677,'Uticyacu',66,NULL,NULL),(678,'Yauyucan',66,NULL,NULL),(679,'Callao',67,NULL,NULL),(680,'Bellavista',67,NULL,NULL),(681,'Carmen De La Legua Reynoso',67,NULL,NULL),(682,'La Perla',67,NULL,NULL),(683,'La Punta',67,NULL,NULL),(684,'Ventanilla',67,NULL,NULL),(685,'Cusco',68,NULL,NULL),(686,'Ccorca',68,NULL,NULL),(687,'Poroy',68,NULL,NULL),(688,'San Jeronimo',68,NULL,NULL),(689,'San Sebastian',68,NULL,NULL),(690,'Santiago',68,NULL,NULL),(691,'Saylla',68,NULL,NULL),(692,'Wanchaq',68,NULL,NULL),(693,'Acomayo',69,NULL,NULL),(694,'Acopia',69,NULL,NULL),(695,'Acos',69,NULL,NULL),(696,'Mosoc Llacta',69,NULL,NULL),(697,'Pomacanchi',69,NULL,NULL),(698,'Rondocan',69,NULL,NULL),(699,'Sangarara',69,NULL,NULL),(700,'Anta',70,NULL,NULL),(701,'Ancahuasi',70,NULL,NULL),(702,'Cachimayo',70,NULL,NULL),(703,'Chinchaypujio',70,NULL,NULL),(704,'Huarocondo',70,NULL,NULL),(705,'Limatambo',70,NULL,NULL),(706,'Mollepata',70,NULL,NULL),(707,'Pucyura',70,NULL,NULL),(708,'Zurite',70,NULL,NULL),(709,'Calca',71,NULL,NULL),(710,'Coya',71,NULL,NULL),(711,'Lamay',71,NULL,NULL),(712,'Lares',71,NULL,NULL),(713,'Pisac',71,NULL,NULL),(714,'San Salvador',71,NULL,NULL),(715,'Taray',71,NULL,NULL),(716,'Yanatile',71,NULL,NULL),(717,'Yanaoca',72,NULL,NULL),(718,'Checca',72,NULL,NULL),(719,'Kunturkanki',72,NULL,NULL),(720,'Langui',72,NULL,NULL),(721,'Layo',72,NULL,NULL),(722,'Pampamarca',72,NULL,NULL),(723,'Quehue',72,NULL,NULL),(724,'Tupac Amaru',72,NULL,NULL),(725,'Sicuani',73,NULL,NULL),(726,'Checacupe',73,NULL,NULL),(727,'Combapata',73,NULL,NULL),(728,'Marangani',73,NULL,NULL),(729,'Pitumarca',73,NULL,NULL),(730,'San Pablo',73,NULL,NULL),(731,'San Pedro',73,NULL,NULL),(732,'Tinta',73,NULL,NULL),(733,'Santo Tomas',74,NULL,NULL),(734,'Capacmarca',74,NULL,NULL),(735,'Chamaca',74,NULL,NULL),(736,'Colquemarca',74,NULL,NULL),(737,'Livitaca',74,NULL,NULL),(738,'Llusco',74,NULL,NULL),(739,'Quiñota',74,NULL,NULL),(740,'Velille',74,NULL,NULL),(741,'Espinar',75,NULL,NULL),(742,'Condoroma',75,NULL,NULL),(743,'Coporaque',75,NULL,NULL),(744,'Ocoruro',75,NULL,NULL),(745,'Pallpata',75,NULL,NULL),(746,'Pichigua',75,NULL,NULL),(747,'Suyckutambo',75,NULL,NULL),(748,'Alto Pichigua',75,NULL,NULL),(749,'Santa Ana',76,NULL,NULL),(750,'Echarate',76,NULL,NULL),(751,'Huayopata',76,NULL,NULL),(752,'Maranura',76,NULL,NULL),(753,'Ocobamba',76,NULL,NULL),(754,'Quellouno',76,NULL,NULL),(755,'Kimbiri',76,NULL,NULL),(756,'Santa Teresa',76,NULL,NULL),(757,'Vilcabamba',76,NULL,NULL),(758,'Pichari',76,NULL,NULL),(759,'Paruro',77,NULL,NULL),(760,'Accha',77,NULL,NULL),(761,'Ccapi',77,NULL,NULL),(762,'Colcha',77,NULL,NULL),(763,'Huanoquite',77,NULL,NULL),(764,'Omacha',77,NULL,NULL),(765,'Paccaritambo',77,NULL,NULL),(766,'Pillpinto',77,NULL,NULL),(767,'Yaurisque',77,NULL,NULL),(768,'Paucartambo',78,NULL,NULL),(769,'Caicay',78,NULL,NULL),(770,'Challabamba',78,NULL,NULL),(771,'Colquepata',78,NULL,NULL),(772,'Huancarani',78,NULL,NULL),(773,'Kosñipata',78,NULL,NULL),(774,'Urcos',79,NULL,NULL),(775,'Andahuaylillas',79,NULL,NULL),(776,'Camanti',79,NULL,NULL),(777,'Ccarhuayo',79,NULL,NULL),(778,'Ccatca',79,NULL,NULL),(779,'Cusipata',79,NULL,NULL),(780,'Huaro',79,NULL,NULL),(781,'Lucre',79,NULL,NULL),(782,'Marcapata',79,NULL,NULL),(783,'Ocongate',79,NULL,NULL),(784,'Oropesa',79,NULL,NULL),(785,'Quiquijana',79,NULL,NULL),(786,'Urubamba',80,NULL,NULL),(787,'Chinchero',80,NULL,NULL),(788,'Huayllabamba',80,NULL,NULL),(789,'Machupicchu',80,NULL,NULL),(790,'Maras',80,NULL,NULL),(791,'Ollantaytambo',80,NULL,NULL),(792,'Yucay',80,NULL,NULL),(793,'Huancavelica',81,NULL,NULL),(794,'Acobambilla',81,NULL,NULL),(795,'Acoria',81,NULL,NULL),(796,'Conayca',81,NULL,NULL),(797,'Cuenca',81,NULL,NULL),(798,'Huachocolpa',81,NULL,NULL),(799,'Huayllahuara',81,NULL,NULL),(800,'Izcuchaca',81,NULL,NULL),(801,'Laria',81,NULL,NULL),(802,'Manta',81,NULL,NULL),(803,'Mariscal Caceres',81,NULL,NULL),(804,'Moya',81,NULL,NULL),(805,'Nuevo Occoro',81,NULL,NULL),(806,'Palca',81,NULL,NULL),(807,'Pilchaca',81,NULL,NULL),(808,'Vilca',81,NULL,NULL),(809,'Yauli',81,NULL,NULL),(810,'Ascension',81,NULL,NULL),(811,'Acobamba',82,NULL,NULL),(812,'Andabamba',82,NULL,NULL),(813,'Anta',82,NULL,NULL),(814,'Caja',82,NULL,NULL),(815,'Marcas',82,NULL,NULL),(816,'Paucara',82,NULL,NULL),(817,'Pomacocha',82,NULL,NULL),(818,'Rosario',82,NULL,NULL),(819,'Lircay',83,NULL,NULL),(820,'Anchonga',83,NULL,NULL),(821,'Callanmarca',83,NULL,NULL),(822,'Ccochaccasa',83,NULL,NULL),(823,'Chincho',83,NULL,NULL),(824,'Congalla',83,NULL,NULL),(825,'Huanca-Huanca',83,NULL,NULL),(826,'Huayllay Grande',83,NULL,NULL),(827,'Julcamarca',83,NULL,NULL),(828,'San Antonio De Antaparco',83,NULL,NULL),(829,'Santo Tomas De Pata',83,NULL,NULL),(830,'Secclla',83,NULL,NULL),(831,'Castrovirreyna',84,NULL,NULL),(832,'Arma',84,NULL,NULL),(833,'Aurahua',84,NULL,NULL),(834,'Capillas',84,NULL,NULL),(835,'Chupamarca',84,NULL,NULL),(836,'Cocas',84,NULL,NULL),(837,'Huachos',84,NULL,NULL),(838,'Huamatambo',84,NULL,NULL),(839,'Mollepampa',84,NULL,NULL),(840,'San Juan',84,NULL,NULL),(841,'Santa Ana',84,NULL,NULL),(842,'Tantara',84,NULL,NULL),(843,'Ticrapo',84,NULL,NULL),(844,'Churcampa',85,NULL,NULL),(845,'Anco',85,NULL,NULL),(846,'Chinchihuasi',85,NULL,NULL),(847,'El Carmen',85,NULL,NULL),(848,'La Merced',85,NULL,NULL),(849,'Locroja',85,NULL,NULL),(850,'Paucarbamba',85,NULL,NULL),(851,'San Miguel De Mayocc',85,NULL,NULL),(852,'San Pedro De Coris',85,NULL,NULL),(853,'Pachamarca',85,NULL,NULL),(854,'Huaytara',86,NULL,NULL),(855,'Ayavi',86,NULL,NULL),(856,'Cordova',86,NULL,NULL),(857,'Huayacundo Arma',86,NULL,NULL),(858,'Laramarca',86,NULL,NULL),(859,'Ocoyo',86,NULL,NULL),(860,'Pilpichaca',86,NULL,NULL),(861,'Querco',86,NULL,NULL),(862,'Quito-Arma',86,NULL,NULL),(863,'San Antonio De Cusicancha',86,NULL,NULL),(864,'San Francisco De Sangayaico',86,NULL,NULL),(865,'San Isidro',86,NULL,NULL),(866,'Santiago De Chocorvos',86,NULL,NULL),(867,'Santiago De Quirahuara',86,NULL,NULL),(868,'Santo Domingo De Capillas',86,NULL,NULL),(869,'Tambo',86,NULL,NULL),(870,'Pampas',87,NULL,NULL),(871,'Acostambo',87,NULL,NULL),(872,'Acraquia',87,NULL,NULL),(873,'Ahuaycha',87,NULL,NULL),(874,'Colcabamba',87,NULL,NULL),(875,'Daniel Hernandez',87,NULL,NULL),(876,'Huachocolpa',87,NULL,NULL),(877,'Huando',87,NULL,NULL),(878,'Huaribamba',87,NULL,NULL),(879,'Ñahuimpuquio',87,NULL,NULL),(880,'Pazos',87,NULL,NULL),(881,'Quishuar',87,NULL,NULL),(882,'Salcabamba',87,NULL,NULL),(883,'Salcahuasi',87,NULL,NULL),(884,'San Marcos De Rocchac',87,NULL,NULL),(885,'Surcubamba',87,NULL,NULL),(886,'Tintay Puncu',87,NULL,NULL),(887,'Huanuco',88,NULL,NULL),(888,'Amarilis',88,NULL,NULL),(889,'Chinchao',88,NULL,NULL),(890,'Churubamba',88,NULL,NULL),(891,'Margos',88,NULL,NULL),(892,'Quisqui',88,NULL,NULL),(893,'San Francisco De Cayran',88,NULL,NULL),(894,'San Pedro De Chaulan',88,NULL,NULL),(895,'Santa Maria Del Valle',88,NULL,NULL),(896,'Yarumayo',88,NULL,NULL),(897,'Pillco Marca',88,NULL,NULL),(898,'Ambo',89,NULL,NULL),(899,'Cayna',89,NULL,NULL),(900,'Colpas',89,NULL,NULL),(901,'Conchamarca',89,NULL,NULL),(902,'Huacar',89,NULL,NULL),(903,'San Francisco',89,NULL,NULL),(904,'San Rafael',89,NULL,NULL),(905,'Tomay Kichwa',89,NULL,NULL),(906,'La Union',90,NULL,NULL),(907,'Chuquis',90,NULL,NULL),(908,'Marias',90,NULL,NULL),(909,'Pachas',90,NULL,NULL),(910,'Quivilla',90,NULL,NULL),(911,'Ripan',90,NULL,NULL),(912,'Shunqui',90,NULL,NULL),(913,'Sillapata',90,NULL,NULL),(914,'Yanas',90,NULL,NULL),(915,'Huacaybamba',91,NULL,NULL),(916,'Canchabamba',91,NULL,NULL),(917,'Cochabamba',91,NULL,NULL),(918,'Pinra',91,NULL,NULL),(919,'Llata',92,NULL,NULL),(920,'Arancay',92,NULL,NULL),(921,'Chavin De Pariarca',92,NULL,NULL),(922,'Jacas Grande',92,NULL,NULL),(923,'Jircan',92,NULL,NULL),(924,'Miraflores',92,NULL,NULL),(925,'Monzon',92,NULL,NULL),(926,'Punchao',92,NULL,NULL),(927,'Puños',92,NULL,NULL),(928,'Singa',92,NULL,NULL),(929,'Tantamayo',92,NULL,NULL),(930,'Rupa-Rupa',93,NULL,NULL),(931,'Daniel Alomia Robles',93,NULL,NULL),(932,'Hermilio Valdizan',93,NULL,NULL),(933,'Jose Crespo Y Castillo',93,NULL,NULL),(934,'Luyando',93,NULL,NULL),(935,'Mariano Damaso Beraun',93,NULL,NULL),(936,'Huacrachuco',94,NULL,NULL),(937,'Cholon',94,NULL,NULL),(938,'San Buenaventura',94,NULL,NULL),(939,'Panao',95,NULL,NULL),(940,'Chaglla',95,NULL,NULL),(941,'Molino',95,NULL,NULL),(942,'Umari',95,NULL,NULL),(943,'Puerto Inca',96,NULL,NULL),(944,'Codo Del Pozuzo',96,NULL,NULL),(945,'Honoria',96,NULL,NULL),(946,'Tournavista',96,NULL,NULL),(947,'Yuyapichis',96,NULL,NULL),(948,'Jesus',97,NULL,NULL),(949,'Baños',97,NULL,NULL),(950,'Jivia',97,NULL,NULL),(951,'Queropalca',97,NULL,NULL),(952,'Rondos',97,NULL,NULL),(953,'San Francisco De Asis',97,NULL,NULL),(954,'San Miguel De Cauri',97,NULL,NULL),(955,'Chavinillo',98,NULL,NULL),(956,'Cahuac',98,NULL,NULL),(957,'Chacabamba',98,NULL,NULL),(958,'Aparicio Pomares',98,NULL,NULL),(959,'Jacas Chico',98,NULL,NULL),(960,'Obas',98,NULL,NULL),(961,'Pampamarca',98,NULL,NULL),(962,'Choras',98,NULL,NULL),(963,'Ica',99,NULL,NULL),(964,'La Tinguiða',99,NULL,NULL),(965,'Los Aquijes',99,NULL,NULL),(966,'Ocucaje',99,NULL,NULL),(967,'Pachacutec',99,NULL,NULL),(968,'Parcona',99,NULL,NULL),(969,'Pueblo Nuevo',99,NULL,NULL),(970,'Salas',99,NULL,NULL),(971,'San Jose De Los Molinos',99,NULL,NULL),(972,'San Juan Bautista',99,NULL,NULL),(973,'Santiago',99,NULL,NULL),(974,'Subtanjalla',99,NULL,NULL),(975,'Tate',99,NULL,NULL),(976,'Yauca Del Rosario',99,NULL,NULL),(977,'Chincha Alta',100,NULL,NULL),(978,'Alto Laran',100,NULL,NULL),(979,'Chavin',100,NULL,NULL),(980,'Chincha Baja',100,NULL,NULL),(981,'El Carmen',100,NULL,NULL),(982,'Grocio Prado',100,NULL,NULL),(983,'Pueblo Nuevo',100,NULL,NULL),(984,'San Juan De Yanac',100,NULL,NULL),(985,'San Pedro De Huacarpana',100,NULL,NULL),(986,'Sunampe',100,NULL,NULL),(987,'Tambo De Mora',100,NULL,NULL),(988,'Nazca',101,NULL,NULL),(989,'Changuillo',101,NULL,NULL),(990,'El Ingenio',101,NULL,NULL),(991,'Marcona',101,NULL,NULL),(992,'Vista Alegre',101,NULL,NULL),(993,'Palpa',102,NULL,NULL),(994,'Llipata',102,NULL,NULL),(995,'Rio Grande',102,NULL,NULL),(996,'Santa Cruz',102,NULL,NULL),(997,'Tibillo',102,NULL,NULL),(998,'Pisco',103,NULL,NULL),(999,'Huancano',103,NULL,NULL),(1000,'Humay',103,NULL,NULL),(1001,'Independencia',103,NULL,NULL),(1002,'Paracas',103,NULL,NULL),(1003,'San Andres',103,NULL,NULL),(1004,'San Clemente',103,NULL,NULL),(1005,'Tupac Amaru Inca',103,NULL,NULL),(1006,'Huancayo',104,NULL,NULL),(1007,'Carhuacallanga',104,NULL,NULL),(1008,'Chacapampa',104,NULL,NULL),(1009,'Chicche',104,NULL,NULL),(1010,'Chilca',104,NULL,NULL),(1011,'Chongos Alto',104,NULL,NULL),(1012,'Chupuro',104,NULL,NULL),(1013,'Colca',104,NULL,NULL),(1014,'Cullhuas',104,NULL,NULL),(1015,'El Tambo',104,NULL,NULL),(1016,'Huacrapuquio',104,NULL,NULL),(1017,'Hualhuas',104,NULL,NULL),(1018,'Huancan',104,NULL,NULL),(1019,'Huasicancha',104,NULL,NULL),(1020,'Huayucachi',104,NULL,NULL),(1021,'Ingenio',104,NULL,NULL),(1022,'Pariahuanca',104,NULL,NULL),(1023,'Pilcomayo',104,NULL,NULL),(1024,'Pucara',104,NULL,NULL),(1025,'Quichuay',104,NULL,NULL),(1026,'Quilcas',104,NULL,NULL),(1027,'San Agustin',104,NULL,NULL),(1028,'San Jeronimo De Tunan',104,NULL,NULL),(1029,'Saño',104,NULL,NULL),(1030,'Sapallanga',104,NULL,NULL),(1031,'Sicaya',104,NULL,NULL),(1032,'Santo Domingo De Acobamba',104,NULL,NULL),(1033,'Viques',104,NULL,NULL),(1034,'Concepcion',105,NULL,NULL),(1035,'Aco',105,NULL,NULL),(1036,'Andamarca',105,NULL,NULL),(1037,'Chambara',105,NULL,NULL),(1038,'Cochas',105,NULL,NULL),(1039,'Comas',105,NULL,NULL),(1040,'Heroinas Toledo',105,NULL,NULL),(1041,'Manzanares',105,NULL,NULL),(1042,'Mariscal Castilla',105,NULL,NULL),(1043,'Matahuasi',105,NULL,NULL),(1044,'Mito',105,NULL,NULL),(1045,'Nueve De Julio',105,NULL,NULL),(1046,'Orcotuna',105,NULL,NULL),(1047,'San Jose De Quero',105,NULL,NULL),(1048,'Santa Rosa De Ocopa',105,NULL,NULL),(1049,'Chanchamayo',106,NULL,NULL),(1050,'Perene',106,NULL,NULL),(1051,'Pichanaqui',106,NULL,NULL),(1052,'San Luis De Shuaro',106,NULL,NULL),(1053,'San Ramon',106,NULL,NULL),(1054,'Vitoc',106,NULL,NULL),(1055,'Jauja',107,NULL,NULL),(1056,'Acolla',107,NULL,NULL),(1057,'Apata',107,NULL,NULL),(1058,'Ataura',107,NULL,NULL),(1059,'Canchayllo',107,NULL,NULL),(1060,'Curicaca',107,NULL,NULL),(1061,'El Mantaro',107,NULL,NULL),(1062,'Huamali',107,NULL,NULL),(1063,'Huaripampa',107,NULL,NULL),(1064,'Huertas',107,NULL,NULL),(1065,'Janjaillo',107,NULL,NULL),(1066,'Julcan',107,NULL,NULL),(1067,'Leonor Ordoñez',107,NULL,NULL),(1068,'Llocllapampa',107,NULL,NULL),(1069,'Marco',107,NULL,NULL),(1070,'Masma',107,NULL,NULL),(1071,'Masma Chicche',107,NULL,NULL),(1072,'Molinos',107,NULL,NULL),(1073,'Monobamba',107,NULL,NULL),(1074,'Muqui',107,NULL,NULL),(1075,'Muquiyauyo',107,NULL,NULL),(1076,'Paca',107,NULL,NULL),(1077,'Paccha',107,NULL,NULL),(1078,'Pancan',107,NULL,NULL),(1079,'Parco',107,NULL,NULL),(1080,'Pomacancha',107,NULL,NULL),(1081,'Ricran',107,NULL,NULL),(1082,'San Lorenzo',107,NULL,NULL),(1083,'San Pedro De Chunan',107,NULL,NULL),(1084,'Sausa',107,NULL,NULL),(1085,'Sincos',107,NULL,NULL),(1086,'Tunan Marca',107,NULL,NULL),(1087,'Yauli',107,NULL,NULL),(1088,'Yauyos',107,NULL,NULL),(1089,'Junin',108,NULL,NULL),(1090,'Carhuamayo',108,NULL,NULL),(1091,'Ondores',108,NULL,NULL),(1092,'Ulcumayo',108,NULL,NULL),(1093,'Satipo',109,NULL,NULL),(1094,'Coviriali',109,NULL,NULL),(1095,'Llaylla',109,NULL,NULL),(1096,'Mazamari',109,NULL,NULL),(1097,'Pampa Hermosa',109,NULL,NULL),(1098,'Pangoa',109,NULL,NULL),(1099,'Rio Negro',109,NULL,NULL),(1100,'Rio Tambo',109,NULL,NULL),(1101,'Tarma',110,NULL,NULL),(1102,'Acobamba',110,NULL,NULL),(1103,'Huaricolca',110,NULL,NULL),(1104,'Huasahuasi',110,NULL,NULL),(1105,'La Union',110,NULL,NULL),(1106,'Palca',110,NULL,NULL),(1107,'Palcamayo',110,NULL,NULL),(1108,'San Pedro De Cajas',110,NULL,NULL),(1109,'Tapo',110,NULL,NULL),(1110,'La Oroya',111,NULL,NULL),(1111,'Chacapalpa',111,NULL,NULL),(1112,'Huay-Huay',111,NULL,NULL),(1113,'Marcapomacocha',111,NULL,NULL),(1114,'Morococha',111,NULL,NULL),(1115,'Paccha',111,NULL,NULL),(1116,'Santa Barbara De Carhuacaya',111,NULL,NULL),(1117,'Santa Rosa De Sacco',111,NULL,NULL),(1118,'Suitucancha',111,NULL,NULL),(1119,'Yauli',111,NULL,NULL),(1120,'Chupaca',112,NULL,NULL),(1121,'Ahuac',112,NULL,NULL),(1122,'Chongos Bajo',112,NULL,NULL),(1123,'Huachac',112,NULL,NULL),(1124,'Huamancaca Chico',112,NULL,NULL),(1125,'San Juan De Iscos',112,NULL,NULL),(1126,'San Juan De Jarpa',112,NULL,NULL),(1127,'Tres De Diciembre',112,NULL,NULL),(1128,'Yanacancha',112,NULL,NULL),(1129,'Trujillo',113,NULL,NULL),(1130,'El Porvenir',113,NULL,NULL),(1131,'Florencia De Mora',113,NULL,NULL),(1132,'Huanchaco',113,NULL,NULL),(1133,'La Esperanza',113,NULL,NULL),(1134,'Laredo',113,NULL,NULL),(1135,'Moche',113,NULL,NULL),(1136,'Poroto',113,NULL,NULL),(1137,'Salaverry',113,NULL,NULL),(1138,'Simbal',113,NULL,NULL),(1139,'Victor Larco Herrera',113,NULL,NULL),(1140,'Ascope',114,NULL,NULL),(1141,'Chicama',114,NULL,NULL),(1142,'Chocope',114,NULL,NULL),(1143,'Magdalena De Cao',114,NULL,NULL),(1144,'Paijan',114,NULL,NULL),(1145,'Razuri',114,NULL,NULL),(1146,'Santiago De Cao',114,NULL,NULL),(1147,'Casa Grande',114,NULL,NULL),(1148,'Bolivar',115,NULL,NULL),(1149,'Bambamarca',115,NULL,NULL),(1150,'Condormarca',115,NULL,NULL),(1151,'Longotea',115,NULL,NULL),(1152,'Uchumarca',115,NULL,NULL),(1153,'Ucuncha',115,NULL,NULL),(1154,'Chepen',116,NULL,NULL),(1155,'Pacanga',116,NULL,NULL),(1156,'Pueblo Nuevo',116,NULL,NULL),(1157,'Julcan',117,NULL,NULL),(1158,'Calamarca',117,NULL,NULL),(1159,'Carabamba',117,NULL,NULL),(1160,'Huaso',117,NULL,NULL),(1161,'Otuzco',118,NULL,NULL),(1162,'Agallpampa',118,NULL,NULL),(1163,'Charat',118,NULL,NULL),(1164,'Huaranchal',118,NULL,NULL),(1165,'La Cuesta',118,NULL,NULL),(1166,'Mache',118,NULL,NULL),(1167,'Paranday',118,NULL,NULL),(1168,'Salpo',118,NULL,NULL),(1169,'Sinsicap',118,NULL,NULL),(1170,'Usquil',118,NULL,NULL),(1171,'San Pedro De Lloc',119,NULL,NULL),(1172,'Guadalupe',119,NULL,NULL),(1173,'Jequetepeque',119,NULL,NULL),(1174,'Pacasmayo',119,NULL,NULL),(1175,'San Jose',119,NULL,NULL),(1176,'Tayabamba',120,NULL,NULL),(1177,'Buldibuyo',120,NULL,NULL),(1178,'Chillia',120,NULL,NULL),(1179,'Huancaspata',120,NULL,NULL),(1180,'Huaylillas',120,NULL,NULL),(1181,'Huayo',120,NULL,NULL),(1182,'Ongon',120,NULL,NULL),(1183,'Parcoy',120,NULL,NULL),(1184,'Pataz',120,NULL,NULL),(1185,'Pias',120,NULL,NULL),(1186,'Santiago De Challas',120,NULL,NULL),(1187,'Taurija',120,NULL,NULL),(1188,'Urpay',120,NULL,NULL),(1189,'Chugay',121,NULL,NULL),(1190,'Huamachuco',121,NULL,NULL),(1191,'Cochorco',121,NULL,NULL),(1192,'Curgos',121,NULL,NULL),(1193,'Marcabal',121,NULL,NULL),(1194,'Sanagoran',121,NULL,NULL),(1195,'Sarin',121,NULL,NULL),(1196,'Sartimbamba',121,NULL,NULL),(1197,'Santiago De Chuco',122,NULL,NULL),(1198,'Angasmarca',122,NULL,NULL),(1199,'Cachicadan',122,NULL,NULL),(1200,'Mollebamba',122,NULL,NULL),(1201,'Mollepata',122,NULL,NULL),(1202,'Quiruvilca',122,NULL,NULL),(1203,'Santa Cruz De Chuca',122,NULL,NULL),(1204,'Sitabamba',122,NULL,NULL),(1205,'Cascas',123,NULL,NULL),(1206,'Lucma',123,NULL,NULL),(1207,'Marmot',123,NULL,NULL),(1208,'Sayapullo',123,NULL,NULL),(1209,'Viru',124,NULL,NULL),(1210,'Chao',124,NULL,NULL),(1211,'Guadalupito',124,NULL,NULL),(1212,'Chiclayo',125,NULL,NULL),(1213,'Chongoyape',125,NULL,NULL),(1214,'Eten',125,NULL,NULL),(1215,'Eten Puerto',125,NULL,NULL),(1216,'Jose Leonardo Ortiz',125,NULL,NULL),(1217,'La Victoria',125,NULL,NULL),(1218,'Lagunas',125,NULL,NULL),(1219,'Monsefu',125,NULL,NULL),(1220,'Nueva Arica',125,NULL,NULL),(1221,'Oyotun',125,NULL,NULL),(1222,'Picsi',125,NULL,NULL),(1223,'Pimentel',125,NULL,NULL),(1224,'Reque',125,NULL,NULL),(1225,'Santa Rosa',125,NULL,NULL),(1226,'Saña',125,NULL,NULL),(1227,'Cayalti',125,NULL,NULL),(1228,'Patapo',125,NULL,NULL),(1229,'Pomalca',125,NULL,NULL),(1230,'Pucala',125,NULL,NULL),(1231,'Tuman',125,NULL,NULL),(1232,'Ferreñafe',126,NULL,NULL),(1233,'Cañaris',126,NULL,NULL),(1234,'Incahuasi',126,NULL,NULL),(1235,'Manuel Antonio Mesones',126,NULL,NULL),(1236,'Muro',126,NULL,NULL),(1237,'Pitipo',126,NULL,NULL),(1238,'Pueblo Nuevo',126,NULL,NULL),(1239,'Lambayeque',127,NULL,NULL),(1240,'Chochope',127,NULL,NULL),(1241,'Illimo',127,NULL,NULL),(1242,'Jayanca',127,NULL,NULL),(1243,'Mochumi',127,NULL,NULL),(1244,'Morrope',127,NULL,NULL),(1245,'Motupe',127,NULL,NULL),(1246,'Olmos',127,NULL,NULL),(1247,'Pacora',127,NULL,NULL),(1248,'Salas',127,NULL,NULL),(1249,'San Jose',127,NULL,NULL),(1250,'Tucume',127,NULL,NULL),(1251,'Lima',128,NULL,NULL),(1252,'Ancon',128,NULL,NULL),(1253,'Ate',128,NULL,NULL),(1254,'Barranco',128,NULL,NULL),(1255,'Breña',128,NULL,NULL),(1256,'Carabayllo',128,NULL,NULL),(1257,'Chaclacayo',128,NULL,NULL),(1258,'Chorrillos',128,NULL,NULL),(1259,'Cieneguilla',128,NULL,NULL),(1260,'Comas',128,NULL,NULL),(1261,'El Agustino',128,NULL,NULL),(1262,'Independencia',128,NULL,NULL),(1263,'Jesus Maria',128,NULL,NULL),(1264,'La Molina',128,NULL,NULL),(1265,'La Victoria',128,NULL,NULL),(1266,'Lince',128,NULL,NULL),(1267,'Los Olivos',128,NULL,NULL),(1268,'Lurigancho',128,NULL,NULL),(1269,'Lurin',128,NULL,NULL),(1270,'Magdalena Del Mar',128,NULL,NULL),(1271,'Magdalena Vieja',128,NULL,NULL),(1272,'Miraflores',128,NULL,NULL),(1273,'Pachacamac',128,NULL,NULL),(1274,'Pucusana',128,NULL,NULL),(1275,'Puente Piedra',128,NULL,NULL),(1276,'Punta Hermosa',128,NULL,NULL),(1277,'Punta Negra',128,NULL,NULL),(1278,'Rimac',128,NULL,NULL),(1279,'San Bartolo',128,NULL,NULL),(1280,'San Borja',128,NULL,NULL),(1281,'San Isidro',128,NULL,NULL),(1282,'San Juan De Lurigancho',128,NULL,NULL),(1283,'San Juan De Miraflores',128,NULL,NULL),(1284,'San Luis',128,NULL,NULL),(1285,'San Martin De Porres',128,NULL,NULL),(1286,'San Miguel',128,NULL,NULL),(1287,'Santa Anita',128,NULL,NULL),(1288,'Santa Maria Del Mar',128,NULL,NULL),(1289,'Santa Rosa',128,NULL,NULL),(1290,'Santiago De Surco',128,NULL,NULL),(1291,'Surquillo',128,NULL,NULL),(1292,'Villa El Salvador',128,NULL,NULL),(1293,'Villa Maria Del Triunfo',128,NULL,NULL),(1294,'Barranca',129,NULL,NULL),(1295,'Paramonga',129,NULL,NULL),(1296,'Pativilca',129,NULL,NULL),(1297,'Supe',129,NULL,NULL),(1298,'Supe Puerto',129,NULL,NULL),(1299,'Cajatambo',130,NULL,NULL),(1300,'Copa',130,NULL,NULL),(1301,'Gorgor',130,NULL,NULL),(1302,'Huancapon',130,NULL,NULL),(1303,'Manas',130,NULL,NULL),(1304,'Canta',131,NULL,NULL),(1305,'Arahuay',131,NULL,NULL),(1306,'Huamantanga',131,NULL,NULL),(1307,'Huaros',131,NULL,NULL),(1308,'Lachaqui',131,NULL,NULL),(1309,'San Buenaventura',131,NULL,NULL),(1310,'Santa Rosa De Quives',131,NULL,NULL),(1311,'San Vicente De Cañete',132,NULL,NULL),(1312,'Asia',132,NULL,NULL),(1313,'Calango',132,NULL,NULL),(1314,'Cerro Azul',132,NULL,NULL),(1315,'Chilca',132,NULL,NULL),(1316,'Coayllo',132,NULL,NULL),(1317,'Imperial',132,NULL,NULL),(1318,'Lunahuana',132,NULL,NULL),(1319,'Mala',132,NULL,NULL),(1320,'Nuevo Imperial',132,NULL,NULL),(1321,'Pacaran',132,NULL,NULL),(1322,'Quilmana',132,NULL,NULL),(1323,'San Antonio',132,NULL,NULL),(1324,'San Luis',132,NULL,NULL),(1325,'Santa Cruz De Flores',132,NULL,NULL),(1326,'Zuðiga',132,NULL,NULL),(1327,'Huaral',133,NULL,NULL),(1328,'Atavillos Alto',133,NULL,NULL),(1329,'Atavillos Bajo',133,NULL,NULL),(1330,'Aucallama',133,NULL,NULL),(1331,'Chancay',133,NULL,NULL),(1332,'Ihuari',133,NULL,NULL),(1333,'Lampian',133,NULL,NULL),(1334,'Pacaraos',133,NULL,NULL),(1335,'San Miguel De Acos',133,NULL,NULL),(1336,'Santa Cruz De Andamarca',133,NULL,NULL),(1337,'Sumbilca',133,NULL,NULL),(1338,'Veintisiete De Noviembre',133,NULL,NULL),(1339,'Matucana',134,NULL,NULL),(1340,'Antioquia',134,NULL,NULL),(1341,'Callahuanca',134,NULL,NULL),(1342,'Carampoma',134,NULL,NULL),(1343,'Chicla',134,NULL,NULL),(1344,'Cuenca',134,NULL,NULL),(1345,'Huachupampa',134,NULL,NULL),(1346,'Huanza',134,NULL,NULL),(1347,'Huarochiri',134,NULL,NULL),(1348,'Lahuaytambo',134,NULL,NULL),(1349,'Langa',134,NULL,NULL),(1350,'Laraos',134,NULL,NULL),(1351,'Mariatana',134,NULL,NULL),(1352,'Ricardo Palma',134,NULL,NULL),(1353,'San Andres De Tupicocha',134,NULL,NULL),(1354,'San Antonio',134,NULL,NULL),(1355,'San Bartolome',134,NULL,NULL),(1356,'San Damian',134,NULL,NULL),(1357,'San Juan De Iris',134,NULL,NULL),(1358,'San Juan De Tantaranche',134,NULL,NULL),(1359,'San Lorenzo De Quinti',134,NULL,NULL),(1360,'San Mateo',134,NULL,NULL),(1361,'San Mateo De Otao',134,NULL,NULL),(1362,'San Pedro De Casta',134,NULL,NULL),(1363,'San Pedro De Huancayre',134,NULL,NULL),(1364,'Sangallaya',134,NULL,NULL),(1365,'Santa Cruz De Cocachacra',134,NULL,NULL),(1366,'Santa Eulalia',134,NULL,NULL),(1367,'Santiago De Anchucaya',134,NULL,NULL),(1368,'Santiago De Tuna',134,NULL,NULL),(1369,'Santo Domingo De Los Ollero',134,NULL,NULL),(1370,'Surco',134,NULL,NULL),(1371,'Huacho',135,NULL,NULL),(1372,'Ambar',135,NULL,NULL),(1373,'Caleta De Carquin',135,NULL,NULL),(1374,'Checras',135,NULL,NULL),(1375,'Hualmay',135,NULL,NULL),(1376,'Huaura',135,NULL,NULL),(1377,'Leoncio Prado',135,NULL,NULL),(1378,'Paccho',135,NULL,NULL),(1379,'Santa Leonor',135,NULL,NULL),(1380,'Santa Maria',135,NULL,NULL),(1381,'Sayan',135,NULL,NULL),(1382,'Vegueta',135,NULL,NULL),(1383,'Oyon',136,NULL,NULL),(1384,'Andajes',136,NULL,NULL),(1385,'Caujul',136,NULL,NULL),(1386,'Cochamarca',136,NULL,NULL),(1387,'Navan',136,NULL,NULL),(1388,'Pachangara',136,NULL,NULL),(1389,'Yauyos',137,NULL,NULL),(1390,'Alis',137,NULL,NULL),(1391,'Ayauca',137,NULL,NULL),(1392,'Ayaviri',137,NULL,NULL),(1393,'Azangaro',137,NULL,NULL),(1394,'Cacra',137,NULL,NULL),(1395,'Carania',137,NULL,NULL),(1396,'Catahuasi',137,NULL,NULL),(1397,'Chocos',137,NULL,NULL),(1398,'Cochas',137,NULL,NULL),(1399,'Colonia',137,NULL,NULL),(1400,'Hongos',137,NULL,NULL),(1401,'Huampara',137,NULL,NULL),(1402,'Huancaya',137,NULL,NULL),(1403,'Huangascar',137,NULL,NULL),(1404,'Huantan',137,NULL,NULL),(1405,'Huaðec',137,NULL,NULL),(1406,'Laraos',137,NULL,NULL),(1407,'Lincha',137,NULL,NULL),(1408,'Madean',137,NULL,NULL),(1409,'Miraflores',137,NULL,NULL),(1410,'Omas',137,NULL,NULL),(1411,'Putinza',137,NULL,NULL),(1412,'Quinches',137,NULL,NULL),(1413,'Quinocay',137,NULL,NULL),(1414,'San Joaquin',137,NULL,NULL),(1415,'San Pedro De Pilas',137,NULL,NULL),(1416,'Tanta',137,NULL,NULL),(1417,'Tauripampa',137,NULL,NULL),(1418,'Tomas',137,NULL,NULL),(1419,'Tupe',137,NULL,NULL),(1420,'Viðac',137,NULL,NULL),(1421,'Vitis',137,NULL,NULL),(1422,'Iquitos',138,NULL,NULL),(1423,'Alto Nanay',138,NULL,NULL),(1424,'Fernando Lores',138,NULL,NULL),(1425,'Indiana',138,NULL,NULL),(1426,'Las Amazonas',138,NULL,NULL),(1427,'Mazan',138,NULL,NULL),(1428,'Napo',138,NULL,NULL),(1429,'Punchana',138,NULL,NULL),(1430,'Putumayo',138,NULL,NULL),(1431,'Torres Causana',138,NULL,NULL),(1432,'Belen',138,NULL,NULL),(1433,'San Juan Bautista',138,NULL,NULL),(1434,'Yurimaguas',139,NULL,NULL),(1435,'Balsapuerto',139,NULL,NULL),(1436,'Barranca',139,NULL,NULL),(1437,'Cahuapanas',139,NULL,NULL),(1438,'Jeberos',139,NULL,NULL),(1439,'Lagunas',139,NULL,NULL),(1440,'Manseriche',139,NULL,NULL),(1441,'Morona',139,NULL,NULL),(1442,'Pastaza',139,NULL,NULL),(1443,'Santa Cruz',139,NULL,NULL),(1444,'Teniente Cesar Lopez Rojas',139,NULL,NULL),(1445,'Nauta',140,NULL,NULL),(1446,'Parinari',140,NULL,NULL),(1447,'Tigre',140,NULL,NULL),(1448,'Trompeteros',140,NULL,NULL),(1449,'Urarinas',140,NULL,NULL),(1450,'Ramon Castilla',141,NULL,NULL),(1451,'Pebas',141,NULL,NULL),(1452,'Yavari',141,NULL,NULL),(1453,'San Pablo',141,NULL,NULL),(1454,'Requena',142,NULL,NULL),(1455,'Alto Tapiche',142,NULL,NULL),(1456,'Capelo',142,NULL,NULL),(1457,'Emilio San Martin',142,NULL,NULL),(1458,'Maquia',142,NULL,NULL),(1459,'Puinahua',142,NULL,NULL),(1460,'Saquena',142,NULL,NULL),(1461,'Soplin',142,NULL,NULL),(1462,'Tapiche',142,NULL,NULL),(1463,'Jenaro Herrera',142,NULL,NULL),(1464,'Yaquerana',142,NULL,NULL),(1465,'Contamana',143,NULL,NULL),(1466,'Inahuaya',143,NULL,NULL),(1467,'Padre Marquez',143,NULL,NULL),(1468,'Pampa Hermosa',143,NULL,NULL),(1469,'Sarayacu',143,NULL,NULL),(1470,'Vargas Guerra',143,NULL,NULL),(1471,'Tambopata',144,NULL,NULL),(1472,'Inambari',144,NULL,NULL),(1473,'Las Piedras',144,NULL,NULL),(1474,'Laberinto',144,NULL,NULL),(1475,'Manu',145,NULL,NULL),(1476,'Fitzcarrald',145,NULL,NULL),(1477,'Madre De Dios',145,NULL,NULL),(1478,'Huepetuhe',145,NULL,NULL),(1479,'Iñapari',146,NULL,NULL),(1480,'Iberia',146,NULL,NULL),(1481,'Tahuamanu',146,NULL,NULL),(1482,'Moquegua',147,NULL,NULL),(1483,'Carumas',147,NULL,NULL),(1484,'Cuchumbaya',147,NULL,NULL),(1485,'Samegua',147,NULL,NULL),(1486,'San Cristobal',147,NULL,NULL),(1487,'Torata',147,NULL,NULL),(1488,'Omate',148,NULL,NULL),(1489,'Chojata',148,NULL,NULL),(1490,'Coalaque',148,NULL,NULL),(1491,'Ichuña',148,NULL,NULL),(1492,'La Capilla',148,NULL,NULL),(1493,'Lloque',148,NULL,NULL),(1494,'Matalaque',148,NULL,NULL),(1495,'Puquina',148,NULL,NULL),(1496,'Quinistaquillas',148,NULL,NULL),(1497,'Ubinas',148,NULL,NULL),(1498,'Yunga',148,NULL,NULL),(1499,'Ilo',149,NULL,NULL),(1500,'El Algarrobal',149,NULL,NULL),(1501,'Pacocha',149,NULL,NULL),(1502,'Chaupimarca',150,NULL,NULL),(1503,'Huachon',150,NULL,NULL),(1504,'Huariaca',150,NULL,NULL),(1505,'Huayllay',150,NULL,NULL),(1506,'Ninacaca',150,NULL,NULL),(1507,'Pallanchacra',150,NULL,NULL),(1508,'Paucartambo',150,NULL,NULL),(1509,'San Fco.De As is De Yarusyac',150,NULL,NULL),(1510,'Simon Bolivar',150,NULL,NULL),(1511,'Ticlacayan',150,NULL,NULL),(1512,'Tinyahuarco',150,NULL,NULL),(1513,'Vicco',150,NULL,NULL),(1514,'Yanacancha',150,NULL,NULL),(1515,'Yanahuanca',151,NULL,NULL),(1516,'Chacayan',151,NULL,NULL),(1517,'Goyllarisquizga',151,NULL,NULL),(1518,'Paucar',151,NULL,NULL),(1519,'San Pedro De Pillao',151,NULL,NULL),(1520,'Santa Ana De Tusi',151,NULL,NULL),(1521,'Tapuc',151,NULL,NULL),(1522,'Vilcabamba',151,NULL,NULL),(1523,'Oxapampa',152,NULL,NULL),(1524,'Chontabamba',152,NULL,NULL),(1525,'Huancabamba',152,NULL,NULL),(1526,'Palcazu',152,NULL,NULL),(1527,'Pozuzo',152,NULL,NULL),(1528,'Puerto Bermudez',152,NULL,NULL),(1529,'Villa Rica',152,NULL,NULL),(1530,'Piura',153,NULL,NULL),(1531,'Castilla',153,NULL,NULL),(1532,'Catacaos',153,NULL,NULL),(1533,'Cura Mori',153,NULL,NULL),(1534,'El Tallan',153,NULL,NULL),(1535,'La Arena',153,NULL,NULL),(1536,'La Union',153,NULL,NULL),(1537,'Las Lomas',153,NULL,NULL),(1538,'Tambo Grande',153,NULL,NULL),(1539,'Ayabaca',154,NULL,NULL),(1540,'Frias',154,NULL,NULL),(1541,'Jilili',154,NULL,NULL),(1542,'Lagunas',154,NULL,NULL),(1543,'Montero',154,NULL,NULL),(1544,'Pacaipampa',154,NULL,NULL),(1545,'Paimas',154,NULL,NULL),(1546,'Sapillica',154,NULL,NULL),(1547,'Sicchez',154,NULL,NULL),(1548,'Suyo',154,NULL,NULL),(1549,'Huancabamba',155,NULL,NULL),(1550,'Canchaque',155,NULL,NULL),(1551,'El Carmen De La Frontera',155,NULL,NULL),(1552,'Huarmaca',155,NULL,NULL),(1553,'Lalaquiz',155,NULL,NULL),(1554,'San Miguel De El Faique',155,NULL,NULL),(1555,'Sondor',155,NULL,NULL),(1556,'Sondorillo',155,NULL,NULL),(1557,'Chulucanas',156,NULL,NULL),(1558,'Buenos Aires',156,NULL,NULL),(1559,'Chalaco',156,NULL,NULL),(1560,'La Matanza',156,NULL,NULL),(1561,'Morropon',156,NULL,NULL),(1562,'Salitral',156,NULL,NULL),(1563,'San Juan De Bigote',156,NULL,NULL),(1564,'Santa Catalina De Mossa',156,NULL,NULL),(1565,'Santo Domingo',156,NULL,NULL),(1566,'Yamango',156,NULL,NULL),(1567,'Paita',157,NULL,NULL),(1568,'Amotape',157,NULL,NULL),(1569,'Arenal',157,NULL,NULL),(1570,'Colan',157,NULL,NULL),(1571,'La Huaca',157,NULL,NULL),(1572,'Tamarindo',157,NULL,NULL),(1573,'Vichayal',157,NULL,NULL),(1574,'Sullana',158,NULL,NULL),(1575,'Bellavista',158,NULL,NULL),(1576,'Ignacio Escudero',158,NULL,NULL),(1577,'Lancones',158,NULL,NULL),(1578,'Marcavelica',158,NULL,NULL),(1579,'Miguel Checa',158,NULL,NULL),(1580,'Querecotillo',158,NULL,NULL),(1581,'Salitral',158,NULL,NULL),(1582,'Pariñas',159,NULL,NULL),(1583,'El Alto',159,NULL,NULL),(1584,'La Brea',159,NULL,NULL),(1585,'Lobitos',159,NULL,NULL),(1586,'Los Organos',159,NULL,NULL),(1587,'Mancora',159,NULL,NULL),(1588,'Sechura',160,NULL,NULL),(1589,'Bellavista De La Union',160,NULL,NULL),(1590,'Bernal',160,NULL,NULL),(1591,'Cristo Nos Valga',160,NULL,NULL),(1592,'Vice',160,NULL,NULL),(1593,'Rinconada Llicuar',160,NULL,NULL),(1594,'Puno',161,NULL,NULL),(1595,'Acora',161,NULL,NULL),(1596,'Amantani',161,NULL,NULL),(1597,'Atuncolla',161,NULL,NULL),(1598,'Capachica',161,NULL,NULL),(1599,'Chucuito',161,NULL,NULL),(1600,'Coata',161,NULL,NULL),(1601,'Huata',161,NULL,NULL),(1602,'Mañazo',161,NULL,NULL),(1603,'Paucarcolla',161,NULL,NULL),(1604,'Pichacani',161,NULL,NULL),(1605,'Plateria',161,NULL,NULL),(1606,'San Antonio',161,NULL,NULL),(1607,'Tiquillaca',161,NULL,NULL),(1608,'Vilque',161,NULL,NULL),(1609,'Azangaro',162,NULL,NULL),(1610,'Achaya',162,NULL,NULL),(1611,'Arapa',162,NULL,NULL),(1612,'Asillo',162,NULL,NULL),(1613,'Caminaca',162,NULL,NULL),(1614,'Chupa',162,NULL,NULL),(1615,'Jose Domingo Choquehuanca',162,NULL,NULL),(1616,'Muñani',162,NULL,NULL),(1617,'Potoni',162,NULL,NULL),(1618,'Saman',162,NULL,NULL),(1619,'San Anton',162,NULL,NULL),(1620,'San Jose',162,NULL,NULL),(1621,'San Juan De Salinas',162,NULL,NULL),(1622,'Santiago De Pupuja',162,NULL,NULL),(1623,'Tirapata',162,NULL,NULL),(1624,'Macusani',163,NULL,NULL),(1625,'Ajoyani',163,NULL,NULL),(1626,'Ayapata',163,NULL,NULL),(1627,'Coasa',163,NULL,NULL),(1628,'Corani',163,NULL,NULL),(1629,'Crucero',163,NULL,NULL),(1630,'Ituata',163,NULL,NULL),(1631,'Ollachea',163,NULL,NULL),(1632,'San Gaban',163,NULL,NULL),(1633,'Usicayos',163,NULL,NULL),(1634,'Juli',164,NULL,NULL),(1635,'Desaguadero',164,NULL,NULL),(1636,'Huacullani',164,NULL,NULL),(1637,'Kelluyo',164,NULL,NULL),(1638,'Pisacoma',164,NULL,NULL),(1639,'Pomata',164,NULL,NULL),(1640,'Zepita',164,NULL,NULL),(1641,'Ilave',165,NULL,NULL),(1642,'Capazo',165,NULL,NULL),(1643,'Pilcuyo',165,NULL,NULL),(1644,'Santa Rosa',165,NULL,NULL),(1645,'Conduriri',165,NULL,NULL),(1646,'Huancane',166,NULL,NULL),(1647,'Cojata',166,NULL,NULL),(1648,'Huatasani',166,NULL,NULL),(1649,'Inchupalla',166,NULL,NULL),(1650,'Pusi',166,NULL,NULL),(1651,'Rosaspata',166,NULL,NULL),(1652,'Taraco',166,NULL,NULL),(1653,'Vilque Chico',166,NULL,NULL),(1654,'Lampa',167,NULL,NULL),(1655,'Cabanilla',167,NULL,NULL),(1656,'Calapuja',167,NULL,NULL),(1657,'Nicasio',167,NULL,NULL),(1658,'Ocuviri',167,NULL,NULL),(1659,'Palca',167,NULL,NULL),(1660,'Paratia',167,NULL,NULL),(1661,'Pucara',167,NULL,NULL),(1662,'Santa Lucia',167,NULL,NULL),(1663,'Vilavila',167,NULL,NULL),(1664,'Ayaviri',168,NULL,NULL),(1665,'Antauta',168,NULL,NULL),(1666,'Cupi',168,NULL,NULL),(1667,'Llalli',168,NULL,NULL),(1668,'Macari',168,NULL,NULL),(1669,'Nuñoa',168,NULL,NULL),(1670,'Orurillo',168,NULL,NULL),(1671,'Santa Rosa',168,NULL,NULL),(1672,'Umachiri',168,NULL,NULL),(1673,'Moho',169,NULL,NULL),(1674,'Conima',169,NULL,NULL),(1675,'Huayrapata',169,NULL,NULL),(1676,'Tilali',169,NULL,NULL),(1677,'Putina',170,NULL,NULL),(1678,'Ananea',170,NULL,NULL),(1679,'Pedro Vilca Apaza',170,NULL,NULL),(1680,'Quilcapuncu',170,NULL,NULL),(1681,'Sina',170,NULL,NULL),(1682,'Juliaca',171,NULL,NULL),(1683,'Cabana',171,NULL,NULL),(1684,'Cabanillas',171,NULL,NULL),(1685,'Caracoto',171,NULL,NULL),(1686,'Sandia',172,NULL,NULL),(1687,'Cuyocuyo',172,NULL,NULL),(1688,'Limbani',172,NULL,NULL),(1689,'Patambuco',172,NULL,NULL),(1690,'Phara',172,NULL,NULL),(1691,'Quiaca',172,NULL,NULL),(1692,'San Juan Del Oro',172,NULL,NULL),(1693,'Yanahuaya',172,NULL,NULL),(1694,'Alto Inambari',172,NULL,NULL),(1695,'Yunguyo',173,NULL,NULL),(1696,'Anapia',173,NULL,NULL),(1697,'Copani',173,NULL,NULL),(1698,'Cuturapi',173,NULL,NULL),(1699,'Ollaraya ',173,NULL,NULL),(1700,'Tinicachi ',173,NULL,NULL),(1701,'Unicachi',173,NULL,NULL),(1702,'Moyobamba ',174,NULL,NULL),(1703,'Calzada ',174,NULL,NULL),(1704,'Habana ',174,NULL,NULL),(1705,'Jepelacio ',174,NULL,NULL),(1706,'Soritor ',174,NULL,NULL),(1707,'Yantalo ',174,NULL,NULL),(1708,'Bellavista ',175,NULL,NULL),(1709,'Alto Biavo ',175,NULL,NULL),(1710,'Bajo Biavo ',175,NULL,NULL),(1711,'Huallaga ',175,NULL,NULL),(1712,'San Pablo ',175,NULL,NULL),(1713,'San Rafael ',175,NULL,NULL),(1714,'San Jose De Sisa',176,NULL,NULL),(1715,'Agua Blanca',176,NULL,NULL),(1716,'San Martin',176,NULL,NULL),(1717,'Santa Rosa',176,NULL,NULL),(1718,'Shatoja',176,NULL,NULL),(1719,'Saposoa',177,NULL,NULL),(1720,'Alto Saposoa',177,NULL,NULL),(1721,'El Eslabon',177,NULL,NULL),(1722,'Piscoyacu',177,NULL,NULL),(1723,'Sacanche',177,NULL,NULL),(1724,'Tingo De Saposoa',177,NULL,NULL),(1725,'Lamas',178,NULL,NULL),(1726,'Alonso De Alvarado',178,NULL,NULL),(1727,'Barranquita',178,NULL,NULL),(1728,'Caynarachi 1/',178,NULL,NULL),(1729,'Cuñumbuqui',178,NULL,NULL),(1730,'Pinto Recodo',178,NULL,NULL),(1731,'Rumisapa',178,NULL,NULL),(1732,'San Roque De Cumbaza',178,NULL,NULL),(1733,'Shanao',178,NULL,NULL),(1734,'Tabalosos',178,NULL,NULL),(1735,'Zapatero',178,NULL,NULL),(1736,'Juanjui',179,NULL,NULL),(1737,'Campanilla',179,NULL,NULL),(1738,'Huicungo',179,NULL,NULL),(1739,'Pachiza',179,NULL,NULL),(1740,'Pajarillo',179,NULL,NULL),(1741,'Picota',180,NULL,NULL),(1742,'Buenos Aires',180,NULL,NULL),(1743,'Caspisapa',180,NULL,NULL),(1744,'Pilluana',180,NULL,NULL),(1745,'Pucacaca',180,NULL,NULL),(1746,'San Cristobal',180,NULL,NULL),(1747,'San Hilarion',180,NULL,NULL),(1748,'Shamboyacu',180,NULL,NULL),(1749,'Tingo De Ponasa',180,NULL,NULL),(1750,'Tres Unidos',180,NULL,NULL),(1751,'Rioja',181,NULL,NULL),(1752,'Awajun',181,NULL,NULL),(1753,'Elias Soplin Vargas',181,NULL,NULL),(1754,'Nueva Cajamarca',181,NULL,NULL),(1755,'Pardo Miguel',181,NULL,NULL),(1756,'Posic',181,NULL,NULL),(1757,'San Fernando',181,NULL,NULL),(1758,'Yorongos',181,NULL,NULL),(1759,'Yuracyacu',181,NULL,NULL),(1760,'Tarapoto',182,NULL,NULL),(1761,'Alberto Leveau',182,NULL,NULL),(1762,'Cacatachi',182,NULL,NULL),(1763,'Chazuta',182,NULL,NULL),(1764,'Chipurana',182,NULL,NULL),(1765,'El Porvenir',182,NULL,NULL),(1766,'Huimbayoc',182,NULL,NULL),(1767,'Juan Guerra',182,NULL,NULL),(1768,'La Banda De Shilcayo',182,NULL,NULL),(1769,'Morales',182,NULL,NULL),(1770,'Papaplaya',182,NULL,NULL),(1771,'San Antonio',182,NULL,NULL),(1772,'Sauce',182,NULL,NULL),(1773,'Shapaja',182,NULL,NULL),(1774,'Tocache',183,NULL,NULL),(1775,'Nuevo Progreso',183,NULL,NULL),(1776,'Polvora',183,NULL,NULL),(1777,'Shunte',183,NULL,NULL),(1778,'Uchiza',183,NULL,NULL),(1779,'Tacna',184,NULL,NULL),(1780,'Alto De La Alianza',184,NULL,NULL),(1781,'Calana',184,NULL,NULL),(1782,'Ciudad Nueva',184,NULL,NULL),(1783,'Inclan',184,NULL,NULL),(1784,'Pachia',184,NULL,NULL),(1785,'Palca',184,NULL,NULL),(1786,'Pocollay',184,NULL,NULL),(1787,'Sama',184,NULL,NULL),(1788,'Coronel Gregorio Albarracín',184,NULL,NULL),(1789,'Lanchipa',184,NULL,NULL),(1790,'Candarave',185,NULL,NULL),(1791,'Cairani',185,NULL,NULL),(1792,'Camilaca',185,NULL,NULL),(1793,'Curibaya',185,NULL,NULL),(1794,'Huanuara',185,NULL,NULL),(1795,'Quilahuani',185,NULL,NULL),(1796,'Locumba',186,NULL,NULL),(1797,'Ilabaya',186,NULL,NULL),(1798,'Ite',186,NULL,NULL),(1799,'Tarata',187,NULL,NULL),(1800,'Chucatamani',187,NULL,NULL),(1801,'Estique',187,NULL,NULL),(1802,'Estique-Pampa',187,NULL,NULL),(1803,'Sitajara',187,NULL,NULL),(1804,'Susapaya',187,NULL,NULL),(1805,'Tarucachi',187,NULL,NULL),(1806,'Ticaco',187,NULL,NULL),(1807,'Tumbes',188,NULL,NULL),(1808,'Corrales',188,NULL,NULL),(1809,'La Cruz',188,NULL,NULL),(1810,'Pampas De Hospital',188,NULL,NULL),(1811,'San Jacinto',188,NULL,NULL),(1812,'San Juan De La Virgen',188,NULL,NULL),(1813,'Zorritos',189,NULL,NULL),(1814,'Casitas',189,NULL,NULL),(1815,'Zarumilla',190,NULL,NULL),(1816,'Aguas Verdes',190,NULL,NULL),(1817,'Matapalo',190,NULL,NULL),(1818,'Papayal',190,NULL,NULL),(1819,'Calleria',191,NULL,NULL),(1820,'Campoverde',191,NULL,NULL),(1821,'Iparia',191,NULL,NULL),(1822,'Masisea',191,NULL,NULL),(1823,'Yarinacocha',191,NULL,NULL),(1824,'Nueva Requena',191,NULL,NULL),(1825,'Raymondi',192,NULL,NULL),(1826,'Sepahua',192,NULL,NULL),(1827,'Tahuania',192,NULL,NULL),(1828,'Yurua',192,NULL,NULL),(1829,'Padre Abad',193,NULL,NULL),(1830,'Irazola',193,NULL,NULL),(1831,'Curimana',193,NULL,NULL),(1832,'Puru',194,NULL,NULL),(1833,'Pueblo Libre',128,NULL,NULL);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_types`
--

DROP TABLE IF EXISTS `field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_types`
--

LOCK TABLES `field_types` WRITE;
/*!40000 ALTER TABLE `field_types` DISABLE KEYS */;
INSERT INTO `field_types` VALUES (1,'Futbol 5'),(2,'Futbol 7'),(3,'Futbol 11'),(4,'Césped Natural'),(5,'Césped Sintético'),(6,'Techado');
/*!40000 ALTER TABLE `field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `hour_cost` double NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'asdf',12,3),(2,'a',2,1),(3,'b',23,1);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_field_types`
--

DROP TABLE IF EXISTS `fields_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_field_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `field_type_id` (`field_type_id`),
  CONSTRAINT `fields_field_types_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fields_field_types_ibfk_2` FOREIGN KEY (`field_type_id`) REFERENCES `field_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_field_types`
--

LOCK TABLES `fields_field_types` WRITE;
/*!40000 ALTER TABLE `fields_field_types` DISABLE KEYS */;
INSERT INTO `fields_field_types` VALUES (1,2,1),(2,2,2),(3,1,5),(4,1,6),(5,2,6);
/*!40000 ALTER TABLE `fields_field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `url` varchar(100) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'adsfadfadf','http://localhost:8000/uploads/UJDFkdwCwncEQlNuxKGftBzMtgMpajbFBAMVBnEMRwckonIqIR.png',2),(2,'hola','http://localhost:8000/uploads/OXjJvGkCdiTirHJAptvynXLXNdRIYYgVJknzBvLjZCnlulqizo.png',3),(3,'adf','http://localhost:8000/uploads/VOTjbSxwkMGVCoWrFLmLNuccdyqqKhFdviERWKAUsyeEDKvVoL.png',3),(4,'afdsf','http://localhost:8000/uploads/mXoHbAHZSTgKInoXUKMHNwoegZbDHOnbVncInBJRSIcJMqnFgb.png',3),(5,'SDAD','UoTNphhziZvcCoDOHhQKFbupzMNVCjLLhXnIcaNZMlXJlnfnNy.png',1),(6,'asdf','sPtjJThmPyiAgkGNPgfrFzIakNOXNtpSiwSwwAOOvZlayMkQbc.png',1),(7,'hkjj','NQTxpVduwzBjBSyIytplsqTRQvhjcVNCXDaXRdqiYiLzpOLLqs.png',1);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `account` varchar(25) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notifications` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Pepe Valdivia',NULL,'',NULL,0),(2,'Pepe Valdivia',NULL,'',NULL,0),(3,'Pepe Valdivia',NULL,'',NULL,0),(4,'Pepe Valdivia',NULL,'',NULL,0),(5,'Pepe Valdivia',NULL,'',NULL,0),(6,'Pepe Valdivia',NULL,'',NULL,0),(7,'Pepe Valdivia',NULL,'',NULL,0),(8,'Pepe Valdivia',NULL,'',NULL,0),(9,'Pepe Valdivia',NULL,'',NULL,0),(10,'Pepe Valdivia',NULL,'',72,0),(11,'Pepe Valdivia',NULL,'',73,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `provinces_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Chachapoyas',1),(2,'Bagua ',1),(3,'Bongara ',1),(4,'Condorcanqui',1),(5,'Luya ',1),(6,'Rodriguez De Mendo',1),(7,'Utcubamba',1),(8,'Huaraz',2),(9,'Aija',2),(10,'Antonio Raymondi',2),(11,'Asunción',2),(12,'Bolognesi',2),(13,'Carhuaz',2),(14,'Carlos F. Fitzcarrald',2),(15,'Casma ',2),(16,'Corongo ',2),(17,'Huari',2),(18,'Huarmey ',2),(19,'Huaylas',2),(20,'Mariscal Luzuriaga',2),(21,'Ocros ',2),(22,'Pallasca ',2),(23,'Pomabamba',2),(24,'Recuay',2),(25,'Santa',2),(26,'Sihuas ',2),(27,'Yungay',2),(28,'Abancay',3),(29,'Andahuaylas',3),(30,'Antabamba',3),(31,'Aymaraes',3),(32,'Cotabambas',3),(33,'Chincheros',3),(34,'Grau',3),(35,'Arequipa',4),(36,'Camana',4),(37,'Caraveli',4),(38,'Castilla',4),(39,'Caylloma',4),(40,'Condesuyos',4),(41,'Islay',4),(42,'La Union ',4),(43,'Huamanga',5),(44,'Cangallo ',5),(45,'Huanca Sancos',5),(46,'Huanta',5),(47,'La Mar',5),(48,'Lucanas',5),(49,'Parinacochas',5),(50,'Paucar Del Sara Sara',5),(51,'Sucre',5),(52,'Victor Fajardo',5),(53,'Vilcas Huaman',5),(54,'Cajamarca',6),(55,'Cajabamba',6),(56,'Celendin ',6),(57,'Chota ',6),(58,'Contumaza ',6),(59,'Cutervo ',6),(60,'Hualgayoc',6),(61,'Jaen',6),(62,'San Ignacio',6),(63,'San Marcos',6),(64,'San Miguel ',6),(65,'San Pablo',6),(66,'Santa Cruz',6),(67,'Callao',7),(68,'Cusco ',8),(69,'Acomayo ',8),(70,'Anta',8),(71,'Calca',8),(72,'Canas ',8),(73,'Canchis',8),(74,'Chumbivilcas',8),(75,'Espinar',8),(76,'La Convencion',8),(77,'Paruro ',8),(78,'Paucartambo',8),(79,'Quispicanchi',8),(80,'Urubamba',8),(81,'Huancavelica',9),(82,'Acobamba ',9),(83,'Angaraes ',9),(84,'Castrovirreyna',9),(85,'Churcampa',9),(86,'Huaytara',9),(87,'Tayacaja',9),(88,'Huanuco ',10),(89,'Ambo ',10),(90,'Dos De Mayo',10),(91,'Huacaybamba',10),(92,'Huamalies',10),(93,'Leoncio Prado',10),(94,'Marañón',10),(95,'Pachitea ',10),(96,'Puerto Inca ',10),(97,'Lauricocha ',10),(98,'Yarowilca',10),(99,'Ica',11),(100,'Chincha',11),(101,'Nazca ',11),(102,'Palpa  ',11),(103,'Pisco ',11),(104,'Huancayo',12),(105,'Concepcion',12),(106,'Chanchamayo',12),(107,'Jauja',12),(108,'Junin ',12),(109,'Satipo ',12),(110,'Tarma ',12),(111,'Yauli',12),(112,'Chupaca',12),(113,'Trujillo',13),(114,'Ascope',13),(115,'Bolivar ',13),(116,'Chepen ',13),(117,'Julcan ',13),(118,'Otuzco ',13),(119,'Pacasmayo',13),(120,'Pataz',13),(121,'Sanchez Carrion',13),(122,'Santiago De Chuco',13),(123,'Gran Chimu',13),(124,'Viru',13),(125,'Chiclayo',14),(126,'Ferreñafe',14),(127,'Lambayeque ',14),(128,'Lima',15),(129,'Barranca ',15),(130,'Cajatambo',15),(131,'Canta',15),(132,'Cañete',15),(133,'Huaral ',15),(134,'Huarochiri ',15),(135,'Huaura',15),(136,'Oyon',15),(137,'Yauyos ',15),(138,'Maynas',16),(139,'Alto Amazonas',16),(140,'Loreto',16),(141,'Mariscal Ramon Castilla',16),(142,'Requena ',16),(143,'Ucayali ',16),(144,'Tambopata ',17),(145,'Manu ',17),(146,'Tahuamanu',17),(147,'Mariscal Nieto',18),(148,'General Sanchez Cerro',18),(149,'Ilo',18),(150,'Pasco',19),(151,'Daniel Alcides Carrion',19),(152,'Oxapampa',19),(153,'Piura',20),(154,'Ayabaca',20),(155,'Huancabamba',20),(156,'Morropon',20),(157,'Paita',20),(158,'Sullana ',20),(159,'Talara ',20),(160,'Sechura ',20),(161,'Puno',21),(162,'Azangaro',21),(163,'Carabaya ',21),(164,'Chucuito ',21),(165,'El Collao  ',21),(166,'Huancane ',21),(167,'Lampa',21),(168,'Melgar ',21),(169,'Moho ',21),(170,'San Antonio De Putina ',21),(171,'San Roman ',21),(172,'Sandia ',21),(173,'Yunguyo ',21),(174,'Moyobamba ',22),(175,'Bellavista ',22),(176,'El Dorado ',22),(177,'Huallaga ',22),(178,'Lamas',22),(179,'Mariscal Caceres',22),(180,'Picota',22),(181,'Rioja',22),(182,'San Martin  ',22),(183,'Tocache ',22),(184,'Tacna',23),(185,'Candarave',23),(186,'Jorge Basadre',23),(187,'Tarata',23),(188,'Tumbes',24),(189,'Contralmirante Villar',24),(190,'Zarumilla',24),(191,'Coronel Portillo',25),(192,'Atalaya',25),(193,'Padre Abad',25),(194,'Purus',25);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180716031559'),('20180716032053'),('20180716033310'),('20180716033439'),('20180716033614'),('20180716033710'),('20180716035126'),('20181029195325'),('20181029195402'),('20181029195725'),('20181029195735'),('20181029200050'),('20181029200731'),('20181029201210'),('20181029201529'),('20181029201948'),('20181029202428'),('20181030151325'),('20181030151355'),('20181030151800'),('20181030162222'),('20181101144525'),('20181101144709'),('20181101144858'),('20181102171113'),('20181102211008'),('20181103011433'),('20181122183908'),('20181122191855'),('20181123180830'),('20181129014310'),('20181207233539');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Kiosko'),(2,'Cafetería'),(3,'Estacionamiento Gratiuito'),(4,'Estacionamiento Pagado'),(5,'Tópico'),(6,'hola');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_client_district_state`
--

DROP TABLE IF EXISTS `vw_client_district_state`;
/*!50001 DROP VIEW IF EXISTS `vw_client_district_state`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_client_district_state` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `address`,
 1 AS `phone`,
 1 AS `account`,
 1 AS `bank_id`,
 1 AS `bank`,
 1 AS `logo_url`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `client_state_id`,
 1 AS `state`,
 1 AS `district_id`,
 1 AS `district`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_clients`
--

DROP TABLE IF EXISTS `vw_clients`;
/*!50001 DROP VIEW IF EXISTS `vw_clients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_clients` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `address`,
 1 AS `logo_url`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `phone`,
 1 AS `district_id`,
 1 AS `district`,
 1 AS `client_state_id`,
 1 AS `client_state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_clients_fields`
--

DROP TABLE IF EXISTS `vw_clients_fields`;
/*!50001 DROP VIEW IF EXISTS `vw_clients_fields`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_clients_fields` AS SELECT 
 1 AS `client_id`,
 1 AS `user_id`,
 1 AS `field_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_clients_services`
--

DROP TABLE IF EXISTS `vw_clients_services`;
/*!50001 DROP VIEW IF EXISTS `vw_clients_services`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_clients_services` AS SELECT 
 1 AS `id`,
 1 AS `client_id`,
 1 AS `service_id`,
 1 AS `name`,
 1 AS `existe`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_districts`
--

DROP TABLE IF EXISTS `vw_districts`;
/*!50001 DROP VIEW IF EXISTS `vw_districts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_districts` AS SELECT 
 1 AS `id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_fields_field_types`
--

DROP TABLE IF EXISTS `vw_fields_field_types`;
/*!50001 DROP VIEW IF EXISTS `vw_fields_field_types`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_fields_field_types` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `existe`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_client_district_state`
--

/*!50001 DROP VIEW IF EXISTS `vw_client_district_state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_client_district_state` AS select `C`.`id` AS `id`,`C`.`name` AS `name`,`C`.`description` AS `description`,`C`.`address` AS `address`,`C`.`phone` AS `phone`,`C`.`account` AS `account`,`C`.`bank_id` AS `bank_id`,`B`.`name` AS `bank`,`C`.`logo_url` AS `logo_url`,`C`.`latitude` AS `latitude`,`C`.`longitude` AS `longitude`,`C`.`client_state_id` AS `client_state_id`,`CS`.`name` AS `state`,`C`.`district_id` AS `district_id`,`D`.`name` AS `district`,`C`.`user_id` AS `user_id` from (((`clients` `C` join `vw_districts` `D` on((`D`.`id` = `C`.`district_id`))) join `client_states` `CS` on((`CS`.`id` = `C`.`client_state_id`))) join `banks` `B` on((`B`.`id` = `C`.`bank_id`))) limit 2000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clients`
--

/*!50001 DROP VIEW IF EXISTS `vw_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clients` AS select `CL`.`id` AS `id`,`CL`.`name` AS `name`,`CL`.`address` AS `address`,`CL`.`logo_url` AS `logo_url`,`CL`.`latitude` AS `latitude`,`CL`.`longitude` AS `longitude`,`CL`.`phone` AS `phone`,`CL`.`id` AS `district_id`,`DI`.`name` AS `district`,`CL`.`id` AS `client_state_id`,`CS`.`name` AS `client_state` from ((`clients` `CL` join `vw_districts` `DI` on((`DI`.`id` = `CL`.`district_id`))) join `client_states` `CS` on((`CS`.`id` = `CL`.`client_state_id`))) limit 2000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clients_fields`
--

/*!50001 DROP VIEW IF EXISTS `vw_clients_fields`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clients_fields` AS select `C`.`id` AS `client_id`,`C`.`user_id` AS `user_id`,`F`.`id` AS `field_id` from (`clients` `C` join `fields` `F` on((`F`.`client_id` = `C`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clients_services`
--

/*!50001 DROP VIEW IF EXISTS `vw_clients_services`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clients_services` AS select `CS`.`id` AS `id`,`CS`.`client_id` AS `client_id`,`CS`.`service_id` AS `service_id`,`S`.`name` AS `name`,0 AS `existe` from (`clients_services` `CS` join `services` `S` on((`CS`.`service_id` = `S`.`id`))) limit 2000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_districts`
--

/*!50001 DROP VIEW IF EXISTS `vw_districts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_districts` AS select `DI`.`id` AS `id`,concat(`DI`.`name`,', ',`PR`.`name`,', ',`DE`.`name`) AS `name` from ((`districts` `DI` join `provinces` `PR` on((`DI`.`province_id` = `PR`.`id`))) join `departments` `DE` on((`PR`.`department_id` = `DE`.`id`))) limit 2000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fields_field_types`
--

/*!50001 DROP VIEW IF EXISTS `vw_fields_field_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fields_field_types` AS select `FT`.`id` AS `id`,`T`.`name` AS `name`,1 AS `existe` from ((`fields_field_types` `FT` join `fields` `F` on((`FT`.`field_id` = `F`.`id`))) join `field_types` `T` on((`FT`.`field_type_id` = `T`.`id`))) */;
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

-- Dump completed on 2018-12-17 22:04:19
