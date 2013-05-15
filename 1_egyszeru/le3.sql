SET linesize 80
SET pagesize 15
TTITLE "Az �sszes �t�s, id�pont szerint rendezve:"
BTITLE "eNapl�"

SELECT
	nev AS "N�v",
	targy AS "T�rgy",
	datum AS "D�tum"
FROM ertekeles
WHERE
	osztalyzat = 5
ORDER BY datum;

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400