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