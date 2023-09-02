-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema industria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema industria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `industria` DEFAULT CHARACTER SET utf8 ;
USE `industria` ;

-- -----------------------------------------------------
-- Table `industria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`clientes` (
  `num_cliente` INT NOT NULL,
  `id_direccion` VARCHAR(80) NULL,
  `saldo` VARCHAR(45) NULL,
  `limi_credito` VARCHAR(45) NULL,
  PRIMARY KEY (`num_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industria`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`direcciones` (
  `id_direccion` INT NOT NULL,
  `calle` VARCHAR(80) NULL,
  `comuna` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industria`.`fabricas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`fabricas` (
  `idfabrica` INT NOT NULL,
  `stock_articulo` INT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfabrica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industria`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`articulo` (
  `num_articulo` INT NOT NULL,
  `des_articulo` VARCHAR(45) NULL,
  `fabricas_idfabrica` INT NOT NULL,
  `clientes_num_cliente` INT NOT NULL,
  PRIMARY KEY (`num_articulo`, `fabricas_idfabrica`, `clientes_num_cliente`),
  INDEX `fk_articulo_fabricas1_idx` (`fabricas_idfabrica` ASC) VISIBLE,
  INDEX `fk_articulo_clientes1_idx` (`clientes_num_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_articulo_fabricas1`
    FOREIGN KEY (`fabricas_idfabrica`)
    REFERENCES `industria`.`fabricas` (`idfabrica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_clientes1`
    FOREIGN KEY (`clientes_num_cliente`)
    REFERENCES `industria`.`clientes` (`num_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`pedidos` (
  `idpedido` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `num_articulos` INT NOT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  `articulo_num_articulo` INT NOT NULL,
  `articulo_fabricas_idfabrica` INT NOT NULL,
  PRIMARY KEY (`idpedido`, `articulo_num_articulo`, `articulo_fabricas_idfabrica`),
  INDEX `fk_pedidos_articulo1_idx` (`articulo_num_articulo` ASC, `articulo_fabricas_idfabrica` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_articulo1`
    FOREIGN KEY (`articulo_num_articulo` , `articulo_fabricas_idfabrica`)
    REFERENCES `industria`.`articulo` (`num_articulo` , `fabricas_idfabrica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industria`.`clientes_has_direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `industria`.`clientes_has_direcciones` (
  `clientes_num_cliente` INT NOT NULL,
  `direcciones_id_direccion` INT NOT NULL,
  PRIMARY KEY (`clientes_num_cliente`, `direcciones_id_direccion`),
  INDEX `fk_clientes_has_direcciones_clientes_idx` (`clientes_num_cliente` ASC) VISIBLE,
  INDEX `fk_clientes_has_direcciones_direcciones1_idx` (`direcciones_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_has_direcciones_clientes`
    FOREIGN KEY (`clientes_num_cliente`)
    REFERENCES `industria`.`clientes` (`num_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_has_direcciones_direcciones1`
    FOREIGN KEY (`direcciones_id_direccion`)
    REFERENCES `industria`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
