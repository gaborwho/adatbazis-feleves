-- Megadott sorok t�rl�se

SET VERIFY OFF
ACCEPT tabla PROMPT "K�rem a t�bla nev�t: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT feltetel PROMPT "K�rem a t�rl�s felt�tel�t: "

DELETE FROM &tabla WHERE &feltetel;

SET VERIFY ON