
SELECT * FROM ITENS
WHERE QUANTIDADE = 1
--FUNCOES DE AGREGACAO
--MEDIA AVG
SELECT AVG(QUANTIDADE) FROM ITENS 

SELECT AVG(QUANTIDADE) AS "MEDIA QUANTIDADE " FROM ITENS 

SELECT AVG(QUANTIDADE) AS "MEDIA QUANTIDADE " 
FROM ITENS 
WHERE QUANTIDADE < 10

--CONTAGEM DE LINHAS 
SELECT COUNT(*) FROM ITENS 


SELECT COUNT(*)FROM ITENS 
WHERE QUANTIDADE = 1

SELECT COUNT(*) AS " CONTAGEM TOTAL" , 
		AVG(QUANTIDADE) AS "MEDIA",
		 MAX(VALOR) AS "dE MAIOR VALOR"
FROM ITENS 
WHERE QUANTIDADE < 10


-- MAX MAIOR VALOR 


SELECT  MAX(VALOR) FROM ITENS 


SELECT  MAX(DESCRICAO) FROM ITENS 

-- MIN - MENOR VALOR

SELECT  MIN(VALOR) FROM ITENS 

SELECT  MIN(DESCRICAO) FROM ITENS 

--SOMATORIA SUM
SELECT SUM (QUANTIDADE) FROM ITENS

SELECT SUM (QUANTIDADE), SUM(VALOR) FROM ITENS

SELECT SUM (QUANTIDADE) AS ITENSTOTAL, COUNT(*) REGISTOS FROM ITENS


--OPERADOR IN 

--EXEMPLO SEM USAR O IN 
SELECT * FROM ITENS
WHERE ID = 1 OR ID = 3 OR ID = 5


--EXEMPLO USANDO O IN 
SELECT * FROM ITENS
WHERE ID IN (1,3,5)

--NOT IN 
SELECT * FROM ITENS
WHERE ID NOT IN (1,3,5)


--SUBQUERY 

SELECT * FROM ITENS WHERE VALOR =  (SELECT  MAX(VALOR) FROM ITENS )

SELECT * FROM ITENS WHERE ID IN (SELECT ID FROM ITENS WHERE QUANTIDADE < 15)

-- VIEWS

CREATE VIEW VW_ITENS AS SELECT * FROM ITENS 


SELECT * FROM VW_ITENS WHERE ID > 3


CREATE VIEW VW_ITENS1 AS SELECT ID AS CODIGO, DESCRICAO, QUANTIDADE , VALOR  FROM ITENS 

SELECT * FROM VW_ITENS1


CREATE VIEW VW_ITENS2 AS SELECT *, QUANTIDADE * VALOR AS TOTAL   FROM ITENS 


SELECT * FROM VW_ITENS2 




-- CONCATENACAO 

SELECT  CONCAT(DESCRICAO, ' OLA ',  QUANTIDADE)    FROM ITENS 

SELECT * FROM ITENS 

--COLU9NA COMPUTADA 

ALTER TABLE ITENS ADD COLUMN TOTAL MONEY GENERATED ALWAYS AS (QUANTIDADE * VALOR ) STORED

ALTER TABLE ITENS DROP COLUMN TOTAL


INSERT INTO ITENS (DESCRICAO, QUANTIDADE, VALOR) 
VALUES ('Agua', 1,7),
		('Escova', 3,5),
		('BALA',2, 4),
		('CHOCOLATE', 30,11),
		('BISCOITO', 1,2)

--PAGINACAO 

SELECT COUNT(*) AS TOTAL , COUNT(*) /2 AS PAGINAS FROM ITENS 

-- PAGINACAO 'E FEITA COM O NUMERO PAGINA -1 * TAMANHO DA PAGINA NO CASO DOIS 
--PAGINA 1   -  1-1 = 0 *2 = 0 
SELECT * FROM ITENS 
LIMIT 2 OFFSET 0

--PAGINA 2   -  2-1 = 1 *2 = 2 
SELECT * FROM ITENS 
LIMIT 2 OFFSET 2

--PAGINA 3   -  3-1 = 2 *2 = 4
SELECT * FROM ITENS 
LIMIT 2 OFFSET 4

--PAGINA 4   
SELECT * FROM ITENS 
LIMIT 2 OFFSET 6

--PAGINA 5   
SELECT * FROM ITENS 
LIMIT 2 OFFSET 8

