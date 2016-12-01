DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS MOVIES;
DROP TABLE IF EXISTS ACTORS;
DROP TABLE IF EXISTS DIRECTORS;
DROP TABLE IF EXISTS SPOUSES;
DROP TABLE IF EXISTS PEOPLES;
DROP TYPE IF EXISTS  parts;

CREATE TYPE parts as ENUM ('Director','Actor');

CREATE TABLE PEOPLES (
	pid			CHAR(6) UNIQUE NOT NULL,
	fName		TEXT NOT NULL,
	lName		TEXT NOT NULL,
	bDay		DATE NOT NULL,
	htIn		INTEGER NOT NULL,
	wtLbs		INTEGER NOT NULL,
	SpouseID	CHAR(6),
	address		TEXT NOT NULL,
	hairColor	TEXT NOT NULL,
	eyeColor	TEXT NOT NULL,
	primary key(pid)	
);

CREATE TABLE ACTORS(
    pid 	CHAR(6) NOT NULL REFERENCES PEOPLES(pid),
    AGDate	DATE,
    primary key (pid)
);

CREATE TABLE DIRECTORS(
    pid			CHAR(6) NOT NULL REFERENCES PEOPLES(pid),
    filmSchool	TEXT,
    DGDate		DATE,
    LensMkr		TEXT
);

CREATE TABLE MOVIES(
    fid				CHAR(6) UNIQUE NOT NULL,
    mName			TEXT NOT NULL,
    MPAANum			TEXT NOT NULL,
    releaseDate		DATE NOT NULL,
    salesDomUS		INT,
    salesForUS		INT,
    salesDvdBlueUS	INT,
    Primary Key(fid)
);

CREATE TABLE STAFF(
	pid 	CHAR(6) NOT NULL REFERENCES PEOPLES (pid),
	fid		CHAR(6) NOT NULL REFERENCES MOVIES (fid),
	part	parts
);

CREATE TABLE SPOUSES(
    SpouseID CHAR(6),
    Primary Key (SpouseID)
);
INSERT INTO PEOPLES(pid, fname, lname, bday, htIn, wtLbs, address, SpouseID, haircolor, eyecolor)
    VALUES	('aaa001','Nicholas','Bradford','Dec-3-1996',61,230,'3399 N Rd',NULL,'blonde','green'),
    		('aaa007','Sean','Connery','Aug-25-1930',74,240,'123 Main St','007abc','white','brown'),
            ('aab007','Pierce','Brosnan','May-16-1953',74,210,'124 Main St','007abb','brown','blue'),
            ('daa001','Terrence','Young','Jun-10-1915',70,180,'111 Main St',NULL,'white','brown');
            
INSERT INTO ACTORS(pid, AGdate)
	VALUES	('aaa007','May-08-1962'),
    		('aab007','May-11-1984'),
            ('aaa001','Dec-03-2011');
    
INSERT INTO DIRECTORS(pid, filmSchool, DGDate, LensMkr)
	VALUES	('daa001','Self-Taught','Oct-26-1939','Sony'),
        	('aaa001','Self-Taught','Oct-26-1939','Sony');

INSERT INTO MOVIES(fid,mName,MPAANum,releaseDate,salesDomUS)
	VALUES	('f10b00','Dr.No','PG','Oct-5-1962',16067035),
    		('f10b01','From Russia With Love','PG','May-27-1964',24800000);

INSERT INTO STAFF(pid, fid, part)
	VALUES	('daa001','f10b00','Director'),
    		('aaa007','f10b00','Actor'),
            ('aaa007','f10b01','Actor'),
            ('aaa001','f10b01','Director');
    
Select *
From PEOPLES;

Select *
From ACTORS;

Select *
From DIRECTORS;

Select *
From STAFF;

SELECT DISTINCT p.pid, fname, lname 
FROM PEOPLES p INNER JOIN DIRECTORS d ON (p.pid = d.pid)
		INNER JOIN STAFF c ON (d.pid = c.pid)
		WHERE p.pid != 'aaa007'
        AND c.part = 'Director';



