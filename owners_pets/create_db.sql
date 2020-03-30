-- Database: owners_pets

-- DROP DATABASE owners_pets;

CREATE DATABASE owners_pets
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1251'
    LC_CTYPE = 'English_United States.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- create owners table

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	city VARCHAR(30),
	state CHAR(2)
);

SELECT * FROM owners;

-- create owners table

CREATE TABLE pets (
	id SERIAL PRIMARY KEY,
	species VARCHAR(30),
	full_name VARCHAR(30),
	age INT,
	owner_id INT REFERENCES owners (id)
);

-- SELECT * FROM pets;

-- add email column to the owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(30) UNIQUE;

-- SELECT * FROM owners;

-- change email column type in the owners table
ALTER TABLE owners
ALTER COLUMN email TYPE VARCHAR(50);
