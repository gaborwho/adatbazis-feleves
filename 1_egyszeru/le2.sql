-- A 10.c oszt�ly n�vsora
SELECT
	nev AS "N�v"
FROM diak
WHERE
	evfolyam = 10 AND
	osztaly = 'c'
ORDER BY nev;