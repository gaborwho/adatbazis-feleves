SET linesize 80
SET pagesize 25
TTITLE "A diákok osztályának átlaga:"
BTITLE "eNapló"
COLUMN "Osztályátlag" FORMAT A12;

SELECT
	d.nev AS "Név",
	LPAD(RPAD(ROUND(a.atlag,2),4,',00'),12) AS "Osztályátlag"
FROM
	diak d,
	(SELECT evfolyam, osztaly, AVG(e.osztalyzat) AS atlag
	FROM ertekeles e, diak d
	WHERE 
		d.nev = e.nev AND
		d.anyja_neve = e.anyja_neve AND
		d.szuletes = e.szuletes
	GROUP BY d.evfolyam, d.osztaly) a
WHERE
	d.osztaly = a.osztaly AND
	d.evfolyam = a.evfolyam
ORDER BY
	"Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400