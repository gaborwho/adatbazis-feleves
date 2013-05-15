SET linesize 80
SET pagesize 25
TTITLE "Az egyes di�kok hi�nyz�sai:"
BTITLE "eNapl�"

SELECT
	d.nev AS "N�v",
	SUM(e.hianyzas) AS "Hi�nyz�sok"
FROM
	diak d,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes
GROUP BY
	d.nev, d.anyja_neve, d.szuletes
ORDER BY
	"N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400