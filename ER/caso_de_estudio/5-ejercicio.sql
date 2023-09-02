-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema medilaser
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medilaser
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `medilaser` DEFAULT CHARACTER SET utf8 ;
USE `medilaser` ;

-- -----------------------------------------------------
-- Table `medilaser`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medilaser`.`pacientes` (
  `id_paciente` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `poblacion` VARCHAR(45) NOT NULL,
  `municipio` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fec_nacimiento` DATE NOT NULL,
  `creado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medilaser`.`ingresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medilaser`.`ingresos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `id_medico` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `num_habitacion` INT NOT NULL,
  `cama` VARCHAR(45) NOT NULL,
  `fec_ingreso` DATE NOT NULL,
  `creado` TIMESTAMP NULL,
  PRIMARY KEY (`codigo`, `id_medico`, `id_paciente`),
  INDEX `fk_ingresos_medicos1_idx` (`id_medico` ASC) VISIBLE,
  INDEX `fk_ingresos_pacientes1_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_ingresos_medicos1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `medilaser`.`medicos` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresos_pacientes1`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `medilaser`.`pacientes` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medilaser`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medilaser`.`medicos` (
  `id_medico` INT NOT NULL,
  `ingresos_codigo` INT NOT NULL,
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP NULL,
  PRIMARY KEY (`id_medico`, `ingresos_codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_medicos_ingresos_idx` (`ingresos_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_medicos_ingresos`
    FOREIGN KEY (`ingresos_codigo`)
    REFERENCES `medilaser`.`ingresos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
