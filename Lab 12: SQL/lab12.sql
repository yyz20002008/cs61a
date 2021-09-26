.read data.sql


CREATE TABLE bluedog AS
  SELECT color,pet from students where color='blue' and pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color,pet,song from students where color='blue' and pet='dog';


CREATE TABLE smallest_int AS
  SELECT time,smallest 
  from students 
  where smallest>2 
  order by smallest
  limit 20;


CREATE TABLE matchmaker AS
  SELECT A.pet,A.song,A.color,B.color
  from students A
  join students B
   on A.pet=B.pet and A.song=B.song
   and A.time<B.time;


CREATE TABLE sevens AS
  SELECT seven
  from students s
  join numbers n
  on s.time=n.time
  where s.number=7 and n.'7'='True';

