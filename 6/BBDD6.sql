-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avio` (
  `ID` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `capacitat` VARCHAR(45) NULL,
  `autonomia` VARCHAR(45) NULL,
  `data_fabricacio` VARCHAR(45) NULL,
  `data_mort` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vol` (
  `ID` INT NOT NULL,
  `num_vol` VARCHAR(45) NULL,
  `origen` VARCHAR(45) NULL,
  `desti` VARCHAR(45) NULL,
  `data_sortida` DATE NULL,
  `hora_sortida` VARCHAR(45) NULL,
  `data_arribada` DATE NULL,
  `hora_arribada` VARCHAR(45) NULL,
  `Avio_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vol_Avio_idx` (`Avio_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio`
    FOREIGN KEY (`Avio_ID`)
    REFERENCES `MER6`.`Avio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Passatger` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `dir` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reserves` (
  `ID` INT NOT NULL,
  `data` DATE NULL,
  `import` VARCHAR(45) NULL,
  `num_asiento` VARCHAR(45) NULL,
  `necessitats` VARCHAR(45) NULL,
  `Vol_ID` INT NULL,
  `Passatger_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Reserves_Vol1_idx` (`Vol_ID` ASC) VISIBLE,
  INDEX `fk_Reserves_Passatger1_idx` (`Passatger_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserves_Vol1`
    FOREIGN KEY (`Vol_ID`)
    REFERENCES `MER6`.`Vol` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserves_Passatger1`
    FOREIGN KEY (`Passatger_ID`)
    REFERENCES `MER6`.`Passatger` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
