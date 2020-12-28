
-- DELIMITADOR -> ;

-- COMO MUDAR O DELIMITADOR 

DELIMITER $


-- STORED PROCEDURES 

SELECT 'JOAO';

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN

  BLOCO DE PROGRAMACAO;

END
$

CREATE PROCEDURE NOME_EMPRESA()
BEGIN

  SELECT 'CURSO DE BANDO DE DADOS' AS CURSO;

END
$

CALL NOME_EMPRESA()$


-- APAGANDO PROCEDURE

DROP PROCEDURE NOME_EMPRESA;


-- PASSANDO PARAMETROS PARA PROCEDURES


CREATE PROCEDURE SOMA(NUMERO1 INT, NUMERO2 INT)
BEGIN

  SELECT NUMERO1 + NUMERO2 AS SOMA;

END
$

CALL SOMA(100, 50);



-- PROCEDURE COM TABELAS

CREATE DATABASE ESTUDO_PROCEDURE$

USE ESTUDO_PROCEDURE$

DELIMITER ;

CREATE TABLE CURSOS(
  IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(30) NOT NULL,
  HORAS INT(3) NOT NULL,
  VALOR FLOAT(100, 2) NOT NULL
);


INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

ALTER TABLE CURSOS
MODIFY VALOR FLOAT(10, 2)$

DELIMITER $


CREATE PROCEDURE CAD_CURSO(NOME VARCHAR(30), HORAS INT, VALOR FLOAT(10, 2))
BEGIN

  INSERT INTO CURSOS VALUES(NULL, NOME, HORAS, VALOR);

END
$

DELIMITER ;


CALL CAD_CURSO('BI SQL SERVER',35,3000.00);
CALL CAD_CURSO('POWER BI',20,1000.00);
CALL CAD_CURSO('TABLEAU',30,1200.00);














