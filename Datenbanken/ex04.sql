DROP SCHEMA IF EXISTS `ex04`;
-- In MySQL, the schema is the synonym for the database
-- DROP DATABASE [IF EXISTS] database_name;
CREATE SCHEMA `ex04` DEFAULT CHARACTER SET utf8 ;
USE `ex04`;

-- ex04.personen definition


CREATE TABLE `person` (
  `pnr` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ex04.auto definition

CREATE TABLE `auto` (
  `anr` int(11) NOT NULL,
  `marke` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `baujahr` int(11) DEFAULT NULL,
  `pnr` int(11) NOT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ex04.person (pnr,name,vorname) VALUES (1,'Müller','Heinz');
INSERT INTO ex04.person (pnr,name,vorname) VALUES (2,'Meier','Hans');
INSERT INTO ex04.person (pnr,name,vorname) VALUES (3,'Schmid','Beat');
INSERT INTO ex04.person (pnr,name,vorname) VALUES (4,'Steffen','Felix');
INSERT INTO ex04.person (pnr,name,vorname) VALUES (5,'Einstein','Albert');

INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (1,'Audi','A6',2008,3);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (2,'Opel','Antara',2007,1);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (3,'Fiat','Punto',2002,4);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (4,'VW','Bora',2003,2);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (5,'Toyota','Yaris',2006,2);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (6,'VW','Golf',2004,1);
INSERT INTO ex04.auto (anr,marke,typ,baujahr,pnr) VALUES (7,'Honda','Civic',2004,2);

ALTER TABLE ex04.auto ADD CONSTRAINT auto_FK FOREIGN KEY (pnr) REFERENCES ex04.person(pnr);

-- ex04.autopersonen source

CREATE OR REPLACE VIEW ex04.autoperson
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr
FROM
    ex04.auto a
INNER JOIN ex04.person p ON
    a.pnr = p.pnr;

-- ex04.auto_allperson source
   
CREATE OR REPLACE VIEW ex04.auto_allperson
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr
FROM
    ex04.auto a
RIGHT JOIN ex04.person p ON
    a.pnr = p.pnr;

   
-- ex04.auto_allperson_2008 source   

CREATE OR REPLACE VIEW ex04.auto_allperson_2008
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr
FROM
    ex04.auto a
RIGHT JOIN ex04.person p ON
    a.pnr = p.pnr
WHERE
    a.baujahr = 2008;
   
-- ex04.person_no_car source   
   
CREATE OR REPLACE VIEW ex04.person_no_car
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr
FROM
    ex04.auto a
RIGHT JOIN ex04.person p ON
    a.pnr = p.pnr
WHERE
    a.baujahr IS NULL;

