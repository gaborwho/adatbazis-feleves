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

-- A hetedik kerületben lakó, 9. után járó diákok száma, évfolyam szerint csoportosítva
SELECT
	evfolyam AS "Évfolyam",
	COUNT(*) AS "Hetedik kerületi lakosok"
FROM
	diak
WHERE
	iranyitoszam >= 1070 AND iranyitoszam <= 1079
GROUP BY
	evfolyam
HAVING
	evfolyam > 9
ORDER BY 
	"Hetedik kerületi lakosok" DESC;
	
-- Az egyes tárgyakban elért eredmények átlaga
SELECT
	targy AS "Tárgy",
	AVG(osztalyzat) AS "Átlag"
FROM
	ertekeles
GROUP BY
	targy
ORDER BY
	"Átlag" DESC, "Tárgy" ASC;
