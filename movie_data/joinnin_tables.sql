SELECT * from movies;
SELECT * from directors;

-- INNER JOIN

INSERT INTO directors (first_name, last_name, date_of_birth, nationality)
VALUES ('Chirstopher', 'Nowlan', '1970-07-30', 'British');

UPDATE directors
SET last_name = 'Nolan'
WHERE director_id = 38;

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies ON directors.director_id = movies.director_id;

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'
ORDER BY movies.movie_length;

SELECT t1.director_id, t1.first_name, t1.last_name, t2.movie_name FROM directors t1
JOIN movies t2 ON t1.director_id = t2.director_id
WHERE t2.movie_lang = 'Japanese'
ORDER BY t2.movie_length;

SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
ORDER BY mr.domestic_takings;

-- if primary key name = foreign key name
SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo
JOIN movie_revenues mr USING (movie_id)
ORDER BY mr.domestic_takings;

-- challenge

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name, mo.release_date, mo.movie_lang FROM directors d
JOIN movies mo USING (director_id)
WHERE mo.movie_lang IN ('Chinese', 'Korean', 'Japanese')
ORDER BY mo.movie_lang;

SELECT mo.movie_name, mo.release_date, mr.international_takings FROM movies mo
JOIN movie_revenues mr USING (movie_id)
WHERE mo.movie_lang = 'English';

SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo
JOIN movie_revenues mr USING (movie_id)
WHERE mr.domestic_takings IS NULL
OR mr.international_takings IS NULL
ORDER BY mo.movie_name;

-- LEFT JOIN

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE d.nationality = 'British';

-- RIGHT JOIN

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
RIGHT JOIN movies mo ON d.director_id = mo.director_id
WHERE d.nationality = 'British';

-- FULL JOIN

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id;

-- challenge

SELECT d.first_name, d.last_name, mo.movie_name, mo.age_certificate FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE d.nationality = 'British';

--  JOIN & GROUP BY
SELECT d.first_name, d.last_name, COUNT(mo.movie_id) AS moivies_number FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
GROUP BY d.first_name, d.last_name;

--  Join more than 2 tables

SELECT d.first_name, d.last_name, mo.movie_name, mr.international_takings, mr.domestic_takings
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id;

SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON ma.movie_id = mo.movie_id
WHERE mo.movie_lang = 'English'
ORDER BY mo.movie_name;

SELECT d.first_name, d.last_name, mo.movie_name, ac.first_name, ac.last_name,
mr.domestic_takings, mr.international_takings
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movies_actors ma ON mo.movie_id = ma.movie_id
JOIN actors ac ON ac.actor_id = ma.actor_id
JOIN movie_revenues mr ON mr.movie_id = mo.movie_id;

-- challenge

SELECT ac.first_name, ac.last_name FROM actors ac
JOIN movies_actors ma ON ma.actor_id = ac.actor_id
JOIN movies mo ON mo.movie_id = ma.movie_id
JOIN directors d ON d.director_id = mo.director_id
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';

SELECT d.first_name, d.last_name, SUM(mr.domestic_takings) as total_dom_takings FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mr.movie_id = mo.movie_id
WHERE mr.domestic_takings IS NOT NULL
GROUP BY d.director_id
ORDER BY total_dom_takings desc
LIMIT 1;

-- Union

SELECT first_name, last_name from directors
UNION
SELECT first_name, last_name from actors;

SELECT first_name, last_name from directors
WHERE nationality = 'American'
UNION
SELECT first_name, last_name from actors
WHERE gender = 'F'
ORDER BY last_name;

-- challenge

SELECT first_name, last_name, date_of_birth FROM directors
UNION ALL
SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY date_of_birth;

SELECT first_name, last_name FROM directors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
UNION ALL
SELECT first_name, last_name FROM actors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
ORDER BY last_name;

-- INTERSECT

SELECT first_name FROM directors
INTERSECT
SELECT first_name FROM actors;

-- EXCEPT

SELECT first_name FROM directors
WHERE nationality = 'American'
EXCEPT
SELECT first_name FROM actors
ORDER BY first_name;

-- challenge

SELECT first_name, last_name, date_of_birth FROM directors
INTERSECT
SELECT first_name, last_name, date_of_birth FROM actors;

SELECT first_name FROM actors
WHERE gender = 'M'
EXCEPT
SELECT first_name FROM directors
WHERE nationality = 'British'
ORDER BY first_name;
