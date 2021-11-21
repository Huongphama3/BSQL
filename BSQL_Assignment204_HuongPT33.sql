create database Movie_film;
use Movie_film;
create table Movie (
  movie_id int primary key IDENTITY(1,1),
  movie_name varchar(255) not null,
  duration int check( duration >=60),--minute
  genre int not null check(genre >= 1 and genre <= 8), 
  director varchar(255) not null,
  amount_of_money int not null,
  comments text
);
drop table Movie;
drop table Actor;

create table Actor (
  actor_id int primary key IDENTITY(1,1),
  name varchar(255) not null,
  age int not null check(age >= 18 and age <= 80),
  average_salary float,
  nationality varchar(255)
);

create table act_in (
  actor_id int,
  movie_id int,
  Foreign Key (actor_id) references Actor(actor_id),
  Foreign Key (movie_id) references Movie(movie_id)
);

-- bai 2
alter table Movie
 add ImageLink varchar(500) unique;

insert into Movie( movie_name,duration, genre, director, amount_of_money, comments, ImageLink)
values ('Tom and Jerry1', 60, 1,'Jame',1000, 'comment1','https://www.facebook.com/TomandJerryVietnam1'),
        ('Tom and Jerry2', 60, 1,'Jame',1000, 'comment2','https://www.facebook.com/TomandJerryVietnam2'),
        ('Tom and Jerry3', 60, 1,'Jame',1000, 'comment3','https://www.facebook.com/TomandJerryVietnam3'),
        ('Tom and Jerry4', 60, 1,'Jame',1000, 'comment4','https://www.facebook.com/TomandJerryVietnam4'),
        ('Tom and Jerry5', 60, 1,'Jame',1000, 'comment5','https://www.facebook.com/TomandJerryVietnam5')
;

-- bai 3

-- 1
select * from Actor where age > 50;

-- 2
select name, average_salary from actor order by average_salary;

-- 3
select Movie.name 
from
  actor join act_in on (actor.id=act_in.actor_id)
  join Movie on (Movie.movie_id=act_in.movie_id)
  where actor.name = 'Test'


-- 4
select movie.name 
from movie join act_in on (movie.id = act_in.movie_id)
group by movie_id having count(act_in.actor_id) > 3