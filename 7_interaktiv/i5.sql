-- Oszlop �tnevez�se

SET verify OFF
ACCEPT &tabla "K�rem a t�bla nev�t: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "K�rem az �tnevezend� oszlop nev�t: "
ACCEPT ujnev PROMPT "K�rem az �j nevet: "

ALTER TABLE &tabla RENAME COLUMN &oszlop TO &ujnev;

SET VERIFY ON