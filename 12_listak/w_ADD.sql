SET serveroutput ON
SET verify OFF

ACCEPT nev PROMPT "K�rem a di�k nev�t: "
ACCEPT anyja_neve PROMPT "K�rem a di�k anyj�nak nev�t: "
ACCEPT szuletes PROMPT "K�rem a di�k sz�let�si d�tum�t: "
ACCEPT targy PROMPT "K�rem a t�rgy nev�t: "
ACCEPT osztalyzat PROMPT "K�rem az oszt�lyzatot (�res, ha hi�nyzott): " default 0
ACCEPT datum PROMPT "K�rem az oszt�lyzat d�tum�t: "

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