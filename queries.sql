-- names of all the actors in the movie 'Die Another Day'
SELECT CONCAT(Actor.first, ' ', Actor.last) FROM Actor, MovieActor, Movie
WHERE Actor.id = MovieActor.aid
AND MovieActor.mid = Movie.id
AND Movie.title = 'Die Another Day';

-- count of all the actors who acted in multiple movies
SELECT COUNT(aid) as ActorsInMultipleMovies
FROM MovieActor
GROUP BY aid, mid
HAVING COUNT(aid) > 1;

--  title of movies that sell more than 1,000,000 tickets
SELECT Movie.title FROM Movie, Sales
WHERE Movie.id = Sales.mid
AND Sales.ticketsSold > 1000000;

-- OUR OWN QUERIES:

-- Average imdb rating of movies directed by James Cameron
SELECT avg(MovieRating.imdb) as AverageDirectorRating
FROM MovieRating, MovieDirector, Director
WHERE MovieRating.mid = MovieDirector.mid
AND MovieDirector.did = Director.id
AND Director.first = 'James' AND Director.last = 'Cameron';

-- The title of the movie with the most actors in 2002, and the number of actors in that movie
SELECT Movie.title, COUNT(mid) as NumberOfActors
FROM MovieActor, Movie
WHERE MovieActor.mid = Movie.id
AND Movie.year = 2002
GROUP BY Movie.title
HAVING COUNT(Movie.title) >= ALL (SELECT COUNT(MA.mid)
       FROM MovieActor as MA, Movie as M
       WHERE MA.mid = M.id
       AND M.year = 2002
       GROUP BY MA.mid);

