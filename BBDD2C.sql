-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Alumne` (
  `expedient` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(25) NULL,
  `cognoms` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` INT(9) NULL,
  `direccio` VARCHAR(100) NULL,
  `data_naixement` DATE NULL,
  PRIMARY KEY (`expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Departament` (
  `ID` VARCHAR(35) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descrip` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Assignatura` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descrip` VARCHAR(45) NULL,
  `crit_aval` VARCHAR(45) NULL,
  `obj` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Matricula` (
  `ID` INT NOT NULL,
  `nivell` VARCHAR(45) NULL,
  `data` DATE NULL,
  `curs` VARCHAR(45) NULL,
  `grup` VARCHAR(45) NULL,
  `Alumne_expedient` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_expedient` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_expedient`)
    REFERENCES `MER2C`.`Alumne` (`expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Professor` (
  `NIF` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `titulacio` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `correu` VARCHAR(45) NULL,
  `Departament_ID` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `MER2C`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`AssignaturaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`AssignaturaMatricula` (
  `ID` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `aula` VARCHAR(45) NULL,
  `calendari` VARCHAR(45) NULL,
  `Matricula_ID` INT NOT NULL,
  `Professor_NIF` VARCHAR(9) NOT NULL,
  `Assignatura_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_AssignaturaMatricula_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Professor1_idx` (`Professor_NIF` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Assignatura1_idx` (`Assignatura_ID` ASC) VISIBLE,
  CONSTRAINT `fk_AssignaturaMatricula_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `MER2C`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Professor1`
    FOREIGN KEY (`Professor_NIF`)
    REFERENCES `MER2C`.`Professor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Assignatura1`
    FOREIGN KEY (`Assignatura_ID`)
    REFERENCES `MER2C`.`Assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
