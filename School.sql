CREATE DATABASE school;

SHOW DATABASES;

USE school;

CREATE TABLE instructors
(
insturctor_id INT NOT NULL AUTO_INCREMENT,
inst_first_name VARCHAR(20),
inst_last_name VARCHAR(20),
campus_phone CHAR(20),
PRIMARY KEY (insturctor_id)

);

INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone ) VALUES
('Kira', 'Bently', '363-9948'),
('Timothy', 'Ennis', '527-4992'),
('Shannon', 'Black', '322-5992'),
('Estela', 'Rosales', '322-6992');

SELECT * FROM instructors;