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

-- Az egyes diákok átlaga, az összes tárgyból
SELECT
	d.nev AS "Név",
	AVG(e.osztalyzat) AS "Átlag"
FROM
	diak d,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes
GROUP BY
	d.nev
ORDER BY
	"Név";

-- 
