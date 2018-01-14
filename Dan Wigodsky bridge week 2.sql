
drop table if exists Reviewers;
drop table if exists Videos;
drop table if exists Levels;

create table Videos 
(ID int auto_increment primary key not null, 
title varchar(100) null,
short_title varchar(40), 
length time,
url varchar(60));

INSERT INTO Videos values(ID,'MySQL Database Tutorial - 1 - Introduction to Databases', 'Bucky SQL tutorial 1', '00:07:31', 'https://www.youtube.com/watch?v=KgiCxe-ZW8o);');
INSERT INTO Videos values(ID,'MySQL Beginner Tutorial 1 - Introduction to MySQL',  'Quentin Watt SQL 1', '00:10:20', 'https://www.youtube.com/watch?v=nN4Kjdverzs');
INSERT INTO Videos values(ID,'MySQL Tutorial 36 - Introduction to Joins', 'Caleb SQL Joins', '00:07:39', 'https://www.youtube.com/watch?v=VFZW1YgUn6M');
INSERT INTO Videos values(ID,'SQL Server join :- Inner join,Left join,Right join and full outer join', 'Types of Joins - Questpond',  '00:08:10', 'https://www.youtube.com/watch?v=KTvYHEntvn8');


CREATE TABLE Levels (
  rating smallint primary key NOT NULL
) ;

INSERT INTO Levels( rating ) VALUES(0),(1),(2),(3),(4),(5);

create table Reviewers
(ID int not null,
name varchar (40),
rating smallint NULL,
review varchar (250),
constraint foreign key (ID)
references Videos (ID),
foreign key (rating)
references Levels (rating));

insert into Reviewers values(4,'Bob Reviewer', null, 'The explanations were good, but the diagrams need help.');
insert into Reviewers values(1,'Hannah Roberts', 4, 'Bucky is always a go to guy, even if a bit childish.');
insert into Reviewers values(1,'Fred Flinstone', 2, 'I liked the original better than the SQL');
insert into Reviewers values(2,'Barney Rubble', 4, 'This was very informative.');
insert into Reviewers values(2,'Cat Video Lvr', 1, 'There wasnt even a cat.');

select
v.ID,
v.short_title,
v.length,
r.name,
r.rating,
r.review
from Videos as v
inner join reviewers as r
on v.id = r.id;


