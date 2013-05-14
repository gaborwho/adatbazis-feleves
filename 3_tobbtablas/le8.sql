-- Az egyes di�kok hi�nyz�sai
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