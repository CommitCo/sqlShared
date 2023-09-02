-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema automoviles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema automoviles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `automoviles` DEFAULT CHARACTER SET utf8 ;
USE `automoviles` ;

-- -----------------------------------------------------
-- Table `automoviles`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `automoviles`.`clientes` (
  `id_cliente` INT NULL AUTO_INCREMENT,
  `identificacion` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `automoviles`.`carros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `automoviles`.`carros` (
  `id_carro` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `matricula` VARCHAR(20) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` INT(4) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` DECIMAL NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_carro`, `id_cliente`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_carros_clientes1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_carros_clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `automoviles`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `automoviles`.`revisiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `automoviles`.`revisiones` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `id_carro` INT NOT NULL,
  `cam_filtro` ENUM("SI", "NO") NOT NULL COMMENT 'Cambio de filtro',
  `cam_aceite` ENUM("SI", "NO") NOT NULL,
  `cam_frenos` ENUM("SI", "NO") NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`, `id_carro`),
  INDEX `fk_revisiones_carros_idx` (`id_carro` ASC) VISIBLE,
  CONSTRAINT `fk_revisiones_carros`
    FOREIGN KEY (`id_carro`)
    REFERENCES `automoviles`.`carros` (`id_carro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
