-- Magdolna nevû tanárok osztályába járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
;