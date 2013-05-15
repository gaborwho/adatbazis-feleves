SET serveroutput ON
CREATE OR REPLACE FUNCTION osztalyfonoke(
	k_nev IN VARCHAR2, k_anyja_neve IN VARCHAR2, k_szuletes IN DATE,
	k_osztalyfonok IN VARCHAR2)
	RETURN BOOLEAN
IS
	osztalyfonoknev osztaly.osztalyfonok%TYPE;
BEGIN
	SELECT osztalyfonok
	INTO osztalyfonoknev
	FROM osztaly o, diak d
	WHERE
		d.evfolyam = o.evfolyam AND
		d.osztaly = o.osztaly AND
		d.nev = k_nev AND
		d.anyja_neve = k_anyja_neve AND
		d.szuletes = k_szuletes AND
		o.osztalyfonok = k_osztalyfonok;
	RETURN TRUE;
EXCEPTION
	WHEN NO_DATA_FOUND
	THEN RAISE_APPLICATION_ERROR(-20124,'Nem az osztályfõnöke!');
END;
/
SHOW ERRORS
SET serveroutput OFF