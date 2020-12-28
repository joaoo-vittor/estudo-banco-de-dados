/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

-- APAGAR TABELA
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
  IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(30) NOT NULL,
  SEXO ENUM('M', 'F') NOT NULL,
  EMAIL VARCHAR(50) UNIQUE,
  CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
  IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
  RUA VARCHAR(30) NOT NULL,
  BAIRRO VARCHAR(30) NOT NULL,
  CIDADE VARCHAR(30) NOT NULL,
  ESTADO CHAR(2) NOT NULL,
  ID_CLIENTE INT UNIQUE,
  FOREIGN KEY(ID_CLIENTE)
  REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
  IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
  TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
  NUMERO VARCHAR(10) NOT NULL,
  ID_CLIENTE INT,
  FOREIGN KEY(ID_CLIENTE)
  REFERENCES CLIENTE(IDCLIENTE)
);


/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */




INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+



INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+



INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

+------------+------+----------+------------+
| IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+------------+------+----------+------------+
|          1 | CEL  | 78458743 |          5 |
|          2 | RES  | 56576876 |          5 |
|          3 | CEL  | 87866896 |          1 |
|          4 | COM  | 54768899 |          2 |
|          5 | RES  | 99667587 |          1 |
|          6 | CEL  | 78989765 |          3 |
|          7 | CEL  | 99766676 |          3 |
|          8 | COM  | 66687899 |          1 |
|          9 | RES  | 89986668 |          5 |
|         10 | CEL  | 88687909 |          2 |
+------------+------+----------+------------+



-- SELEÇÃO, JUNÇÃO, PROJEÇÃO

-- PROJEÇÃO -> É TUDO QUE VOCE QUER VER NA TELA

SELECT * FROM TELEFONE;

SELECT TIPO, NUMERO FROM TELEFONE;

-- SELEÇÃO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
-- A CLAUSULA DE SELECAO É O WHERE

SELECT NOME, SEXO, EMAIL
FROM CLIENTE
WHERE SEXO = 'F';


-- JUNÇÃO -> JOIN

-- NOME, SEXO, BAIRRO, CIDADE
SELECT NOME, SEXO, BAIRRO, CIDADE -- PROJEÇÃO
FROM CLIENTE, ENDERECO -- ORIGEM
WHERE IDCLIENTE = ID_CLIENTE; 

-- WHERE É CLAUSULA DE SELEÇÃO

-- JOIN

SELECT NOME, SEXO, BAIRRO, CIDADE --PROJEÇÃO
FROM CLIENTE
  INNER JOIN ENDERECO -- JUNÇÃO
  ON IDCLIENTE = ID_CLIENTE; -- SELECAO

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+



SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
  INNER JOIN ENDERECO
  ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

-- NOME, SEXO, EMAIL, TIPO, TELEFONE

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
  INNER JOIN TELEFONE
  ON IDCLIENTE = ID_CLIENTE;


-- JUÇÃO COM 3 TABELAS

-- NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO

SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE
  INNER JOIN ENDERECO
  ON IDCLIENTE = ID_CLIENTE
  INNER JOIN TELEFONE
  ON IDCLIENTE = ID_CLIENTE;

-- ERROR 1052 (23000): Column 'ID_CLIENTE' in on clause is ambiguous


-- NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO

SELECT  CLIENTE.NOME, CLIENTE.SEXO, 
        ENDERECO.BAIRRO, ENDERECO.CIDADE, 
        TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
  INNER JOIN ENDERECO
  ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
  INNER JOIN TELEFONE
  ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;


-- ALIAS

SELECT  C.NOME, C.SEXO, 
        E.BAIRRO, E.CIDADE, 
        T.TIPO, T.NUMERO
FROM CLIENTE C
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE;



-- COMANDOS DE DML

/*

  DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 6;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUTO(
  IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
  NOME_PRODUTO VARCHAR(30),
  PRECO INT,
  FRETE FLOAT(10, 2)
);

-- ALTER TABLE

-- ALTERANDO O NOME DE UMA COLUNA -> CHANGE

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | YES  |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float(10,2) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO FLOAT(10, 2);

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | YES  |     | NULL    |                |
| VALOR_UNITARIO | float(10,2) | YES  |     | NULL    |                |
| FRETE          | float(10,2) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+



-- MODIFY

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(30) NOT NULL;

DESC PRODUTO;

-- ADICIONANDO COLUNAS

ALTER TABLE PRODUTO
ADD PESO FLOAT(10, 2) NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | YES  |     | NULL    |                |
| VALOR_UNITARIO | varchar(30) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | YES  |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


-- APGANDO UMA COLUNA

ALTER TABLE PRODUTO
DROP COLUMN PESO;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | YES  |     | NULL    |                |
| VALOR_UNITARIO | varchar(30) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- ADICIONANDO COLUNA NA ORDEM ESPECIFICA

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10, 2) NOT NULL
AFTER NOME_PRODUTO;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | YES  |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(30) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


ALTER TABLE PRODUTO
DROP COLUMN PESO;


ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;


