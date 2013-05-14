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