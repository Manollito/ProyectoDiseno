CREATE DATABASE  IF NOT EXISTS `proyectov1` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyectov1`;
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
  `FechaEscaneo` datetime NOT NULL,
  `Resultado` decimal(6,4) NOT NULL,
  `idSuscripcion` int NOT NULL,
  `amIFaceId` int NOT NULL,
  PRIMARY KEY (`idBitacoraEscaneo`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idOperario_idx` (`idOperario`),
  KEY `idEscaneo_idx` (`idEscaneo`),
  KEY `Bitacora_idTipoEscaneo_idx` (`idTipoEscaneo`),
  KEY `Bitacora_idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Bitacora_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `escaneo` (`idEscaneo`),
  CONSTRAINT `Bitacora_idOperario` FOREIGN KEY (`idOperario`) REFERENCES `usuarios` (`idOperarios`),
  CONSTRAINT `Bitacora_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  CONSTRAINT `Bitacora_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`),
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
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas` (
  `idCaracteristicas` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `TipoValor` varchar(20) NOT NULL,
  PRIMARY KEY (`idCaracteristicas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
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
  `Ubicacion` point NOT NULL,
  PRIMARY KEY (`idDirecciones`),
  KEY `Direcciones_idPais_idx` (`idPais`),
  CONSTRAINT `Direcciones_idPais` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPaises`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,'La Merced','A10','Cartago','Cartago','30106',_binary '\0\0\0\0\0\0\0ˆB\€{R¿∂‰†Ñ]D@'),(2,1,'Alajuelita','A10','San Jos√©','San Jos√©','30106',_binary '\0\0\0\0\0\0\0ˆB\€{R¿∂‰†Ñ]D@');
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
  `amIFaceId` int NOT NULL,
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
  `Nombre` varchar(50) NOT NULL,
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
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacion` (
  `idOrganizacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion`
--

LOCK TABLES `organizacion` WRITE;
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
INSERT INTO `organizacion` VALUES (1,'Hospital Buena Vista'),(2,'Clinicas Por La Paz'),(3,'Hospital M√©dicos Unidos'),(4,'Hospital La libertad'),(5,'Clinicas La Prosperidad'),(6,'Hospital El Progreso');
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
  `Nombre` varchar(100) NOT NULL,
  `idOrganizacion` int NOT NULL,
  `idDireccion` int NOT NULL,
  `isActve` tinyint NOT NULL,
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
  `checksum` varchar(64) NOT NULL,
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
  `idPaises` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPaises`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Costa Rica'),(2,'Panam√°'),(3,'M√©xico');
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
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  PRIMARY KEY (`idPlan_Calendar`),
  KEY `Calendar_idPlanes_idx` (`idPlan`),
  CONSTRAINT `Calendar_idPlanes` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`)
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
INSERT INTO `plan_tipoescaneo` VALUES (1,1),(2,1),(1,2),(2,2),(2,3);
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
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'B√°sico','Descripci√≥n Plan B√°sico',100.00),(2,'Premium','Descripci√≥n Plan Premium',300.00);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_caracteriscticas`
--

DROP TABLE IF EXISTS `planes_caracteriscticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_caracteriscticas` (
  `idPlanes_Caracteriscticas` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `idCaracteristica` int NOT NULL,
  `Values` varchar(20) NOT NULL,
  PRIMARY KEY (`idPlanes_Caracteriscticas`),
  KEY `idPlanCaract_idPlan_idx` (`idPlan`),
  KEY `idCaractPlan_idx` (`idCaracteristica`),
  CONSTRAINT `idCaractPlan` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristicas`),
  CONSTRAINT `idPlanCaract_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_caracteriscticas`
--

