CREATE DATABASE  IF NOT EXISTS `hamnurguesas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hamnurguesas`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: hamnurguesas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `arma_entrega`
--

DROP TABLE IF EXISTS `arma_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arma_entrega` (
  `id_arma_entrega` int(11) NOT NULL,
  `dni_empleado` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_arma_entrega`),
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `arma_entrega_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arma_entrega`
--

LOCK TABLES `arma_entrega` WRITE;
/*!40000 ALTER TABLE `arma_entrega` DISABLE KEYS */;
INSERT INTO `arma_entrega` VALUES (101,11111111,'2026-10-23 12:45:00'),(102,11111111,'2026-10-23 14:00:00'),(103,22222222,'2026-10-23 15:10:00');
/*!40000 ALTER TABLE `arma_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Hamburguesas','Hamburguesas de carne vacuna y pollo con ingredientes frescos'),(2,'Bebidas','Gaseosas, aguas y jugos naturales'),(3,'Acompañamientos','Papas fritas, aros de cebolla y nuggests');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `piso_dpto` varchar(50) DEFAULT NULL,
  `barrio_zona` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Roberto','Fernández','1144556677','Piso 3 Dpto B','Centro'),(2,'Ana','Martínez','1122334455','PB A','Palermo'),(3,'Lucas','González','1199887766','Casa','Belgrano');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocina`
--

DROP TABLE IF EXISTS `cocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cocina` (
  `dni_empleado` int(11) NOT NULL,
  `fecha_vto_cm` date DEFAULT NULL,
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `cocina_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocina`
--

LOCK TABLES `cocina` WRITE;
/*!40000 ALTER TABLE `cocina` DISABLE KEYS */;
INSERT INTO `cocina` VALUES (22222222,'2027-05-15'),(11111111,'2026-12-01'),(33333333,'2028-01-10');
/*!40000 ALTER TABLE `cocina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despacho`
--

DROP TABLE IF EXISTS `despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho` (
  `dni_empleado` int(11) NOT NULL,
  `fecha_hora` date DEFAULT NULL,
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `despacho_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho`
--

LOCK TABLES `despacho` WRITE;
/*!40000 ALTER TABLE `despacho` DISABLE KEYS */;
INSERT INTO `despacho` VALUES (11111111,'2026-10-20'),(22222222,'2026-10-21'),(33333333,'2026-10-22');
/*!40000 ALTER TABLE `despacho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalla`
--

DROP TABLE IF EXISTS `detalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalla` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `aclaraciones_item` varchar(255) DEFAULT NULL,
  `subtotal_linea` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalla_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `detalla_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalla`
--

LOCK TABLES `detalla` WRITE;
/*!40000 ALTER TABLE `detalla` DISABLE KEYS */;
INSERT INTO `detalla` VALUES (1,1001,501,1,6500.00,'Sin aderezos',6500.00),(2,1001,502,1,2000.00,'Fría',2000.00),(3,1002,503,2,2200.00,'Con bastante sal',4400.00);
/*!40000 ALTER TABLE `detalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `dni_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `rol` varchar(80) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `horario` time DEFAULT NULL,
  PRIMARY KEY (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (11111111,'Carlos','Gómez','Cajero','carlos.gomez@email.com','08:00:00'),(22222222,'María','López','Cocinero','maria.lopez@email.com','12:00:00'),(33333333,'Juan','Pérez','Repartidor','juan.perez@email.com','18:00:00');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregan`
--

DROP TABLE IF EXISTS `entregan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregan` (
  `dni_empleado` int(11) NOT NULL,
  `id_entregan` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_entregan`),
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `entregan_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregan`
--

LOCK TABLES `entregan` WRITE;
/*!40000 ALTER TABLE `entregan` DISABLE KEYS */;
INSERT INTO `entregan` VALUES (33333333,1,'2026-10-23 13:00:00'),(33333333,2,'2026-10-23 14:15:00'),(11111111,3,'2026-10-23 15:30:00');
/*!40000 ALTER TABLE `entregan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `dni_empleado` int(11) NOT NULL,
  `id_arma_entrega` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `modalidad` varchar(30) NOT NULL,
  `fecha_hora_ingreso` datetime NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `propina_monto` decimal(12,2) DEFAULT NULL,
  `monto_pago_efectivo` decimal(12,2) DEFAULT NULL,
  `vuelto_calculado` decimal(12,2) DEFAULT NULL,
  `notas_cocina` text DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `dni_empleado` (`dni_empleado`),
  KEY `id_arma_entrega` (`id_arma_entrega`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_arma_entrega`) REFERENCES `arma_entrega` (`id_arma_entrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1001,11111111,101,'Entregado','Delivery','2026-10-23 12:30:00',8500.00,9000.00,500.00,10000.00,1000.00,'Sin cebolla'),(1002,11111111,102,'En Preparacion','Take Away','2026-10-23 13:45:00',4200.00,4200.00,0.00,5000.00,800.00,'Extra queso'),(1003,22222222,103,'Pendiente','Local','2026-10-23 15:00:00',6100.00,6100.00,300.00,6100.00,0.00,'Papas bien cocidas');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparan`
--

DROP TABLE IF EXISTS `preparan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preparan` (
  `id_preparan` int(11) NOT NULL,
  `dni_empleado` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_preparan`),
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `preparan_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparan`
--

LOCK TABLES `preparan` WRITE;
/*!40000 ALTER TABLE `preparan` DISABLE KEYS */;
INSERT INTO `preparan` VALUES (201,22222222,'2026-10-23 12:30:00'),(202,22222222,'2026-10-23 13:45:00'),(203,22222222,'2026-10-23 15:00:00');
/*!40000 ALTER TABLE `preparan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `dni_empleado` int(11) NOT NULL,
  `id_preparan` int(11) NOT NULL,
  `nmombre` varchar(150) NOT NULL,
  `descripcion_corta` varchar(255) DEFAULT NULL,
  `descripcion_detallada` text DEFAULT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  `precio_actual` decimal(12,2) NOT NULL,
  `pausa` tinyint(1) DEFAULT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `dni_empleado` (`dni_empleado`),
  KEY `id_preparan` (`id_preparan`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_preparan`) REFERENCES `preparan` (`id_preparan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (501,1,22222222,201,'Hamburguesa Doble Queso','Doble carne con mucho cheddar','Medallón doble de carne de 120g, doble queso cheddar y salsa especial','http://img.com/doblequeso.jpg',6500.00,0,50),(502,2,11111111,202,'Gaseosa Cola 500ml','Bebida refrescante','Botella individual de gaseosa sabor cola','http://img.com/cola.jpg',2000.00,0,100),(503,3,22222222,203,'Papas Fritas Medianas','Papas bastón crujientes','Porción mediana de papas fritas con sal fina','http://img.com/papas.jpg',2200.00,0,40);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realiza`
--

DROP TABLE IF EXISTS `realiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realiza` (
  `id_realiza` varchar(20) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `entrecalles_aclaraciones` varchar(100) DEFAULT NULL,
  `direccion_calle_numero` varchar(50) NOT NULL,
  PRIMARY KEY (`id_realiza`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `realiza_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realiza`
--

LOCK TABLES `realiza` WRITE;
/*!40000 ALTER TABLE `realiza` DISABLE KEYS */;
INSERT INTO `realiza` VALUES ('R-001',1,1001,'Entre San Martín y Belgrano','Av. Corrientes 1234'),('R-002',2,1002,'Timbre 2B','Calle Mitre 567'),('R-003',3,1003,'Portón blanco','Av. Cabildo 890');
/*!40000 ALTER TABLE `realiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `dni_empleado` int(11) NOT NULL,
  `vehiculo` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  KEY `dni_empleado` (`dni_empleado`),
  CONSTRAINT `repartidores_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (33333333,'Moto Honda Wave 110',1),(11111111,'Bicicleta Rodado 29',0),(22222222,'Auto Fiat Uno',1);
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 10:57:45
