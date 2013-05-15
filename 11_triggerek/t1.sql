-- Oszt�lyzat �rt�k�nek ellen�rz�se

SET serveroutput ON
CREATE OR REPLACE TRIGGER osztalyzat
BEFORE INSERT ON ertekeles
FOR EACH ROW
DECLARE
	tulkicsi EXCEPTION;
	tulnagy EXCEPTION;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�j �rt�kel�s trigger fut...');
	IF :NEW.osztalyzat IS NOT NULL AND :NEW.osztalyzat < 0
	THEN
		RAISE tulkicsi;
	ELSIF :NEW.osztalyzat IS NOT NULL AND :NEW.osztalyzat > 5
	THEN
		RAISE tulnagy;
	END IF;
	DBMS_OUTPUT.PUT_LINE('Az �rt�kel�s megfelel�!');
EXCEPTION
	WHEN tulkicsi
	THEN RAISE_APPLICATION_ERROR(-20121,'Ilyen kis oszt�lyzatot nem lehet adni!');
	WHEN tulnagy
	THEN RAISE_APPLICATION_ERROR(-20122,'Ilyen nagy oszt�lyzatot nem lehet adni!');
END;
/
SHOW ERRORS
SET serveroutput OFF