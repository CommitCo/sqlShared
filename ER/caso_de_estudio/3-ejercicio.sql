-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema instituto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema instituto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `instituto` DEFAULT CHARACTER SET utf8 ;
USE `instituto` ;

-- -----------------------------------------------------
-- Table `instituto`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`alumnos` (
  `id_estudiante` INT NOT NULL,
  `num_expe` INT NOT NULL COMMENT 'Numero de expedientes',
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instituto`.`modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`modulos` (
  `id_modulo` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `id_estudiante` INT NOT NULL,
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modulo`, `id_profesor`, `id_estudiante`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_modulos_profesores_idx` (`id_profesor` ASC) VISIBLE,
  INDEX `fk_modulos_alumnos1_idx` (`id_estudiante` ASC) VISIBLE,
  CONSTRAINT `fk_modulos_profesores`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `instituto`.`profesores` (`id_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_modulos_alumnos1`
    FOREIGN KEY (`id_estudiante`)
    REFERENCES `instituto`.`alumnos` (`id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instituto`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituto`.`profesores` (
  `id_profesor` INT NOT NULL,
  `id_modulo` INT NOT NULL,
  `dni` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_profesor`, `id_modulo`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  INDEX `fk_profesores_modulos1_idx` (`id_modulo` ASC) VISIBLE,
  CONSTRAINT `fk_profesores_modulos1`
    FOREIGN KEY (`id_modulo`)
    REFERENCES `instituto`.`modulos` (`id_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
