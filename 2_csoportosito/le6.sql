SET linesize 80
SET pagesize 15
TTITLE "Az egyes tárgyakban elért eredmények átlaga:"
BTITLE "eNapló"

SELECT
	targy AS "Tárgy",
	ROUND(AVG(osztalyzat),2) AS "Átlag"
FROM
	ertekeles
GROUP BY
	targy
ORDER BY
	"Átlag" DESC, "Tárgy" ASC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400