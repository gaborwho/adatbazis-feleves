-- A di�kok oszt�lytermei
SELECT
	d.nev AS "N�v",
	o.terem AS "Oszt�lyterem"
FROM
	diak d,
	osztaly o
WHERE
	d.evfolyam = o.evfolyam AND
	d.osztaly = o.osztaly
ORDER BY
	"N�v";