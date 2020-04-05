-- Database: test

-- DROP DATABASE test;

CREATE DATABASE test
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'English_United States.1251'
  LC_CTYPE = 'English_United States.1251'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;


-- modify tables and add a column

CREATE TABLE examples (
	example_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30)
);

-- SELECT* FROM examples;

ALTER TABLE examples
ADD column email VARCHAR(50) UNIQUE;

ALTER TABLE examples
ADD column nationality VARCHAR(30),
ADD column age INT NOT NULL;

ALTER TABLE examples
ALTER column nationality TYPE CHAR(3);

ALTER TABLE examples
ALTER column last_name TYPE VARCHAR(30),
ALTER column email TYPE VARCHAR(50);


-- mamanipulate data in the table

INSERT into examples (first_name, last_name, email, nationality, age)
VALUES ('David', 'Mitchel', 'dmitch@gmai.com', 'GBR', 43);

INSERT into examples (first_name, last_name, email, nationality, age)
VALUES ('Emily', 'Watson', 'ewatson@gmai.com', 'USA', 29),
('Theo', 'Scott', 'tscsott@gmail.com', 'AUS', 40),
('Emily', 'Smoth', 'esmith@gmai.com', 'GBR', 29),
('Jim', 'Burr', 'jburr@gmai.com', 'USA', 54);

UPDATE examples
SET email = 'davidmitchell@gmail.com'
WHERE example_id = 1;

UPDATE examples
SET nationality = 'CAN'
WHERE nationality = 'USA';

UPDATE examples
SET first_name = 'James',
age = 55
WHERE example_id = 5;

DELETE FROM examples
WHERE example_id = 2;

DELETE FROM examples
WHERE nationality = 'GBR';


-- deleting tables from db
CREATE TABLE practise (
	id SERIAL PRIMARY KEY,
	products_name VARCHAR(50),
	product_price NUMERIC(4, 2)
);

-- SELECT * FROM practise;

DROP TABLE practise;
