-- Oszlop átnevezése

SET verify OFF
ACCEPT tabla PROMPT "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Kérem az átnevezendõ oszlop nevét: "
ACCEPT ujnev PROMPT "Kérem az új nevet: "

ALTER TABLE &tabla RENAME COLUMN &oszlop TO &ujnev;

SELECT * FROM &tabla;

SET VERIFY ON