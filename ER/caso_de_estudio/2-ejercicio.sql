-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema transportista
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema transportista
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `transportista` DEFAULT CHARACTER SET utf8 ;
USE `transportista` ;

-- -----------------------------------------------------
-- Table `transportista`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportista`.`provincias` (
  `idprovincia` INT NOT NULL,
  `idpaquete` INT NOT NULL,
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `creado` TIMESTAMP NULL,
  PRIMARY KEY (`idprovincia`, `idpaquete`),
  INDEX `fk_provincias_paquetes1_idx` (`idpaquete` ASC) VISIBLE,
  CONSTRAINT `fk_provincias_paquetes1`
    FOREIGN KEY (`idpaquete`)
    REFERENCES `transportista`.`paquetes` (`idpaquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportista`.`paquetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportista`.`paquetes` (
  `idpaquete` INT NOT NULL,
  `idcamionero` INT NOT NULL,
  `idprovincia` INT NOT NULL,
  `codigo` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `destinario` VARCHAR(80) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NULL,
  PRIMARY KEY (`idpaquete`, `idcamionero`, `idprovincia`),
  INDEX `fk_paquetes_camioneros_idx` (`idcamionero` ASC) VISIBLE,
  INDEX `fk_paquetes_provincias2_idx` (`idprovincia` ASC) VISIBLE,
  CONSTRAINT `fk_paquetes_camioneros`
    FOREIGN KEY (`idcamionero`)
    REFERENCES `transportista`.`camioneros` (`idcamionero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paquetes_provincias2`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `transportista`.`provincias` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportista`.`camiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportista`.`camiones` (
  `idcamion` INT NOT NULL,
  `idcamionero` INT NOT NULL,
  `matricula` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcamion`, `idcamionero`),
  INDEX `fk_camiones_camioneros1_idx` (`idcamionero` ASC) VISIBLE,
  CONSTRAINT `fk_camiones_camioneros1`
    FOREIGN KEY (`idcamionero`)
    REFERENCES `transportista`.`camioneros` (`idcamionero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportista`.`camioneros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportista`.`camioneros` (
  `idcamionero` INT NOT NULL,
  `idpaquete` INT NOT NULL,
  `idcamion` INT NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `salario` DECIMAL NULL,
  `poblacion` VARCHAR(100) NULL,
  `creado` TIMESTAMP NULL,
  PRIMARY KEY (`idcamionero`, `idpaquete`, `idcamion`),
  INDEX `fk_camioneros_paquetes1_idx` (`idpaquete` ASC) VISIBLE,
  INDEX `fk_camioneros_camiones1_idx` (`idcamion` ASC) VISIBLE,
  CONSTRAINT `fk_camioneros_paquetes1`
    FOREIGN KEY (`idpaquete`)
    REFERENCES `transportista`.`paquetes` (`idpaquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camioneros_camiones1`
    FOREIGN KEY (`idcamion`)
    REFERENCES `transportista`.`camiones` (`idcamion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
