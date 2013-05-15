SET serveroutput ON
CREATE OR REPLACE TRIGGER ujhianyzas
BEFORE INSERT ON ertekeles
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('�j hi�nyz�s trigger fut...');
	IF :NEW.hianyzas IS NOT NULL AND
		hianyzott(:NEW.nev, :NEW.anyja_neve, :NEW.szuletes) = FALSE
	THEN
		DBMS_OUTPUT.PUT_LINE('A di�k eddig sosem hi�nyzott!');
	END IF;
END;
/
SHOW ERRORS
SET serveroutput OFF