CREATE DATABASE AGENCIA_DB;

CREATE TABLE CARGO (
	ID SERIAL PRIMARY KEY, 
	CARGO VARCHAR(20)
);

CREATE TABLE FUNCIONARIO(
	CPF VARCHAR(11) PRIMARY KEY, 
	NOME VARCHAR(50),
	CARGO_ID INT REFERENCES CARGO (ID)
);

CREATE TABLE TELEFONE(
	CPF VARCHAR(11) REFERENCES FUNCIONARIO(CPF),
	TELEFONE VARCHAR(11),
	PRIMARY KEY (CPF, TELEFONE)
);

CREATE TABLE AGENCIA(
	NUMERO SERIAL PRIMARY KEY, 
	ENDERECO VARCHAR (100)
);

CREATE TABLE ALOCACAO(
	CPF VARCHAR (11) REFERENCES FUNCIONARIO(CPF),
	NUMERO_AGENCIA INT REFERENCES AGENCIA(NUMERO), 
	HORAS_TRABALHADAS FLOAT
);

ALTER TABLE ALOCACAO ADD CONSTRAINT PK_CPF_NUM_AGENCIA PRIMARY KEY  (CPF, NUMERO_AGENCIA);


INSERT INTO CARGO (CARGO) VALUES ('GERENTE') , ('ATENDENTE'), ('SEGURANCA');

INSERT INTO FUNCIONARIO (CPF, NOME, CARGO_ID) 
VALUES ('123', 'VITOR', 3),
 ('124', 'ANA', 2),
 ('126', 'fERNANDA', 1),
 ('125', 'LUCAS', 2),
 ('129', 'JULIO', 3);
 
 
 INSERT INTO TELEFONE (CPF, TELEFONE ) 
 VALUES ('123', '1456'),
 ('123', '56789'),
 ('124', '5445'),
 ('126', '45'),
 ('125', '56'),
 ('129', '564664');
 
 
 INSERT INTO AGENCIA (ENDERECO) VALUES ('R GIRASSOL'), ('R FIANDEIRAS');
 
 INSERT INTO ALOCACAO (CPF, NUMERO_AGENCIA, HORAS_TRABALHADAS )
 VALUES ('123', 1, 3),
 ('123', 2, 3),
 ('124', 1, 2),
 ('126', 1, 1),
  ('126',2, 1),
 ('125', 1, 2),
 ('129', 2, 3);
 
 SELECT *FROM FUNCIONARIO;
 SELECT *FROM CARGO;
 SELECT *FROM TELEFONE;
 SELECT *FROM ALOCACAO;
 SELECT *FROM AGENCIA;
 