CREATE DATABASE movie_ratings;

SHOW DATABASES;

USE movie_ratings; 

-- Creating movies table and the fields that correspond with it 

CREATE TABLE Movies
(

MovieID INT NOT NULL AUTO_INCREMENT,
MovieTitle VARCHAR(200) NOT NULL,
ReleaseDate DATETIME NOT NULL,
Genre VARCHAR(50) NOT NULL,
PRIMARY KEY(MovieID)

);

-- I am now going insert into the fields 
INSERT INTO Movies (MovieTitle, ReleaseDate, Genre) 

VALUES
('The Hunt for Red October', '1990-03-02', 'Action, Adventure, Thriller'),
('Lady Bird', '2017-12-01', 'Comedy, Drama'),
('Inception', '2010-08-16', 'Action, Adventure, Sci-Fi');

CREATE TABLE Consumers
(
FOREIGN KEY(ConsumerID),
First_name VARCHAR(15) NOT NULL,
Last_name VARCHAR(15) NOT NULL,
Address VARCHAR(15) NOT NULL,
City VARCHAR(25) NOT NULL,
State VARCHAR(2) NOT NULL,
Zip INT NOT NULL

);

INSERT INTO Consumers (First_name, Last_name, Address, City, State, Zip )

VALUES
('Toru', 'Okada', '800 Glenridge Ave', 'Hobart', 'IN', 46342),
('Kumiko' ,'Okada', '864 NW Bohemia St', 'Vincentown' ,'NJ', 08088),
('Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage','TN', 37076),
('May', 'Kasahara', '5 Kent Rd', 'East Haven','CT', 06512); 



