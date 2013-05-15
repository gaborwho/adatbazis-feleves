SET linesize 80
SET pagesize 25
TTITLE "Diákok hiányzásaikkal:"
BTITLE "eNapló"

CREATE OR REPLACE VIEW atlag
AS
SELECT d.nev, d.anyja_neve, d.szuletes, SUM(e.hianyzas) as hianyzasok
FROM
	diak d,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes
GROUP BY
	d.nev, d.anyja_neve, d.szuletes;

SELECT
	nev AS "Név",
	hianyzasok AS "Hiányzások"
FROM atlag
ORDER BY "Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400