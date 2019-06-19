CREATE DATABASE  IF NOT EXISTS `arroz_tower` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arroz_tower`;
-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: arroz_tower
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `hora_evento` datetime NOT NULL,
  `id_relacionado` int(11) NOT NULL,
  `tipo_evento` enum('tarjeta','usuario') DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  UNIQUE KEY `id_evento_UNIQUE` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'2019-06-03 20:42:27',1,'tarjeta'),(2,'2019-06-03 20:43:18',1,'tarjeta'),(3,'2019-06-03 20:43:30',1,'tarjeta'),(4,'2019-06-03 20:43:37',2,'tarjeta'),(5,'2019-06-03 20:46:52',1,'tarjeta'),(6,'2019-06-03 20:55:04',2,'tarjeta'),(7,'2019-06-03 20:55:25',3,'tarjeta'),(8,'2019-06-03 20:56:18',2,'tarjeta'),(9,'2019-06-03 20:58:31',2,'tarjeta'),(10,'2019-06-03 20:59:08',2,'tarjeta'),(11,'2019-06-03 21:00:19',2,'tarjeta'),(12,'2019-06-03 21:02:06',2,'tarjeta'),(13,'2019-06-03 21:02:14',2,'tarjeta'),(14,'2019-06-03 21:02:20',1,'tarjeta'),(15,'2019-06-03 21:02:23',3,'tarjeta'),(16,'2019-06-03 21:12:00',2,'tarjeta'),(17,'2019-06-03 21:12:06',1,'tarjeta'),(18,'2019-06-03 21:12:10',3,'tarjeta'),(19,'2019-06-03 21:12:13',1,'usuario'),(20,'2019-06-03 21:12:55',2,'tarjeta'),(21,'2019-06-03 21:15:45',1,'tarjeta'),(22,'2019-06-03 21:15:50',3,'tarjeta'),(23,'2019-06-03 21:15:58',2,'tarjeta'),(24,'2019-06-03 21:16:02',3,'tarjeta'),(25,'2019-06-03 21:16:11',3,'tarjeta'),(26,'2019-06-03 21:16:14',1,'usuario'),(27,'2019-06-03 21:16:49',1,'tarjeta'),(28,'2019-06-03 21:16:49',2,'tarjeta'),(29,'2019-06-03 21:16:50',3,'tarjeta'),(30,'2019-06-03 21:16:51',1,'usuario'),(31,'2019-06-03 21:16:59',1,'tarjeta'),(32,'2019-06-03 21:16:59',2,'tarjeta'),(33,'2019-06-03 21:16:59',3,'tarjeta'),(34,'2019-06-03 21:17:00',1,'usuario'),(35,'2019-06-03 21:17:07',1,'usuario'),(36,'2019-06-03 21:18:06',2,'tarjeta'),(37,'2019-06-03 21:18:07',3,'tarjeta'),(38,'2019-06-03 21:18:07',1,'usuario'),(39,'2019-06-03 21:18:09',1,'tarjeta'),(40,'2019-06-03 21:18:14',2,'tarjeta'),(41,'2019-06-03 21:18:15',3,'tarjeta'),(42,'2019-06-03 21:18:15',1,'usuario'),(43,'2019-06-03 21:18:17',3,'tarjeta'),(44,'2019-06-03 21:18:28',2,'tarjeta'),(45,'2019-06-03 21:18:29',3,'tarjeta'),(46,'2019-06-03 21:18:31',1,'usuario'),(47,'2019-06-03 21:18:31',3,'tarjeta'),(48,'2019-06-03 21:18:37',3,'tarjeta'),(49,'2019-06-03 21:18:37',3,'tarjeta'),(50,'2019-06-03 21:18:38',3,'tarjeta'),(51,'2019-06-03 21:18:39',3,'tarjeta'),(52,'2019-06-03 21:18:50',3,'tarjeta'),(53,'2019-06-03 21:18:53',3,'tarjeta'),(54,'2019-06-03 21:18:54',3,'tarjeta'),(55,'2019-06-03 21:18:59',2,'tarjeta'),(56,'2019-06-03 21:19:22',2,'tarjeta'),(57,'2019-06-03 21:19:25',3,'tarjeta'),(58,'2019-06-03 21:19:28',1,'usuario'),(59,'2019-06-03 21:19:34',1,'usuario'),(60,'2019-06-03 21:20:29',1,'usuario'),(61,'2019-06-03 21:20:37',1,'tarjeta'),(62,'2019-06-03 21:20:42',2,'tarjeta'),(63,'2019-06-03 21:20:46',3,'tarjeta'),(64,'2019-06-03 21:20:49',1,'usuario'),(65,'2019-06-03 21:20:50',3,'tarjeta'),(66,'2019-06-03 21:20:55',1,'tarjeta'),(67,'2019-06-03 21:20:56',3,'tarjeta'),(68,'2019-06-03 21:21:00',1,'usuario'),(69,'2019-06-03 21:21:01',1,'tarjeta'),(70,'2019-06-03 22:13:27',3,'tarjeta'),(71,'2019-06-03 22:13:34',1,'usuario'),(72,'2019-06-03 22:13:38',3,'tarjeta'),(73,'2019-06-03 22:13:44',2,'tarjeta'),(74,'2019-06-03 22:13:48',1,'tarjeta'),(75,'2019-06-03 22:13:48',2,'tarjeta'),(76,'2019-06-03 22:13:52',3,'tarjeta'),(77,'2019-06-03 22:13:53',3,'tarjeta'),(78,'2019-06-03 22:13:54',3,'tarjeta'),(79,'2019-06-03 22:13:55',3,'tarjeta'),(80,'2019-06-03 22:13:56',3,'tarjeta'),(81,'2019-06-03 22:13:56',3,'tarjeta'),(82,'2019-06-03 22:13:57',3,'tarjeta'),(83,'2019-06-03 22:14:04',2,'tarjeta'),(84,'2019-06-03 22:14:04',1,'tarjeta'),(85,'2019-06-03 22:14:07',1,'usuario'),(86,'2019-06-03 22:14:08',3,'tarjeta'),(87,'2019-06-03 22:14:11',3,'tarjeta'),(88,'2019-06-03 22:24:16',2,'tarjeta'),(89,'2019-06-03 22:24:25',1,'tarjeta'),(90,'2019-06-03 22:26:10',2,'tarjeta'),(91,'2019-06-03 22:26:10',1,'usuario'),(92,'2019-06-03 22:26:12',3,'tarjeta'),(93,'2019-06-03 22:26:20',1,'usuario'),(94,'2019-06-03 22:26:22',1,'tarjeta'),(95,'2019-06-03 22:29:34',2,'tarjeta'),(96,'2019-06-03 22:29:35',3,'tarjeta'),(97,'2019-06-03 22:29:39',1,'usuario'),(98,'2019-06-03 22:29:40',3,'tarjeta'),(99,'2019-06-03 22:29:40',2,'tarjeta'),(100,'2019-06-03 22:29:41',1,'tarjeta'),(101,'2019-06-03 22:29:44',1,'tarjeta'),(102,'2019-06-03 22:29:45',2,'tarjeta'),(103,'2019-06-03 22:29:46',2,'tarjeta'),(104,'2019-06-03 22:32:12',3,'tarjeta'),(105,'2019-06-03 22:32:12',1,'usuario'),(106,'2019-06-03 22:32:14',2,'tarjeta'),(107,'2019-06-03 22:32:33',2,'tarjeta'),(108,'2019-06-03 22:32:35',3,'tarjeta'),(109,'2019-06-03 22:32:36',1,'usuario'),(110,'2019-06-03 22:32:54',3,'tarjeta'),(111,'2019-06-03 22:32:54',2,'tarjeta'),(112,'2019-06-03 22:33:02',1,'usuario'),(113,'2019-06-03 22:33:03',2,'tarjeta'),(114,'2019-06-03 22:33:06',2,'tarjeta'),(115,'2019-06-03 22:59:58',2,'tarjeta'),(116,'2019-06-03 22:59:59',2,'tarjeta'),(117,'2019-06-03 22:59:59',2,'tarjeta'),(118,'2019-06-03 23:00:00',2,'tarjeta'),(119,'2019-06-03 23:00:08',2,'tarjeta'),(120,'2019-06-03 23:00:08',2,'tarjeta'),(121,'2019-06-03 23:00:09',2,'tarjeta'),(122,'2019-06-03 23:00:10',2,'tarjeta'),(123,'2019-06-03 23:00:10',2,'tarjeta'),(124,'2019-06-03 23:00:11',2,'tarjeta'),(125,'2019-06-03 23:34:01',1,'usuario'),(126,'2019-06-03 23:34:46',1,'usuario'),(127,'2019-06-03 23:41:16',3,'tarjeta'),(128,'2019-06-03 23:41:23',2,'tarjeta'),(129,'2019-06-03 23:41:26',1,'usuario'),(130,'2019-06-03 23:41:34',3,'tarjeta'),(131,'2019-06-03 23:44:07',3,'tarjeta'),(132,'2019-06-04 15:13:52',3,'tarjeta'),(133,'2019-06-04 15:16:50',3,'tarjeta'),(134,'2019-06-04 15:16:54',2,'tarjeta'),(135,'2019-06-04 15:16:59',1,'usuario'),(136,'2019-06-04 15:17:04',2,'tarjeta'),(137,'2019-06-04 15:18:46',3,'tarjeta'),(138,'2019-06-04 15:18:51',3,'tarjeta'),(139,'2019-06-04 16:34:17',1,'usuario'),(140,'2019-06-04 16:35:56',1,'usuario'),(141,'2019-06-04 16:35:59',3,'tarjeta'),(142,'2019-06-04 16:36:04',1,'tarjeta'),(143,'2019-06-04 16:36:08',2,'tarjeta'),(144,'2019-06-04 16:36:14',1,'tarjeta'),(145,'2019-06-04 16:36:14',2,'tarjeta'),(146,'2019-06-04 16:36:18',2,'tarjeta'),(147,'2019-06-04 16:36:19',3,'tarjeta'),(148,'2019-06-04 16:36:25',3,'tarjeta'),(149,'2019-06-04 16:36:26',1,'tarjeta'),(150,'2019-06-04 16:36:30',1,'tarjeta'),(151,'2019-06-04 16:36:31',3,'tarjeta'),(152,'2019-06-04 16:36:34',2,'tarjeta'),(153,'2019-06-04 16:36:35',1,'tarjeta'),(154,'2019-06-04 16:36:41',3,'tarjeta'),(155,'2019-06-04 16:36:41',3,'tarjeta'),(156,'2019-06-04 16:36:43',2,'tarjeta'),(157,'2019-06-04 16:36:44',2,'tarjeta'),(158,'2019-06-04 16:36:48',1,'tarjeta'),(159,'2019-06-04 16:36:48',1,'tarjeta'),(160,'2019-06-04 16:36:49',2,'tarjeta'),(161,'2019-06-04 16:36:49',2,'tarjeta'),(162,'2019-06-04 16:36:54',1,'tarjeta'),(163,'2019-06-04 16:36:54',2,'tarjeta'),(164,'2019-06-04 16:36:54',1,'tarjeta'),(165,'2019-06-04 16:36:55',2,'tarjeta'),(166,'2019-06-04 16:36:55',3,'tarjeta'),(167,'2019-06-04 16:36:59',1,'usuario'),(168,'2019-06-04 16:36:59',3,'tarjeta'),(169,'2019-06-04 16:37:00',2,'tarjeta'),(170,'2019-06-04 16:37:01',2,'tarjeta'),(171,'2019-06-04 16:37:01',3,'tarjeta'),(172,'2019-06-04 16:37:05',1,'usuario'),(173,'2019-06-04 16:37:06',1,'usuario'),(174,'2019-06-04 16:37:06',1,'usuario'),(175,'2019-06-04 16:37:07',3,'tarjeta'),(177,'2019-06-17 21:35:47',10,'usuario'),(178,'2019-06-17 21:48:16',9,'usuario'),(179,'2019-06-17 22:00:47',11,'usuario'),(180,'2019-06-17 22:00:47',10,'usuario'),(181,'2019-06-17 22:00:47',9,'usuario'),(182,'2019-06-17 22:01:33',9,'usuario'),(183,'2019-06-17 22:01:33',10,'usuario'),(184,'2019-06-17 22:01:33',11,'usuario'),(185,'2019-06-17 22:02:43',11,'usuario'),(186,'2019-06-17 22:03:00',11,'usuario'),(187,'2019-06-17 22:09:06',8,'usuario'),(188,'2019-06-17 22:09:55',11,'usuario'),(189,'2019-06-17 22:11:28',11,'usuario'),(190,'2019-06-17 22:12:41',10,'usuario'),(191,'2019-06-17 22:13:59',10,'usuario'),(192,'2019-06-17 22:17:09',10,'usuario'),(193,'2019-06-17 22:17:45',10,'usuario'),(194,'2019-06-17 22:19:44',10,'usuario'),(195,'2019-06-17 22:22:00',10,'usuario'),(196,'2019-06-17 22:23:00',10,'usuario'),(197,'2019-06-17 22:24:07',10,'usuario'),(198,'2019-06-17 22:25:50',10,'usuario'),(199,'2019-06-17 23:43:28',10,'usuario'),(200,'2019-06-17 23:56:00',11,'usuario'),(201,'2019-06-18 16:06:21',33,'usuario'),(202,'2019-06-18 16:06:45',33,'usuario'),(203,'2019-06-18 16:06:56',12,'usuario');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_tipo`
