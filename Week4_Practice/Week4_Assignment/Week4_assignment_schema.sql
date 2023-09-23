-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inha_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inha_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inha_DB` DEFAULT CHARACTER SET utf8 ;
USE `Inha_DB` ;

-- -----------------------------------------------------
-- Table `Inha_DB`.`Building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha_DB`.`Building` (
  `Bid` INT NOT NULL,
  `BName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Bid`),
  UNIQUE INDEX `Bid_UNIQUE` (`Bid` ASC) VISIBLE,
  UNIQUE INDEX `BName_UNIQUE` (`BName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha_DB`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha_DB`.`Department` (
  `Did` INT NOT NULL,
  `Dname` VARCHAR(30) NOT NULL,
  `DEmail` VARCHAR(45) NOT NULL,
  `DPhoneNumber` CHAR(11) NULL,
  `Building_Bid` INT NOT NULL,
  PRIMARY KEY (`Did`, `Dname`),
  UNIQUE INDEX `Did_UNIQUE` (`Did` ASC) VISIBLE,
  UNIQUE INDEX `DEmail_UNIQUE` (`DEmail` ASC) VISIBLE,
  UNIQUE INDEX `Dname_UNIQUE` (`Dname` ASC) VISIBLE,
  UNIQUE INDEX `DPhoneNumber_UNIQUE` (`DPhoneNumber` ASC) VISIBLE,
  INDEX `fk_Department_Building1_idx` (`Building_Bid` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Building1`
    FOREIGN KEY (`Building_Bid`)
    REFERENCES `Inha_DB`.`Building` (`Bid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha_DB`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha_DB`.`Student` (
  `Sid` INT NOT NULL,
  `Sname` VARCHAR(30) NOT NULL,
  `SEmail` VARCHAR(45) NULL,
  `SPhoneNumber` CHAR(11) NULL,
  `Department_Did` INT NOT NULL,
  `Major` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Sid`),
  UNIQUE INDEX `Sid_UNIQUE` (`Sid` ASC) VISIBLE,
  UNIQUE INDEX `SEmail_UNIQUE` (`SEmail` ASC) VISIBLE,
  UNIQUE INDEX `SPhoneNumber_UNIQUE` (`SPhoneNumber` ASC) VISIBLE,
  INDEX `fk_Student_Department1_idx` (`Department_Did` ASC, `Major` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Department1`
    FOREIGN KEY (`Department_Did` , `Major`)
    REFERENCES `Inha_DB`.`Department` (`Did` , `Dname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha_DB`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha_DB`.`Room` (
  `Rid` INT NOT NULL,
  `Rname` VARCHAR(30) NOT NULL,
  `Capacity` INT NOT NULL,
  `Building_Bid` INT NOT NULL,
  UNIQUE INDEX `Rid_UNIQUE` (`Rid` ASC) VISIBLE,
  PRIMARY KEY (`Rid`),
  UNIQUE INDEX `Rname_UNIQUE` (`Rname` ASC) VISIBLE,
  INDEX `fk_Room_Building1_idx` (`Building_Bid` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Building1`
    FOREIGN KEY (`Building_Bid`)
    REFERENCES `Inha_DB`.`Building` (`Bid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
