CREATE DATABASE  IF NOT EXISTS `arroz_tower` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arroz_tower`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'2019-06-19 18:03:35',34,'usuario'),(2,'2019-06-19 18:05:29',34,'usuario'),(3,'2019-06-19 18:05:37',34,'usuario');
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
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_habitacion` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`),
  UNIQUE KEY `id_habitacion_UNIQUE` (`id_habitacion`),
  KEY `fk_tipo_habitacion_habitacion_idx` (`id_tipo_habitacion`),
  CONSTRAINT `fk_tipo_habitacion_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,1,NULL),(2,1,NULL),(3,2,NULL),(4,2,NULL),(5,3,NULL),(6,3,NULL),(7,4,NULL),(8,4,NULL),(9,5,NULL),(10,5,NULL),(11,5,NULL);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_tipo_habitacion`
--

DROP TABLE IF EXISTS `reserva_tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reserva_tipo_habitacion` (
  `id_reserva` int(11) NOT NULL,
  `id_tipo_habitacion` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
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
/*!40000 ALTER TABLE `reserva_tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('activa','cancelada','espera','terminada') NOT NULL DEFAULT 'espera',
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `id_reserva_UNIQUE` (`id_reserva`),
  KEY `fk_clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_reserva_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (3,1,'2000-07-01','2000-07-05','activa',NULL),(10,1,'2000-07-01','2000-07-05','cancelada',NULL),(11,1,'2000-07-01','2000-07-05','activa',NULL),(12,1,'2000-07-01','2000-07-05','cancelada',NULL),(13,1,'2000-07-01','2000-07-05','activa',NULL),(14,1,'2000-07-01','2000-07-05','cancelada',NULL),(15,1,'2007-07-03','2007-12-12','activa',NULL);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
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
  `capacidad` int(2) NOT NULL,
  `descripcion` tinytext,
  `precio` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin@admin.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'imbatman@batman.com','d1ebaaac13d8a73b0cbf1b8e99c329dd','10','Bruce Wayne','Bruce Wayne','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'vderivi@gmail.com','85a3a55fa5d68b30a9fd4c4a0289da77','39950434','Victor','De Rivi','3416725222',NULL,NULL,NULL,NULL,NULL,_binary '',NULL),(11,'d10s@gmail.com','25d55ad283aa400af464c76d713c07ad','10 ','juan ','roman','10',NULL,'AR','Buenos Aires ',1,'bombonera',NULL,NULL),(12,'jhonny@gmail.com','25d55ad283aa400af464c76d713c07ad','asd ','prueba hash 1','hashin','123',NULL,'AR','vgg',0,'en la esquina',_binary '\0','31ffad21b34e66ee7937d2cf593defc6'),(33,'ariasramirox@gmail.com','b643f311b21f660a5f8e6c5987207e3b','123123','3123123','123123','123123',NULL,'AR','123123',123123,'12312312',_binary '','aeb40acae433f86e045d7331b773e393'),(34,'seba.a.rossi@gmail.com','e0bbd224aa782e5396a7941694b2018f','39951271|','SebastiÃ¡n','Rossi','3416572511',NULL,'AR','Rosario',2000,'San MartÃ­n 1466',_binary '','d5400fdf1e2775116754943d2ccbe355');
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

-- Dump completed on 2019-08-01 14:01:38
