-- Oszlop m�dos�t�sa

SET verify OFF
ACCEPT &tabla "K�rem a t�bla nev�t: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "K�rem a m�dos�tand� oszlop nev�t: "
ACCEPT parameterek PROMPT "K�rem a m�dos�t�s param�tereit: "

ALTER TABLE &tabla MODIFY (&oszlop &parameterek);

SET VERIFY ON