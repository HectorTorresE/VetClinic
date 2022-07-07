/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  date_of_birth DATE,
  escape_attempts INTEGER default 0,
  neutered BOOLEAN default false,
  weight_kg DECIMAL not NULL,
  PRIMARY KEY(id)
);