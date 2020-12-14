DROP SCHEMA IF EXISTS `ex06`;
-- In MySQL, the schema is the synonym for the database
-- DROP DATABASE [IF EXISTS] database_name;
CREATE SCHEMA `ex06` DEFAULT CHARACTER SET utf8 ;
USE `ex06`;

-- ex06.personen definition


CREATE TABLE `person` (
  `pnr` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ex06.auto definition

CREATE TABLE `auto` (
  `anr` int(11) NOT NULL,
  `marke` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `baujahr` int(11) DEFAULT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ex06.auto definition

CREATE TABLE `fahrzeughalter` (
  `pnr` int(11) NOT NULL,
  `anr` int(11) NOT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO ex06.person (pnr,name,vorname) VALUES (1,'Müller','Heinz');
INSERT INTO ex06.person (pnr,name,vorname) VALUES (2,'Meier','Hans');
INSERT INTO ex06.person (pnr,name,vorname) VALUES (3,'Schmid','Beat');

INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (1,'Audi','A6',2008);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (2,'Opel','Antara',2007);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (3,'Fiat','Punto',2002);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (4,'VW','Bora',2003);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (5,'Toyota','Yaris',2006);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (6,'VW','Golf',2004);
INSERT INTO ex06.auto (anr,marke,typ,baujahr) VALUES (7,'Honda','Civic',2004);

INSERT INTO ex06.fahrzeughalter (pnr,anr) VALUES 
(1,2),
(1,6),
(2,4),
(2,7),
(3,1)
;

ALTER TABLE ex06.fahrzeughalter ADD CONSTRAINT fahrzeughalter_FK FOREIGN KEY (anr) REFERENCES ex06.auto(anr);
ALTER TABLE ex06.fahrzeughalter ADD CONSTRAINT fahrzeughalter_FK_1 FOREIGN KEY (pnr) REFERENCES ex06.person(pnr);

-- autoperson

CREATE OR REPLACE VIEW ex06.autoperson
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr
FROM
    ex06.fahrzeughalter f
INNER JOIN ex06.auto a ON
    f.anr = a.anr
INNER JOIN ex06.person p ON
    f.pnr = p.pnr;

-- auto_allperson
   
CREATE OR REPLACE VIEW ex06.auto_allperson
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr
FROM
    ex06.fahrzeughalter f
INNER JOIN ex06.auto a ON
    f.anr = a.anr
RIGHT JOIN ex06.person p ON
    f.pnr = p.pnr;

-- person_allauto

CREATE OR REPLACE VIEW ex06.person_allauto
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr
FROM
    ex06.fahrzeughalter f
RIGHT JOIN ex06.auto a ON
    f.anr = a.anr
LEFT JOIN ex06.person p ON
    f.pnr = p.pnr;
   

-- allperson_nocar

   
CREATE OR REPLACE VIEW ex06.allperson_nocar
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr
FROM
    ex06.fahrzeughalter f
INNER JOIN ex06.auto a ON
    f.anr = a.anr
RIGHT JOIN ex06.person p ON
    f.pnr = p.pnr
WHERE
    a.marke IS NULL;

   
-- allcar_noperson

   
CREATE OR REPLACE VIEW ex06.allcar_noperson
AS SELECT
    p.pnr,
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr
FROM
    ex06.fahrzeughalter f
RIGHT JOIN ex06.auto a ON
    f.anr = a.anr
LEFT JOIN ex06.person p ON
    f.pnr = p.pnr
WHERE
    p.name IS NULL;



   