LOCK TABLES `planes_caracteriscticas` WRITE;
/*!40000 ALTER TABLE `planes_caracteriscticas` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes_caracteriscticas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regla_organizacion`
--

DROP TABLE IF EXISTS `regla_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regla_organizacion` (
  `idOrganizacion` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idOrganizacion`,`idRegla`),
  KEY `idRegOrg_Regla_idx` (`idRegla`),
  CONSTRAINT `idRegOrg_Organizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `idRegOrg_Regla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regla_organizacion`
--

LOCK TABLES `regla_organizacion` WRITE;
/*!40000 ALTER TABLE `regla_organizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `regla_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regla_sitio`
--

DROP TABLE IF EXISTS `regla_sitio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regla_sitio` (
  `idSitio` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idSitio`,`idRegla`),
  KEY `idRegSit_idRegla_idx` (`idRegla`),
  CONSTRAINT `idRegSit_idRegla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`),
  CONSTRAINT `idRegSit_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regla_sitio`
--

LOCK TABLES `regla_sitio` WRITE;
/*!40000 ALTER TABLE `regla_sitio` DISABLE KEYS */;
/*!40000 ALTER TABLE `regla_sitio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglas`
--

DROP TABLE IF EXISTS `reglas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglas` (
  `idReglasClasificacion` int NOT NULL AUTO_INCREMENT,
  `idTipoClasificacion` int NOT NULL,
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `Value` decimal(6,4) NOT NULL,
  `idTipoUnidad` int NOT NULL,
  `isActive` tinyint NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Operador` enum('<','>','=','>=','<=') NOT NULL,
  PRIMARY KEY (`idReglasClasificacion`),
  KEY `idTipoClasificacion_idx` (`idTipoClasificacion`),
  KEY `idPlan_idx` (`idPlan`),
  KEY `idTipoEscaneo_idx` (`idTipoEscaneo`),
  KEY `Reglas_idTipoUnidad_idx` (`idTipoUnidad`),
  CONSTRAINT `Reglas_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `Reglas_idTipoClasificacion` FOREIGN KEY (`idTipoClasificacion`) REFERENCES `tipoclasificacion` (`idTipoClasificacion`),
  CONSTRAINT `Reglas_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`),
  CONSTRAINT `Reglas_idTipoUnidad` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas`
--

LOCK TABLES `reglas` WRITE;
/*!40000 ALTER TABLE `reglas` DISABLE KEYS */;
INSERT INTO `reglas` VALUES (25,1,1,1,20.0000,1,1,'2024-10-19','<'),(26,2,1,1,20.0000,1,1,'2024-10-19','='),(27,3,1,1,20.0000,1,1,'2024-10-19','>'),(28,1,1,2,80.0000,2,1,'2024-10-19','<'),(29,2,1,2,80.0000,2,1,'2024-10-19','='),(30,3,1,2,80.0000,2,1,'2024-10-19','>'),(31,5,2,1,30.0000,2,1,'2024-10-19','<'),(32,6,2,1,30.0000,2,1,'2024-10-19','>'),(33,5,2,2,1.7000,3,1,'2024-10-19','<'),(34,6,2,2,1.7000,3,1,'2024-10-19','>'),(35,5,2,3,50.0000,5,1,'2024-10-19','<'),(36,6,2,3,50.0000,5,1,'2024-10-19','>');
/*!40000 ALTER TABLE `reglas` ENABLE KEYS */;
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
  `Valor` decimal(6,4) NOT NULL,
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
  `idDireccion` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idSitio`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `Sitio_idDireccion_idx` (`idDireccion`),
  CONSTRAINT `Sitio_idDireccion` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDirecciones`),
  CONSTRAINT `Sitio_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitios`
--

LOCK TABLES `sitios` WRITE;
/*!40000 ALTER TABLE `sitios` DISABLE KEYS */;
INSERT INTO `sitios` VALUES (1,1,1,'Hospital Buena Vista parte baja'),(2,2,2,'Clinicas Por La Paz parte baja');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,1,1,1,1),(2,2,2,1,1);
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
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoClasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoclasificacion`
--

LOCK TABLES `tipoclasificacion` WRITE;
/*!40000 ALTER TABLE `tipoclasificacion` DISABLE KEYS */;
INSERT INTO `tipoclasificacion` VALUES (1,'Verde'),(2,'Azul'),(3,'Rojo'),(4,'Amarillo'),(5,'Leve'),(6,'Grave');
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
  `Nombre` varchar(50) NOT NULL,
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
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoescaneo`
--

