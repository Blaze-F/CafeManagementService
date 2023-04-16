-- MySQL Script generated by MySQL Workbench
-- Sun Apr 16 23:07:57 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cafe_service
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cafe_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafe_service` DEFAULT CHARACTER SET utf8mb4 ;
USE `cafe_service` ;

-- -----------------------------------------------------
-- Table `cafe_service`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafe_service`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) NOT NULL,
  `updated_at` DATETIME(6) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(13) NOT NULL,
  `name` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_phone_fcd7f7da_uniq` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cafe_service`.`cafe_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafe_service`.`cafe_product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) NOT NULL,
  `updated_at` DATETIME(6) NOT NULL,
  `name` VARCHAR(20) CHARACTER SET 'utf8mb4' NOT NULL,
  `price` INT(11) NOT NULL,
  `cost` INT(11) NOT NULL,
  `barcode` VARCHAR(13) CHARACTER SET 'latin1' NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  `description` VARCHAR(200) CHARACTER SET 'latin1' NOT NULL,
  `size` VARCHAR(1) CHARACTER SET 'latin1' NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cafe_product_user_id_622a3319_fk_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `cafe_product_user_id_622a3319_fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `cafe_service`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 83
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;