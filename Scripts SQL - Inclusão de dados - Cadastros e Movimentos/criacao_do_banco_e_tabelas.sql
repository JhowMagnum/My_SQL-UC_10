-- drop database copa_mundo;
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `copa_mundo` 
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;
USE `copa_mundo` ;


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo` (
  `idgrupo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idgrupo`)
  ) default charset = utf8;
  
  
  -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estadio` (
  `idestadio` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `localização` VARCHAR(45) NULL,
  `capacidade` INT NULL,
  PRIMARY KEY (`idestadio`)
  ) default charset = utf8;




-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` INT NOT NULL,
  `selecao` VARCHAR(45) NULL,
  `continente` VARCHAR(45) NULL,
  `tecnico` VARCHAR(45) NULL,
  `pontos` INT NULL,
  `vitorias` INT NULL,
  `empates` INT NULL,
  `derrotas` INT NULL,
  `golspro` INT NULL,
  `golscontra` INT NULL,
  `grupo_idgrupo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpais`),
	FOREIGN KEY (`grupo_idgrupo`) REFERENCES `copa_mundo`.`grupo` (`idgrupo`)
) default charset = utf8;



-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jogos` (
  `idrodada` INT NOT NULL,
  `data` DATETIME NULL,
  `estadio_idestadio` INT NOT NULL,
  `pais_idpais_1` INT NOT NULL,
  `pais_idpais_2` INT NOT NULL,
  `gols_idpais_1` INT NULL,
  `gols_idpais_2` INT NULL,
  `publico` INT NULL,
  PRIMARY KEY (`idrodada`),
    FOREIGN KEY (`estadio_idestadio`) REFERENCES `copa_mundo`.`estadio` (`idestadio`),
    FOREIGN KEY (`pais_idpais_1`) REFERENCES `copa_mundo`.`pais` (`idpais`),
	FOREIGN KEY (`pais_idpais_2`) REFERENCES `copa_mundo`.`pais` (`idpais`)
  ) default charset = utf8;

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jogador` (
  `idjogador` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `camisa` INT NULL,
  `posicao` VARCHAR(45) NULL,
  `pais_idpais`INT NOT NULL,
  `situacao` VARCHAR(45) NULL,
  PRIMARY KEY (`idjogador`),
	FOREIGN KEY (`pais_idpais`) REFERENCES `copa_mundo`.`pais` (`idpais`)
 ) default charset = utf8;


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartao` (
  `idcartao` INT NOT NULL AUTO_INCREMENT,
  `jogos_idrodada` INT NOT NULL,
  `jogador_idjogador` INT NOT NULL,
  `amarelo` BOOLEAN NULL,
  `vermelho` BOOLEAN NULL,
  `tempo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcartao`),
    FOREIGN KEY (`jogos_idrodada`) REFERENCES `copa_mundo`.`jogos` (`idrodada`),
    FOREIGN KEY (`jogador_idjogador`) REFERENCES `copa_mundo`.`jogador` (`idjogador`)
    ) default charset = utf8;


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gols` (
  `idgols` INT NOT NULL AUTO_INCREMENT,
  `jogos_idrodada` INT NOT NULL,
  `jogador_idjogador` INT NOT NULL,
  `tempo` VARCHAR(45) NULL,
  PRIMARY KEY (`idgols`),
    FOREIGN KEY (`jogador_idjogador`) REFERENCES `copa_mundo`.`jogador` (`idjogador`),
	FOREIGN KEY (`jogos_idrodada`) REFERENCES `copa_mundo`.`jogos` (`idrodada`)
) default charset = utf8;


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `substituicao` (
  `idsubstituicao` INT NOT NULL AUTO_INCREMENT,
  `jogos_idrodada` INT NOT NULL,
  `jogador_idjogador_sai` INT NOT NULL,
  `jogador_idjogador_entra` INT NOT NULL,
  `tempo` VARCHAR(45) NULL,
  PRIMARY KEY (`idsubstituicao`),
    FOREIGN KEY (`jogos_idrodada`) REFERENCES `copa_mundo`.`jogos` (`idrodada`),
	FOREIGN KEY (`jogador_idjogador_sai`) REFERENCES `copa_mundo`.`jogador` (`idjogador`),
    FOREIGN KEY (`jogador_idjogador_entra`) REFERENCES `copa_mundo`.`jogador` (`idjogador`)
) default charset = utf8;


-- ----------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------




