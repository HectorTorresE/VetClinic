/*Queries that provide answers to the questions from all projects.*/

BEGIN TRANSACTION;

  UPDATE animals SET species='unspecified';

  SELECT * FROM animals ORDER BY id; 

  SELECT species from animals;
  
ROLLBACK;


BEGIN TRANSACTION;

  UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 

  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

  SELECT species from animals;

COMMIT TRANSACTION;


BEGIN TRANSACTION;

  DELETE FROM animals;

  SELECT COUNT(*) FROM ANIMALS;

ROLLBACK;

Begin TRANSACTION;

  DELETE FROM animals WHERE date_of_birth  >  '2022-01-01';

  SAVEPOINT date_filter;

  UPDATE animals SET weight_kg = (weight_kg * -1);

  ROLLBACK TO date_filter;

  UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
  
COMMIT TRANSACTION;

SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals WHERE animals.escape_attempts = 0;
  
SELECT AVG(weight_kg) AS "average weight" FROM animals;

SELECT CASE 
WHEN neutered=true THEN 'Neutered' ELSE 'Not Neutered' 
END,
SUM(escape_attempts) as "escapes"
FROM animals GROUP BY neutered ORDER BY escapes DESC LIMIT 1;

  
SELECT species, MIN(weight_kg) AS "Minimum weight", MAX(weight_kg)  AS "Maximum weight" FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;