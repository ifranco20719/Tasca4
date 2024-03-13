-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`tipus_polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`tipus_polissa` (
  `idtipus_polissa` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipus_polissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`client` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `VIP` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`venedor` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `DIR` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`polissa` (
  `num_polissa` INT NOT NULL,
  `preu_anual` VARCHAR(45) NULL,
  `tipus_pagament` VARCHAR(45) NULL,
  `data_contracte` DATE NULL,
  `client_DNI` VARCHAR(9) NOT NULL,
  `venedor_DNI` VARCHAR(9) NOT NULL,
  `tipus_polissa_idtipus_polissa` INT NOT NULL,
  PRIMARY KEY (`num_polissa`, `client_DNI`, `venedor_DNI`, `tipus_polissa_idtipus_polissa`),
  INDEX `fk_polissa_client_idx` (`client_DNI` ASC) VISIBLE,
  INDEX `fk_polissa_venedor1_idx` (`venedor_DNI` ASC) VISIBLE,
  INDEX `fk_polissa_tipus_polissa1_idx` (`tipus_polissa_idtipus_polissa` ASC) VISIBLE,
  CONSTRAINT `fk_polissa_client`
    FOREIGN KEY (`client_DNI`)
    REFERENCES `MER4`.`client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polissa_venedor1`
    FOREIGN KEY (`venedor_DNI`)
    REFERENCES `MER4`.`venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polissa_tipus_polissa1`
    FOREIGN KEY (`tipus_polissa_idtipus_polissa`)
    REFERENCES `MER4`.`tipus_polissa` (`idtipus_polissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
