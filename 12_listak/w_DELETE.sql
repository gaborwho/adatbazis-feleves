SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "K�rem a di�k nev�t: "
ACCEPT anyja_neve PROMPT "K�rem a di�k anyj�nak nev�t: "
ACCEPT szuletes PROMPT "K�rem a di�k sz�let�si d�tum�t: "
ACCEPT targy PROMPT "K�rem a t�rlend� �rt�kel�s tant�rgy�t: "
ACCEPT datum PROMPT "K�rem a t�rlend� �rt�kel�s d�tum�t: "

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
		THEN RAISE_APPLICATION_ERROR(-20201,'Nincs ilyen �rt�kel�s.');
END;
/

SET serveroutput OFF
SET verify ON