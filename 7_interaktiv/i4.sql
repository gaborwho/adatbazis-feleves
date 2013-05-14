-- Oszlop módosítása

SET verify OFF
ACCEPT &tabla "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Kérem a módosítandó oszlop nevét: "
ACCEPT parameterek PROMPT "Kérem a módosítás paramétereit: "

ALTER TABLE &tabla MODIFY (&oszlop &parameterek);

SET VERIFY ON