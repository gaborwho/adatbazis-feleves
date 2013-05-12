-- Mely oszt�lyba j�rnak Ir�n nev� di�kok
SELECT
	nev AS "N�v",
	evfolyam AS "�vfolyam",
	osztaly AS "Oszt�ly"
FROM diak
WHERE nev LIKE '%Ir�n%'
ORDER BY nev;

-- A 10.c oszt�ly n�vsora
SELECT
	nev AS "N�v"
FROM diak
WHERE
	evfolyam = 10 AND
	osztaly = 'c'
ORDER BY nev;

-- Az �sszes �t�s, id�pont szerint
SELECT
	nev AS "N�v",
	targy AS "T�rgy",
	datum AS "D�tum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;

