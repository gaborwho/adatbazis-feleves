-- Di�kok, akiknek a m�sodikon van a term�k
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
ORDER BY
	"N�v";