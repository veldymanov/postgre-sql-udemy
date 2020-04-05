SELECT * FROM directors;

SELECT first_name FROM directors;

SELECT first_name, last_name FROM directors;

SELECT first_name, last_name, nationality FROM directors;

SELECT * FROM movies
WHERE age_certificate = '15';

SELECT * FROM movies
WHERE age_certificate = '15'
AND movie_lang = 'Chinese';

SELECT * FROM movies
WHERE age_certificate = '15'
OR movie_lang = 'Chinese';

SELECT * FROM movies
WHERE movie_lang = 'English'
AND age_certificate = '15'
AND director_id = 27;

SELECT movie_name, movie_length FROM movies
WHERE movie_length > 120;

SELECT movie_name, movie_length FROM movies
WHERE movie_length > 100
AND movie_length <= 120;

SELECT * FROM movies
WHERE release_date > '1999-12-31';

-- challenge
SELECT * FROM movies;

SELECT movie_name FROM movies
WHERE movie_length > 90
AND movie_lang = 'English';

SELECT movie_name, release_date FROM movies;

SELECT * FROM directors;

SELECT first_name, last_name, nationality FROM directors
WHERE nationality = 'American';

SELECT * FROM actors
WHERE gender = 'M'
AND date_of_birth > '1970-01-01';


-- IN, NOT IN

SELECT * FROM actors
where first_name IN ('Bruce', 'John', 'Peter');

SELECT * FROM actors
where first_name NOT IN ('Bruce', 'John', 'Peter');

SELECT * FROM actors
where actor_id NOT IN (2,3,4,5,6,8);


-- LIKE

SELECT * FROM actors
where first_name LIKE 'P%';

SELECT * FROM actors
where first_name LIKE 'Pe_';

SELECT * FROM actors
where first_name LIKE '%rl%';

SELECT * FROM actors
where first_name LIKE '__rl%';

-- BETWEEN

SELECT * FROM movies
WHERE release_date BETWEEN '2001-01-04' AND '2005-01-01';

SELECT * FROM movies
WHERE movie_length BETWEEN 90 AND 120;


--  challenge

SELECT movie_name, movie_lang FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');

SELECT first_name, last_name, date_of_birth FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';

SELECT * FROM directors
WHERE nationality IN ('British', 'French', 'German')
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';


-- ORDER BY

SELECT * FROM actors
ORDER BY first_name;

SELECT * FROM actors
ORDER BY first_name DESC;

SELECT * FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth ASC;

-- LIMIT

SELECT * FROM movie_revenues
ORDER BY domestic_takings
LIMIT 5;

SELECT * FROM movie_revenues
ORDER BY revenue_id
LIMIT 5 OFFSET 3;

-- FETCH

SELECT movie_id, movie_name FROM movies
FETCH FIRST ROW ONLY;

SELECT movie_id, movie_name FROM movies
FETCH FIRST 10 ROW ONLY;

SELECT movie_id, movie_name FROM movies
OFFSET 8 ROWS
FETCH FIRST 10 ROW ONLY;

-- SELECT DISTINCT

SELECT DISTINCT movie_lang FROM movies
ORDER BY movie_lang;

SELECT DISTINCT movie_lang, age_certificate FROM movies
ORDER BY movie_lang;

SELECT DISTINCT * FROM movies;

-- challenge

SELECT * FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth;

SELECT DISTINCT nationality FROM directors;

SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC
LIMIT 10;

SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC
FETCH FIRST 10 ROWS ONLY;

-- NULL values

SELECT * FROM actors
WHERE date_of_birth IS NULL;

SELECT * FROM actors
WHERE date_of_birth IS NOT NULL;

SELECT * FROM movie_revenues
WHERE domestic_takings IS NOT NULL
ORDER BY domestic_takings DESC;

-- Column Name Alias

SELECT last_name AS surname FROM directors
WHERE last_name LIKE 'A%'
ORDER BY surname;

-- Concatenation

SELECT 'concat' || ' ' || 'togather' AS new_string;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM actors;

SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM actors;


--  challenge

SELECT * FROM movie_revenues
WHERE international_takings IS NOT NULL
ORDER BY international_takings DESC
LIMIT 3;

SELECT CONCAT_WS(' ', first_name, last_name) AS full_name from directors;

SELECT * FROM actors
WHERE first_name IS NULL
OR date_of_birth IS NULL;
