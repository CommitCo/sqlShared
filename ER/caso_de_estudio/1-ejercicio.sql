-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empresa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empresa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empresa` DEFAULT CHARACTER SET utf8 ;
USE `empresa` ;

-- -----------------------------------------------------
-- Table `empresa`.`provedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`provedores` (
  `nit` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `creado` TIMESTAMP NULL,
  `productos_codigo` INT NOT NULL,
  PRIMARY KEY (`nit`, `productos_codigo`),
  INDEX `fk_provedores_productos1_idx` (`productos_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_provedores_productos1`
    FOREIGN KEY (`productos_codigo`)
    REFERENCES `empresa`.`productos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`productos` (
  `codigo` INT NOT NULL,
  `clientes_idcliente` INT NOT NULL,
  `provedores_nit` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `precio` DECIMAL NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`, `clientes_idcliente`, `provedores_nit`),
  INDEX `fk_productos_clientes_idx` (`clientes_idcliente` ASC) VISIBLE,
  INDEX `fk_productos_provedores1_idx` (`provedores_nit` ASC) VISIBLE,
  CONSTRAINT `fk_productos_clientes`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `empresa`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_provedores1`
    FOREIGN KEY (`provedores_nit`)
    REFERENCES `empresa`.`provedores` (`nit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`clientes` (
  `idcliente` INT NOT NULL,
  `productos_codigo` INT NOT NULL,
  `identificacion` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `fech_nacimiento` DATE NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcliente`, `productos_codigo`),
  INDEX `fk_clientes_productos1_idx` (`productos_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_productos1`
    FOREIGN KEY (`productos_codigo`)
    REFERENCES `empresa`.`productos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
