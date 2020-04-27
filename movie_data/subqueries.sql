-- Uncorrelated subqueries
SELECT movie_name, movie_length FROM movies
WHERE movie_length > ( SELECT AVG(movie_length) from movies );

SELECT first_name, last_name, date_of_birth FROM directors
WHERE date_of_birth > (
	SELECT date_of_birth FROM directors
	WHERE first_name = 'James'
	AND last_name = 'Cameron'
)

SELECT mo.movie_name, d.first_name, d.last_name FROM movies mo
JOIN directors d ON mo.director_id = d.director_id
WHERE mo.movie_id IN (
	SELECT movie_id FROM movie_revenues
	WHERE international_takings > domestic_takings
)
ORDER BY movie_id;

-- challenge

SELECT first_name, last_name, date_of_birth FROM actors
WHERE date_of_birth < (
	SELECT date_of_birth FROM actors
	WHERE first_name = 'Marlon'
	AND last_name = 'Brando'
);

SELECT movie_name FROM movies
WHERE movie_id IN (
	SELECT movie_id FROM movie_revenues
	WHERE domestic_takings > 300.0
);

SELECT MIN(movie_length), MAX(movie_length) FROM movies
WHERE movie_id IN (
	SELECT movie_id FROM movie_revenues
	WHERE domestic_takings > ( SELECT AVG(domestic_takings) FROM movie_revenues	)
)

-- Crrelated subqueries

SELECT d1.first_name, d1.last_name, d1.nationality, d1.date_of_birth FROM directors d1
WHERE d1.date_of_birth = (
	SELECT MIN (d2.date_of_birth) FROM directors d2
	WHERE d2.nationality = d1.nationality
);

-- To do above query with uncorrelated subquery
SELECT first_name, last_name, nationality, date_of_birth FROM directors
WHERE date_of_birth IN (
	SELECT MIN(date_of_birth) FROM directors
	GROUP BY nationality
);


SELECT mo1.movie_name, mo1.movie_lang, mo1.movie_length FROM movies mo1
WHERE mo1.movie_length = (
	SELECT MAX(mo2.movie_length) from movies mo2
	WHERE mo2.movie_lang = mo1.movie_lang
)
ORDER BY mo1.movie_length;

-- Trying do similar query without subqueries which doesn't include movie_name
-- but it is not the same, it takes THE ONLY ONE max_length movie, even if there are more
SELECT movie_lang, MAX(movie_length) AS max_length from movies
GROUP BY movie_lang
ORDER BY max_length;

-- challenge

SELECT first_name, last_name, gender, date_of_birth from actors
WHERE date_of_birth IN (
	SELECT MIN(date_of_birth) FROM actors
	GROUP BY gender
)

SELECT mo1.movie_name, mo1.movie_length, mo1.age_certificate from movies mo1
WHERE mo1.movie_length > (
	SELECT AVG(mo2.movie_length) FROM movies mo2
	WHERE mo1.age_certificate = mo2.age_certificate
)
ORDER BY mo1.age_certificate;
