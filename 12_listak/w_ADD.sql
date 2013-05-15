SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "Kérem a diák nevét: "
ACCEPT anyja_neve PROMPT "Kérem a diák anyjának nevét: "
ACCEPT szuletes PROMPT "Kérem a diák születési dátumát: "
ACCEPT targy PROMPT "Kérem a tárgy nevét: "
ACCEPT osztalyzat PROMPT "Kérem az osztályzatot (üres, ha hiányzott): " default 0
ACCEPT datum PROMPT "Kérem az osztályzat dátumát: "

BEGIN
	IF &osztalyzat = 0
	THEN
		INSERT INTO ertekeles (nev, anyja_neve, szuletes, targy, datum, hianyzas)
			VALUES ('&nev', '&anyja_neve', TO_DATE('&szuletes'), '&targy', TO_DATE('&datum'), 1);
	ELSE
		INSERT INTO ertekeles (nev, anyja_neve, szuletes, targy, datum, osztalyzat)
			VALUES ('&nev', '&anyja_neve', TO_DATE('&szuletes'),
				'&targy',TO_DATE('&datum'), '&osztalyzat');
	END IF;
END;
/

SET serveroutput OFF
SET verify ON