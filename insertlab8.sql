INSERT INTO trainers(trainer_id,trainer_name)
VALUES
      (1, 'Will'),
      (2, 'Koga'),
      (3, 'Bruno'),
      (4, 'Lance');

INSERT INTO pokemon_species(species_name)
VALUES
      ('Pikachu'),
      ('Charmander'),
      ('Bulbasuar'),
      ('Squirtle'),
      ('Geodude'),
      ('Magikarp'),
      ('Weedle'),
      ('Butterfree');

INSERT INTO pokemon(pokemon_id,trainer_id,species_name)
VALUES
      (1,1,'Pikachu'),
      (2,1,'Charmander'),
      (3,1,'Bulasuar'),
      (4,1,'Squirtle'),
      (5,1,'Geodude'),
      (6,1,'Magikarp'),
      (7,1,'Weedle'),
      (8,2,'Pikachu'),
      (9,2,'Charmander'),
      (10,2,'Bulbasuar'),
      (11,2,'Squirtle'), 
      (12,2,'Geodude'),
      (13,2,'Magikarp'),
      (14,2,'Weedle');


INSERT INTO trainer_party_members(pokemon_id, trainer_id)
VALUES
      (1,1),
      (2,1),
      (3,1),
      (4,1),
      (5,1),
      (6,1),
      (11,2);