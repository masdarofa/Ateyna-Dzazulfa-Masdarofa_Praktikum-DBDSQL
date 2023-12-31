CREATE DATABASE SISTEM_AKADEMIK;

USE SISTEM_AKADEMIK;

CREATE TABLE FAKULTAS(
	ID_FAKULTAS SMALLINT PRIMARY KEY,
	FAKULTAS VARCHAR(45)NOT NULL
);

CREATE TABLE JURUSAN(
	ID_JURUSAN SMALLINT PRIMARY KEY,
	ID_FAKULTAS SMALLINT REFERENCES FAKULTAS(ID_FAKULTAS),
	JURUSAN VARCHAR(45)NOT NULL
);

CREATE TABLE STRATA(
	ID_STRATA SMALLINT PRIMARY KEY,
	SINGKAT VARCHAR(10)NOT NULL,
	STRATA VARCHAR(45)NOT NULL
);

CREATE TABLE PROGRAM_STUDI(
	ID_PROGRAM_STUDI SMALLINT PRIMARY KEY,
	ID_STRATA SMALLINT REFERENCES STRATA(ID_STRATA),
	ID_JURUSAN SMALLINT REFERENCES JURUSAN(ID_JURUSAN),
	PROGRAM_STUDI VARCHAR(60)NOT NULL
);

CREATE TABLE SELEKSI_MASUK(
	ID_SELEKSI_MASUK SMALLINT PRIMARY KEY,
	SINGKAT VARCHAR(12)NOT NULL,
	SELEKSI_MASUK VARCHAR(100)NOT NULL
);

CREATE TABLE MAHASISWA(
	NIM VARCHAR(15)NOT NULL PRIMARY KEY,
	ID_SELEKSI_MASUK SMALLINT REFERENCES SELEKSI_MASUK(ID_SELEKSI_MASUK),
	ID_PROGRAM_STUDI SMALLINT REFERENCES PROGRAM_STUDI(ID_PROGRAM_STUDI),
	NAMA VARCHAR(45)NOT NULL,
	ANGKATAN SMALLINT,
	TGL_LAHIR DATE,
	KOTA_LAHIR VARCHAR(60),
	JENIS_KELAMIN CHAR(1) CHECK(JENIS_KELAMIN IN('P','W'))
);

INSERT INTO FAKULTAS
VALUES(1,'EKONOMI & BISNIS'),(2,'ILMU KOMPUTER')

INSERT INTO JURUSAN 
VALUES(21,2,'INFORMATIKA'),(22,2,'SISTEM INFORMASI'),(23,2,'TEKNIK KOMPUTER')

INSERT INTO strata
VALUES(1,'D1','DIPLOMA'),(2,'S1','SARJANA'),(3,'S2','MAGISTER')

INSERT INTO PROGRAM_STUDI 
VALUES(211,2,21,'TEKNIK INFORMATIKA'),(212,2,21,'TEKNIK KOMPUTER'),(219,3,21,'MAGISTER ILMU KOMPUTER')

INSERT INTO seleksi_masuk
VALUES(1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGRI'),(2,'SBMPTN','SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGRI')

INSERT INTO mahasiswa 
VALUES('155150400',1,211,'JONI',2015,'1997-01-01','MALANG','W'),('155150401',2,212,'JONO',2015,'1997-10-2','SITUBONDO','P')

UPDATE mahasiswa SET nama = 'Vanes' WHERE  nama = 'JONI';

SELECT * FROM mahasiswa;

DELETE FROM mahasiswa WHERE nama = 'JONO';

SELECT * FROM mahasiswa;