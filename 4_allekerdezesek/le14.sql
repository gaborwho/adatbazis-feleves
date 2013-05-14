-- Andrásokkal nem egy osztályba járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%András%')
ORDER BY "Név";