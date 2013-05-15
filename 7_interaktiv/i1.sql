-- Sorok módosítása

SET VERIFY OFF

ACCEPT tabla PROMPT "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Melyik oszlopot kívánja módosítani? "
ACCEPT ertek PROMPT "Milyen értéket kíván megadni? "
ACCEPT feltetel PROMPT "Kérem a módosítás feltételét: "

UPDATE &tabla
SET &oszlop = &ertek
WHERE &feltetel;

SET VERIFY ON