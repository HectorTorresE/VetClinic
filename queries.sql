SELECT animals.name, visits.visit_date FROM visits INNER JOIN animals ON animal_id = animals.id
INNER JOIN vets ON vet_id=vets.id WHERE vets.name='William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name) FROM visits INNER JOIN animals ON animal_id = animals.id
INNER JOIN vets ON vet_id=vets.id WHERE vets.name='Stephanie Mendez';

SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vet_id
LEFT JOIN species ON species_id=species.id ORDER BY vets.name;

SELECT animals.name FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE vets.name='Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30'
ORDER BY animals.name;

SELECT animals.name, COUNT(animals.name) AS number_visits FROM visits INNER JOIN animals ON animal_id= animals.id 
GROUP BY animals.name ORDER BY number_visits DESC LIMIT 1;


SELECT animals.name, visit_date  FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE vets.name='Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, 
vets.name, vets.age, vets.date_of_graduation, visit_date  
FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
ORDER BY visit_date DESC LIMIT 1;

SELECT COUNT(animals.name) FROM visits 
INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE animals.species_id NOT IN((SELECT species_id FROM specializations WHERE vet_id=visits.vet_id));

SELECT species.name FROM animals INNER JOIN visits ON animals.id=animal_id
INNER JOIN vets ON vet_id=vets.id
INNER JOIN species ON animals.species_id=species.id
WHERE vets.name='Maisy Smith'
GROUP BY species.name ORDER BY  COUNT(species.name) DESC LIMIT 1