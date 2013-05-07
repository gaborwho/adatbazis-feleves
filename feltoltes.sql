DROP TABLE ertekeles;
DROP TABLE diak;
DROP TABLE osztaly;

CREATE TABLE osztaly
(
	evfolyam NUMBER(2),
	osztaly CHAR(1),
	osztalyfonok VARCHAR(32),
	terem NUMBER(3) UNIQUE,
	CONSTRAINT pk_osztaly PRIMARY KEY (evfolyam, osztaly),
	CONSTRAINT check_osztaly_evfolyam CHECK (evfolyam BETWEEN 9 and 12)
);

CREATE TABLE diak
(
	nev VARCHAR(32),
	anyja_neve VARCHAR(32),
	szuletes DATE,
	evfolyam NUMBER(2),
	osztaly CHAR(1),
	iranyitoszam NUMBER(4),
	lakcim VARCHAR(32),
	CONSTRAINT pk_diak PRIMARY KEY (nev, anyja_neve, szuletes),
	CONSTRAINT fk_diak_osztaly FOREIGN KEY (evfolyam, osztaly) REFERENCES osztaly (evfolyam, osztaly)
);

CREATE TABLE ertekeles
(
	nev VARCHAR(32),
	anyja_neve VARCHAR(32),
	szuletes DATE,
	datum DATE,
	targy VARCHAR(16),
	osztalyzat NUMBER(1),
	hianyzas NUMBER(1),
	CONSTRAINT pk_ertekeles PRIMARY KEY (nev, anyja_neve, szuletes, datum, targy),
	CONSTRAINT check_ertekeles_targy CHECK (targy IN ('Magyar', 'Matematika', 'Technika', 'Zene', 'Testnevelés')),
	CONSTRAINT check_ertekeles_osztalyzat CHECK (osztalyzat BETWEEN 1 AND 5),
	CONSTRAINT check_ertekeles_hianyzas CHECK (hianyzas IS NULL OR hianyzas IS NOT NULL AND osztalyzat IS NULL AND hianyzas <= 1),
	CONSTRAINT fk_ertekeles_diak FOREIGN KEY (nev, anyja_neve, szuletes) REFERENCES diak (nev, anyja_neve, szuletes)
);

INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (9, 'a', 'Kiss Magdolna', 321);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (9, 'b', 'Szabó Ferenc', 221);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (10, 'c', 'Kovács Péter', 223);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (11, 'c', 'Kovács Ilona', 103);

INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Bogdán András','Fehér Magdolna','1994-6-11',11,'c',1046,'Ajnácskő u. 1.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Major Marianna','Pintér Rita','1994-10-29',11,'c',1014,'Vágfarkasd u. 14.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Vass Bernadett','Molnár Ágnes','1996-3-27',10,'c',1070,'Szabolcska Mihály u. 7.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Magyar Dezső','Dudás Ildikó','1994-6-20',9,'b',1042,'Móricz Zsigmond körtér 5.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Oláh Irén','Fábián Fanni','1997-1-24',9,'b',1089,'Serleg u. 7.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Juhász Balázs','Gáspár Ibolya','1994-1-27',9,'a',1028,'Hamzsabégi út 8.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Kozma Andrea','Boros Anett','1995-12-11',9,'a',1093,'Október 23.-a u. 8.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Gulyás Attila','Máté Judit','1994-5-22',11,'c',1079,'Budaörsi út 3.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Tamás Márta','Jakab Eszter','1996-8-21',10,'c',1030,'Rőf u. 15.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Szücs Irén','Major Brigitta','1995-4-1',9,'a',1074,'Függetlenségi park 6.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Székely Klára','Sipos Magdolna','1994-7-28',9,'b',1066,'Bukarest u. 11.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Bognár Norbert','Szűcs Nikoletta','1997-8-21',9,'b',1029,'Diószegi út 5.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Veres Márton','Illés Kinga','1996-10-17',10,'c',1075,'Tass Vezér u. 1.');

INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat) 
	VALUES ('Bogdán András', 'Fehér Magdolna', '1994-6-11', '2013-4-4', 'Magyar', 3 );
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat) 
	VALUES ('Bogdán András', 'Fehér Magdolna', '1994-6-11', '2013-4-4', 'Zene', 3 );
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat) 
	VALUES ('Bogdán András', 'Fehér Magdolna', '1994-6-11', '2013-4-4', 'Matematika', 5 );

INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, hianyzas) 
	VALUES ('Bogdán András', 'Fehér Magdolna', '1994-6-11', '2013-4-9', 'Matematika', 1 );

SELECT nev, anyja_neve, evfolyam, osztaly FROM diak;
SELECT * FROM osztaly;
SELECT nev, datum, osztalyzat, hianyzas FROM ertekeles;
