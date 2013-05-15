SET linesize 80
SET pagesize 15
TTITLE "Az egyes t�rgyakban el�rt eredm�nyek �tlaga:"
BTITLE "eNapl�"

SELECT
	targy AS "T�rgy",
	ROUND(AVG(osztalyzat),2) AS "�tlag"
FROM
	ertekeles
GROUP BY
	targy
ORDER BY
	"�tlag" DESC, "T�rgy" ASC;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400