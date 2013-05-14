-- Az egyes osztályok létszáma
SELECT
	evfolyam as "Évfolyam",
	osztaly as "Osztály",
	COUNT(*) as "Létszám"
FROM
	diak
GROUP BY
	evfolyam, osztaly
ORDER BY
	"Évfolyam", "Osztály" ASC;