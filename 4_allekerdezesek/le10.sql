-- Magdolna nev� tan�rok oszt�ly�ba j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
;