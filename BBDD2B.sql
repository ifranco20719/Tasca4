-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`pelicules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`pelicules` (
  `isbn` INT(20) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `protagonista` VARCHAR(45) NULL,
  `actor_secundari` VARCHAR(45) NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`tarifa` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`cine` (
  `nif` INT(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  `num_sales` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `horari` VARCHAR(45) NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`projeccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`projeccions` (
  `id` INT NOT NULL,
  `sala` VARCHAR(45) NOT NULL,
  `hora_inici` TIME NOT NULL,
  `hora_fi` TIME NOT NULL,
  `cine_nif` INT(9) NOT NULL,
  `tarifa_ID` INT NOT NULL,
  `pelicules_isbn` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projeccions_cine_idx` (`cine_nif` ASC) VISIBLE,
  INDEX `fk_projeccions_tarifa1_idx` (`tarifa_ID` ASC) VISIBLE,
  INDEX `fk_projeccions_pelicules1_idx` (`pelicules_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_projeccions_cine`
    FOREIGN KEY (`cine_nif`)
    REFERENCES `MER2B`.`cine` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeccions_tarifa1`
    FOREIGN KEY (`tarifa_ID`)
    REFERENCES `MER2B`.`tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeccions_pelicules1`
    FOREIGN KEY (`pelicules_isbn`)
    REFERENCES `MER2B`.`pelicules` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
