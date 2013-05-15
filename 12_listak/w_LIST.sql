SET serveroutput ON
SET verify OFF

DECLARE
	sorszam NUMBER;
BEGIN
	sorszam := 0;
	DBMS_OUTPUT.PUT_LINE('Osztályzatok listázása:');
	FOR a IN (SELECT d.nev, d.evfolyam, d.osztaly, e.osztalyzat, e.targy
		FROM ertekeles e, diak d
		WHERE
			e.osztalyzat IS NOT NULL AND
			d.nev = e.nev AND
			d.anyja_neve = e.anyja_neve AND
			d.szuletes = e.szuletes
		ORDER BY d.nev)
	LOOP
		sorszam := sorszam + 1;
		DBMS_OUTPUT.PUT_LINE('<>' || LPAD(sorszam,3,' ') || '. Név: ' || RPAD(INITCAP(a.nev || '; '),32,' ') || LPAD(a.evfolyam,2,' ') || '.' || a.osztaly || ': ' || a.osztalyzat || ' (' || a.targy || ')');
	END LOOP;
END;
/

SET serveroutput OFF
SET verify ON