SET linesize 80
SET pagesize 15
TTITLE "A 10.c osztály névsora:"
BTITLE "eNapló"

SELECT
	nev AS "Név"
FROM diak
WHERE
	evfolyam = 10 AND
	osztaly = 'c'
ORDER BY nev;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400