-- A 10.c osztály névsora
SELECT
	nev AS "Név"
FROM diak
WHERE
	evfolyam = 10 AND
	osztaly = 'c'
ORDER BY nev;