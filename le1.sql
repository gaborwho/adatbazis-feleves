-- Mely osztályba járnak Irén nevû diákok
SELECT
	nev AS "Név",
	evfolyam AS "Évfolyam",
	osztaly AS "Osztály"
FROM diak
WHERE nev LIKE '%Irén%'
ORDER BY nev;

-- A 10.c osztály névsora
SELECT
	nev AS "Név"
FROM diak
WHERE
	evfolyam = 10 AND
	osztaly = 'c'
ORDER BY nev;

-- Az összes ötös, idõpont szerint
SELECT
	nev AS "Név",
	targy AS "Tárgy",
	datum AS "Dátum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;

