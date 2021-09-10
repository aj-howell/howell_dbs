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

