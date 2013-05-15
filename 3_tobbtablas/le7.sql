SET linesize 80
SET pagesize 25
TTITLE "Az egyes diákok osztálytermei:"
BTITLE "eNapló"

SELECT
	d.nev AS "Név",
	o.terem AS "Osztályterem"
FROM
	diak d,
	osztaly o
WHERE
	d.evfolyam = o.evfolyam AND
	d.osztaly = o.osztaly
ORDER BY
	"Név";

TTITLE OFF
BTITLE OFF
SET pagesize 40
SET linesize 400