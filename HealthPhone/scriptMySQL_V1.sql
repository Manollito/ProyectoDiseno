-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProyectoV1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProyectoV1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProyectoV1` DEFAULT CHARACTER SET utf8 ;
USE `ProyectoV1` ;

-- -----------------------------------------------------
-- Table `ProyectoV1`.`Organizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Organizacion` (
  `idOrganizacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrganizacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Planes` (
  `idPlanes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` NVARCHAR(255) NOT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Disponibilidad` INT NOT NULL,
  `CantidadEscaneos` INT NOT NULL,
  `Activo` TINYINT NOT NULL,
  PRIMARY KEY (`idPlanes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TipoClasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TipoClasificacion` (
  `idTipoClasificacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoClasificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TipoEscaneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TipoEscaneo` (
  `idTipoEscaneo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEscaneo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`ReglasClasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`ReglasClasificacion` (
  `idReglasClasificacion` INT NOT NULL AUTO_INCREMENT,
  `idTipoClasificacion` INT NOT NULL,
  `idPlan` INT NOT NULL,
  `idTipoEscaneo` INT NOT NULL,
  PRIMARY KEY (`idReglasClasificacion`),
  INDEX `idTipoClasificacion_idx` (`idTipoClasificacion` ASC) VISIBLE,
  INDEX `idPlan_idx` (`idPlan` ASC) VISIBLE,
  INDEX `idTipoEscaneo_idx` (`idTipoEscaneo` ASC) VISIBLE,
  CONSTRAINT `Reglas_idTipoClasificacion`
    FOREIGN KEY (`idTipoClasificacion`)
    REFERENCES `ProyectoV1`.`TipoClasificacion` (`idTipoClasificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Reglas_idPlan`
    FOREIGN KEY (`idPlan`)
    REFERENCES `ProyectoV1`.`Planes` (`idPlanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Reglas_idTipoEscaneo`
    FOREIGN KEY (`idTipoEscaneo`)
    REFERENCES `ProyectoV1`.`TipoEscaneo` (`idTipoEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Paises` (
  `idPaises` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPaises`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Direcciones` (
  `idDirecciones` INT NOT NULL AUTO_INCREMENT,
  `idPais` INT NOT NULL,
  `Calle` VARCHAR(100) NOT NULL,
  `Numero` VARCHAR(10) NOT NULL,
  `Ciudad` VARCHAR(50) NOT NULL,
  `Estado` VARCHAR(50) NOT NULL,
  `CodigoPostal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idDirecciones`),
  INDEX `Direcciones_idPais_idx` (`idPais` ASC) VISIBLE,
  CONSTRAINT `Direcciones_idPais`
    FOREIGN KEY (`idPais`)
    REFERENCES `ProyectoV1`.`Paises` (`idPaises`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Sitios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Sitios` (
  `idSitio` INT NOT NULL AUTO_INCREMENT,
  `idOrganizacion` INT NOT NULL,
  `idReglaClasificacion` INT NOT NULL,
  `idDireccion` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSitio`),
  INDEX `idOrganizacion_idx` (`idOrganizacion` ASC) VISIBLE,
  INDEX `idReglaClasificacion_idx` (`idReglaClasificacion` ASC) VISIBLE,
  INDEX `Sitio_idDireccion_idx` (`idDireccion` ASC) VISIBLE,
  CONSTRAINT `Sitio_idOrganizacion`
    FOREIGN KEY (`idOrganizacion`)
    REFERENCES `ProyectoV1`.`Organizacion` (`idOrganizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Sitio_idReglaClasificacion`
    FOREIGN KEY (`idReglaClasificacion`)
    REFERENCES `ProyectoV1`.`ReglasClasificacion` (`idReglasClasificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Sitio_idDireccion`
    FOREIGN KEY (`idDireccion`)
    REFERENCES `ProyectoV1`.`Direcciones` (`idDirecciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TiposStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TiposStatus` (
  `idTiposStatus` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idTiposStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Suscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Suscripciones` (
  `idSuscripciones` INT NOT NULL AUTO_INCREMENT,
  `idSitio` INT NOT NULL,
  `idPlan` INT NOT NULL,
  `Activo` TINYINT NOT NULL,
  `idStatus` INT NOT NULL,
  PRIMARY KEY (`idSuscripciones`),
  INDEX `idPlan_idx` (`idPlan` ASC) VISIBLE,
  INDEX `idSitio_idx` (`idSitio` ASC) VISIBLE,
  INDEX `idStatus_idx` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `Suscripciones_idPlan`
    FOREIGN KEY (`idPlan`)
    REFERENCES `ProyectoV1`.`Planes` (`idPlanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Suscripciones_idSitio`
    FOREIGN KEY (`idSitio`)
    REFERENCES `ProyectoV1`.`Sitios` (`idSitio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Suscripciones_idStatus`
    FOREIGN KEY (`idStatus`)
    REFERENCES `ProyectoV1`.`TiposStatus` (`idTiposStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Operarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Operarios` (
  `idOperarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  `idStatus` INT NOT NULL,
  PRIMARY KEY (`idOperarios`),
  INDEX `idStatus_idx` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `Operarios_idStatus`
    FOREIGN KEY (`idStatus`)
    REFERENCES `ProyectoV1`.`TiposStatus` (`idTiposStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Escaneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Escaneo` (
  `idEscaneo` INT NOT NULL AUTO_INCREMENT,
  `idTipoEscaneo` INT NOT NULL,
  `idSuscripcion` INT NOT NULL,
  `FechaEscaneo` DATETIME NOT NULL,
  `idStatus` INT NOT NULL,
  PRIMARY KEY (`idEscaneo`),
  INDEX `idTipoEscaneo_idx` (`idTipoEscaneo` ASC) VISIBLE,
  INDEX `idSuscripcion_idx` (`idSuscripcion` ASC) VISIBLE,
  INDEX `idStatus_idx` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `Escaneo_idTipoEscaneo`
    FOREIGN KEY (`idTipoEscaneo`)
    REFERENCES `ProyectoV1`.`TipoEscaneo` (`idTipoEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Escaneo_idSuscripcion`
    FOREIGN KEY (`idSuscripcion`)
    REFERENCES `ProyectoV1`.`Suscripciones` (`idSuscripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Escaneo_idStatus`
    FOREIGN KEY (`idStatus`)
    REFERENCES `ProyectoV1`.`TiposStatus` (`idTiposStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TipoOperacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TipoOperacion` (
  `idTipoOperacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idTipoOperacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`BitacoraEscaneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`BitacoraEscaneo` (
  `idBitacoraEscaneo` INT NOT NULL AUTO_INCREMENT,
  `idSitio` INT NOT NULL,
  `idOperario` INT NOT NULL,
  `idEscaneo` INT NOT NULL,
  `idTipoEscaneo` INT NOT NULL,
  `idOperacion` INT NOT NULL,
  `FechaEscaneo` DATETIME NOT NULL,
  `ResultadoAnterior` DECIMAL(10,2) NOT NULL,
  `ResultadoNuevo` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idBitacoraEscaneo`),
  INDEX `idSitio_idx` (`idSitio` ASC) VISIBLE,
  INDEX `idOperario_idx` (`idOperario` ASC) VISIBLE,
  INDEX `idEscaneo_idx` (`idEscaneo` ASC) VISIBLE,
  INDEX `idOperacion_idx` (`idOperacion` ASC) VISIBLE,
  INDEX `Bitacora_idTipoEscaneo_idx` (`idTipoEscaneo` ASC) VISIBLE,
  CONSTRAINT `Bitacora_idSitio`
    FOREIGN KEY (`idSitio`)
    REFERENCES `ProyectoV1`.`Sitios` (`idSitio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bitacora_idOperario`
    FOREIGN KEY (`idOperario`)
    REFERENCES `ProyectoV1`.`Operarios` (`idOperarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bitacora_idEscaneo`
    FOREIGN KEY (`idEscaneo`)
    REFERENCES `ProyectoV1`.`Escaneo` (`idEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bitacora_idOperacion`
    FOREIGN KEY (`idOperacion`)
    REFERENCES `ProyectoV1`.`TipoOperacion` (`idTipoOperacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bitacora_idTipoEscaneo`
    FOREIGN KEY (`idTipoEscaneo`)
    REFERENCES `ProyectoV1`.`TipoEscaneo` (`idTipoEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`MetodoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`MetodoPago` (
  `idMetodoPago` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMetodoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Pagos` (
  `idPagos` INT NOT NULL AUTO_INCREMENT,
  `idOrganizacion` INT NOT NULL,
  `idSuscripcion` INT NOT NULL,
  `Monto` DECIMAL(10,2) NOT NULL,
  `FechaPago` DATE NOT NULL,
  `idMetodoPago` INT NOT NULL,
  `idStatus` INT NOT NULL,
  PRIMARY KEY (`idPagos`),
  INDEX `idOrganizacion_idx` (`idOrganizacion` ASC) VISIBLE,
  INDEX `idSuscripcion_idx` (`idSuscripcion` ASC) VISIBLE,
  INDEX `idMetodoPago_idx` (`idMetodoPago` ASC) VISIBLE,
  INDEX `idStatus_idx` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `Pagos_idOrganizacion`
    FOREIGN KEY (`idOrganizacion`)
    REFERENCES `ProyectoV1`.`Organizacion` (`idOrganizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pagos_idSuscripcion`
    FOREIGN KEY (`idSuscripcion`)
    REFERENCES `ProyectoV1`.`Suscripciones` (`idSuscripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pagos_idMetodoPago`
    FOREIGN KEY (`idMetodoPago`)
    REFERENCES `ProyectoV1`.`MetodoPago` (`idMetodoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pagos_idStatus`
    FOREIGN KEY (`idStatus`)
    REFERENCES `ProyectoV1`.`TiposStatus` (`idTiposStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Plan_TipoEscaneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Plan_TipoEscaneo` (
  `idPlan` INT NOT NULL,
  `idTipoEscaneo` INT NOT NULL,
  PRIMARY KEY (`idPlan`, `idTipoEscaneo`),
  INDEX `PlanTipoEscaneo_idTipoEscaneo_idx` (`idTipoEscaneo` ASC) VISIBLE,
  CONSTRAINT `PlanTipoEscaneo_idPlan`
    FOREIGN KEY (`idPlan`)
    REFERENCES `ProyectoV1`.`Planes` (`idPlanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PlanTipoEscaneo_idTipoEscaneo`
    FOREIGN KEY (`idTipoEscaneo`)
    REFERENCES `ProyectoV1`.`TipoEscaneo` (`idTipoEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`OrganizacionDirecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`OrganizacionDirecciones` (
  `idOrganizacionDirecciones` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `idOrganizacion` INT NOT NULL,
  `idDireccion` INT NOT NULL,
  PRIMARY KEY (`idOrganizacionDirecciones`),
  INDEX `OrgDic_idOrganizacion_idx` (`idOrganizacion` ASC) VISIBLE,
  INDEX `OrgDic_idDirecciones_idx` (`idDireccion` ASC) VISIBLE,
  CONSTRAINT `OrgDic_idOrganizacion`
    FOREIGN KEY (`idOrganizacion`)
    REFERENCES `ProyectoV1`.`Organizacion` (`idOrganizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrgDic_idDirecciones`
    FOREIGN KEY (`idDireccion`)
    REFERENCES `ProyectoV1`.`Direcciones` (`idDirecciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`Plan_Calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`Plan_Calendar` (
  `idPlan_Calendar` INT NOT NULL AUTO_INCREMENT,
  `idPlan` INT NOT NULL,
  `idSuscripcion` INT NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NOT NULL,
  PRIMARY KEY (`idPlan_Calendar`),
  INDEX `Calendar_idPlanes_idx` (`idPlan` ASC) VISIBLE,
  INDEX `Calendar_idSuscripcion_idx` (`idSuscripcion` ASC) VISIBLE,
  CONSTRAINT `Calendar_idPlanes`
    FOREIGN KEY (`idPlan`)
    REFERENCES `ProyectoV1`.`Planes` (`idPlanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Calendar_idSuscripcion`
    FOREIGN KEY (`idSuscripcion`)
    REFERENCES `ProyectoV1`.`Suscripciones` (`idSuscripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TipoContacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TipoContacto` (
  `idTipoContacto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoContacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`InformacionContacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`InformacionContacto` (
  `idInformacionContacto` INT NOT NULL AUTO_INCREMENT,
  `idTipoContacto` INT NOT NULL,
  `idContacto` INT NOT NULL,
  `TipoEntidad` ENUM('Organizacion', 'Operario') NOT NULL,
  `Valor` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idInformacionContacto`),
  INDEX `InfoContac_idTipoContacto_idx` (`idTipoContacto` ASC) VISIBLE,
  CONSTRAINT `InfoContac_idTipoContacto`
    FOREIGN KEY (`idTipoContacto`)
    REFERENCES `ProyectoV1`.`TipoContacto` (`idTipoContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`TipoUnidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`TipoUnidad` (
  `idTipoUnidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoUnidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoV1`.`ResultadoEscaneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoV1`.`ResultadoEscaneo` (
  `idResultadoEscaneo` INT NOT NULL AUTO_INCREMENT,
  `idEscaneo` INT NOT NULL,
  `idTipoEscaneo` INT NOT NULL,
  `Valor` DECIMAL(10,2) NOT NULL,
  `idTipoUnidad` INT NOT NULL,
  PRIMARY KEY (`idResultadoEscaneo`),
  INDEX `Resultado_idEscaneo_idx` (`idEscaneo` ASC) VISIBLE,
  INDEX `Resultado_idTipoEscaneo_idx` (`idTipoEscaneo` ASC) VISIBLE,
  INDEX `Resultado_idUnidad_idx` (`idTipoUnidad` ASC) VISIBLE,
  CONSTRAINT `Resultado_idEscaneo`
    FOREIGN KEY (`idEscaneo`)
    REFERENCES `ProyectoV1`.`Escaneo` (`idEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Resultado_idTipoEscaneo`
    FOREIGN KEY (`idTipoEscaneo`)
    REFERENCES `ProyectoV1`.`TipoEscaneo` (`idTipoEscaneo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Resultado_idUnidad`
    FOREIGN KEY (`idTipoUnidad`)
    REFERENCES `ProyectoV1`.`TipoUnidad` (`idTipoUnidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
