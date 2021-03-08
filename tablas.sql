CREATE DATABASE  IF NOT EXISTS `arroz_tower` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arroz_tower`;
-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: arroz_tower
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `hora_evento` datetime NOT NULL,
  `id_relacionado` int NOT NULL,
  `tipo_evento` enum('tarjeta','usuario') DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  UNIQUE KEY `id_evento_UNIQUE` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'2019-06-19 18:03:35',34,'usuario'),(2,'2019-06-19 18:05:29',34,'usuario'),(3,'2019-06-19 18:05:37',34,'usuario'),(4,'2019-09-10 21:39:18',34,'usuario'),(5,'2019-09-10 21:41:00',34,'usuario'),(6,'2019-09-10 21:41:55',34,'usuario'),(7,'2019-09-10 21:42:11',34,'usuario'),(8,'2019-09-10 21:42:34',34,'usuario'),(9,'2019-09-10 21:43:05',34,'usuario'),(10,'2019-09-10 21:43:15',1,'tarjeta'),(11,'2019-09-10 21:43:19',2,'tarjeta'),(12,'2019-09-10 21:43:24',3,'tarjeta'),(13,'2019-09-10 21:43:30',2,'tarjeta'),(14,'2019-09-10 21:43:30',3,'tarjeta'),(15,'2019-09-10 21:43:36',1,'tarjeta'),(16,'2019-09-10 21:43:37',2,'tarjeta'),(17,'2019-09-10 21:43:37',3,'tarjeta'),(18,'2019-09-10 21:45:38',34,'usuario'),(19,'2021-03-01 18:15:38',1,'tarjeta'),(20,'2021-03-01 18:15:42',2,'tarjeta'),(21,'2021-03-01 18:15:45',3,'tarjeta'),(22,'2021-03-01 18:15:51',1,'tarjeta'),(23,'2021-03-01 18:15:52',2,'tarjeta'),(24,'2021-03-01 18:15:52',1,'tarjeta'),(25,'2021-03-01 18:15:52',3,'tarjeta'),(26,'2021-03-01 18:31:47',37,'usuario');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_tipo`
--

