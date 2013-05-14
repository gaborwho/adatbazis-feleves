-- Új oszlop hozzáadása

SET verify OFF
ACCEPT &tabla "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "Kérem az új oszlop nevét: "
ACCEPT tipus PROMPT "Kérem az új oszlop típusát: "

ALTER TABLE &tabla ADD (&oszlop &tipus);

SET VERIFY ON