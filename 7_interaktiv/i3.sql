-- �j oszlop hozz�ad�sa

SET verify OFF
ACCEPT &tabla "K�rem a t�bla nev�t: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT oszlop PROMPT "K�rem az �j oszlop nev�t: "
ACCEPT tipus PROMPT "K�rem az �j oszlop t�pus�t: "

ALTER TABLE &tabla ADD (&oszlop &tipus);

SET VERIFY ON