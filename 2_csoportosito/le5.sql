SET linesize 80
SET pagesize 15
TTITLE "A hetedik kerületi, kilencedik feletti diákok, évfolyam szerint:"
BTITLE "eNapló"

SELECT
	evfolyam AS "Évfolyam",
	COUNT(*) AS "Hetedik kerületi lakosok"
FROM
	diak
WHERE
	iranyitoszam >= 1070 AND iranyitoszam <= 1079
GROUP BY
	evfolyam
HAVING
	evfolyam > 9
ORDER BY 
	"Hetedik kerületi lakosok" DESC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400