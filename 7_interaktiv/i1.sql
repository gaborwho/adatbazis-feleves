-- Sorok m�dos�t�sa

SET VERIFY OFF

ACCEPT tabla PROMPT "K�rem a t�bla nev�t: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Melyik oszlopot k�v�nja m�dos�tani? "
ACCEPT ertek PROMPT "Milyen �rt�ket k�v�n megadni? "
ACCEPT feltetel PROMPT "K�rem a m�dos�t�s felt�tel�t: "

UPDATE &tabla
SET &oszlop = &ertek
WHERE &feltetel;

SET VERIFY ON