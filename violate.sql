/* 
This file contains invalid statements for:
     3 primary key constraints
     6 referential integrity constraints
     3 check constraints

, which are the required (minimum) numbers of constraints.


*/


/* *****PRIMARY KEY VIOLATIONS***** */

-- Table Movie - primary key #1: cannot have two movies with same id
insert into Movie values(272, "Road to CS Master", 2017, "R", "Zaniolo Works");
-- Invalid because there is already tuple with id 272 in the database


-- Table Actor - primary key #2: cannot have two actors with same id
update Actor set id = 65875 where id = 65885;
-- Tuple having id 65875 already exists


-- Table MovieDirector - primary key #5: cannot have 2 records with same combinations of mid and did
insert into MovieDirector values(825,1141);
-- This will be a duplicate record (this combination already exists)





/* *****REFERENTIAL INTEGRITY VIOLATIONS***** */

-- Table Sales - referential integrity #1: mid must reference id from Movie table
insert into Sales values (58735, 9873452, 123523443);
-- a movie with id of 58735 do not exist in Movie Table


-- Table MovieGenre - referential integrity #2: mid must reference id from Movie
insert into MovieGenre values(68935, "Computer Science");
-- A movie with id of 68935 do not exist in Movie Table


-- Table MovieDirector - referential integrity #3: mid must reference id from Movie
update MovieDirector set mid = 3467 where mid = 3 and did = 112;
-- Movie with id of 3467 do not exist


-- Table MovieDirector - referential integrity #4: did must reference id from Director
update MovieDirector set did = 3425 where mid = 3 and did = 112;
-- Director with id of 3425 do not exist


-- Table MovieActor - referential integrity #5: mid must reference id from Movie
delete from Movie where id = 1002;
-- This particular movie is referenced by record(s) in MovieActor. Referential integrity restricts deletion of records that are referenced


-- Table MovieActor - referential integrity #6: aid must reference id from Actor
delete from Actor where id=42218;
-- This actor (id42218) is referenced by records in MovieActor. same as above.





/* *****CHECK VIOLATIONS***** */

-- Table Actor - check #1: dob must be less than or equal to dod
update Actor set dod=19001021 where id=65857;
-- dob for this tuple is 19611226 = 12/26/1961. dod cannot be less than this date


-- Table Sales - check #2: tickets sold cannot be negative
update Sales set ticketsSold=-2456234 where mid=3244;
-- the modification would make ticketsSold for this tuple negative

-- Table MovieRating - check #4: imdb and rot must be number between 0 and 100 
update MovieRating set imdb=-5 where mid = 40;
-- imdb would be out of range
