SET linesize 80
SET pagesize 15
TTITLE "Mely oszt�lyba j�rnak Ir�n nev� di�kok:"
BTITLE "eNapl�"

SELECT
	nev AS "N�v",
	evfolyam AS "�vfolyam",
	osztaly AS "Oszt�ly"
FROM diak
WHERE nev LIKE '%Ir�n%'
ORDER BY nev;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400