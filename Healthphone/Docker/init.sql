-- SCRIPT DE CREACIÓN DE BASE Y TABLAS 


-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectov1
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `bitacoraescaneo`
--

DROP TABLE IF EXISTS `bitacoraescaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraescaneo` (
  `idBitacoraEscaneo` int NOT NULL AUTO_INCREMENT,
  `idSitio` int NOT NULL,
  `idOperario` int NOT NULL,
  `idEscaneo` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `idOperacion` int NOT NULL,
  `FechaEscaneo` datetime NOT NULL,
  `ResultadoAnterior` decimal(10,2) NOT NULL,
  `ResultadoNuevo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idBitacoraEscaneo`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idOperario_idx` (`idOperario`),
  KEY `idEscaneo_idx` (`idEscaneo`),
  KEY `idOperacion_idx` (`idOperacion`),
  KEY `Bitacora_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `Bitacora_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `escaneo` (`idEscaneo`),
  CONSTRAINT `Bitacora_idOperacion` FOREIGN KEY (`idOperacion`) REFERENCES `tipooperacion` (`idTipoOperacion`),
  CONSTRAINT `Bitacora_idOperario` FOREIGN KEY (`idOperario`) REFERENCES `operarios` (`idOperarios`),
  CONSTRAINT `Bitacora_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  CONSTRAINT `Bitacora_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoraescaneo`
--

LOCK TABLES `bitacoraescaneo` WRITE;
/*!40000 ALTER TABLE `bitacoraescaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacoraescaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `idDirecciones` int NOT NULL AUTO_INCREMENT,
  `idPais` int NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `CodigoPostal` varchar(10) NOT NULL,
  PRIMARY KEY (`idDirecciones`),
  KEY `Direcciones_idPais_idx` (`idPais`),
  CONSTRAINT `Direcciones_idPais` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPaises`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escaneo`
--

DROP TABLE IF EXISTS `escaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escaneo` (
  `idEscaneo` int NOT NULL AUTO_INCREMENT,
  `idTipoEscaneo` int NOT NULL,
  `idSuscripcion` int NOT NULL,
  `FechaEscaneo` datetime NOT NULL,
  PRIMARY KEY (`idEscaneo`),
  KEY `idTipoEscaneo_idx` (`idTipoEscaneo`),
  KEY `idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Escaneo_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`),
  CONSTRAINT `Escaneo_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escaneo`
--

LOCK TABLES `escaneo` WRITE;
/*!40000 ALTER TABLE `escaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `escaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacioncontacto`
--

DROP TABLE IF EXISTS `informacioncontacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacioncontacto` (
  `idInformacionContacto` int NOT NULL AUTO_INCREMENT,
  `idTipoContacto` int NOT NULL,
  `idContacto` int NOT NULL,
  `TipoEntidad` enum('Organizacion','Operario') NOT NULL,
  `Valor` varchar(255) NOT NULL,
  PRIMARY KEY (`idInformacionContacto`),
  KEY `InfoContac_idTipoContacto_idx` (`idTipoContacto`),
  CONSTRAINT `InfoContac_idTipoContacto` FOREIGN KEY (`idTipoContacto`) REFERENCES `tipocontacto` (`idTipoContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacioncontacto`
--

LOCK TABLES `informacioncontacto` WRITE;
/*!40000 ALTER TABLE `informacioncontacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacioncontacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopago` (
  `idMetodoPago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopago`
--

LOCK TABLES `metodopago` WRITE;
/*!40000 ALTER TABLE `metodopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operarios`
--

DROP TABLE IF EXISTS `operarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operarios` (
  `idOperarios` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `idStatus` int NOT NULL,
  PRIMARY KEY (`idOperarios`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `Operarios_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `tiposstatus` (`idTiposStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operarios`
--

LOCK TABLES `operarios` WRITE;
/*!40000 ALTER TABLE `operarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `operarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacion` (
  `idOrganizacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrganizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion`
--

LOCK TABLES `organizacion` WRITE;
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizaciondirecciones`
--

DROP TABLE IF EXISTS `organizaciondirecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizaciondirecciones` (
  `idOrganizacionDirecciones` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `idOrganizacion` int NOT NULL,
  `idDireccion` int NOT NULL,
  PRIMARY KEY (`idOrganizacionDirecciones`),
  KEY `OrgDic_idOrganizacion_idx` (`idOrganizacion`),
  KEY `OrgDic_idDirecciones_idx` (`idDireccion`),
  CONSTRAINT `OrgDic_idDirecciones` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDirecciones`),
  CONSTRAINT `OrgDic_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizaciondirecciones`
--

LOCK TABLES `organizaciondirecciones` WRITE;
/*!40000 ALTER TABLE `organizaciondirecciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizaciondirecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPagos` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `idSuscripcion` int NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `FechaPago` date NOT NULL,
  `idMetodoPago` int NOT NULL,
  `idStatus` int NOT NULL,
  PRIMARY KEY (`idPagos`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `idSuscripcion_idx` (`idSuscripcion`),
  KEY `idMetodoPago_idx` (`idMetodoPago`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `Pagos_idMetodoPago` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idMetodoPago`),
  CONSTRAINT `Pagos_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `Pagos_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `tiposstatus` (`idTiposStatus`),
  CONSTRAINT `Pagos_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `idPaises` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idPaises`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_calendar`
--

DROP TABLE IF EXISTS `plan_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_calendar` (
  `idPlan_Calendar` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `idSuscripcion` int NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  PRIMARY KEY (`idPlan_Calendar`),
  KEY `Calendar_idPlanes_idx` (`idPlan`),
  KEY `Calendar_idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Calendar_idPlanes` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `Calendar_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_calendar`
--

LOCK TABLES `plan_calendar` WRITE;
/*!40000 ALTER TABLE `plan_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_tipoescaneo`
--

DROP TABLE IF EXISTS `plan_tipoescaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_tipoescaneo` (
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  PRIMARY KEY (`idPlan`,`idTipoEscaneo`),
  KEY `PlanTipoEscaneo_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `PlanTipoEscaneo_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `PlanTipoEscaneo_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_tipoescaneo`
--

LOCK TABLES `plan_tipoescaneo` WRITE;
/*!40000 ALTER TABLE `plan_tipoescaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_tipoescaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `idPlanes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Disponibilidad` int NOT NULL,
  `CantidadEscaneos` int NOT NULL,
  `Activo` tinyint NOT NULL,
  PRIMARY KEY (`idPlanes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglasclasificacion`
--

DROP TABLE IF EXISTS `reglasclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglasclasificacion` (
  `idReglasClasificacion` int NOT NULL AUTO_INCREMENT,
  `idTipoClasificacion` int NOT NULL,
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `ValorMin` decimal(6,4) NOT NULL,
  `ValorMax` decimal(6,4) NOT NULL,
  PRIMARY KEY (`idReglasClasificacion`),
  KEY `idTipoClasificacion_idx` (`idTipoClasificacion`),
  KEY `idPlan_idx` (`idPlan`),
  KEY `idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `Reglas_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `Reglas_idTipoClasificacion` FOREIGN KEY (`idTipoClasificacion`) REFERENCES `tipoclasificacion` (`idTipoClasificacion`),
  CONSTRAINT `Reglas_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglasclasificacion`
--

LOCK TABLES `reglasclasificacion` WRITE;
/*!40000 ALTER TABLE `reglasclasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reglasclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadoescaneo`
--

DROP TABLE IF EXISTS `resultadoescaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultadoescaneo` (
  `idResultadoEscaneo` int NOT NULL AUTO_INCREMENT,
  `idEscaneo` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `Valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idResultadoEscaneo`),
  KEY `Resultado_idEscaneo_idx` (`idEscaneo`),
  KEY `Resultado_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `Resultado_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `escaneo` (`idEscaneo`),
  CONSTRAINT `Resultado_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadoescaneo`
--

LOCK TABLES `resultadoescaneo` WRITE;
/*!40000 ALTER TABLE `resultadoescaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultadoescaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitios`
--

DROP TABLE IF EXISTS `sitios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitios` (
  `idSitio` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `idReglaClasificacion` int NOT NULL,
  `idDireccion` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idSitio`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `idReglaClasificacion_idx` (`idReglaClasificacion`),
  KEY `Sitio_idDireccion_idx` (`idDireccion`),
  CONSTRAINT `Sitio_idDireccion` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDirecciones`),
  CONSTRAINT `Sitio_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `Sitio_idReglaClasificacion` FOREIGN KEY (`idReglaClasificacion`) REFERENCES `reglasclasificacion` (`idReglasClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitios`
--

LOCK TABLES `sitios` WRITE;
/*!40000 ALTER TABLE `sitios` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `idSuscripciones` int NOT NULL AUTO_INCREMENT,
  `idSitio` int NOT NULL,
  `idPlan` int NOT NULL,
  `Activo` tinyint NOT NULL,
  `idStatus` int NOT NULL,
  PRIMARY KEY (`idSuscripciones`),
  KEY `idPlan_idx` (`idPlan`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `Suscripciones_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `Suscripciones_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  CONSTRAINT `Suscripciones_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `tiposstatus` (`idTiposStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoclasificacion`
--

DROP TABLE IF EXISTS `tipoclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoclasificacion` (
  `idTipoClasificacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoclasificacion`
--

LOCK TABLES `tipoclasificacion` WRITE;
/*!40000 ALTER TABLE `tipoclasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontacto`
--

DROP TABLE IF EXISTS `tipocontacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocontacto` (
  `idTipoContacto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontacto`
--

LOCK TABLES `tipocontacto` WRITE;
/*!40000 ALTER TABLE `tipocontacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocontacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoescaneo`
--

DROP TABLE IF EXISTS `tipoescaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoescaneo` (
  `idTipoEscaneo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `idTipoUnidad` int NOT NULL,
  PRIMARY KEY (`idTipoEscaneo`),
  KEY `TipoEscaneo_idTipoUnidad_idx` (`idTipoUnidad`),
  CONSTRAINT `TipoEscaneo_idTipoUnidad` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoescaneo`
--

LOCK TABLES `tipoescaneo` WRITE;
/*!40000 ALTER TABLE `tipoescaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoescaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipooperacion`
--

DROP TABLE IF EXISTS `tipooperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipooperacion` (
  `idTipoOperacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`idTipoOperacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipooperacion`
--

LOCK TABLES `tipooperacion` WRITE;
/*!40000 ALTER TABLE `tipooperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipooperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposstatus`
--

DROP TABLE IF EXISTS `tiposstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposstatus` (
  `idTiposStatus` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`idTiposStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposstatus`
--

LOCK TABLES `tiposstatus` WRITE;
/*!40000 ALTER TABLE `tiposstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipounidad`
--

DROP TABLE IF EXISTS `tipounidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipounidad` (
  `idTipoUnidad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipounidad`
--

LOCK TABLES `tipounidad` WRITE;
/*!40000 ALTER TABLE `tipounidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipounidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 18:08:05


-- SCRIPT DE INSERCIÓN DE DATOS 

USE Healthphone;

INSERT INTO paises (idPaises, Nombre) 
VALUES (1, 'Costa Rica'), (2, 'Panamá'), (3, 'México');

INSERT INTO organizacion (Nombre, Contrasena) 
VALUES ('Hospital Buena Vista', '12345678'), ('Clinicas Por La Paz', '12345678'), ('Hospital Médicos Unidos', '12345678'), 
('Hospital La libertad', '12345678'), ('Clinicas La Prosperidad', '12345678'), ('Hospital El Progreso', '12345678');

INSERT INTO metodopago (Nombre) 
VALUES ('PayPal'), ('Stripe'), ('MercadoPago'), ('Yappy');

INSERT INTO operarios (Nombre, Contrasena, idStatus) 
VALUES ('Juan Carlos Rojas', '12345678', 1), ('Maria Magdalena Rivas', '12345678', 1), ('Juan Carlos Rojas', '12345678', 1), 
('Juan Carlos Rojas', '12345678', 2),('Juan Carlos Rojas', '12345678', 2), ('Juan Carlos Rojas', '12345678', 2);

INSERT INTO tiposstatus (Nombre) 
VALUES ('Activo'), ('Inactivo'), ('Pagado'), ('Pendiente'), ('Cancelado'), ('Suspendido');

INSERT INTO tipounidad (Nombre) 
VALUES ('grados'), ('centímetros'), ('metos'), ('gramos'), ('kilogramos');

INSERT INTO tipooperacion (Nombre) 
VALUES ('Creado'), ('Modificado'), ('Eliminado');

INSERT INTO tipoescaneo (Nombre, idTipoUnidad) 
VALUES ('Temperatura', 1), ('Altura', 2), ('Peso', 5);

INSERT INTO tipocontacto (Nombre) 
VALUES ('Telefono'), ('Correo'), ('Fax'), ('Redes Sociales');

INSERT INTO tipoclasificacion (Nombre) 
VALUES ('Verde'), ('Azul'), ('Rojo'), ('Amarillo'), ('Leve'), ('Grave');

INSERT INTO planes (Nombre, Descripcion, Precio, Disponibilidad, CantidadEscaneos, Activo) 
VALUES ('Básico', 'Descripción Plan Básico', 100.00, 50, 1000, TRUE), 
('Medio', 'Descripción Plan Medio', 200.00, 100, 2000, TRUE),
('Premium', 'Descripción Plan Premium', 300.00, 150, 3000, TRUE),
('Personalizado 1', 'Descripción Plan Personalizado 1', 300.00, 150, 3000, FALSE);

INSERT INTO informacioncontacto (idTipoContacto, idContacto, TipoEntidad, Valor) 
VALUES (1, 1, 'Organizacion', '12345678'),  (2, 1, 'Organizacion', 'correo@gmail.com'),  (1, 2, 'Organizacion', '12345678')
,  (2, 2, 'Organizacion', 'correo@gmail.com'),  (1, 1, 'Operario', '12345678'),  (2, 1, 'Operario', 'correo@gmail.com')
,  (1, 2, 'Operario', '12345678'),  (2, 2, 'Operario', 'correo@gmail.com');

INSERT INTO planes (idPais, Calle, Numero, Ciudad, Estado, CodigoPostal) 
VALUES (1, 'La Paz', '300', 'Cartago', 'Tejar', '30106'), (2, 'La Mora', '100', 'Panamá', 'Panamá', '30106'),
(3, 'La Mexicana', '200', 'México', 'México', '30106'), (1, 'La Guaria', '300', 'Cartago', 'Tejar', '30106'),
(1, 'La Monarca', '300', 'Cartago', 'Tejar', '30106');

INSERT INTO suscripciones (Nombre) 
VALUES ('Verde'), ('Azul');