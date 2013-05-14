-- A 11. c osztály új osztályfõnöke Fekete Zoltán

SAVEPOINT SP1;

UPDATE
	osztaly
SET
	osztalyfonok = 'Fekete Zoltán'
WHERE
	evfolyam = 11 AND
	osztaly = 'c';

ROLLBACK TO SP1;