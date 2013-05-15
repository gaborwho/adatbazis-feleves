SET linesize 80
SET pagesize 15
TTITLE "Magdolna nev� tan�rok oszt�ly�ba j�r� di�kok:"
BTITLE "eNapl�"

SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
ORDER BY
	"N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400