-- Magdolna nev� tan�rok oszt�ly�ba j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
;

-- Di�kok, akiknek a m�sodikon van a term�k
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
;

-- Kilencedikesekkel nem egy terembe j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem <> ALL (SELECT terem FROM osztaly WHERE evfolyam = 9)
;

-- Legal�bb egy kilencedikes oszt�ly term�n�l magasabb sz�m� terembe j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem > ANY (SELECT terem FROM osztaly WHERE evfolyam = 9)
;

-- Andr�sokkal nem egy oszt�lyba j�r� di�kok
SELECT
	d.nev AS "N�v"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%Andr�s%')
;