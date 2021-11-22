
DROP DATABASE IF EXISTS pokemon_db;

CREATE DATABASE pokemon_db;

USE pokemon_db;

CREATE TABLE trainers
(
trainer_id INT NOT NULL,
trainer_name VARCHAR(25) NOT NULL,
PRIMARY KEY(trainer_id)


);


CREATE TABLE pokemon_species
(
    species_name VARCHAR(25) NOT NULL,
    PRIMARY KEY(species_name)
);

CREATE TABLE pokemon
(
    pokemon_id INT NOT NULL,
    trainer_id INT NOT NULL,
    species_name VARCHAR(25) NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (species_name) REFERENCES pokemon_species(species_name),
    PRIMARY KEY(pokemon_id)
   

);

CREATE TABLE trainer_party_members
(
    pokemon_id INT NOT NULL,
    trainer_id INT NOT NULL,

    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    PRIMARY KEY(trainer_id, pokemon_id)
);

SOURCE insertlab8.sql;
-- CALL trade(7,10,1,2);

-- a function  that figures out the party size 
DROP FUNCTION IF EXISTS party_size;
CREATE FUNCTION party_size(trainer_id1 INT)
RETURNS INT 
RETURN
    (
        SELECT COUNT(trainer_id) FROM trainer_party_members
        WHERE trainer_id = trainer_id1
    );
-- SELECT party_size(2);
DROP FUNCTION IF EXISTS pokemon_owned;
CREATE FUNCTION pokemon_owned(trainer_id1 INT)
RETURNS INT 
RETURN
    (
        SELECT COUNT(trainer_id) FROM pokemon
        WHERE trainer_id = trainer_id1
    );
-- if the party is too large 
DELIMITER //
 CREATE OR REPLACE TRIGGER max_party
 BEFORE INSERT ON trainer_party_members
 FOR EACH ROW
    BEGIN
        IF party_size(NEW.trainer_id) = 6 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Max Party has been reached';
        END IF; 
    END; //

 DELIMITER ;

-- Cannot delete pokemon if they only have one within their party 
DELIMITER $$
 CREATE OR REPLACE TRIGGER min_party
 BEFORE DELETE ON trainer_party_members
 FOR EACH ROW
    BEGIN
        IF party_size(OLD.trainer_id) = 1 AND pokemon_owned(OLD.trainer_id) > 1 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Must have at least one pokemon in the party';
        END IF;

        IF party_size(OLD.trainer_id) = 1 THEN 
            SET FOREIGN_KEY_CHECKS=0;
        END IF;

    END; $$

 DELIMITER ;

-- Cannot change the trainer of a pokemon without trading
DELIMITER ||
 CREATE OR REPLACE TRIGGER update_party
 BEFORE UPDATE ON trainer_party_members
 FOR EACH ROW
    BEGIN
        IF OLD.trainer_id != NEW.trainer_id THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Cannot change the trainer of a pokemon without trading';
        END IF; 
    END; ||

 DELIMITER ;

DELIMITER //
CREATE PROCEDURE trade(IN pokemonid1 INT,IN pokemonid2 INT, IN old_trainer_id1 INT, IN old_trainer_id2 INT)

BEGIN 
-- DELIMITER //

    START TRANSACTION;

    SELECT * FROM trainer_party_members;

-- update the 1st trainer
IF EXISTS(SELECT * FROM trainer_party_members WHERE pokemon_id=pokemonid1 AND trainer_id=old_trainer_id1) THEN
	UPDATE trainer_party_members
	SET pokemon_id = pokemonid2
	WHERE trainer_id = old_trainer_id1 AND pokemon_id= pokemonid1;
ELSE
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Pokemon does not exist within table';
END IF;
-- update the 2nd trainer 
IF EXISTS(SELECT * FROM trainer_party_members WHERE pokemon_id=pokemonid2 AND trainer_id=old_trainer_id2) THEN
	Update trainer_party_members
	SET pokemon_id= pokemonid1
	WHERE trainer_id=old_trainer_id2  AND pokemon_id=pokemonid2;

    COMMIT;

    SELECT * FROM trainer_party_members;

ELSE
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Pokemon does not exist within table';
END IF;

END; //

DELIMITER ;
 
 --CALL trade(1,11,1,2);

-- cannot update the trainer of the pokemon
--  Update trainer_party_members
-- 	SET trainer_id= 2
-- 	WHERE pokemon_id= 6;

-- can update the pokemon they have in their party if they actually own it 
    --   Update trainer_party_members
	--   SET pokemon_id= 2
	--   WHERE trainer_id= 2;

-- If all the pokemon that the trainer owns are no longer there then delete the trainer
-- going off the assumption that the party keeps track of what the trainer last had in his party changes would be made as told


-- tried doing it through a trigger and realized it was just more efficient to do within a procedure as triggers 
-- can only operate on one table effectively

--  CREATE OR REPLACE TRIGGER delete_pokemon
--  BEFORE DELETE ON pokemon
--  FOR EACH ROW
--     BEGIN 
--         IF EXISTS(SELECT * FROM pokemon WHERE trainer_id = OLD.trainer_id) THEN
--                 SET FOREIGN_KEY_CHECKS=0;
--                 IF pokemon_owned(OLD.trainer_id) = 0 THEN
--                     DELETE FROM trainers WHERE trainer_id = OLD.trainer_id;
--                 END IF;
--         END IF; 
        
--     END; $$

--  DELIMITER ;

DELIMITER $$
-- call this procedure to delete the trainer
CREATE PROCEDURE delete_trainer(IN trainer_id1 INT)

BEGIN 
   IF EXISTS(SELECT * FROM pokemon WHERE trainer_id = trainer_id1) THEN
                SET FOREIGN_KEY_CHECKS=0;
                DELETE FROM pokemon WHERE trainer_id=trainer_id1;
                

                IF pokemon_owned(trainer_id1) = 0 THEN
                    DELETE FROM trainers WHERE trainer_id = trainer_id1;
                    DELETE FROM trainer_party_members WHERE trainer_id=trainer_id1;
                    
                END IF;
        END IF; 
        
    END; $$

DELIMITER ;