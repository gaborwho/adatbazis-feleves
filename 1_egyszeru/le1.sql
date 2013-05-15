SET linesize 80
SET pagesize 15
TTITLE "Mely osztályba járnak Irén nevû diákok:"
BTITLE "eNapló"

SELECT
	nev AS "Név",
	evfolyam AS "Évfolyam",
	osztaly AS "Osztály"
FROM diak
WHERE nev LIKE '%Irén%'
ORDER BY nev;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400