/*going through the steps of the tutorial*/
CREATE DATABASE pets;

SHOW DATABASES;

USE pets;

CREATE TABLE cats
(
id INT unsigned NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
owner VARCHAR(100) NOT NULL,
birth DATE NOT NULL,
PRIMARY KEY (id)


);

SHOW TABLES;

DESCRIBE cats;

INSERT INTO cats ( name, owner, birth) VALUES
('Sandy', 'Lennon', '2015-01-03'),
('Cookie', 'Casey', '2013-11-13'),
('Charlie', 'River', '2016-05-21');

SELECT * FROM cats;

SELECT name FROM cats WHERE owner = 'Casey';

DELETE FROM cats WHERE name = 'Cookie';

SELECT * FROM cats;

ALTER TABLE cats ADD gender CHAR(1) AFTER name;

DESCRIBE cats;

SHOW CREATE TABLE cats\G;

ALTER TABLE cats DROP gender;

DESCRIBE cats;

CREATE DATABASE school;

SHOW DATABASE;

USE school;

CREATE TABLE instructors
(
insturctor_id INT NOT NULL AUTO_INCREMENT,
inst_first_name VARCHAR(20) NOT NULL,
inst_last_name VARCHAR(20) NOT NULL,
campus_phone INT NOT NULL
PRIMARY KEY (insturctor_id)

);

INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone) VALUES
('Kira', 'Bently', '363-9948'),
('Timothy', 'Ennis', '527-4992'),
('Shannon', 'Black', '322-5992'),
('Estela', 'Rosales', '322-6992');

SELECT * FROM instructors;