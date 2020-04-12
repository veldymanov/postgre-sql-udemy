SELECT domestic_takings FROM movie_revenues;

SELECT count(domestic_takings) FROM movie_revenues;

SELECT * FROM movie_revenues
WHERE domestic_takings IS NULL;

SELECT sum(domestic_takings) from movie_revenues;

SELECT sum(domestic_takings) from movie_revenues
WHERE domestic_takings > 100.0;

-- challange

SELECT COUNT(*) FROM actors
WHERE date_of_birth > '1970-01-01';

SELECT * FROM movie_revenues;

SELECT MAX(domestic_takings) from movie_revenues;
SELECT MIN(domestic_takings) from movie_revenues;

select * from movies;

SELECT SUM(movie_length) from movies
WHERE age_certificate = '15';

SELECT * from directors;

SELECT COUNT(*) FROM directors
WHERE nationality = 'Japanese';

SELECT AVG(movie_length) FROM movies
WHERE movie_lang = 'Chinese';

-- Grouping data
SELECT * FROM movies;

SELECT movie_lang, COUNT(movie_lang) AS group_count, SUM(movie_length) AS length_sum, AVG(movie_length) AS length_avg FROM movies
GROUP BY movie_lang;

SELECT movie_lang, age_certificate, AVG(movie_length) AS length_avg FROM movies
GROUP BY movie_lang, age_certificate;

SELECT movie_lang, age_certificate, AVG(movie_length) AS length_avg FROM movies
WHERE movie_length > 120
GROUP BY movie_lang, age_certificate;


SELECT movie_lang, COUNT(movie_lang) FROM movies
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;

SELECT movie_lang, COUNT(movie_lang) FROM movies
WHERE movie_length > 120
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;

-- challenge

SELECT nationality, COUNT(nationality) FROM directors
GROUP BY nationality;

SELECT movie_lang, age_certificate, SUM(movie_length) FROM movies
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang, age_certificate;

SELECT movie_lang, SUM(movie_length) FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;

--  Mathematical Operators

SELECT 5 + 6 AS addition;
SELECT 8 - 3 AS substrusction;
SELECT 35 / 3 AS division;
SELECT 4 * 6 AS multiplication;
SELECT 35 % 3 AS modulus;

SELECT * FROM movie_revenues;
SELECT movie_id, (domestic_takings + international_takings) AS total_takings FROM movie_revenues;
