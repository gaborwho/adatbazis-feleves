-- Az �sszes �t�s, id�pont szerint
SELECT
	nev AS "N�v",
	targy AS "T�rgy",
	datum AS "D�tum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;