-- Az egyes t�rgyakban el�rt eredm�nyek �tlaga
SELECT
	targy AS "T�rgy",
	AVG(osztalyzat) AS "�tlag"
FROM
	ertekeles
GROUP BY
	targy
ORDER BY
	"�tlag" DESC, "T�rgy" ASC;