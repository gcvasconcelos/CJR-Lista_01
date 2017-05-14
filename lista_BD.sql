UPDATE empresa.empregado
SET salario = 28000
WHERE codemp = 3;

SELECT *
FROM empresa.empregado
WHERE salario > 30000;

SELECT nome
FROM empresa.empregado
JOIN empresa.trabalhaem
	ON empresa.empregado.codemp = empresa.trabalhaem.codemp 
JOIN empresa.projeto
	ON empresa.trabalhaem.codproj = empresa.projeto.codproj
WHERE titulo = 'Transmogrifador';
 
SELECT empresa.empregado.nome, endereco
FROM empresa.empregado
JOIN empresa.departamento
	ON empresa.empregado.coddepto = empresa.departamento.coddepto
WHERE empresa.departamento.nome = 'Pesquisa';

SELECT * 
FROM empresa.empregado
WHERE nome LIKE 'A%';

SELECT upper(nome)
FROM empresa.empregado;

UPDATE empresa.empregado
SET nome = upper(nome);

SELECT initcap(nome)
FROM empresa.empregado;

SELECT min(datanasc)
FROM empresa.empregado;

SELECT max(datanasc) 
FROM empresa.empregado;

SELECT nome, datanasc
FROM empresa.empregado
WHERE extract(MONTH FROM datanasc) = 10;

SELECT nome 
FROM empresa.empregado 
WHERE datanasc
BETWEEN '1950-01-01' AND '1970-01-01';

SELECT titulo
FROM empresa.projeto
ORDER BY titulo;

SELECT nome, horas
FROM empresa.empregado
JOIN empresa.trabalhaem
	ON empresa.empregado.codemp = empresa.trabalhaem.codemp
JOIN empresa.projeto
	ON empresa.trabalhaem.codproj = empresa.projeto.codproj
WHERE empresa.projeto.codproj = 3
ORDER BY horas DESC;

SELECT DISTINCT empregado.codemp
FROM empresa.empregado
JOIN empresa.trabalhaem
	ON empresa.empregado.codemp = empresa.trabalhaem.codemp
WHERE horas > 10;

SELECT count(codemp)
FROM empresa.empregado
WHERE coddepto = 4;

SELECT projeto.titulo AS projeto, MIN(horas) AS minimo, MAX(horas) AS maximo, ROUND(AVG(horas), 2) AS media
FROM empresa.trabalhaem
JOIN empresa.projeto
	ON empresa.trabalhaem.codproj = empresa.projeto.codproj
GROUP BY projeto.titulo;

SELECT codproj --nao entendi como se usa o AS aqui
FROM empresa.trabalhaem
GROUP BY codproj
HAVING AVG(horas) > 20;

SELECT titulo
FROM empresa.projeto
WHERE codproj 
IN (	
	SELECT codproj 
	FROM empresa.trabalhaem
	GROUP BY codproj
	HAVING AVG(horas) > 20
);