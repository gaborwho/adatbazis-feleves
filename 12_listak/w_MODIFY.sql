SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "K�rem a di�k nev�t: "
ACCEPT anyja_neve PROMPT "K�rem a di�k anyj�nak nev�t: "
ACCEPT szuletes PROMPT "K�rem a di�k sz�let�si d�tum�t: "
ACCEPT targy PROMPT "K�rem a m�dos�tand� oszt�lyzat tant�rgy�t: "
ACCEPT datum PROMPT "K�rem a m�dos�tand� oszt�lyzat d�tum�t: "
ACCEPT osztalyzat PROMPT "K�rem a korrig�lt oszt�lyzatot: "
DECLARE
	talalt BOOLEAN;
BEGIN
	talalt := FALSE;
	FOR a IN (SELECT * FROM ertekeles)
	LOOP
		IF
			UPPER(a.nev) = UPPER('&nev') AND
			UPPER(a.anyja_neve) = UPPER('&anyja_neve') AND
			a.szuletes = TO_DATE('&szuletes') AND
			UPPER(a.targy) = UPPER('&targy') AND
			a.datum = TO_DATE('&datum') AND
			a.osztalyzat IS NOT NULL
		THEN
			UPDATE ertekeles
			SET osztalyzat = '&osztalyzat'
			WHERE
				UPPER(nev) = UPPER('&nev') AND
				UPPER(anyja_neve) = UPPER('&anyja_neve') AND
				szuletes = TO_DATE('&szuletes') AND
				UPPER(targy) = UPPER('&targy') AND
				datum = TO_DATE('&datum');
			talalt := TRUE;
			EXIT;
		END IF;
	END LOOP;
	IF talalt = FALSE
	THEN
		RAISE_APPLICATION_ERROR(-20900,'Nincs ilyen oszt�lyzat!');
	END IF;
END;
/

SET serveroutput OFF
SET verify ON