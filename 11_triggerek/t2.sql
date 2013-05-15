SET serveroutput ON
CREATE OR REPLACE TRIGGER ujhianyzas
BEFORE INSERT ON ertekeles
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Új hiányzás trigger fut...');
	IF :NEW.hianyzas IS NOT NULL AND
		hianyzott(:NEW.nev, :NEW.anyja_neve, :NEW.szuletes) = FALSE
	THEN
		DBMS_OUTPUT.PUT_LINE('A diák eddig sosem hiányzott!');
	END IF;
END;
/
SHOW ERRORS
SET serveroutput OFF