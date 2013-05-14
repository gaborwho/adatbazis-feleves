-- Az összes ötös, idõpont szerint
SELECT
	nev AS "Név",
	targy AS "Tárgy",
	datum AS "Dátum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;