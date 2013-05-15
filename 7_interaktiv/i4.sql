-- Oszlop módosítása

SET verify OFF
ACCEPT tabla PROMPT "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Kérem a módosítandó oszlop nevét: "
ACCEPT parameterek PROMPT "Kérem a módosítás paramétereit: "

ALTER TABLE &tabla MODIFY (&oszlop &parameterek);

SELECT * FROM &tabla;

SET VERIFY ON