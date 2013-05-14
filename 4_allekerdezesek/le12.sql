-- Kilencedikesekkel nem egy terembe járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem <> ALL (SELECT terem FROM osztaly WHERE evfolyam = 9)
ORDER BY "Név";