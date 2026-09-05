CREATE SCHEMA `playdex` ;

CREATE TABLE `playdex`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  `senha` VARCHAR(45) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `id_mercado` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_usuario_mercado`
    FOREIGN KEY (`id_mercado`) REFERENCES `playdex`.`mercado` (`id_mercado`)
    ON UPDATE CASCADE
);

CREATE TABLE `playdex`.`jogo` (
  `id_jogo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `avaliacao` INT NOT NULL,
  `classificacao_etaria` INT NOT NULL,
  `data_lancamento` DATE NOT NULL,
  PRIMARY KEY (`id_jogo`));

CREATE TABLE `playdex`.`biblioteca` (
  `id_biblioteca` INT NOT NULL AUTO_INCREMENT,
  `data_criacao` DATE NOT NULL,
  `data_atualizacao` DATE NOT NULL,
  `quantidade_jogos` INT NOT NULL DEFAULT 0,
  `horas_totais` INT NOT NULL DEFAULT 0,
  `id_usuario` INT NOT NULL UNIQUE,
  PRIMARY KEY (`id_biblioteca`),
  CONSTRAINT `fk_biblioteca_usuario`
    FOREIGN KEY (`id_usuario`) REFERENCES `playdex`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `playdex`.`lista_de_desejos` (
  `id_lista` INT NOT NULL AUTO_INCREMENT,
  `data_criacao` DATE NOT NULL,
  `quantidade_jogos` INT NOT NULL DEFAULT 0,
  `data_atualizacao` DATE NOT NULL,
  `posicao` INT NOT NULL DEFAULT 0,
  `id_usuario` INT NOT NULL UNIQUE,
  PRIMARY KEY (`id_lista`),
  CONSTRAINT `fk_lista_usuario`
    FOREIGN KEY (`id_usuario`) REFERENCES `playdex`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `playdex`.`mercado` (
  `id_mercado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL NOT NULL,
  `moeda` VARCHAR(45) NOT NULL,
  `descricao` TEXT NOT NULL,
  PRIMARY KEY (`id_mercado`));

CREATE TABLE `playdex`.`desenvolvedor` (
  `id_desenvolvedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `data_fundacao` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_desenvolvedor`));

CREATE TABLE `playdex`.`distribuidora` (
  `id_distribuidora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `descricao` TEXT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_distribuidora`));

CREATE TABLE `playdex`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` TEXT NOT NULL,
  `popularidade` INT NOT NULL,
  `data_cadastro` DATE NOT NULL,
  PRIMARY KEY (`id_genero`));

CREATE TABLE `jogodesenvolvedor` (
  `id_jogodesenvolvedor` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_desenvolvedor` INT NOT NULL,
  PRIMARY KEY (`id_jogodesenvolvedor`),
  CONSTRAINT `fk_jd_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jd_desenvolvedor`
    FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
    ON DELETE CASCADE
);

CREATE TABLE `jogogenero` (
  `id_jogogenero` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_jogogenero`),
  CONSTRAINT `fk_jg_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jg_genero`
    FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
    ON DELETE CASCADE
);

CREATE TABLE `jogodistribuidora` (
  `id_jogodistribuidora` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_distribuidora` INT NOT NULL,
  PRIMARY KEY (`id_jogodistribuidora`),
  CONSTRAINT `fk_jdist_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jdist_distribuidora`
    FOREIGN KEY (`id_distribuidora`) REFERENCES `distribuidora` (`id_distribuidora`)
    ON DELETE CASCADE
);

CREATE TABLE `jogomercado` (
  `id_jogomercado` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_mercado` INT NOT NULL,
  PRIMARY KEY (`id_jogomercado`),
  CONSTRAINT `fk_jm_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jm_mercado`
    FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`)
    ON DELETE CASCADE
);

CREATE TABLE `jogolista_desejo` (
  `id_jogolista_desejo` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_lista` INT NOT NULL,
  PRIMARY KEY (`id_jogolista_desejo`),
  CONSTRAINT `fk_jld_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jld_lista`
    FOREIGN KEY (`id_lista`) REFERENCES `lista_de_desejos` (`id_lista`)
    ON DELETE CASCADE
);

CREATE TABLE `jogobiblioteca` (
  `id_jogobiblioteca` INT NOT NULL AUTO_INCREMENT,
  `id_jogo` INT NOT NULL,
  `id_biblioteca` INT NOT NULL,
  PRIMARY KEY (`id_jogobiblioteca`),
  CONSTRAINT `fk_jb_jogo`
    FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_jb_biblioteca`
    FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`)
    ON DELETE CASCADE
);