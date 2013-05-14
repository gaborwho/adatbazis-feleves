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