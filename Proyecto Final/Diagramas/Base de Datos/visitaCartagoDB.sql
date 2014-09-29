SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoUsuario` (
  `idTipoUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(70) NOT NULL,
  `Password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarioxtipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarioxtipo` (
  `idusuarioxtipo` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  `TipoUsuario_idTipoUsuario` INT NOT NULL,
  PRIMARY KEY (`idusuarioxtipo`),
  INDEX `fk_usuarioxtipo_Usuario1_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_usuarioxtipo_TipoUsuario1_idx` (`TipoUsuario_idTipoUsuario` ASC),
  CONSTRAINT `fk_usuarioxtipo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioxtipo_TipoUsuario1`
    FOREIGN KEY (`TipoUsuario_idTipoUsuario`)
    REFERENCES `mydb`.`TipoUsuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Anuncio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Anuncio` (
  `idAnuncio` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(500) NOT NULL,
  `likes` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Ubicacion` VARCHAR(200) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAnuncio`),
  INDEX `fk_Anuncio_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Anuncio_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consumidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consumidor` (
  `idConsumidor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Cedula` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConsumidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservacion` (
  `idReservacion` INT NOT NULL AUTO_INCREMENT,
  `Anuncio_idAnuncio` INT NOT NULL,
  `CantidadPersonas` INT NOT NULL,
  `Consumidor_idConsumidor` INT NOT NULL,
  PRIMARY KEY (`idReservacion`),
  INDEX `fk_Reservacion_Anuncio1_idx` (`Anuncio_idAnuncio` ASC),
  INDEX `fk_Reservacion_Consumidor1_idx` (`Consumidor_idConsumidor` ASC),
  CONSTRAINT `fk_Reservacion_Anuncio1`
    FOREIGN KEY (`Anuncio_idAnuncio`)
    REFERENCES `mydb`.`Anuncio` (`idAnuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservacion_Consumidor1`
    FOREIGN KEY (`Consumidor_idConsumidor`)
    REFERENCES `mydb`.`Consumidor` (`idConsumidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CodigoReservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CodigoReservacion` (
  `idCodigoReservacion` INT NOT NULL AUTO_INCREMENT,
  `Codigo` VARCHAR(45) NOT NULL,
  `Reservacion_idReservacion` INT NOT NULL,
  PRIMARY KEY (`idCodigoReservacion`),
  INDEX `fk_CodigoReservacion_Reservacion1_idx` (`Reservacion_idReservacion` ASC),
  CONSTRAINT `fk_CodigoReservacion_Reservacion1`
    FOREIGN KEY (`Reservacion_idReservacion`)
    REFERENCES `mydb`.`Reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ubicacion` (
  `idUbicacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUbicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idtipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`anuncioxTipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`anuncioxTipo` (
  `idanuncioxTipo` INT NOT NULL AUTO_INCREMENT,
  `Anuncio_idAnuncio` INT NOT NULL,
  `Tipo_idtipo` INT NOT NULL,
  PRIMARY KEY (`idanuncioxTipo`),
  INDEX `fk_anuncioxTipo_Anuncio1_idx` (`Anuncio_idAnuncio` ASC),
  INDEX `fk_anuncioxTipo_Tipo1_idx` (`Tipo_idtipo` ASC),
  CONSTRAINT `fk_anuncioxTipo_Anuncio1`
    FOREIGN KEY (`Anuncio_idAnuncio`)
    REFERENCES `mydb`.`Anuncio` (`idAnuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anuncioxTipo_Tipo1`
    FOREIGN KEY (`Tipo_idtipo`)
    REFERENCES `mydb`.`Tipo` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`anuncioxUbicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`anuncioxUbicacion` (
  `idanuncioxUbicacion` INT NOT NULL AUTO_INCREMENT,
  `Anuncio_idAnuncio` INT NOT NULL,
  `Ubicacion_idUbicacion` INT NOT NULL,
  PRIMARY KEY (`idanuncioxUbicacion`),
  INDEX `fk_anuncioxUbicacion_Anuncio1_idx` (`Anuncio_idAnuncio` ASC),
  INDEX `fk_anuncioxUbicacion_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC),
  CONSTRAINT `fk_anuncioxUbicacion_Anuncio1`
    FOREIGN KEY (`Anuncio_idAnuncio`)
    REFERENCES `mydb`.`Anuncio` (`idAnuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anuncioxUbicacion_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `mydb`.`Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Consumidor_idConsumidor` INT NOT NULL,
  PRIMARY KEY (`idTelefono`),
  INDEX `fk_Telefono_Consumidor1_idx` (`Consumidor_idConsumidor` ASC),
  CONSTRAINT `fk_Telefono_Consumidor1`
    FOREIGN KEY (`Consumidor_idConsumidor`)
    REFERENCES `mydb`.`Consumidor` (`idConsumidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
