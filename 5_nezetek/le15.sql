-- Nézet: a diákok hiányzásaikkal

CREATE OR REPLACE VIEW atlag
AS
SELECT d.nev, d.anyja_neve, d.szuletes, SUM(e.hianyzas) as hianyzasok
FROM
	diak d,
	ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes
GROUP BY
	d.nev, d.anyja_neve, d.szuletes;

SELECT * FROM atlag;