LOCK TABLES `tipoescaneo` WRITE;
/*!40000 ALTER TABLE `tipoescaneo` DISABLE KEYS */;
INSERT INTO `tipoescaneo` VALUES (1,'Temperatura'),(2,'Altura'),(3,'Peso');
/*!40000 ALTER TABLE `tipoescaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomoneda`
--

DROP TABLE IF EXISTS `tipomoneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomoneda` (
  `idTipoMoneda` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Simbolo` varchar(3) NOT NULL,
  PRIMARY KEY (`idTipoMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomoneda`
--

LOCK TABLES `tipomoneda` WRITE;
/*!40000 ALTER TABLE `tipomoneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomoneda` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposstatus`
--

LOCK TABLES `tiposstatus` WRITE;
/*!40000 ALTER TABLE `tiposstatus` DISABLE KEYS */;
INSERT INTO `tiposstatus` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Pagado'),(4,'Pendiente'),(5,'Cancelado'),(6,'Suspendido');
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
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipounidad`
--

LOCK TABLES `tipounidad` WRITE;
/*!40000 ALTER TABLE `tipounidad` DISABLE KEYS */;
INSERT INTO `tipounidad` VALUES (1,'grados'),(2,'cent√≠metros'),(3,'metos'),(4,'gramos'),(5,'kilogramos');
/*!40000 ALTER TABLE `tipounidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idOperarios` int NOT NULL AUTO_INCREMENT,
  `idStatus` int NOT NULL,
  `EsOperador` tinyint NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`idOperarios`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `Operarios_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `tiposstatus` (`idTiposStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_resultados`
--

DROP TABLE IF EXISTS `view_resultados`;
/*!50001 DROP VIEW IF EXISTS `view_resultados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_resultados` AS SELECT 
 1 AS `Nombre Sitio`,
 1 AS `Nombre Organizacion`,
 1 AS `Nombre Plan`,
 1 AS `ID Tipo Clasificacion`,
 1 AS `Nombre Tipo Clasificacion`,
 1 AS `ID Tipo Escaneo`,
 1 AS `Nombre Tipo Escaneo`,
 1 AS `ID Tipo Unidad`,
 1 AS `Nombre Tipo Unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_resultados`
--

/*!50001 DROP VIEW IF EXISTS `view_resultados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_resultados` AS select `s`.`Nombre` AS `Nombre Sitio`,`o`.`Nombre` AS `Nombre Organizacion`,`p`.`Nombre` AS `Nombre Plan`,`r`.`idTipoClasificacion` AS `ID Tipo Clasificacion`,`tc`.`Nombre` AS `Nombre Tipo Clasificacion`,`r`.`idTipoEscaneo` AS `ID Tipo Escaneo`,`te`.`Nombre` AS `Nombre Tipo Escaneo`,`r`.`idTipoUnidad` AS `ID Tipo Unidad`,`tu`.`Nombre` AS `Nombre Tipo Unidad` from (((((((`sitios` `s` join `organizacion` `o` on((`s`.`idOrganizacion` = `o`.`idOrganizacion`))) join `suscripciones` `su` on((`s`.`idSitio` = `su`.`idSitio`))) join `planes` `p` on((`su`.`idPlan` = `p`.`idPlanes`))) join `reglas` `r` on((`p`.`idPlanes` = `r`.`idPlan`))) join `tipoclasificacion` `tc` on((`r`.`idTipoClasificacion` = `tc`.`idTipoClasificacion`))) join `tipoescaneo` `te` on((`r`.`idTipoEscaneo` = `te`.`idTipoEscaneo`))) join `tipounidad` `tu` on((`r`.`idTipoUnidad` = `tu`.`idTipoUnidad`))) */;
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

-- Dump completed on 2024-10-19 22:42:04
