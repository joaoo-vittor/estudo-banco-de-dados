


/*
NOME DO LIVRO	
NOME DO AUTOR	
SEXO DO AUTOR	
NUMERO DE PÁGINAS	
NOME DA EDITORA	
VALOR DO LIVRO	
ESTADO (UF) DA EDITORA	
ANO PUBLICACAO	
*/

CREATE DATABASE LIVRARIA;

CREATE TABLE LIVROS(
  NOME VARCHAR(50),
  AUTOR VARCHAR(30),
  SEXO CHAR(9),
  PAGINAS CHAR(7),
  EDITORA VARCHAR(20),
  VALOR VARCHAR(8),
  UF CHAR(2),
  PUBLICACAO CHAR(4)
);


INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Cavaleiro Real',	'Ana Claudia',	'Feminino',	'465',	'Atlas',	'49.9',	'RJ',	'2009');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('SQL para leigos',	'João Nunes',	'Masculino',	'450',	'Addison',	'98',	'SP',	'2018');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Receitas Caseiras',	'Celia Tavares',	'Feminino',	'210',	'Atlas',	'45',	'RJ',	'2008');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Pessoas Efetivas',	'Eduardo Santos',	'Masculino',	'390',	'Beta',	'78.99',	'RJ',	'2018');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Habitos Saudáveis',	'Eduardo Santos',	'Masculino',	'630',	'Beta',	'150.98',	'RJ', '2019');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('A Casa Marrom',	'Hermes Macedo',	'Masculino',	'250',	'Bubba',	'60',	'MG',	'2016');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Estacio Querido',	'Geraldo Francisco',	'Masculino',	'310',	'Insignia',	'100',	'ES',	'2015');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Pra sempre amigas',	'Leda Silva',	'Feminino',	'510',	'Insignia',	'78.98',	'ES',	'2011');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('Copas Inesqueciveis',	'Marco Alcantara',	'Masculino',	'200',	'Larson',	'130.98',	'RS',	'2018');

INSERT INTO LIVROS(NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO) 
  VALUES('O poder da mente',	'Clara Mafra',	'Feminino',	'120',	'Continental',	'56.58',	'SP',	'2017');


/*
1 – Trazer todos os dados.
2 – Trazer o nome do livro e o nome da editora
3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
5 – Trazer os valores dos livros das editoras de São Paulo.
6 – Trazer os dados dos autores do sexo masculino que tiveram 
    livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).
*/

-- 1 – Trazer todos os dados.
SELECT NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO FROM LIVROS;


-- 2 – Trazer o nome do livro e o nome da editora
SELECT NOME, EDITORA FROM LIVROS;


-- 3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
SELECT NOME, UF FROM LIVROS WHERE SEXO = 'Masculino';


-- 4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
SELECT NOME, PAGINAS FROM LIVROS WHERE SEXO = 'Feminino';


-- 5 – Trazer os valores dos livros das editoras de São Paulo.
SELECT NOME, AUTOR, VALOR, UF FROM LIVROS WHERE UF = 'SP';

-- 6 – Trazer os dados dos autores do sexo masculino que tiveram 
--     livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).

SELECT NOME, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, PUBLICACAO FROM LIVROS 
  WHERE SEXO = 'Masculino' AND (UF = 'SP' OR UF = 'RJ');
