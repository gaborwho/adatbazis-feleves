-- Legalább egy kilencedikes osztály terménél magasabb számú terembe járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem > ANY (SELECT terem FROM osztaly WHERE evfolyam = 9)
ORDER BY "Név";