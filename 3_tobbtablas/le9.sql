-- Az diákok osztályának átlaga
SELECT
	d.nev AS "Név",
	a.atlag AS "Osztályátlag"
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