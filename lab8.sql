
CREATE DATABASE pokemondb;

USE pokemondb;

CREATE TABLE trainers
(
trainer_id INT NOT NULL,
trainer_name VARCHAR(25) NOT NULL,
PRIMARY KEY(trainer_id)

);


CREATE TABLE pokemon_species
(
  
    species_name VARCHAR(25),
    PRIMARY KEY(species_name)
);

CREATE TABLE pokemon
(
    pokemon_id INT NOT NULL,
    species_name VARCHAR(25) NOT NULL,
    trainer_id INT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (species_name) REFERENCES pokemon_species(species_name),
    PRIMARY KEY(pokemon_id)
   

);

CREATE TABLE  trainer_party_members
(

    pokemon_id INT NOT NULL,
    trainer_id INT NOT NULL,

    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    PRIMARY KEY(pokemon_id, trainer_id)

);

SOURCE insertlab8.sql;