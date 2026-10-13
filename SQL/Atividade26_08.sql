CREATE SCHEMA `atividade2608` ;

CREATE TABLE `livro`(
id_livro INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
ano YEAR NOT NULL,
id_editora INT NOT NULL,
PRIMARY KEY(id_livro)
FOREIGN KEY(id_editora)
REFERENCES editora(id_editora)
);

CREATE TABLE `autor`(
id_autor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
PRIMARY KEY(id_autor)
);

CREATE TABLE `editora`(
id_editora INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
PRIMARY KEY(id_editora)
);

CREATE TABLE `ficha_catalografica`(
id_ficha_catalografica INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
id_livro INT NOT NULL UNIQUE,
PRIMARY KEY(id_ficha_catalografica)
FOREIGN KEY(id_livro)
REFERENCES livro(id_livro)
);

CREATE TABLE `livro_autor`(
id_livroAutor INT NOT NULL AUTO_INCREMENT,
id_livro INT NOT NULL,
id_autor INT NOT NULL,
PRIMARY KEY(id_livroAutor)
FOREIGN KEY(id_autor)
REFERENCES autor(id_autor)
);