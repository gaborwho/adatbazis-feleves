SET linesize 80
SET pagesize 25
TTITLE "Andr�sokkal nem egy oszt�lyba j�r� di�kok:"
BTITLE "eNapl�"

SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%Andr�s%')
ORDER BY "N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400