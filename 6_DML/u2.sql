-- A 11. c oszt�ly �j oszt�lyf�n�ke legyen a 9. a oszt�ly oszt�lyf�n�ke

SAVEPOINT SP2;

UPDATE
	osztaly
SET
	osztalyfonok = (SELECT osztalyfonok
		FROM osztaly
		WHERE evfolyam = 9 AND osztaly = 'a')
WHERE
	evfolyam = 11 AND
	osztaly = 'c';

COMMIT;