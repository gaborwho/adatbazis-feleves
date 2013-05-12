-- A diákok osztálytermei
SELECT
	d.nev AS "Név",
	o.terem AS "Osztályterem"
FROM
	diak d,
	osztaly o
WHERE
	d.evfolyam = o.evfolyam AND
	d.osztaly = o.osztaly
ORDER BY
	"Név";

-- Az egyes diákok hiányzásai
SELECT
	d.nev AS "Név",
	SUM(e.hianyzas) AS "Hiányzások"
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
	"Név";

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