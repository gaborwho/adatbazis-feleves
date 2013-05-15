SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "Kérem a diák nevét: "
ACCEPT anyja_neve PROMPT "Kérem a diák anyjának nevét: "
ACCEPT szuletes PROMPT "Kérem a diák születési dátumát: "
ACCEPT targy PROMPT "Kérem a törlendõ értékelés tantárgyát: "
ACCEPT datum PROMPT "Kérem a törlendõ értékelés dátumát: "

DECLARE
	v_nev ertekeles.nev%TYPE;
BEGIN
	DELETE FROM ertekeles
	WHERE
		UPPER(nev) = UPPER('&nev') AND
		UPPER(anyja_neve) = UPPER('&anyja_neve') AND
		szuletes = TO_DATE('&szuletes') AND
		UPPER(targy) = UPPER('&targy') AND
		datum = TO_DATE('&datum');

	EXCEPTION
		WHEN NO_DATA_FOUND
		THEN RAISE_APPLICATION_ERROR(-20201,'Nincs ilyen értékelés.');
END;
/

SET serveroutput OFF
SET verify ON