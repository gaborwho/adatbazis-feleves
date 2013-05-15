SET linesize 80
SET pagesize 15
TTITLE "Az egyes oszt�lyok l�tsz�ma:"
BTITLE "eNapl�"

SELECT
	evfolyam as "�vfolyam",
	osztaly as "Oszt�ly",
	COUNT(*) as "L�tsz�m"
FROM
	diak
GROUP BY
	evfolyam, osztaly
ORDER BY
	"�vfolyam", "Oszt�ly" ASC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400