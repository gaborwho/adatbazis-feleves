-- Magdolna nevû tanárok osztályába járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE osztalyfonok LIKE '%Magdolna%')
;

-- Diákok, akiknek a másodikon van a termük
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) IN (SELECT osztaly, evfolyam FROM osztaly WHERE terem >= 200 AND terem < 300)
;

-- Kilencedikesekkel nem egy terembe járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem <> ALL (SELECT terem FROM osztaly WHERE evfolyam = 9)
;

-- Legalább egy kilencedikes osztály terménél magasabb számú terembe járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d,
	osztaly o
WHERE
	d.osztaly = o.osztaly AND
	d.evfolyam = o.evfolyam AND
	o.terem > ANY (SELECT terem FROM osztaly WHERE evfolyam = 9)
;

-- Andrásokkal nem egy osztályba járó diákok
SELECT
	d.nev AS "Név"
FROM
	diak d
WHERE
	(osztaly, evfolyam) NOT IN (SELECT osztaly, evfolyam FROM diak WHERE nev LIKE '%András%')
;