DROP TABLE IF EXISTS `extra_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_tipo` (
  `id_extra_habitacion` int NOT NULL,
  `id_tipo_habitacion` int NOT NULL,
  PRIMARY KEY (`id_extra_habitacion`,`id_tipo_habitacion`),
  KEY `fk_tipo_habitacion_idx` (`id_tipo_habitacion`),
  CONSTRAINT `fk_extra_tipo_extra_habitacion` FOREIGN KEY (`id_extra_habitacion`) REFERENCES `extras_habitacion` (`id_extra_habitacion`) ON UPDATE RESTRICT,
  CONSTRAINT `fk_extra_tipo_tipo_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_habitacion` (
  `id_extra_habitacion` int NOT NULL,
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
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int NOT NULL AUTO_INCREMENT,
  `id_tipo_habitacion` int DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `id_reserva` int DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`),
  UNIQUE KEY `id_habitacion_UNIQUE` (`id_habitacion`),
  KEY `fk_tipo_habitacion_habitacion_idx` (`id_tipo_habitacion`),
  KEY `fk_habitacion_reserva_idx` (`id_reserva`),
  CONSTRAINT `fk_habitacion_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_habitacion_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,2,3,NULL),(4,2,4,NULL),(5,3,5,NULL),(6,3,6,NULL),(7,4,7,NULL),(8,4,8,NULL),(9,5,9,NULL),(10,5,10,NULL),(11,5,11,NULL);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_tipo_habitacion`
--

DROP TABLE IF EXISTS `reserva_tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_tipo_habitacion` (
  `id_reserva` int NOT NULL,
  `id_tipo_habitacion` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`,`id_tipo_habitacion`),
  KEY `fk_reserva_tipo_habitacion_tipo_habitacion_idx` (`id_tipo_habitacion`),
  CONSTRAINT `fk_reserva_tipo_habitacion_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  CONSTRAINT `fk_reserva_tipo_habitacion_tipo_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_tipo_habitacion`
--

LOCK TABLES `reserva_tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `reserva_tipo_habitacion` DISABLE KEYS */;
INSERT INTO `reserva_tipo_habitacion` VALUES (23,5,1),(24,5,1),(26,1,2),(26,2,2),(26,3,2),(26,4,2),(26,5,1),(27,1,2),(28,4,1),(29,5,1),(30,3,1),(31,4,2),(32,1,1),(32,4,1),(33,1,1),(34,1,1),(35,2,1);
/*!40000 ALTER TABLE `reserva_tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('activa','cancelada','espera','terminada') NOT NULL DEFAULT 'espera',
  `fecha_creacion` date DEFAULT NULL,
  `retenida` tinyint DEFAULT '0',
  `fecha_ingreso_real` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `id_reserva_UNIQUE` (`id_reserva`),
  KEY `fk_clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_reserva_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (23,1,'2019-08-02','2019-08-08','terminada','2019-08-21',NULL,NULL),(24,1,'2019-09-02','2019-09-08','cancelada','2019-08-21',NULL,NULL),(26,1,'2019-09-02','2019-09-08','cancelada','2019-08-21',NULL,NULL),(27,1,'2019-09-09','2019-09-15','activa','2019-08-21',NULL,NULL),(28,1,'2019-08-11','2019-08-26','cancelada','2019-08-27',NULL,NULL),(29,1,'2019-09-28','2019-09-29','cancelada','2019-08-27',NULL,NULL),(30,34,'2019-09-11','2019-09-13','cancelada','2019-09-10',NULL,NULL),(31,34,'2019-09-11','2019-09-13','cancelada','2019-09-10',NULL,NULL),(32,34,'2021-03-10','2021-04-22','terminada','2021-03-01',NULL,NULL),(33,34,'2021-03-19','2021-04-14','cancelada','2021-03-01',NULL,NULL),(34,34,'2021-03-05','2021-03-14','activa','2021-03-07',NULL,NULL),(35,34,'2021-03-15','2021-03-21','espera','2021-03-07',1,NULL);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL,
  `id_reserva` int NOT NULL,
  `id_habitación` int NOT NULL,
  `id_tipo_servicio` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `id_servicio_UNIQUE` (`id_servicio`),
  KEY `servicio_reseva_idx` (`id_reserva`),
  KEY `servicio_habitacion_idx` (`id_habitación`),
  KEY `servicio_tipo_servicio_idx` (`id_tipo_servicio`),
  CONSTRAINT `servicio_habitacion` FOREIGN KEY (`id_habitación`) REFERENCES `habitaciones` (`id_habitacion`),
  CONSTRAINT `servicio_reseva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  CONSTRAINT `servicio_tipo_servicio` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `id_tarjeta` int NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_habitacion` (
  `id_tipo_habitacion` int NOT NULL,
  `capacidad` int NOT NULL,
  `descripcion` tinytext,
  `precio` int DEFAULT NULL,
  `tipo_habitacion` enum('deluxe','deluxeplus','juniorsuite','executivesuite','suitepresidencial') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_habitacion`),
  UNIQUE KEY `id_tipo_habitacion_UNIQUE` (`id_tipo_habitacion`),
  UNIQUE KEY `tipo_habitacion1_UNIQUE` (`tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion`
--

LOCK TABLES `tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion` DISABLE KEYS */;
INSERT INTO `tipo_habitacion` VALUES (1,2,'Nuestras habitaciones Deluxe son ideales para una estadía de negocios.',2000,'deluxe'),(2,2,'Combinación ideal para un viaje de negocios o para alojarse en familia.',4000,'deluxeplus'),(3,4,'Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.',6000,'juniorsuite'),(4,6,'Servicios de última generación, espacio adicional y jacuzzi para dos personas.',8000,'executivesuite'),(5,8,'Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.',10000,'suitepresidencial');
/*!40000 ALTER TABLE `tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int NOT NULL,
  `nombre_servicio` varchar(45) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`),
  UNIQUE KEY `id_tipo_servicio_UNIQUE` (`id_tipo_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `verificado` bit(1) DEFAULT b'0',
  `friendly_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `friendly_id_UNIQUE` (`friendly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin@admin.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'1'),(4,'imbatman@batman.com','d1ebaaac13d8a73b0cbf1b8e99c329dd','10','Bruce Wayne','Bruce Wayne','10',NULL,NULL,NULL,NULL,NULL,NULL,'2'),(7,'vderivi@gmail.com','85a3a55fa5d68b30a9fd4c4a0289da77','39950434','Victor','De Rivi','3416725222',NULL,NULL,NULL,NULL,NULL,_binary '','3'),(11,'d10s@gmail.com','25d55ad283aa400af464c76d713c07ad','10 ','juan ','roman','10',NULL,'AR','Buenos Aires ',1,'bombonera',NULL,'4'),(12,'jhonny@gmail.com','25d55ad283aa400af464c76d713c07ad','asd ','prueba hash 1','hashin','123',NULL,'AR','vgg',0,'en la esquina',_binary '\0','5'),(33,'ariasramirox@gmail.com','b643f311b21f660a5f8e6c5987207e3b','123123','3123123','123123','123123',NULL,'AR','123123',123123,'12312312',_binary '','6'),(34,'seba.a.rossi@gmail.com','e0bbd224aa782e5396a7941694b2018f','39951271','SebastiÃ¡n','Rossi','3416572511',NULL,'AR','Rosario',2000,'San MartÃ­n 1466',_binary '','GM2QQ9'),(37,'seba.a.rossi+test@gmail.com','16d7a4fca7442dda3ad93c9a726597e4','39999999','test','test','34111111111',NULL,'AR','test',2000,'test',_binary '','evd2mb');
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
	IF (NEW.verificado != OLD.verificado AND NEW.verificado = 1)
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

--
-- Dumping events for database 'arroz_tower'
--

--
-- Dumping routines for database 'arroz_tower'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 21:37:12
