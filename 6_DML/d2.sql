-- Amnesztiát kapnak a diákok, mindenkinek igazoljuk a hiányzását

DELETE FROM ertekeles
WHERE hianyzas IS NOT NULL;

ROLLBACK;