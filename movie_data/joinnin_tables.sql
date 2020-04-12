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
