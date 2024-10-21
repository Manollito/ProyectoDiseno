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
  CONSTRAINT `Direcciones_idPais` FOREIGN KEY (`idPais`) REFERENCES `Paises` (`idPaises`)
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
  CONSTRAINT `OrgDic_idDirecciones` FOREIGN KEY (`idDireccion`) REFERENCES `Direcciones` (`idDirecciones`),
  CONSTRAINT `OrgDic_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `Organizacion` (`idOrganizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Sitios` (
  `idSitio` int NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int NOT NULL,
  `idDireccion` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idSitio`),
  KEY `idOrganizacion_idx` (`idOrganizacion`),
  KEY `Sitio_idDireccion_idx` (`idDireccion`),
  CONSTRAINT `Sitio_idDireccion` FOREIGN KEY (`idDireccion`) REFERENCES `Direcciones` (`idDirecciones`),
  CONSTRAINT `Sitio_idOrganizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `Organizacion` (`idOrganizacion`)
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
  CONSTRAINT `Operarios_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `TiposStatus` (`idTiposStatus`)
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
  CONSTRAINT `Suscripciones_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `Planes` (`idPlanes`),
  CONSTRAINT `Suscripciones_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `Sitios` (`idSitio`),
  CONSTRAINT `Suscripciones_idStatus` FOREIGN KEY (`idStatus`) REFERENCES `TiposStatus` (`idTiposStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Plan_Calendar` (
  `idPlan_Calendar` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  PRIMARY KEY (`idPlan_Calendar`),
  KEY `Calendar_idPlanes_idx` (`idPlan`),
  CONSTRAINT `Calendar_idPlanes` FOREIGN KEY (`idPlan`) REFERENCES `Planes` (`idPlanes`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Plan_TipoEscaneo` (
  `idPlan` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  PRIMARY KEY (`idPlan`,`idTipoEscaneo`),
  KEY `PlanTipoEscaneo_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `PlanTipoEscaneo_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `Planes` (`idPlanes`),
  CONSTRAINT `PlanTipoEscaneo_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `TipoEscaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Planes_Caracteriscticas` (
  `idPlanes_Caracteriscticas` int NOT NULL AUTO_INCREMENT,
  `idPlan` int NOT NULL,
  `idCaracteristica` int NOT NULL,
  `Values` varchar(20) NOT NULL,
  PRIMARY KEY (`idPlanes_Caracteriscticas`),
  KEY `idPlanCaract_idPlan_idx` (`idPlan`),
  KEY `idPlanCaract_idCaract_idx` (`idCaracteristica`),
  CONSTRAINT `idPlanCaract_idCaract` FOREIGN KEY (`idCaracteristica`) REFERENCES `Caracteristicas` (`idCaracteristicas`),
  CONSTRAINT `idPlanCaract_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `Planes` (`idPlanes`)
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
  CONSTRAINT `Reglas_idPlan` FOREIGN KEY (`idPlan`) REFERENCES `Planes` (`idPlanes`),
  CONSTRAINT `Reglas_idTipoClasificacion` FOREIGN KEY (`idTipoClasificacion`) REFERENCES `TipoClasificacion` (`idTipoClasificacion`),
  CONSTRAINT `Reglas_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `TipoEscaneo` (`idTipoEscaneo`),
  CONSTRAINT `Reglas_idTipoUnidad` FOREIGN KEY (`idTipoUnidad`) REFERENCES `TipoUnidad` (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Regla_Organizacion` (
  `idOrganizacion` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idOrganizacion`,`idRegla`),
  KEY `idRegOrg_Regla_idx` (`idRegla`),
  CONSTRAINT `idRegOrg_Organizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`),
  CONSTRAINT `idRegOrg_Regla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Regla_Sitio` (
  `idSitio` int NOT NULL,
  `idRegla` int NOT NULL,
  PRIMARY KEY (`idSitio`,`idRegla`),
  KEY `idRegSit_idRegla_idx` (`idRegla`),
  CONSTRAINT `idRegSit_idRegla` FOREIGN KEY (`idRegla`) REFERENCES `reglas` (`idReglasClasificacion`),
  CONSTRAINT `idRegSit_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Escaneo` (
  `idEscaneo` int NOT NULL AUTO_INCREMENT,
  `idSuscripcion` int NOT NULL,
  `FechaEscaneo` datetime NOT NULL,
  `amIFaceId` int NOT NULL,
  PRIMARY KEY (`idEscaneo`),
  KEY `idSuscripcion_idx` (`idSuscripcion`),
  CONSTRAINT `Escaneo_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `Suscripciones` (`idSuscripciones`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ResultadoEscaneo` (
  `idResultadoEscaneo` int NOT NULL AUTO_INCREMENT,
  `idEscaneo` int NOT NULL,
  `idTipoEscaneo` int NOT NULL,
  `Valor` decimal(10,4) NOT NULL,
  PRIMARY KEY (`idResultadoEscaneo`),
  KEY `Resultado_idEscaneo_idx` (`idEscaneo`),
  KEY `Resultado_idTipoEscaneo_idx` (`idTipoEscaneo`),
  CONSTRAINT `Resultado_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `Escaneo` (`idEscaneo`),
  CONSTRAINT `Resultado_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `TipoEscaneo` (`idTipoEscaneo`)
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
  CONSTRAINT `Bitacora_idEscaneo` FOREIGN KEY (`idEscaneo`) REFERENCES `Escaneo` (`idEscaneo`),
  CONSTRAINT `Bitacora_idOperario` FOREIGN KEY (`idOperario`) REFERENCES `Usuarios` (`idOperarios`),
  CONSTRAINT `Bitacora_idSitio` FOREIGN KEY (`idSitio`) REFERENCES `Sitios` (`idSitio`),
  CONSTRAINT `Bitacora_idSuscripcion` FOREIGN KEY (`idSuscripcion`) REFERENCES `Suscripciones` (`idSuscripciones`),
  CONSTRAINT `Bitacora_idTipoEscaneo` FOREIGN KEY (`idTipoEscaneo`) REFERENCES `TipoEscaneo` (`idTipoEscaneo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `InformacionContacto` (
  `idInformacionContacto` int NOT NULL AUTO_INCREMENT,
  `idTipoContacto` int NOT NULL,
  `idContacto` int NOT NULL,
  `TipoEntidad` enum('Organizacion','Operario') NOT NULL,
  `Valor` varchar(255) NOT NULL,
  PRIMARY KEY (`idInformacionContacto`),
  KEY `InfoContac_idTipoContacto_idx` (`idTipoContacto`),
  CONSTRAINT `InfoContac_idTipoContacto` FOREIGN KEY (`idTipoContacto`) REFERENCES `tipocontacto` (`idTipoContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Metodopago` (
  `idMetodoPago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `Pagos` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;