/* Aj Howell LAB3 In this lab I am creating multiple tables that relate to the Movie business. Thee first inlcudes
information on movies and their general details. The second includes information about the consumer. The last table is a linking table
that shows how consumers interact with the movies*/

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

ConsumerID INT NOT NULL AUTO_INCREMENT,
First_name VARCHAR(15) NOT NULL,
Last_name VARCHAR(15) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(25) NOT NULL,
State VARCHAR(2) NOT NULL,
Zip INT NOT NULL,
PRIMARY KEY(ConsumerID)

);

INSERT INTO Consumers (First_name,Last_name,Address, City, State, Zip)

VALUES
('Toru','Okada','800 Glenridge Ave','Hobart','IN',46342),
('Kumiko','Okada','864 NW Bohemia St','Vincentown','NJ',08088),
('Noboru','Wataya','342 Joy Ridge St','Hermitage','TN',37076),
('May','Kasahara','5 Kent Rd','East Haven','CT', 06512); 


CREATE TABLE Ratings
(

WhenRated DATETIME NOT NULL,
NumberStars INT NOT NULL,
FOREIGN KEY (ConsumerID),
REFERENCES Consumers(ConsumerID),
FOREIGN KEY (MoviesID),
REFERENCES Movies(MovieID)

);

INSERT INTO Ratings(MovieID,ConsumerID,WhenRated, NumberStars)

VALUES
(1, 1, '2010-09-02 10:54:19', 4),
(1, 3,'2012-08-05 15:00:01', 3),
(1,4 ,'2016-10-02 23:58:12', 1),
(2, 3, '2017-03-27 00:12:48', 2),
(2, 4,'2018-08-02 00:54:42', 4);

/* Generate a report */ 
SELECT consumer_first_name, consumer_last_name, movie_name, rating 
 FROM movies 
 NATURAL JOIN ratings
 NATURAL JOIN consumers;

 -- The flaw within the table is that the genre has too many data entries.


 -- STEP 6
 DROP DATABASE IF EXISTS;

 CREATE DATABASE movie_ratings;

SHOW DATABASES;

USE movie_ratings; 

CREATE TABLE Movies
(

MovieID INT NOT NULL AUTO_INCREMENT,
MovieTitle VARCHAR(200) NOT NULL,
ReleaseDate DATETIME NOT NULL,
GenreID INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(MovieID)


);

INSERT INTO Movies (MovieTitle, ReleaseDate) 

VALUES
('The Hunt for Red October', '1990-03-02'),
('Lady Bird', '2017-12-01'),
('Inception', '2010-08-16');

--creating another table that'll reference the movieID which will allow for each movie to have multiple genres 
CREATE TABLE Genres
(
FOREIGN KEY(movieID),
REFERENCES Movies(MovieID),
genre VARCHAR(50) NOT NULL

);

INSERT INTO Genres(movieID, genre) 

VALUES
(1, 'Action'),
(1,'Thriller'),
(1, 'Adventure'),
(2, 'Comedy'),
(2, 'Drama'),
(3, 'Action'),
(3, 'Adventure'),
(3, 'Sci-Fi');

CREATE TABLE Consumers
(

ConsumerID INT NOT NULL AUTO_INCREMENT,
First_name VARCHAR(15) NOT NULL,
Last_name VARCHAR(15) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(25) NOT NULL,
State VARCHAR(2) NOT NULL,
Zip INT NOT NULL,
PRIMARY KEY(ConsumerID)

);

INSERT INTO Consumers (First_name,Last_name,Address, City, State, Zip)

VALUES
('Toru','Okada','800 Glenridge Ave','Hobart','IN',46342),
('Kumiko','Okada','864 NW Bohemia St','Vincentown','NJ',08088),
('Noboru','Wataya','342 Joy Ridge St','Hermitage','TN',37076),
('May','Kasahara','5 Kent Rd','East Haven','CT', 06512); 


CREATE TABLE Ratings
(

WhenRated DATETIME NOT NULL,
NumberStars INT NOT NULL,
FOREIGN KEY (ConsumerID),
REFERENCES Consumers(ConsumerID),
FOREIGN KEY (MoviesID),
REFERENCES Movies(MovieID)

);

INSERT INTO Ratings(MovieID,ConsumerID,WhenRated, NumberStars)

VALUES
(1, 1, '2010-09-02 10:54:19', 4),
(1, 3,'2012-08-05 15:00:01', 3),
(1,4 ,'2016-10-02 23:58:12', 1),
(2, 3, '2017-03-27 00:12:48', 2),
(2, 4,'2018-08-02 00:54:42', 4);

/* Generate a report */ 
SELECT consumer_first_name, consumer_last_name, movie_name, rating 
 FROM movies 
 NATURAL JOIN ratings
 NATURAL JOIN consumers;