CREATE DATABASE IF NOT EXISTS `proyectov1`;
USE `proyectov1`;

CREATE TABLE `Paises` (
  `idPaises` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPaises`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Organizacion` (
  `idOrganizacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Direcciones` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Organizaciondirecciones` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Sitios` (
  `idSitio` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `idDireccion` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idSitio`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `Sitio_idDireccion_idx` (`idDireccion`),
  CONSTRAINT `Sitio_idDireccion` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDirecciones`),
  CONSTRAINT `Sitio_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Planes` (
  `idPlanes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TipoClasificacion` (
  `idTipoClasificacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoClasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TipoUnidad` (
  `idTipoUnidad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TipoEscaneo` (
  `idTipoEscaneo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Caracteristicas` (
  `idCaracteristicas` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `TipoValor` varchar(20) NOT NULL,
  PRIMARY KEY (`idCaracteristicas`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TipoMoneda` (
  `idTipoMoneda` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Simbolo` varchar(3) NOT NULL,
  PRIMARY KEY (`idTipoMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TiposStatus` (
  `idTiposStatus` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`idTiposStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `TipoContacto` (
  `idTipoContacto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Usuarios` (
  `idOperarios` int NOT NULL AUTO_INCREMENT,
  `idStatus` int NOT NULL,
  `EsOperador` tinyint NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`idOperarios`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `Operarios_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `tiposstatus` (`idTiposStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Suscripciones` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Plan_Calendar` (
  `idPlan_Calendar` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  PRIMARY KEY (`idPlan_Calendar`),
  KEY `Calendar_idPlanes_idx` (`idPlan`),
  CONSTRAINT `Calendar_idPlanes` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Plan_TipoEscaneo` (
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  PRIMARY KEY (`idPlan`,`idTipoEscaneo`),
  KEY `PlanTipoEscaneo_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `PlanTipoEscaneo_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`),
  CONSTRAINT `PlanTipoEscaneo_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Planes_Caracteriscticas` (
  `idPlanes_Caracteriscticas` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `idCaracteristica` int NOT NULL,
  `Values` varchar(20) NOT NULL,
  PRIMARY KEY (`idPlanes_Caracteriscticas`),
  KEY `idPlanCaract_idPlan_idx` (`idPlan`),
  KEY `idPlanCaract_idCaract_idx` (`idCaracteristica`),
  CONSTRAINT `idPlanCaract_idCaract` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristicas`),
  CONSTRAINT `idPlanCaract_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Reglas` (
  `idReglasClasificacion` int NOT NULL AUTO_INCREMENT,
  `idTipoClasificacion` int NOT NULL,
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `Value` decimal(10,4) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Regla_Organizacion` (
  `idReglaOrganizacion` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idReglaOrganizacion`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `idRegla_idx` (`idRegla`),
  CONSTRAINT `ReglaOrg_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `ReglaOrg_idRegla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Regla_Sitio` (
  `idReglaSitio` int NOT NULL AUTO_INCREMENT,
  `idSitio` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idReglaSitio`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idRegla_idx` (`idRegla`),
  CONSTRAINT `ReglaSitio_idRegla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`),
  CONSTRAINT `ReglaSitio_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Escaneo` (
  `idEscaneo` int NOT NULL AUTO_INCREMENT,
  `idSuscripcion` int NOT NULL,
  `FechaEscaneo` datetime NOT NULL,
  `amIFaceId` int NOT NULL,
  PRIMARY KEY (`idEscaneo`),
  KEY `idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Escaneo_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ResultadoEscaneo` (
  `idResultadoEscaneo` int NOT NULL AUTO_INCREMENT,
  `idEscaneo` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `Valor` decimal(10,4) NOT NULL,
  PRIMARY KEY (`idResultadoEscaneo`),
  KEY `Resultado_idEscaneo_idx` (`idEscaneo`),
  KEY `Resultado_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `Resultado_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `escaneo` (`idEscaneo`),
  CONSTRAINT `Resultado_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `tipoescaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `BitacoraEscaneo` (
  `idBitacoraEscaneo` int NOT NULL AUTO_INCREMENT,
  `idSitio` int NOT NULL,
  `idOperario` int NOT NULL,
  `idEscaneo` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `FechaEscaneo` datetime NOT NULL,
  `Resultado` decimal(10,4) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `InformacionContacto` (
  `idInformacionContacto` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int DEFAULT NULL,
  `idOperario` int DEFAULT NULL,
  `idSitio` int DEFAULT NULL,
  `idTipoContacto` int NOT NULL,
  `Informacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idInformacionContacto`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `idOperario_idx` (`idOperario`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idTipoContacto_idx` (`idTipoContacto`),
  CONSTRAINT `InfoContacto_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `InfoContacto_idOperario` FOREIGN KEY (`idOperario`) REFERENCES `usuarios` (`idOperarios`),
  CONSTRAINT `InfoContacto_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  CONSTRAINT `InfoContacto_idTipoContacto` FOREIGN KEY (`idTipoContacto`) REFERENCES `tipocontacto` (`idTipoContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Metodopago` (
  `idMetodoPago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Pagos` (
  `idPagos` int NOT NULL AUTO_INCREMENT,
  `idMetodoPago` int NOT NULL,
  `idSitio` int NOT NULL,
  `idSuscripcion` int NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `FechaPago` datetime NOT NULL,
  PRIMARY KEY (`idPagos`),
  KEY `idMetodoPago_idx` (`idMetodoPago`),
  KEY `idSitio_idx` (`idSitio`),
  KEY `idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Pagos_idMetodoPago` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idMetodoPago`),
  CONSTRAINT `Pagos_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  CONSTRAINT `Pagos_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripciones` (`idSuscripciones`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;