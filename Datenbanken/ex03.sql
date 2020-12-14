CREATE DATABASE `ex03` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

-- ex03.personen definition


CREATE TABLE `person` (
  `pnr` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ex03.auto definition

CREATE TABLE `auto` (
  `anr` int(11) NOT NULL,
  `marke` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `baujahr` int(11) DEFAULT NULL,
  `pnr` int(11) NOT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ex03.person (pnr,name,vorname) VALUES (1,'Müller','Heinz');
INSERT INTO ex03.person (pnr,name,vorname) VALUES (2,'Meier','Hans');
INSERT INTO ex03.person (pnr,name,vorname) VALUES (3,'Schmid','Beat');
INSERT INTO ex03.person (pnr,name,vorname) VALUES (4,'Steffen','Felix');
INSERT INTO ex03.person (pnr,name,vorname) VALUES (5,'Einstein','Albert');

INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (1,'Audi','A6',2008,3);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (2,'Opel','Antara',2007,1);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (3,'Fiat','Punto',2002,4);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (4,'VW','Bora',2003,2);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (5,'Toyota','Yaris',2006,5);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (6,'VW','Golf',2004,1);
INSERT INTO ex03.auto (anr,marke,typ,baujahr,pnr) VALUES (7,'Honda','Civic',2004,2);

ALTER TABLE ex03.auto ADD CONSTRAINT auto_FK FOREIGN KEY (pnr) REFERENCES ex03.person(pnr);

-- ex03.autopersonen source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `ex03`.`autopersonen` AS
select
    `p`.`name` AS `name`,
    `p`.`vorname` AS `vorname`,
    `a`.`marke` AS `marke`,
    `a`.`typ` AS `typ`,
    `a`.`baujahr` AS `baujahr`,
    `a`.`anr` AS `anr`,
    `p`.`pnr` AS `pnr`
from
    (`ex03`.`auto` `a`
join `ex03`.`person` `p` on
    ((`p`.`pnr` = `a`.`pnr`)));
