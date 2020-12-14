CREATE DATABASE `ex02` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

-- ex02.personen definition


CREATE TABLE `person` (
  `pnr` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ex02.auto definition

CREATE TABLE `auto` (
  `anr` int(11) NOT NULL,
  `marke` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `baujahr` int(11) DEFAULT NULL,
  `pnr` int(11) NOT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ex02.person (pnr,name,vorname) VALUES (1,'Müller','Heinz');
INSERT INTO ex02.person (pnr,name,vorname) VALUES (2,'Meier','Hans');
INSERT INTO ex02.person (pnr,name,vorname) VALUES (3,'Schmid','Beat');
INSERT INTO ex02.person (pnr,name,vorname) VALUES (4,'Steffen','Felix');
INSERT INTO ex02.person (pnr,name,vorname) VALUES (5,'Einstein','Albert');

INSERT INTO ex02.auto (anr,marke,typ,baujahr,pnr) VALUES (1,'Audi','A6',2008,3);
INSERT INTO ex02.auto (anr,marke,typ,baujahr,pnr) VALUES (2,'Opel','Antara',2007,1);
INSERT INTO ex02.auto (anr,marke,typ,baujahr,pnr) VALUES (3,'Fiat','Punto',2002,4);

ALTER TABLE ex02.auto ADD CONSTRAINT auto_FK FOREIGN KEY (pnr) REFERENCES ex02.person(pnr);

CREATE OR REPLACE VIEW ex02.autopersonen
AS SELECT
    p.name,
    p.vorname,
    a.marke,
    a.typ,
    a.baujahr,
    a.anr,
    p.pnr
FROM
    ex02.auto a
INNER JOIN ex02.person p ON
    p.pnr = a.pnr;

