SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "Kérem a diák nevét: "
ACCEPT anyja_neve PROMPT "Kérem a diák anyjának nevét: "
ACCEPT szuletes PROMPT "Kérem a diák születési dátumát: "
ACCEPT targy PROMPT "Kérem a módosítandó osztályzat tantárgyát: "
ACCEPT datum PROMPT "Kérem a módosítandó osztályzat dátumát: "
ACCEPT osztalyzat PROMPT "Kérem a korrigált osztályzatot: "
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
		RAISE_APPLICATION_ERROR(-20900,'Nincs ilyen osztályzat!');
	END IF;
END;
/

SET serveroutput OFF
SET verify ON