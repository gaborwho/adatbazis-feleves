-- Kiss Magdolna elhagyja az iskolát, és viszi az osztályait is.

DELETE FROM ertekeles
WHERE (nev, anyja_neve, szuletes) IN
	(SELECT nev, anyja_neve, szuletes
	FROM
		osztaly o,
		diak d
	WHERE
		d.evfolyam = o.evfolyam AND
		d.osztaly = o.osztaly AND
		o.osztalyfonok = 'Kiss Magdolna');

DELETE FROM diak
WHERE (evfolyam, osztaly) IN
	(SELECT evfolyam, osztaly
	FROM osztaly
	WHERE osztalyfonok = 'Kiss Magdolna');

DELETE FROM osztaly
WHERE osztalyfonok = 'Kiss Magdolna';

ROLLBACK;