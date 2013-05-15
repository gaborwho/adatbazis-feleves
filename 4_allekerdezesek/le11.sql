SET linesize 80
SET pagesize 25
TTITLE "Diákok, akiknek a másodikon van a termük:"
BTITLE "eNapló"

SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
ORDER BY
	"Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400