-- FORMA 01 - EXCLUINDO AS COLUNAS

INSERT INTO CLIENTE VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 1234567891, '11114444', 'RUA SEI LÁ - BAIRRO - CIDADE - CD');
INSERT INTO CLIENTE VALUES('VITOR', 'M', 'VITOR@GMAIL.COM', 1234567893, '22224444', 'RUA SEI LÁ - BAIRRO - CIDADE - CD');
INSERT INTO CLIENTE VALUES('MARIA', 'F', NULL, 1234567894, '15154444', 'RUA SEI LÁ - BAIRRO - CIDADE - CD');

-- FORMA 02 - COLOCANDO AS COLUNAS

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) 
  VALUES('AMANDA', 'F', 'RUA SEI LÁ - BAIRRO - CIDADE - RJ', '22224444', 1234567891);

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) 
  VALUES('SOFIA', 'F', 'RUA SEI LÁ - BAIRRO - CIDADE - RJ', '22228888', 1234567810);

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) 
  VALUES('ALINE', 'F', 'RUA SEI LÁ - BAIRRO - CIDADE - AB', '22225555', 1234567910);


-- PROJEÇÃO -> COMANDO SELECT

SELECT NOW() AS DATA_HORA;

SELECT 'JOÃO VITOR' AS NOME;

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, EMAIL, SEXO, ENDERECO FROM CLIENTE;


SELECT NOME, EMAIL, SEXO, ENDERECO, NOW() AS DATA_HORA FROM CLIENTE;


-- SELEÇÃO -> FILTRANDO DADOS COM WHERE

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';


SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO = 'RJ';

-- UTILIZANDO LIKE -> POR APROXIMAÇÃO

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';

-- CARACTER CORINGA % -> QUALQUER COISA
-- COMEÇA COM QUALQUER COISA E TERMINA COM RJ
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';

