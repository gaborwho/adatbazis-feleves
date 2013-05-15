-- Van-e a diáknak hiányzása?

CREATE OR REPLACE FUNCTION hianyzott(
	diak_nev in VARCHAR2,
	diak_anyja_neve in VARCHAR2,
	diak_szuletes in DATE)
	RETURN BOOLEAN
IS
	CURSOR k1 IS SELECT * FROM ertekeles;
	k1_rekord k1%ROWTYPE;
BEGIN
	OPEN k1;
	LOOP
		FETCH k1 INTO k1_rekord;
		EXIT WHEN k1%notfound;
		IF
			UPPER(k1_rekord.nev) LIKE UPPER(diak_nev) AND
			UPPER(k1_rekord.anyja_neve) = UPPER(diak_anyja_neve) AND
			k1_rekord.szuletes = diak_szuletes AND
			k1_rekord.hianyzas IS NOT NULL
		THEN
			RETURN TRUE;
		END IF;
	END LOOP;
	RETURN FALSE;
END;
/
SHOW ERRORS