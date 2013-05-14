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