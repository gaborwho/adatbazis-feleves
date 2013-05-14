-- Kilencedikesekkel nem egy terembe j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem <> ALL (SELECT terem FROM osztaly WHERE evfolyam = 9)
ORDER BY "N�v";