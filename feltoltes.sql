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
	CONSTRAINT check_ertekeles_targy CHECK (targy IN ('Magyar', 'Matematika', 'Technika', 'Zene', 'Testnevel�s')),
	CONSTRAINT check_ertekeles_osztalyzat CHECK (osztalyzat BETWEEN 1 AND 5),
	CONSTRAINT check_ertekeles_hianyzas CHECK (hianyzas IS NULL OR hianyzas IS NOT NULL AND osztalyzat IS NULL AND hianyzas <= 1),
	CONSTRAINT fk_ertekeles_diak FOREIGN KEY (nev, anyja_neve, szuletes) REFERENCES diak (nev, anyja_neve, szuletes)
);

INSERT INTO osztaly
	VALUES (9, 'a', 'Kiss Magdolna', 321);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (9, 'b', 'Szab� Ferenc', 221);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (10, 'c', 'Kov�cs P�ter', 223);
INSERT INTO osztaly (evfolyam, osztaly, osztalyfonok, terem) 
	VALUES (11, 'c', 'Kov�cs Ilona', 103);

INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Bogd�n Andr�s','Feh�r Magdolna','1994-6-11',11,'c',1046,'Ajn�csk� u. 1.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Major Marianna','Pint�r Rita','1994-10-29',11,'c',1014,'V�gfarkasd u. 14.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Vass Bernadett','Moln�r �gnes','1996-3-27',10,'c',1070,'Szabolcska Mih�ly u. 7.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Magyar Dezs�','Dud�s Ildik�','1994-6-20',9,'b',1042,'M�ricz Zsigmond k�rt�r 5.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Ol�h Ir�n','F�bi�n Fanni','1997-1-24',9,'b',1089,'Serleg u. 7.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Juh�sz Bal�zs','G�sp�r Ibolya','1994-1-27',9,'a',1028,'Hamzsab�gi �t 8.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Kozma Andrea','Boros Anett','1995-12-11',9,'a',1093,'Okt�ber 23.-a u. 8.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Guly�s Attila','M�t� Judit','1994-5-22',11,'c',1079,'Buda�rsi �t 3.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Tam�s M�rta','Jakab Eszter','1996-8-21',10,'c',1030,'R�f u. 15.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Sz�cs Ir�n','Major Brigitta','1995-4-1',9,'a',1074,'F�ggetlens�gi park 6.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Sz�kely Kl�ra','Sipos Magdolna','1994-7-28',9,'b',1066,'Bukarest u. 11.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Bogn�r Norbert','Sz�cs Nikoletta','1997-8-21',9,'b',1029,'Di�szegi �t 5.');
INSERT INTO diak (nev, anyja_neve, szuletes, evfolyam, osztaly, iranyitoszam, lakcim) 
	VALUES ('Veres M�rton','Ill�s Kinga','1996-10-17',10,'c',1075,'Tass Vez�r u. 1.');

INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogd�n Andr�s', 'Feh�r Magdolna', '1994-6-11', '2013-05-06', 'Magyar', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Major Marianna', 'Pint�r Rita', '1994-10-29', '2013-05-07', 'Zene', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Vass Bernadett', 'Moln�r �gnes', '1996-3-27', '2013-05-10', 'Matematika', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Magyar Dezs�', 'Dud�s Ildik�', '1994-6-20', '2013-05-09', 'Magyar', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Ol�h Ir�n', 'F�bi�n Fanni', '1997-1-24', '2013-05-06', 'Zene', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Juh�sz Bal�zs', 'G�sp�r Ibolya', '1994-1-27', '2013-05-07', 'Matematika', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Kozma Andrea', 'Boros Anett', '1995-12-11', '2013-05-08', 'Magyar', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Guly�s Attila', 'M�t� Judit', '1994-5-22', '2013-05-08', 'Zene', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Tam�s M�rta', 'Jakab Eszter', '1996-8-21', '2013-05-06', 'Matematika', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�cs Ir�n', 'Major Brigitta', '1995-4-1', '2013-05-07', 'Magyar', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�kely Kl�ra', 'Sipos Magdolna', '1994-7-28', '2013-05-09', 'Zene', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogn�r Norbert', 'Sz�cs Nikoletta', '1997-8-21', '2013-05-07', 'Matematika', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Veres M�rton', 'Ill�s Kinga', '1996-10-17', '2013-05-10', 'Magyar', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogd�n Andr�s', 'Feh�r Magdolna', '1994-6-11', '2013-05-09', 'Zene', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Major Marianna', 'Pint�r Rita', '1994-10-29', '2013-05-06', 'Matematika', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Vass Bernadett', 'Moln�r �gnes', '1996-3-27', '2013-05-07', 'Magyar', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Magyar Dezs�', 'Dud�s Ildik�', '1994-6-20', '2013-05-08', 'Zene', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Ol�h Ir�n', 'F�bi�n Fanni', '1997-1-24', '2013-05-09', 'Matematika', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Juh�sz Bal�zs', 'G�sp�r Ibolya', '1994-1-27', '2013-05-10', 'Magyar', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Kozma Andrea', 'Boros Anett', '1995-12-11', '2013-05-06', 'Zene', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Guly�s Attila', 'M�t� Judit', '1994-5-22', '2013-05-10', 'Matematika', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Tam�s M�rta', 'Jakab Eszter', '1996-8-21', '2013-05-07', 'Magyar', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�cs Ir�n', 'Major Brigitta', '1995-4-1', '2013-05-09', 'Zene', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�kely Kl�ra', 'Sipos Magdolna', '1994-7-28', '2013-05-06', 'Matematika', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogn�r Norbert', 'Sz�cs Nikoletta', '1997-8-21', '2013-05-07', 'Magyar', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Veres M�rton', 'Ill�s Kinga', '1996-10-17', '2013-05-07', 'Zene', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogd�n Andr�s', 'Feh�r Magdolna', '1994-6-11', '2013-05-08', 'Matematika', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Major Marianna', 'Pint�r Rita', '1994-10-29', '2013-05-10', 'Magyar', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Vass Bernadett', 'Moln�r �gnes', '1996-3-27', '2013-05-09', 'Zene', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Magyar Dezs�', 'Dud�s Ildik�', '1994-6-20', '2013-05-06', 'Matematika', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Ol�h Ir�n', 'F�bi�n Fanni', '1997-1-24', '2013-05-07', 'Magyar', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Juh�sz Bal�zs', 'G�sp�r Ibolya', '1994-1-27', '2013-05-06', 'Zene', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Kozma Andrea', 'Boros Anett', '1995-12-11', '2013-05-07', 'Matematika', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Guly�s Attila', 'M�t� Judit', '1994-5-22', '2013-05-08', 'Magyar', '4');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Tam�s M�rta', 'Jakab Eszter', '1996-8-21', '2013-05-10', 'Zene', '5');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�cs Ir�n', 'Major Brigitta', '1995-4-1', '2013-05-11', 'Matematika', '1');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Sz�kely Kl�ra', 'Sipos Magdolna', '1994-7-28', '2013-05-10', 'Magyar', '2');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Bogn�r Norbert', 'Sz�cs Nikoletta', '1997-8-21', '2013-05-10', 'Zene', '3');
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, osztalyzat)
	VALUES ('Veres M�rton', 'Ill�s Kinga', '1996-10-17', '2013-05-08', 'Matematika', '4');


INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, hianyzas) 
	VALUES ('Bogd�n Andr�s', 'Feh�r Magdolna', '1994-6-11', '2013-05-06', 'Matematika', 1 );
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, hianyzas)
	VALUES ('Kozma Andrea', 'Boros Anett', '1995-12-11', '2013-05-09', 'Matematika', 1);
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, hianyzas)
	VALUES ('Bogn�r Norbert', 'Sz�cs Nikoletta', '1997-8-21', '2013-05-08', 'Magyar', 1);
INSERT INTO ertekeles (nev, anyja_neve, szuletes, datum, targy, hianyzas)
	VALUES ('Kozma Andrea', 'Boros Anett', '1995-12-11', '2013-05-09', 'Zene', 1);

SELECT nev AS "N�v", anyja_neve AS "Anyja neve", evfolyam AS "�vfolyam", osztaly AS "Oszt�ly" FROM diak;
SELECT evfolyam AS "�vfolyam", osztaly AS "Oszt�ly", osztalyfonok AS "Oszt�lyf�n�k", terem AS "Terem"
FROM osztaly;
SELECT nev AS "N�v", datum AS "D�tum", osztalyzat AS "Oszt�lyzat", hianyzas AS "Hi�nyz�s" FROM ertekeles;
