CREATE SCHEMA `sistemafilmes` ;

CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(150) UNIQUE
);

CREATE TABLE filmes (
	id_filme INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	ano_lancamento INT
);

CREATE TABLE avaliacoes (
	id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_filme INT,
	avaliacao VARCHAR(200) NOT NULL,
	nota DECIMAL(3,1) CHECK(nota >= 0 AND nota <= 10),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

ALTER TABLE usuarios 
ADD COLUMN data_registro DATE DEFAULT (CURRENT_DATE);

INSERT INTO usuarios (nome, email)
VALUES ('Diego', 'diegoemail@algumemail.com');

INSERT INTO filmes (titulo, ano_lancamento)
VALUES ('Detetive Pikachu', 2019);

INSERT INTO avaliacoes (id_usuario, id_filme, avaliacao, nota)
VALUES (1, 1, 'Filme muito bom e legal', 10);

DROP TABLE avaliacoes;
-- Escolhi tirar a tabela de avaliações pois acho que é a menos importante. Pois sem ter usuários ou filmes, não adianta ter a avaliação, já que ela depende de ambos