SET linesize 80
SET pagesize 25
TTITLE "Di�kok, akiknek a m�sodikon van a term�k:"
BTITLE "eNapl�"

SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
ORDER BY
	"N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400