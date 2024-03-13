-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2A` ;
USE `MER2A` ;

-- -----------------------------------------------------
-- Table `MER2A`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Pacient` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefon` INT(9) NULL,
  `Dir` VARCHAR(100) NULL,
  `Num_SS` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2A`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Metge` (
  `numero_colegiat` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `especialitat` VARCHAR(45) NULL,
  `carrec` VARCHAR(45) NULL,
  `telefon` INT(9) NULL,
  `dni` VARCHAR(9) NULL,
  PRIMARY KEY (`numero_colegiat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2A`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Consulta` (
  `ID` INT NOT NULL,
  `data` DATE NULL,
  `llit` VARCHAR(45) NULL,
  `planta` VARCHAR(45) NULL,
  `diagnostic` VARCHAR(45) NULL,
  `Pacient_id` INT NOT NULL,
  `Metge_numero_colegiat` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_id` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_numero_colegiat` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_id`)
    REFERENCES `MER2A`.`Pacient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_numero_colegiat`)
    REFERENCES `MER2A`.`Metge` (`numero_colegiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
