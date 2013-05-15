SET linesize 80
SET pagesize 25
TTITLE "Az egyes di�kok oszt�lytermei:"
BTITLE "eNapl�"

SELECT
	d.nev AS "N�v",
	o.terem AS "Oszt�lyterem"
FROM
	diak d,
	osztaly o
WHERE
	d.evfolyam = o.evfolyam AND
	d.osztaly = o.osztaly
ORDER BY
	"N�v";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400