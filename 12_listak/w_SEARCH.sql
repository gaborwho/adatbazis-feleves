SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "Adja meg az �rt�kel�s t�rgy�t, vagy a di�k nev�t: "
DECLARE
	talalt BOOLEAN;
BEGIN
	talalt := FALSE;
	DBMS_OUTPUT.PUT_LINE('A tal�latok:');
	FOR a IN (SELECT d.nev, d.evfolyam, d.osztaly, e.osztalyzat, e.targy, e.hianyzas
		FROM ertekeles e, diak d
		WHERE
			d.nev = e.nev AND
			d.anyja_neve = e.anyja_neve AND
			d.szuletes = e.szuletes)
	LOOP
		IF UPPER(a.nev) LIKE UPPER('%&nev%') OR UPPER(a.targy) LIKE UPPER('%&nev%')
		THEN
			DBMS_OUTPUT.PUT_LINE('N�v: ' || INITCAP(a.nev) || ', ' || a.evfolyam || '. ' || a.osztaly || ': ' || a.targy || ' ' || a.osztalyzat || ' hi�nyz�s: ' || a.hianyzas );
			talalt := TRUE;
		END IF;
	END LOOP;
	IF talalt = FALSE
	THEN
		DBMS_OUTPUT.PUT_LINE('Nincs tal�lat...');
	END IF;
END;
/

SET serveroutput OFF
SET verify ON