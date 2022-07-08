/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS animals;
CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  date_of_birth DATE,
  escape_attempts INTEGER default 0,
  neutered BOOLEAN default false,
  weight_kg DECIMAL not NULL,
  species_id INTEGER,
  owner_id INTEGER,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS owners;
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INTEGER,
  PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD CONSTRAINT FK_owners
FOREIGN KEY (owner_id)
REFERENCES owners (id);

DROP TABLE IF EXISTS species;
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD CONSTRAINT FK_species
FOREIGN KEY (species_id)
REFERENCES species (id);


DROP TABLE IF EXISTS vets;
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations(
  vet_id INTEGER,
  species_id INTEGER
);

DROP TABLE IF EXISTS visits;
CREATE TABLE visits(
  animal_id INTEGER,
  vet_id INTEGER,
  visit_date DATE
);