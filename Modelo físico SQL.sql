DROP DATABASE AMIGOX;
CREATE DATABASE AMIGOX;
USE AMIGOX;
CREATE TABLE chat(
	id_chat INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	data_chat DATE NOT NULL,
	horario DATETIME NOT NULL,
	mensagem VARCHAR(10000),
	id_apelido INTEGER NOT NULL);

CREATE TABLE apelido(
	id_apelido INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	codinome VARCHAR(50) NOT NULL,
	id_participante INTEGER NOT NULL);

CREATE TABLE participante(
	id_participante INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(50) NOT NULL,
	id_apelido INTEGER NOT NULL);

CREATE TABLE presente(
	id_presente INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	lista_presente VARCHAR(100) NOT NULL,
	valor_estipulado FLOAT NOT NULL,
	id_participante INTEGER NOT NULL);

CREATE TABLE participante_grupo(
	id_participante_grupo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_participante INTEGER NOT NULL,
	id_grupo INTEGER NOT NULL);

CREATE TABLE grupo(
	id_grupo INTEGER NOT NULL PRIMARY KEY auto_increment,
	nome_grupo VARCHAR(100) NOT NULL,
	data_sorteio DATE NOT NULL,
	horário DATETIME NOT NULL,
	local_revelacao VARCHAR(50) NOT NULL);
    
ALTER TABLE chat ADD CONSTRAINT fk_chat_apelido
FOREIGN KEY (id_apelido) REFERENCES apelido(id_apelido);

ALTER TABLE apelido ADD CONSTRAINT fk_apelido_participante
FOREIGN KEY (id_participante) REFERENCES participante(id_participante);

ALTER TABLE participante ADD CONSTRAINT fk_participante_apelido
FOREIGN KEY (id_apelido) REFERENCES apelido(id_apelido);

ALTER TABLE presente ADD CONSTRAINT fk_presente_participante
FOREIGN KEY (id_participante) REFERENCES participante(id_participante);

ALTER TABLE participante_grupo ADD CONSTRAINT fk_participante_grupo_participante
FOREIGN KEY (id_participante) REFERENCES participante(id_participante);

ALTER TABLE participante_grupo ADD CONSTRAINT fk_participante_grupo_grupo
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo);