-- Amneszti�t kapnak a di�kok, mindenkinek igazoljuk a hi�nyz�s�t

DELETE FROM ertekeles
WHERE hianyzas IS NOT NULL;

ROLLBACK;