
-- CAMPO DA TABELA VAZIO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;


SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;


-- CLAUSULA UPDATE

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'MARIA@GMAIL.COM'
WHERE NOME = 'MARIA';

UPDATE CLIENTE
SET EMAIL = 'JOSE@GMAIL.COM'
WHERE NOME = 'JOSE';

UPDATE CLIENTE
SET EMAIL = 'NILTON@GMAIL.COM'
WHERE NOME = 'NILTON';

UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM'
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'AMANDA@GMAIL.COM'
WHERE NOME = 'AMANDA';

UPDATE CLIENTE
SET EMAIL = 'SOFIA@GMAIL.COM'
WHERE NOME = 'SOFIA';

UPDATE CLIENTE
SET EMAIL = 'ALINE@GMAIL.COM'
WHERE NOME = 'ALINE';

SELECT NOME, EMAIL
FROM CLIENTE;


-- DELETE

SELECT NOME 
FROM CLIENTE
WHERE NOME = 'AMANDA';

SELECT COUNT(*) AS "QTD" -- TOTAL 6
FROM CLIENTE;

SELECT COUNT(*) AS "QTD" -- TOTAL 1
FROM CLIENTE
WHERE NOME = 'AMANDA';


DELETE FROM CLIENTE
WHERE NOME = 'AMANDA';

SELECT * FROM CLIENTE;


