CREATE DATABASE school;

SHOW DATABASES;

USE school;

CREATE TABLE instructors
(
insturctor_id INT NOT NULL AUTO_INCREMENT,
inst_first_name VARCHAR(20),
inst_last_name VARCHAR(20),
campus_phone VARCHAR(100),
PRIMARY KEY (insturctor_id)

);

INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone ) VALUES
('Kira', 'Bently', '3639948'),
('Timothy', 'Ennis', '5274992'),
('Shannon', 'Black', '3225992'),
('Estela', 'Rosales', '3226992');

SELECT * FROM instructors;