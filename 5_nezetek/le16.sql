SET linesize 80
SET pagesize 25
TTITLE "Oszt�lyok �s �tlagaik:"
BTITLE "eNapl�"

CREATE OR REPLACE VIEW osztalyatlag
AS
SELECT o.evfolyam, o.osztaly, AVG(e.osztalyzat) as osztalyatlag
FROM
	diak d,
	osztaly o,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes AND
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam
GROUP BY
	o.osztaly, o.evfolyam;

SELECT
	evfolyam AS "�vfolyam",
	osztaly AS "Oszt�ly",
	ROUND(osztalyatlag,2) AS "�tlag"
FROM osztalyatlag
ORDER BY "�tlag";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400