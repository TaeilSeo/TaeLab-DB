-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema taelab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taelab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taelab` DEFAULT CHARACTER SET utf8 ;
USE `taelab` ;

-- -----------------------------------------------------
-- Table `taelab`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`user` (
  `userId` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taelab`.`asset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`asset` (
  `assetId` INT NOT NULL,
  `symbol` VARCHAR(45) NOT NULL,
  `assetName` VARCHAR(45) NOT NULL,
  `exchange` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  `sector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`assetId`),
  UNIQUE INDEX `assetId_UNIQUE` (`assetId` ASC) VISIBLE,
  UNIQUE INDEX `symbol_UNIQUE` (`symbol` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taelab`.`watchlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`watchlist` (
  `watchlistId` VARCHAR(45) NOT NULL,
  `assetId` INT NOT NULL,
  `userId` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`watchlistId`),
  INDEX `fk_user_has_asset_asset1_idx` (`assetId` ASC) VISIBLE,
  INDEX `fk_user_has_asset_user_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_asset_user`
    FOREIGN KEY (`userId`)
    REFERENCES `taelab`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_asset_asset1`
    FOREIGN KEY (`assetId`)
    REFERENCES `taelab`.`asset` (`assetId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;