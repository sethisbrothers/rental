-- -----------------------------------------------------
-- Schema rental
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rental` ;

-- -----------------------------------------------------
-- Schema rental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rental` DEFAULT CHARACTER SET latin1 ;
USE `rental` ;

-- -----------------------------------------------------
-- Table `rental`.`catégorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`catégorie` ;

CREATE TABLE IF NOT EXISTS `rental`.`catégorie` (
  `idcatégorie` INT(11) NOT NULL AUTO_INCREMENT,
  `catégories` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idcatégorie`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rental`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`clients` ;

CREATE TABLE IF NOT EXISTS `rental`.`clients` (
  `idclients` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(50) NOT NULL,
  `Prenom` VARCHAR(100) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idclients`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rental`.`films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`films` ;

CREATE TABLE IF NOT EXISTS `rental`.`films` (
  `idfilms` INT(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(50) NOT NULL,
  `date_de_sortie` YEAR(4) NOT NULL,
  `durée` TIME NOT NULL,
  `réalisateur` VARCHAR(100) NOT NULL,
  `catégorie_idcatégorie` INT(11) NOT NULL,
  PRIMARY KEY (`idfilms`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_films_catégorie1_idx` ON `rental`.`films` (`catégorie_idcatégorie` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `rental`.`historique`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`historique` ;

CREATE TABLE IF NOT EXISTS `rental`.`historique` (
  `idHistorique` INT(11) NOT NULL,
  `date_de_création` DATE NOT NULL,
  `date_de_modification` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `films_idfilms` INT(11) NOT NULL,
  `clients_idclients` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorique`, `films_idfilms`, `clients_idclients`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_historique_films1_idx` ON `rental`.`historique` (`films_idfilms` ASC) VISIBLE;

CREATE INDEX `fk_historique_clients1_idx` ON `rental`.`historique` (`clients_idclients` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `rental`.`loué`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`loué` ;

CREATE TABLE IF NOT EXISTS `rental`.`loué` (
  `idloué` INT(11) NOT NULL AUTO_INCREMENT,
  `date_de_location` DATETIME NOT NULL,
  `date_de_retour` DATETIME NOT NULL,
  `clients_idclients` INT(11) NOT NULL,
  `films_idfilms` INT(11) NOT NULL,
  PRIMARY KEY (`idloué`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_loué_clients_idx` ON `rental`.`loué` (`clients_idclients` ASC) VISIBLE;

CREATE INDEX `fk_loué_films1_idx` ON `rental`.`loué` (`films_idfilms` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `rental`.`paiement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental`.`paiement` ;

CREATE TABLE IF NOT EXISTS `rental`.`paiement` (
  `idPaiement` INT(11) NOT NULL AUTO_INCREMENT,
  `date_de_paiement` DATETIME NOT NULL,
  `description` TEXT NOT NULL,
  `montant` FLOAT NOT NULL,
  `clients_idclients` INT(11) NOT NULL,
  PRIMARY KEY (`idPaiement`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_paiement_clients1_idx` ON `rental`.`paiement` (`clients_idclients` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
