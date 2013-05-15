-- Tanulópárok kialakítása

DROP TABLE tanuloparok;
CREATE TABLE tanuloparok AS SELECT * FROM diak;
ALTER TABLE tanuloparok ADD (par_nev VARCHAR(32), par_anyja_neve VARCHAR(32), par_szuletes DATE);

CREATE OR REPLACE VIEW diakatlag AS
SELECT
	t.nev, t.anyja_neve, t.szuletes,
	t.par_nev, t.par_anyja_neve, t.par_szuletes,
	t.evfolyam,
	a.atlag
FROM
	tanuloparok t,
(SELECT d.nev, d.anyja_neve, d.szuletes,
	AVG(e.osztalyzat) AS atlag
FROM tanuloparok d, ertekeles e
WHERE
	d.nev = e.nev AND
	d.anyja_neve = e.anyja_neve AND
	d.szuletes = e.szuletes
GROUP BY d.nev, d.anyja_neve, d.szuletes) a
WHERE
	t.nev = a.nev AND
	t.anyja_neve = a.anyja_neve AND
	t.szuletes = a.szuletes;

BEGIN
FOR i IN (
	SELECT * FROM diakatlag
	ORDER BY atlag DESC)
LOOP
SELECT par_nev INTO parnev FROM tanuloparok t
	WHERE t.nev = i.nev AND t.anyja_neve = i.anyja_neve AND t.szuletes = i.szuletes;
IF parnev IS NULL
THEN
	FOR j IN (
		SELECT * FROM diakatlag
		WHERE
			par_nev IS NULL AND
			evfolyam = i.evfolyam AND 
			nev != i.nev AND anyja_neve != i.anyja_neve AND szuletes != i.szuletes
		ORDER BY atlag ASC)
	LOOP		
		UPDATE tanuloparok SET
			par_nev = j.nev,
			par_anyja_neve = j.anyja_neve,
			par_szuletes = j.szuletes
		WHERE
			nev = i.nev AND
			anyja_neve = i.anyja_neve
			AND szuletes = i.szuletes;

		UPDATE tanuloparok SET
			par_nev = i.nev,
			par_anyja_neve = i.anyja_neve,
			par_szuletes = i.szuletes
		WHERE
			nev = j.nev AND
			anyja_neve = j.anyja_neve
			AND szuletes = j.szuletes;

		EXIT;
	END LOOP;
END IF;
END LOOP;
END;
/

SELECT nev, par_nev FROM tanuloparok;