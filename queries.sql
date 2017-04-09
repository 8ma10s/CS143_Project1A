SELECT CONCAT(Actor.first, ' ', Actor.last) FROM Actor JOIN MovieActor ON Actor.id = MovieActor.aid JOIN Movie ON MovieActor.mid = Movie.id WHERE Movie.title = 'Die Another Day';
