SET linesize 80
SET pagesize 15
TTITLE "A hetedik ker�leti, kilencedik feletti di�kok, �vfolyam szerint:"
BTITLE "eNapl�"

SELECT
	evfolyam AS "�vfolyam",
	COUNT(*) AS "Hetedik ker�leti lakosok"
FROM
	diak
WHERE
	iranyitoszam >= 1070 AND iranyitoszam <= 1079
GROUP BY
	evfolyam
HAVING
	evfolyam > 9
ORDER BY 
	"Hetedik ker�leti lakosok" DESC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400