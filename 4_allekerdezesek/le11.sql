-- Diákok, akiknek a másodikon van a termük
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
ORDER BY
	"Név";