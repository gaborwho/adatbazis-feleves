-- Andr�sokkal nem egy oszt�lyba j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%Andr�s%')
ORDER BY "N�v";