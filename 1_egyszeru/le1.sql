-- Mely oszt�lyba j�rnak Ir�n nev� di�kok
SELECT
	nev AS "N�v",
	evfolyam AS "�vfolyam",
	osztaly AS "Oszt�ly"
FROM diak
WHERE nev LIKE '%Ir�n%'
ORDER BY nev;