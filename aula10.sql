
-- SUBQUERY

SELECT NOME, MIN(MARCO) AS MENOR_MAR
FROM VENDEDORES;

SELECT NOME, MARCO 
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);


SELECT NOME, MARCO 
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);


SELECT NOME, MARCO 
FROM VENDEDORES
WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);


SELECT NOME, FEVEREIRO 
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

SELECT AVG(FEVEREIRO) FROM VENDEDORES;


SELECT NOME, FEVEREIRO 
FROM VENDEDORES
WHERE FEVEREIRO < (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

