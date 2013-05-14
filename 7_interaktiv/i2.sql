-- Megadott sorok törlése

SET VERIFY OFF
ACCEPT tabla PROMPT "Kérem a tábla nevét: "
PROMPT "A &tabla tartalma: "
SELECT * FROM &tabla;
ACCEPT feltetel PROMPT "Kérem a törlés feltételét: "

DELETE FROM &tabla WHERE &feltetel;

SET VERIFY ON