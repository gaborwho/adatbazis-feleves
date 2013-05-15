SET linesize 80
SET pagesize 25
TTITLE "Andrásokkal nem egy osztályba járó diákok:"
BTITLE "eNapló"

SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%András%')
ORDER BY "Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400