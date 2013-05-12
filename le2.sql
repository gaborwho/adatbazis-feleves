-- Az egyes oszt�lyok l�tsz�ma
SELECT
	evfolyam as "�vfolyam",
	osztaly as "Oszt�ly",
	COUNT(*) as "L�tsz�m"
FROM
	diak
GROUP BY
	evfolyam, osztaly
ORDER BY
	"�vfolyam", "Oszt�ly" ASC;

-- A hetedik ker�letben lak�, 9. ut�n j�r� di�kok sz�ma, �vfolyam szerint csoportos�tva
SELECT
	evfolyam AS "�vfolyam",
	COUNT(*) AS "Hetedik ker�leti lakosok"
FROM
	diak
WHERE
	iranyitoszam >= 1070 AND iranyitoszam <= 1079
GROUP BY
	evfolyam
HAVING
	evfolyam > 9
ORDER BY 
	"Hetedik ker�leti lakosok" DESC;
	
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
