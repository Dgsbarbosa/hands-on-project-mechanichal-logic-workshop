-- Criação do banco de dados
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE = InnoDB;

-- Tabela Veiculo
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Placa` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Ano` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC),
  INDEX `fk_Veiculo_Cliente_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Veiculo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tabela Mecânico
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico` (
  `idMecânico` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecânico`)
) ENGINE = InnoDB;

-- Tabela Equipe
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Nome da Equipe` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipe`)
) ENGINE = InnoDB;

-- Tabela Ordem de Serviço
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem_de_Serviço` (
  `idOrdem_de_Serviço` INT NOT NULL AUTO_INCREMENT,
  `Data_emissao` DATE NULL,
  `Data_conclusao` DATE NULL,
  `Status` VARCHAR(45) NULL,
  `Valor_Total` FLOAT NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`idOrdem_de_Serviço`),
  INDEX `fk_Ordem_de_Serviço_Veiculo1_idx` (`Veiculo_idVeiculo` ASC),
  INDEX `fk_Ordem_de_Serviço_Equipe1_idx` (`Equipe_idEquipe` ASC),
  CONSTRAINT `fk_Ordem_de_Serviço_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `mydb`.`Veiculo` (`idVeiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ordem_de_Serviço_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tabela Serviço
CREATE TABLE IF NOT EXISTS `mydb`.`Serviço` (
  `idServiço` INT NOT NULL AUTO_INCREMENT,
  `Descrição` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idServiço`)
) ENGINE = InnoDB;

-- Tabela Peça
CREATE TABLE IF NOT EXISTS `mydb`.`Peça` (
  `idPeça` INT NOT NULL AUTO_INCREMENT,
  `Descrição` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeça`)
) ENGINE = InnoDB;

-- Tabela Equipe_has_Mecânico (Relacionamento entre Equipe e Mecânico)
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe_has_Mecânico` (
  `Equipe_idEquipe` INT NOT NULL,
  `Mecânico_idMecânico` INT NOT NULL,
  PRIMARY KEY (`Equipe_idEquipe`, `Mecânico_idMecânico`),
  INDEX `fk_Equipe_has_Mecânico_Mecânico1_idx` (`Mecânico_idMecânico` ASC),
  INDEX `fk_Equipe_has_Mecânico_Equipe1_idx` (`Equipe_idEquipe` ASC),
  CONSTRAINT `fk_Equipe_has_Mecânico_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Equipe_has_Mecânico_Mecânico1`
    FOREIGN KEY (`Mecânico_idMecânico`)
    REFERENCES `mydb`.`Mecânico` (`idMecânico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tabela Ordem_de_Serviço_has_Serviço (Relacionamento entre Ordem de Serviço e Serviço)
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem_de_Serviço_has_Serviço` (
  `Ordem_de_Serviço_idOrdem_de_Serviço` INT NOT NULL,
  `Serviço_idServiço` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_idOrdem_de_Serviço`, `Serviço_idServiço`),
  INDEX `fk_Ordem_de_Serviço_has_Serviço_Serviço1_idx` (`Serviço_idServiço` ASC),
  INDEX `fk_Ordem_de_Serviço_has_Serviço_Ordem_de_Serviço1_idx` (`Ordem_de_Serviço_idOrdem_de_Serviço` ASC),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Serviço_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_idOrdem_de_Serviço`)
    REFERENCES `mydb`.`Ordem_de_Serviço` (`idOrdem_de_Serviço`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Serviço_Serviço1`
    FOREIGN KEY (`Serviço_idServiço`)
    REFERENCES `mydb`.`Serviço` (`idServiço`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tabela Ordem_de_Serviço_has_Peça (Relacionamento entre Ordem de Serviço e Peça)
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem_de_Serviço_has_Peça` (
  `Ordem_de_Serviço_idOrdem_de_Serviço` INT NOT NULL,
  `Peça_idPeça` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_idOrdem_de_Serviço`, `Peça_idPeça`),
  INDEX `fk_Ordem_de_Serviço_has_Peça_Peça1_idx` (`Peça_idPeça` ASC),
  INDEX `fk_Ordem_de_Serviço_has_Peça_Ordem_de_Serviço1_idx` (`Ordem_de_Serviço_idOrdem_de_Serviço` ASC),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peça_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_idOrdem_de_Serviço`)
    REFERENCES `mydb`.`Ordem_de_Serviço` (`idOrdem_de_Serviço`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peça_Peça1`
    FOREIGN KEY (`Peça_idPeça`)
    REFERENCES `mydb`.`Peça` (`idPeça`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
