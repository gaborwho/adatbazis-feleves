-- Mely osztályba járnak Irén nevû diákok
SELECT
	nev AS "Név",
	evfolyam AS "Évfolyam",
	osztaly AS "Osztály"
FROM diak
WHERE nev LIKE '%Irén%'
ORDER BY nev;