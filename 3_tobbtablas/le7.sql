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