SET linesize 80
SET pagesize 15
TTITLE "Az összes ötös, idõpont szerint rendezve:"
BTITLE "eNapló"

SELECT
	nev AS "Név",
	targy AS "Tárgy",
	datum AS "Dátum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400