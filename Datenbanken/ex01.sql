DROP SCHEMA IF EXISTS `ex01`;
-- In MySQL, the schema is the synonym for the database
-- DROP DATABASE [IF EXISTS] database_name;
CREATE SCHEMA `ex01` DEFAULT CHARACTER SET utf8 ;
USE `ex01`;

-- ex01.auto definition

CREATE TABLE `auto` (
  `anr` int(11) NOT NULL,
  `marke` varchar(100) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `baujahr` int(11) DEFAULT NULL,
  PRIMARY KEY (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ex01.person definition

CREATE TABLE `person` (
  `pnr` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `anr` int(11) DEFAULT NULL,
  PRIMARY KEY (`pnr`),
  KEY `anr_idx` (`anr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auto` (`anr`,`marke`,`typ`,`baujahr`) VALUES (1,'Audi','A6',2008);
INSERT INTO `auto` (`anr`,`marke`,`typ`,`baujahr`) VALUES (2,'Opel','Antara',2007);
INSERT INTO `auto` (`anr`,`marke`,`typ`,`baujahr`) VALUES (3,'Fiat','Punto',2002);
INSERT INTO `auto` (`anr`,`marke`,`typ`,`baujahr`) VALUES (4,'VW','Bora',2003);
INSERT INTO `auto` (`anr`,`marke`,`typ`,`baujahr`) VALUES (5,'Toyota','Yaris',2006);

INSERT INTO `person` (`pnr`,`name`,`vorname`,`anr`) VALUES (1,'Müller','Heinz',2);
INSERT INTO `person` (`pnr`,`name`,`vorname`,`anr`) VALUES (2,'Meier','Hans',4);
INSERT INTO `person` (`pnr`,`name`,`vorname`,`anr`) VALUES (3,'Schmid','Beat',1);
INSERT INTO `person` (`pnr`,`name`,`vorname`,`anr`) VALUES (4,'Steffen','Felix',3);
INSERT INTO `person` (`pnr`,`name`,`vorname`,`anr`) VALUES (5,'Einstein','Albert',5);

SELECT
    a.marke,
    a.typ,
    a.baujahr,
    p.name,
    p.vorname,
    p.pnr
FROM
    ex01.auto a
INNER JOIN ex01.person p ON
    a.anr = p.anr;

 
ALTER TABLE ex01.person ADD CONSTRAINT person_FK FOREIGN KEY (anr) REFERENCES ex01.auto(anr);
 
UPDATE ex01.person SET anr = '10' WHERE (pnr = '5');
-- Fehler


-- ex01.autobesitzer source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `ex01`.`autobesitzer` AS
select
    `p`.`pnr` AS `pnr`,
    `p`.`name` AS `name`,
    `p`.`vorname` AS `vorname`,
    `a`.`marke` AS `marke`,
    `a`.`typ` AS `typ`,
    `a`.`baujahr` AS `baujahr`
from
    (`ex01`.`auto` `a`
join `ex01`.`person` `p` on
    ((`a`.`anr` = `p`.`anr`)));