--

DROP TABLE IF EXISTS `extra_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `extra_tipo` (
  `id_extra_habitacion` int(11) NOT NULL,
  `id_tipo_habitacion` int(11) NOT NULL,
  PRIMARY KEY (`id_extra_habitacion`,`id_tipo_habitacion`),
  KEY `fk_tipo_habitacion_idx` (`id_tipo_habitacion`),
  CONSTRAINT `fk_extra_habitacion` FOREIGN KEY (`id_extra_habitacion`) REFERENCES `extras_habitacion` (`id_extra_habitacion`),
  CONSTRAINT `fk_tipo_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_tipo`
--

LOCK TABLES `extra_tipo` WRITE;
/*!40000 ALTER TABLE `extra_tipo` DISABLE KEYS */;
INSERT INTO `extra_tipo` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(11,1),(12,1),(1,2),(2,2),(4,2),(5,2),(6,2),(7,2),(11,2),(12,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(11,3),(12,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5);
/*!40000 ALTER TABLE `extra_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_habitacion`
--

DROP TABLE IF EXISTS `extras_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `extras_habitacion` (
  `id_extra_habitacion` int(11) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`id_extra_habitacion`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `id_extra_habitacion_UNIQUE` (`id_extra_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_habitacion`
--

LOCK TABLES `extras_habitacion` WRITE;
/*!40000 ALTER TABLE `extras_habitacion` DISABLE KEYS */;
INSERT INTO `extras_habitacion` VALUES (11,'Acceso a Internet por Banda Ancha desde la habitación'),(12,'Cofre de seguridad digital'),(7,'Desayuno Americano Buffet servido en nuestro restaurante'),(1,'Doble línea telefónica'),(2,'Escritorio ejecutivo de trabajo'),(8,'Estacionamiento con servicio de valet parking'),(9,'Internet inalámbrico (Wi-Fi) en todas las áreas del hotel'),(4,'Libre acceso a nuestro Health Club & Spa, piscina y gimnasio'),(5,'Pantalla LCD de 32\'\' con DVD'),(10,'Room service las 24 hs'),(6,'Sistema de climatización individual'),(3,'Voice mail');
/*!40000 ALTER TABLE `extras_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tarjetas` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `estado` enum('activa','anulada') NOT NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
INSERT INTO `tarjetas` VALUES (1,'activa'),(2,'activa'),(3,'anulada');
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_habitacion`
--

DROP TABLE IF EXISTS `tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_habitacion` (
  `id_tipo_habitacion` int(11) NOT NULL,
  `tipo_habitacion` varchar(45) NOT NULL,
  `capacidad` int(2) NOT NULL,
  `descripcion` tinytext,
  `detalle` tinytext,
  PRIMARY KEY (`id_tipo_habitacion`),
  UNIQUE KEY `id_tipo_habitacion_UNIQUE` (`id_tipo_habitacion`),
  UNIQUE KEY `tipo_habitacion_UNIQUE` (`tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion`
--

LOCK TABLES `tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion` DISABLE KEYS */;
INSERT INTO `tipo_habitacion` VALUES (1,'Deluxe',2,'Nuestras habitaciones Deluxe son ideales para una estadía de negocios.','Estas habitaciones pueden disponer de cama King Size (2 x 2 mts.) o dos camas de 1.30 x 1.90 mts cada una.'),(2,'Deluxe Plus',2,'Combinación ideal para un viaje de negocios o para alojarse en familia.','Estas habitaciones pueden contar con cama King Size (2 x 2 mts) o dos camas de 1.30 x 1.90 mts cada una, el baño a diferencia de las Deluxe, está equipado con hidromasaje simple.'),(3,'Junior Suite',4,'Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.','Presenta dimensiones mas amplias que Deluxe y Deluxe Plus, dispone de una antesala con diván y escritorio, la habitación principal cuenta con cama King Size (2 x 2 mts).'),(4,'Executive Suite',6,'Servicios de última generación, espacio adicional y jacuzzi para dos personas.','Este tipo de habitación ofrece una antesala con diván y escritorio, toilette de cortesía, cama King Size (2 x 2 mts.) en la habitación principal y el baño principal cuenta con jacuzzi para dos personas.'),(5,'Suite Presidencial',8,'Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.','La Suite Presidencial es única en su categoría. Ubicada estratégicamente cuenta con amplios espacios y servicios de primera categoría.');
/*!40000 ALTER TABLE `tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `codigo_postal` int(10) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `verificado` bit(1) DEFAULT b'0',
  `hash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin@admin.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'imbatman@batman.com','d1ebaaac13d8a73b0cbf1b8e99c329dd','10','Bruce Wayne','Bruce Wayne','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'seba.a.rossi@gmail.com','ed37a736bd1f173fe8ce0825ba749608','39951271','Sebastian','Rossi','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'vderivi@gmail.com','85a3a55fa5d68b30a9fd4c4a0289da77','39950434','Victor','De Rivi','3416725222',NULL,NULL,NULL,NULL,NULL,_binary '',NULL),(11,'d10s@gmail.com','25d55ad283aa400af464c76d713c07ad','10 ','juan ','roman','10',NULL,'AR','Buenos Aires ',1,'bombonera',NULL,NULL),(12,'jhonny@gmail.com','25d55ad283aa400af464c76d713c07ad','asd ','prueba hash 1','hashin','123',NULL,'AR','vgg',0,'en la esquina',_binary '\0','31ffad21b34e66ee7937d2cf593defc6'),(33,'ariasramirox@gmail.com','b643f311b21f660a5f8e6c5987207e3b','123123','3123123','123123','123123',NULL,'AR','123123',123123,'12312312',_binary '','aeb40acae433f86e045d7331b773e393');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verified_user_evt_update` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
	IF (NEW.verificado != OLD.verificado)
	THEN
		INSERT INTO `arroz_tower`.`eventos`
        (id_relacionado, hora_evento, tipo_evento)
        VALUES
        (NEW.id_usuario, CURRENT_TIMESTAMP(), 'usuario');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 16:10:25
