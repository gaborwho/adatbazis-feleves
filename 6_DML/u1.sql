-- A 11. c oszt�ly �j oszt�lyf�n�ke Fekete Zolt�n

SAVEPOINT SP1;

UPDATE
	osztaly
SET
	osztalyfonok = 'Fekete Zolt�n'
WHERE
	evfolyam = 11 AND
	osztaly = 'c';

ROLLBACK TO SP1;