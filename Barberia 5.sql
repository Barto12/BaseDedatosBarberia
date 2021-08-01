-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: barberia
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Current Database: `barberia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `barberia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `barberia`;

--
-- Current Database: `mydb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mydb`;

--
-- Table structure for table `alcaldia-municipio`
--

DROP TABLE IF EXISTS `alcaldia-municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcaldia-municipio` (
  `id_alcaldia-municipio` int NOT NULL AUTO_INCREMENT,
  `nombre_alcaldia-municipiocol` varchar(100) NOT NULL,
  `estado_id_estado` int NOT NULL,
  PRIMARY KEY (`id_alcaldia-municipio`,`estado_id_estado`),
  KEY `fk_alcaldia-municipio_estado1_idx` (`estado_id_estado`),
  CONSTRAINT `fk_alcaldia-municipio_estado1` FOREIGN KEY (`estado_id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcaldia-municipio`
--

LOCK TABLES `alcaldia-municipio` WRITE;
/*!40000 ALTER TABLE `alcaldia-municipio` DISABLE KEYS */;
INSERT INTO `alcaldia-municipio` VALUES (1,'Miguel Hidalgo',1),(2,'Coacalco',2),(3,'Cuajimalpa',1),(4,'Alvaro Obregon',1),(5,'Naucalpan',2);
/*!40000 ALTER TABLE `alcaldia-municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `fecha` date NOT NULL,
  `hora inicio` time NOT NULL,
  `hora fin` time NOT NULL,
  `servicio_id servicio` int NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `fk_calendario_servicio1_idx` (`servicio_id servicio`),
  CONSTRAINT `fk_calendario_servicio1` FOREIGN KEY (`servicio_id servicio`) REFERENCES `servicio` (`id servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES ('2020-05-01','10:00:00','20:00:00',1),('2020-05-02','10:00:00','20:00:00',2),('2020-05-03','10:00:00','20:00:00',3),('2020-05-04','10:00:00','20:00:00',4),('2020-05-05','10:00:00','20:00:00',5);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `id_catalogo` int NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `uso_interno` tinyint NOT NULL,
  `uso_externo` tinyint NOT NULL,
  `catalogocol` tinyint NOT NULL,
  `producto_id_producto` int NOT NULL,
  PRIMARY KEY (`id_catalogo`,`producto_id_producto`),
  KEY `fk_catalogo_producto1_idx` (`producto_id_producto`),
  CONSTRAINT `fk_catalogo_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
INSERT INTO `catalogo` VALUES (1,'cabello',0,1,1,1),(2,'cuidado capilar',1,1,1,2),(3,'depilacion',0,1,1,3),(4,'crecimiento barba',1,1,1,4),(5,'bigote',0,0,1,5),(6,'facial',1,1,1,5);
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id cita` int NOT NULL AUTO_INCREMENT,
  `no de personal` int NOT NULL,
  `no cliente` int NOT NULL,
  `servicio_id servicio` int NOT NULL,
  `calendario_fecha` date NOT NULL,
  PRIMARY KEY (`id cita`,`servicio_id servicio`),
  KEY `fk_cita_servicio1_idx` (`servicio_id servicio`),
  KEY `fk_cita_calendario1_idx` (`calendario_fecha`),
  CONSTRAINT `fk_cita_calendario1` FOREIGN KEY (`calendario_fecha`) REFERENCES `calendario` (`fecha`),
  CONSTRAINT `fk_cita_servicio1` FOREIGN KEY (`servicio_id servicio`) REFERENCES `servicio` (`id servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,1,1,1,'2020-05-01'),(2,2,2,2,'2020-05-02'),(3,3,3,3,'2020-05-03'),(4,4,4,4,'2020-05-04'),(5,5,5,5,'2020-05-05');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `categoria_cliente` varchar(45) NOT NULL,
  `contacto_id_contacto` int NOT NULL,
  `membresia_id_membresia` int NOT NULL,
  `sucursal_id_sucursal` int NOT NULL,
  `sucursal_direccion_id_direccion` int NOT NULL,
  `sucursal_contacto_id_contacto` int NOT NULL,
  `recibo_id recibo` int NOT NULL,
  `servicio_id servicio` int NOT NULL,
  PRIMARY KEY (`id_cliente`,`contacto_id_contacto`,`membresia_id_membresia`,`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`,`sucursal_contacto_id_contacto`,`recibo_id recibo`),
  KEY `fk_cliente_contacto1_idx` (`contacto_id_contacto`),
  KEY `fk_cliente_membresia1_idx` (`membresia_id_membresia`),
  KEY `fk_cliente_sucursal1_idx` (`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`,`sucursal_contacto_id_contacto`),
  KEY `fk_cliente_servicio1_idx` (`servicio_id servicio`),
  CONSTRAINT `fk_cliente_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`),
  CONSTRAINT `fk_cliente_membresia1` FOREIGN KEY (`membresia_id_membresia`) REFERENCES `membresia` (`id_membresia`),
  CONSTRAINT `fk_cliente_servicio1` FOREIGN KEY (`servicio_id servicio`) REFERENCES `servicio` (`id servicio`),
  CONSTRAINT `fk_cliente_sucursal1` FOREIGN KEY (`sucursal_id_sucursal`, `sucursal_direccion_id_direccion`, `sucursal_contacto_id_contacto`) REFERENCES `sucursal` (`id_sucursal`, `direccion_id_direccion`, `contacto_id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'mario','martinez','martinez','HDFGHJ87','frecuente',1,1,1,1,1,1,1),(2,'maria','martinez','martinez','HDFR567','frecuente',2,2,2,2,2,2,2),(3,'fernando','martinez','martinez','DFGTR545','frecuente',3,3,3,3,3,3,3),(4,'fernanda','martinez','martinez','DFGH768','frecuente',4,4,4,4,4,4,4),(5,'susana','martinez','martinez','JUIO987','frecuente',5,5,5,5,5,5,5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonia`
--

DROP TABLE IF EXISTS `colonia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colonia` (
  `id colonia` int NOT NULL AUTO_INCREMENT,
  `nombre colonia` varchar(100) NOT NULL,
  PRIMARY KEY (`id colonia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
INSERT INTO `colonia` VALUES (1,'Popotla'),(2,'San Franscisco'),(3,'Lomas de Santa Fe'),(4,'San Jacinto'),(5,'Adolfo Lopez Mateos');
/*!40000 ALTER TABLE `colonia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id_contacto` int NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'5556678996','01@gmail.com'),(2,'4567874','02@yahoo.com'),(3,'4567890','03@yahoo.com.mx'),(4,'7897654','04@correo.uia.mx'),(5,'7876434','05@hotmail.com');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos laboral`
--

DROP TABLE IF EXISTS `datos laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos laboral` (
  `id personal` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `salario` double NOT NULL,
  `personal_id_personal` int NOT NULL,
  `personal_sucursal_id_sucursal` int NOT NULL,
  `personal_sucursal_direccion_id_direccion` int NOT NULL,
  `personal_contacto_id_contacto` int NOT NULL,
  PRIMARY KEY (`id personal`),
  KEY `fk_datos laboral_personal1_idx` (`personal_id_personal`,`personal_sucursal_id_sucursal`,`personal_sucursal_direccion_id_direccion`,`personal_contacto_id_contacto`),
  CONSTRAINT `fk_datos laboral_personal1` FOREIGN KEY (`personal_id_personal`, `personal_sucursal_id_sucursal`, `personal_sucursal_direccion_id_direccion`, `personal_contacto_id_contacto`) REFERENCES `personal` (`id_personal`, `sucursal_id_sucursal`, `sucursal_direccion_id_direccion`, `contacto_id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos laboral`
--

LOCK TABLES `datos laboral` WRITE;
/*!40000 ALTER TABLE `datos laboral` DISABLE KEYS */;
INSERT INTO `datos laboral` VALUES (1,'E',100,1,1,1,1),(2,'T',200,2,2,2,2),(3,'U',300,3,3,3,3),(4,'E',400,4,4,4,4),(5,'U',500,5,5,5,5);
/*!40000 ALTER TABLE `datos laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentos` (
  `id_descuento` int NOT NULL AUTO_INCREMENT,
  `nombre descuento` varchar(45) NOT NULL,
  `tipo descuento` varchar(45) NOT NULL,
  `precio promoción` double NOT NULL,
  `corte` tinyint NOT NULL,
  `barba` tinyint NOT NULL,
  `depilado` tinyint NOT NULL,
  `cuidado capilar` tinyint NOT NULL,
  `cliente_id_cliente` int NOT NULL,
  `cliente_contacto_id_contacto` int NOT NULL,
  `cliente_membresia_id_membresia` int NOT NULL,
  `cliente_sucursal_id_sucursal` int NOT NULL,
  `cliente_sucursal_direccion_id_direccion` int NOT NULL,
  `cliente_sucursal_contacto_id_contacto` int NOT NULL,
  PRIMARY KEY (`id_descuento`,`cliente_id_cliente`,`cliente_contacto_id_contacto`,`cliente_membresia_id_membresia`,`cliente_sucursal_id_sucursal`,`cliente_sucursal_direccion_id_direccion`,`cliente_sucursal_contacto_id_contacto`),
  KEY `fk_Descuentos_cliente1_idx` (`cliente_id_cliente`,`cliente_contacto_id_contacto`,`cliente_membresia_id_membresia`,`cliente_sucursal_id_sucursal`,`cliente_sucursal_direccion_id_direccion`,`cliente_sucursal_contacto_id_contacto`),
  CONSTRAINT `fk_Descuentos_cliente1` FOREIGN KEY (`cliente_id_cliente`, `cliente_contacto_id_contacto`, `cliente_membresia_id_membresia`, `cliente_sucursal_id_sucursal`, `cliente_sucursal_direccion_id_direccion`, `cliente_sucursal_contacto_id_contacto`) REFERENCES `cliente` (`id_cliente`, `contacto_id_contacto`, `membresia_id_membresia`, `sucursal_id_sucursal`, `sucursal_direccion_id_direccion`, `sucursal_contacto_id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

LOCK TABLES `descuentos` WRITE;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
INSERT INTO `descuentos` VALUES (1,'cumpleañero','L',1,1,0,1,0,1,1,1,1,1,1),(2,'cumpleañero','K',2,1,1,1,1,2,2,2,2,2,2),(3,'cumpleañero','H',3,1,1,1,1,3,3,3,3,3,3),(4,'cumpleañero','F',4,1,1,1,1,4,4,4,4,4,4),(5,'cumpleañero','D',5,1,1,1,1,5,5,5,5,5,5);
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `nombre_calle` varchar(100) NOT NULL,
  `numero_exterior` varchar(20) NOT NULL,
  `numero_interior` varchar(20) NOT NULL,
  `alcaldia-municipio_id_alcaldia-municipio` int NOT NULL,
  PRIMARY KEY (`id_direccion`,`alcaldia-municipio_id_alcaldia-municipio`),
  KEY `fk_direccion_alcaldia-municipio1_idx` (`alcaldia-municipio_id_alcaldia-municipio`),
  CONSTRAINT `fk_direccion_alcaldia-municipio1` FOREIGN KEY (`alcaldia-municipio_id_alcaldia-municipio`) REFERENCES `alcaldia-municipio` (`id_alcaldia-municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Mar Caspio','678','1',1),(2,'Lopez Portillo','23','9',2),(3,'Vasco de Quiroga ','3000','5',3),(4,'Villas de las palmas','2000','45',4),(5,'Buen tono','34','7',5),(6,'Montes Urales','1400','6',1),(7,'Fernando Zavala','123','345',2),(8,'3 cerrrada del milagro','333','D',3),(9,'San Andres Urdapilleta','789','C',4),(10,'Circuito Zapata','1000','9',5);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidor` (
  `id_distribuidor` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(100) NOT NULL,
  `RFC_distribuidor` varchar(12) NOT NULL,
  `sucursal_id_sucursal` int NOT NULL,
  `sucursal_direccion_id_direccion` int NOT NULL,
  PRIMARY KEY (`id_distribuidor`,`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`),
  KEY `fk_distribuidor_sucursal1_idx` (`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`),
  CONSTRAINT `fk_distribuidor_sucursal1` FOREIGN KEY (`sucursal_id_sucursal`, `sucursal_direccion_id_direccion`) REFERENCES `sucursal` (`id_sucursal`, `direccion_id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor`
--

LOCK TABLES `distribuidor` WRITE;
/*!40000 ALTER TABLE `distribuidor` DISABLE KEYS */;
INSERT INTO `distribuidor` VALUES (3,'caprice de mexico','MELM83052',1,1),(4,'procter and gamble','FLGV80023',2,2),(5,'moco de gorila sa de cv','LOMP8206',3,3),(6,'salem ','ROSM9007',4,4),(7,'xiomara','ALM101413',5,5);
/*!40000 ALTER TABLE `distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor_producto`
--

DROP TABLE IF EXISTS `distribuidor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidor_producto` (
  `id_distribuidor_producto` int NOT NULL,
  `producto_id_producto` int NOT NULL,
  PRIMARY KEY (`id_distribuidor_producto`,`producto_id_producto`),
  KEY `fk_distribuidor_has_producto_producto1_idx` (`producto_id_producto`),
  KEY `fk_distribuidor_has_producto_distribuidor1_idx` (`id_distribuidor_producto`),
  CONSTRAINT `fk_distribuidor_has_producto_distribuidor1` FOREIGN KEY (`id_distribuidor_producto`) REFERENCES `distribuidor` (`id_distribuidor`),
  CONSTRAINT `fk_distribuidor_has_producto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor_producto`
--

LOCK TABLES `distribuidor_producto` WRITE;
/*!40000 ALTER TABLE `distribuidor_producto` DISABLE KEYS */;
INSERT INTO `distribuidor_producto` VALUES (3,1),(4,2),(5,3),(6,4),(7,5);
/*!40000 ALTER TABLE `distribuidor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Ciudad de Mëxico'),(2,'Estado de  Mexico');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido paterno` varchar(100) NOT NULL,
  `apellido materno` varchar(100) NOT NULL,
  `denominacion social` varchar(100) NOT NULL,
  `tipo tributario` varchar(100) NOT NULL,
  `cuota repercutiva` double NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `emisor` varchar(100) NOT NULL,
  `no de serie` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'Miguel','Martinez','Rodriguez','l','persona fisica',16,3000,'sucursal norte',1,'L'),(2,'Lucia','Esparza','Salazar','a','persona fisica',16,40,'sucursal sur',2,'K'),(3,'martin','salazar','hernandez','w','persona fisica',16,50,'sucursal norte',3,'J'),(4,'brenda','sepulveda','araiza','d','persona fisica',16,30,'sucursal sur',4,'M'),(5,'carlos ','cepeda','gomez','s','persona fisica',16,50,'sucursal sur',5,'U'),(6,'susana','distancia','gatell','d','persona moral',16,500,'sucursal norte',6,'Y');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `existencia` tinyint NOT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `productos_existencia` int DEFAULT NULL,
  `inventariocol` int DEFAULT NULL,
  `producto_id_producto` int NOT NULL,
  PRIMARY KEY (`id_inventario`,`producto_id_producto`),
  KEY `fk_inventario_producto1_idx` (`producto_id_producto`),
  CONSTRAINT `fk_inventario_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,0,'2020-06-03',0,1,1),(2,1,'2021-07-08',1,1,2),(3,1,'2023-09-07',1,1,3),(4,0,'2021-05-30',0,1,4),(5,1,'2022-08-12',1,1,5),(6,1,'2021-12-01',1,1,5);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `costo_anual` varchar(100) NOT NULL,
  PRIMARY KEY (`id_membresia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,'100'),(2,'100'),(3,'100'),(4,'100'),(5,'100');
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `sucursal_id_sucursal` int NOT NULL,
  `sucursal_direccion_id_direccion` int NOT NULL,
  `contacto_id_contacto` int NOT NULL,
  `hora entrada` time NOT NULL,
  `hora salida` time NOT NULL,
  PRIMARY KEY (`id_personal`,`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`,`contacto_id_contacto`),
  KEY `fk_personal_sucursal1_idx` (`sucursal_id_sucursal`,`sucursal_direccion_id_direccion`),
  KEY `fk_personal_contacto1_idx` (`contacto_id_contacto`),
  CONSTRAINT `fk_personal_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`),
  CONSTRAINT `fk_personal_sucursal1` FOREIGN KEY (`sucursal_id_sucursal`, `sucursal_direccion_id_direccion`) REFERENCES `sucursal` (`id_sucursal`, `direccion_id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'mario ','zavala','rosas','HGFG7678',1,1,1,'10:00:00','22:00:00'),(2,'maria','zavala','rosas','FGHYT678',2,2,2,'10:00:00','22:00:00'),(3,'fernanda','zavala','rosas','JUYT7865',3,3,3,'10:00:00','22:00:00'),(4,'brenda','zavala','rosas','DFRT6785',4,4,4,'10:00:00','22:00:00'),(5,'cruz','zavala','rosas','JHGY7896',5,5,5,'10:00:00','22:00:00');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `folio_producto` int NOT NULL,
  `marca_producto` varchar(100) NOT NULL,
  `costo_producto` double NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'shampoo ',1,'Loreal',100,250),(2,'acondicionador',2,'Caprice',150,300),(3,'cera para cabello',3,'Moco de Gorila',300,600),(4,'gel',4,'Xiomara',450,900),(5,'spray',5,'Salem',500,1000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id promociones` int NOT NULL AUTO_INCREMENT,
  `lunes_descuento` tinyint NOT NULL,
  `paquetes_sencillo` tinyint NOT NULL,
  `descuento_producto` tinyint NOT NULL,
  `cliente_id_cliente` int NOT NULL,
  `cliente_contacto_id_contacto` int NOT NULL,
  `cliente_membresia_id_membresia` int NOT NULL,
  `cliente_sucursal_id_sucursal` int NOT NULL,
  `cliente_sucursal_direccion_id_direccion` int NOT NULL,
  `cliente_sucursal_contacto_id_contacto` int NOT NULL,
  PRIMARY KEY (`id promociones`,`cliente_id_cliente`,`cliente_contacto_id_contacto`,`cliente_membresia_id_membresia`,`cliente_sucursal_id_sucursal`,`cliente_sucursal_direccion_id_direccion`,`cliente_sucursal_contacto_id_contacto`),
  KEY `fk_promociones_cliente1_idx` (`cliente_id_cliente`,`cliente_contacto_id_contacto`,`cliente_membresia_id_membresia`,`cliente_sucursal_id_sucursal`,`cliente_sucursal_direccion_id_direccion`,`cliente_sucursal_contacto_id_contacto`),
  CONSTRAINT `fk_promociones_cliente1` FOREIGN KEY (`cliente_id_cliente`, `cliente_contacto_id_contacto`, `cliente_membresia_id_membresia`, `cliente_sucursal_id_sucursal`, `cliente_sucursal_direccion_id_direccion`, `cliente_sucursal_contacto_id_contacto`) REFERENCES `cliente` (`id_cliente`, `contacto_id_contacto`, `membresia_id_membresia`, `sucursal_id_sucursal`, `sucursal_direccion_id_direccion`, `sucursal_contacto_id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,1,0,1,1,1,1,1,1,1),(2,1,1,1,2,2,2,2,2,2),(3,1,1,1,3,3,3,3,3,3),(4,1,1,1,4,4,4,4,4,4),(5,1,1,1,5,5,5,5,5,5);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_membresia`
--

DROP TABLE IF EXISTS `promociones_membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_membresia` (
  `id_promociones_membresia` int NOT NULL,
  `cumpleañera` tinyint DEFAULT NULL,
  `2x1` tinyint DEFAULT NULL,
  `paquete especial` varchar(45) DEFAULT NULL,
  `membresia_id_membresia` int NOT NULL,
  PRIMARY KEY (`id_promociones_membresia`,`membresia_id_membresia`),
  KEY `fk_promociones_membresia_membresia1_idx` (`membresia_id_membresia`),
  CONSTRAINT `fk_promociones_membresia_membresia1` FOREIGN KEY (`membresia_id_membresia`) REFERENCES `membresia` (`id_membresia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_membresia`
--

LOCK TABLES `promociones_membresia` WRITE;
/*!40000 ALTER TABLE `promociones_membresia` DISABLE KEYS */;
INSERT INTO `promociones_membresia` VALUES (1,1,1,'especial',1),(2,1,1,'especial',2),(3,1,1,'especial',3),(4,0,1,'especial',4),(5,0,0,'especial',5);
/*!40000 ALTER TABLE `promociones_membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibo`
--

DROP TABLE IF EXISTS `recibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibo` (
  `id recibo` int NOT NULL AUTO_INCREMENT,
  `fecha hora` datetime NOT NULL,
  `cantidad producto` int NOT NULL,
  `precio producto` double NOT NULL,
  `cantidad servicio` int NOT NULL,
  `precio servicio` double NOT NULL,
  `IVA` decimal(10,0) NOT NULL,
  `ISR` decimal(10,0) NOT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL,
  `servicio_id servicio` int NOT NULL,
  `factura_id_factura` int NOT NULL,
  PRIMARY KEY (`id recibo`),
  KEY `fk_recibo_servicio1_idx` (`servicio_id servicio`),
  KEY `fk_recibo_factura1_idx` (`factura_id_factura`),
  CONSTRAINT `fk_recibo_factura1` FOREIGN KEY (`factura_id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `fk_recibo_servicio1` FOREIGN KEY (`servicio_id servicio`) REFERENCES `servicio` (`id servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibo`
--

LOCK TABLES `recibo` WRITE;
/*!40000 ALTER TABLE `recibo` DISABLE KEYS */;
INSERT INTO `recibo` VALUES (1,'2020-02-01 10:00:00',1,20,1,20,16,10,46,46,1,1),(2,'2020-02-02 10:00:00',1,20,1,20,16,10,46,46,2,2),(3,'2020-02-03 10:00:00',1,20,1,20,16,10,46,46,3,3),(4,'2020-02-04 10:00:00',1,20,1,20,16,10,46,46,4,4),(5,'2020-02-05 10:00:00',1,20,1,20,16,10,46,46,5,5);
/*!40000 ALTER TABLE `recibo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recompensa_membresia`
--

DROP TABLE IF EXISTS `recompensa_membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recompensa_membresia` (
  `id_recompensa_membresia` int NOT NULL,
  `atencion_sin_cita` tinyint NOT NULL,
  `puntos` int NOT NULL,
  `referidos` int DEFAULT NULL,
  `membresia_id_membresia` int NOT NULL,
  PRIMARY KEY (`id_recompensa_membresia`,`membresia_id_membresia`),
  KEY `fk_recompensa_membresia_membresia1_idx` (`membresia_id_membresia`),
  CONSTRAINT `fk_recompensa_membresia_membresia1` FOREIGN KEY (`membresia_id_membresia`) REFERENCES `membresia` (`id_membresia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recompensa_membresia`
--

LOCK TABLES `recompensa_membresia` WRITE;
/*!40000 ALTER TABLE `recompensa_membresia` DISABLE KEYS */;
INSERT INTO `recompensa_membresia` VALUES (1,0,10,1,1),(2,1,10,1,2),(3,1,10,1,3),(4,1,10,0,4),(5,1,10,0,5);
/*!40000 ALTER TABLE `recompensa_membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id servicio` int NOT NULL,
  `nombre servicio` varchar(100) NOT NULL,
  `costo` decimal(10,0) NOT NULL,
  `calificacion` double DEFAULT NULL,
  `venta linea` tinyint DEFAULT NULL,
  `venta mostrador` tinyint DEFAULT NULL,
  `tipo servicio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'corte',100,10,0,1,'corte'),(2,'depilacion',100,2,0,1,'depilacion'),(3,'corte barba',100,4,0,1,'corte barba'),(4,'lavado cabello',100,5,0,1,'lavado cabello'),(5,'facial',100,6,0,1,'facial');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `direccion_id_direccion` int NOT NULL,
  `contacto_id_contacto` int NOT NULL,
  PRIMARY KEY (`id_sucursal`,`direccion_id_direccion`,`contacto_id_contacto`),
  KEY `fk_sucursal_direccion_idx` (`direccion_id_direccion`),
  KEY `fk_sucursal_contacto1_idx` (`contacto_id_contacto`),
  CONSTRAINT `fk_sucursal_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`),
  CONSTRAINT `fk_sucursal_direccion` FOREIGN KEY (`direccion_id_direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 17:54:55
