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
-- Table `taelab`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`stock` (
  `stockId` INT NOT NULL,
  `symbol` VARCHAR(45) NOT NULL,
  `company` VARCHAR(45) NOT NULL,
  `exchange` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  `sector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`stockId`),
  UNIQUE INDEX `assetId_UNIQUE` (`stockId` ASC) VISIBLE,
  UNIQUE INDEX `symbol_UNIQUE` (`symbol` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taelab`.`watchlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`watchlist` (
  `watchlistId` VARCHAR(45) NOT NULL,
  `stockId` INT NOT NULL,
  `userId` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`watchlistId`),
  INDEX `fk_user_has_asset_asset1_idx` (`stockId` ASC) VISIBLE,
  INDEX `fk_user_has_asset_user_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_asset_user`
    FOREIGN KEY (`userId`)
    REFERENCES `taelab`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_asset_asset1`
    FOREIGN KEY (`stockId`)
    REFERENCES `taelab`.`stock` (`stockId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taelab`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taelab`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taelab`.`news` (
  `newsId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `subtitle` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `categoryId` INT NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  `url` VARCHAR(100) NULL,
  `regdate` TIMESTAMP NULL DEFAULT now(),
  PRIMARY KEY (`newsId`),
  INDEX `fk_news_category1_idx` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `fk_news_category1`
    FOREIGN KEY (`categoryId`)
    REFERENCES `taelab`.`category` (`categoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
