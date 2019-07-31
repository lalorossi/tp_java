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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'2019-06-19 18:03:35',34,'usuario'),(2,'2019-06-19 18:05:29',34,'usuario'),(3,'2019-06-19 18:05:37',34,'usuario'),(4,'2019-06-19 21:35:41',37,'usuario'),(5,'2019-06-20 13:22:31',39,'usuario'),(6,'2019-06-20 13:24:44',40,'usuario'),(7,'2019-06-20 14:02:37',41,'usuario'),(8,'2019-06-20 14:39:08',41,'usuario'),(9,'2019-06-20 14:40:25',41,'usuario');
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
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_habitacion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('activa','cacelada','espera','terminada') NOT NULL DEFAULT 'espera',
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `id_reserva_UNIQUE` (`id_reserva`),
  KEY `fk_tipo_habitacion_idx` (`id_tipo_habitacion`),
  KEY `fk_clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_reserva_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_tipo_habitacion` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
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
  `friendly_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `friendly_id_UNIQUE` (`friendly_id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin@admin.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,_binary '\0','1'),(4,'imbatman@batman.com','d1ebaaac13d8a73b0cbf1b8e99c329dd','10','Bruce Wayne','Bruce Wayne','10',NULL,NULL,NULL,NULL,NULL,_binary '\0','2'),(7,'vderivi@gmail.com','85a3a55fa5d68b30a9fd4c4a0289da77','39950434','Victor','De Rivi','3416725222',NULL,NULL,NULL,NULL,NULL,_binary '','3'),(11,'d10s@gmail.com','25d55ad283aa400af464c76d713c07ad','10 ','juan ','roman','10',NULL,'AR','Buenos Aires ',1,'bombonera',_binary '\0','4'),(12,'jhonny@gmail.com','25d55ad283aa400af464c76d713c07ad','asd ','prueba hash 1','hashin','123',NULL,'AR','vgg',0,'en la esquina',_binary '\0','5'),(33,'ariasramirox@gmail.com','b643f311b21f660a5f8e6c5987207e3b','123123','3123123','123123','123123',NULL,'AR','123123',123123,'12312312',_binary '','6'),(38,'aasd@asd.conadf','a3dcb4d229de6fde0db5686dee47145d','123','asd','asd','213',NULL,'AR','asd',123,'assd',_binary '\0','PQY'),(41,'seba.a.rossi@gmail.com','e0bbd224aa782e5396a7941694b2018f','39951271','SebastiÃ¡n','Rossi','3416572511',NULL,'AR','Rosario',2000,'San MartÃ­n 1466',_binary '','GM2QQ9');
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

-- Dump completed on 2019-06-20 14:50:52
