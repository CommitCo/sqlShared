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
  `id_provedore` INT NOT NULL,
  `rut` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `pag_web` VARCHAR(45) NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_provedore`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`direccion` (
  `id_direccion` INT NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `comuna` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`clientes` (
  `id_cliente` INT NOT NULL,
  `rut` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion_id_direccion` INT NOT NULL,
  PRIMARY KEY (`id_cliente`, `direccion_id_direccion`),
  INDEX `fk_clientes_direccion_idx` (`direccion_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_direccion`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `empresa`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`telefonos` (
  `id_telefono` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_telefono`, `id_cliente`),
  INDEX `fk_telefonos_clientes1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_telefonos_clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `empresa`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`productos` (
  `id_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `stock` VARCHAR(45) NOT NULL,
  `nom_provedor` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `provedores_id_provedore` INT NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `provedores_id_provedore`, `categoria_id_categoria`),
  INDEX `fk_productos_provedores1_idx` (`provedores_id_provedore` ASC) VISIBLE,
  INDEX `fk_productos_categoria1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_provedores1`
    FOREIGN KEY (`provedores_id_provedore`)
    REFERENCES `empresa`.`provedores` (`id_provedore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `empresa`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa`.`ventas` (
  `id_venta` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `descuento` VARCHAR(45) NOT NULL,
  `monto_final` DECIMAL NOT NULL,
  `precio` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL,
  `creado` TIMESTAMP NULL,
  `productos_id_producto` INT NOT NULL,
  `productos_provedores_id_provedore` INT NOT NULL,
  `productos_categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_venta`, `id_cliente`, `productos_id_producto`, `productos_provedores_id_provedore`, `productos_categoria_id_categoria`),
  INDEX `fk_ventas_clientes1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_ventas_productos1_idx` (`productos_id_producto` ASC, `productos_provedores_id_provedore` ASC, `productos_categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `empresa`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_productos1`
    FOREIGN KEY (`productos_id_producto` , `productos_provedores_id_provedore` , `productos_categoria_id_categoria`)
    REFERENCES `empresa`.`productos` (`id_producto` , `provedores_id_provedore` , `categoria_id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
