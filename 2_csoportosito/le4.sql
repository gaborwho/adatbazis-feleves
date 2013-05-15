SET linesize 80
SET pagesize 15
TTITLE "Az egyes osztályok létszáma:"
BTITLE "eNapló"

SELECT
	evfolyam as "Évfolyam",
	osztaly as "Osztály",
	COUNT(*) as "Létszám"
FROM
	diak
GROUP BY
	evfolyam, osztaly
ORDER BY
	"Évfolyam", "Osztály" ASC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400