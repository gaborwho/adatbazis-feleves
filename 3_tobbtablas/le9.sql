SET linesize 80
SET pagesize 25
TTITLE "A di�kok oszt�ly�nak �tlaga:"
BTITLE "eNapl�"
COLUMN "Oszt�ly�tlag" FORMAT A12;

SELECT
	d.nev AS "N�v",
	LPAD(RPAD(ROUND(a.atlag,2),4,',00'),12) AS "Oszt�ly�tlag"
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
	"N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400