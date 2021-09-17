CREATE DATABASE movie_ratings;

SHOW DATABASE;

USE movie_ratings; 

-- Creating movies table and the fields that correspond with it 

CREATE TABLE Movies
(

MovieID INT NOT NULL AUTO_INCREMENT,
MovieTitle VARCHAR(200) NOT NULL,
ReleaseDate DATETIME NOT NULL,
Genre VARCHAR(50) NOT NULL

);

-- I am now going insert into the fields 
INSERT INTO Movies( MovieID, MovieTitle, ReleaseDate, Genre) 

VALUES
('The Hunt for Red October', '1990-03-02', 'Action, Adventure, Thriller'),
('Lady Bird', '2017-12-01', 'Comedy, Drama'),
('Inception', '2010-08-16', 'Action, Adventure, Sci-Fi');





