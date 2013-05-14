-- Nézet: osztályok, átlaggal

CREATE OR REPLACE VIEW osztalyatlag
AS
SELECT o.evfolyam, o.osztaly, AVG(e.osztalyzat) as osztalyatlag
FROM
	diak d,
	osztaly o,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes AND
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam
GROUP BY
	o.osztaly, o.evfolyam;

SELECT * FROM osztalyatlag ORDER BY osztaly, evfolyam;