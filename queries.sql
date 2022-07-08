/*Queries that provide answers to the questions from all projects.*/

SELECT animals.name from animals INNER JOIN owners on animals.owner_id=owners.id
WHERE owners.full_name='Melody Pond' ORDER BY animals.name;

SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id
WHERE species.name='Pokemon' ORDER BY animals.name;

SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.full_name;

SELECT species.name, COUNT(animals.name) AS count FROM animals  
INNER JOIN species ON animals.species_id = species.id GROUP BY species.id
ORDER BY count DESC;

SELECT animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
INNER JOIN species ON animals.species_id = species.id
WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell'
ORDER BY animals.name;

SELECT animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name='Dean Winchester' AND escape_attempts=0
ORDER BY animals.name;

SELECT owners.full_name, COUNT(animals.name) AS count FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;