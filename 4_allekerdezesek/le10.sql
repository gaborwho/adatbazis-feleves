SET linesize 80
SET pagesize 15
TTITLE "Magdolna nevû tanárok osztályába járó diákok:"
BTITLE "eNapló"

SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
ORDER BY
	"Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400