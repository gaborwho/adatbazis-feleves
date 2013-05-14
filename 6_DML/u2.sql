-- A 11. c osztály új osztályfõnöke legyen a 9. a osztály osztályfõnöke

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