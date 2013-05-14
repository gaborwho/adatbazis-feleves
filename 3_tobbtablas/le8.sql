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