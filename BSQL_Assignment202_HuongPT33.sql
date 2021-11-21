create database fresher_training1;
use fresher_training;
drop database fresher_training;
drop TABLE Trainee;
create table Trainee (
    TraineeID int primary key IDENTITY(1,1),
    Full_Name nvarchar(100),
    Birth_Date date, Gender tinyint,
    ET_IQ int check ([ET_IQ] between 0 and 20), 
    ET_Gmath int check ([ET_Gmath] between 0 and 20), 
    ET_English int check ([ET_English] between 0 and 50),
    Training_Class int not null,
    Evaluation_Notes text
);
INSERT into Trainee(Full_Name,Birth_Date,ET_Gmath,ET_English,ET_IQ,Training_Class,Evaluation_Notes,Fsoft_Account)
VALUES
        ('Pham Huong','1999-06-22', 19, 48,18,2,'Note1','Huong@fosft.com'),
        ('Pham Hung','1999-06-22', 15, 40, 15,3,'Note1','Huong2@fosft.com'),
        ('Pham Hong','1999-06-22', 15, 30, 15,4,'Note1','Huong3@fosft.com'),
        ('Nguyen Huong','1999-06-22', 17, 13, 10,5,'Note1','Huong4@fosft.com'),
        ('Duc Hoa','1995-01-05', 19, 45, 13,6,'Note1','Huong5@fosft.com'),
        ('Le Huong','1995-06-22', 12, 40, 19,7,'Note1','Huong6@fosft.com'),
        ('Vu Huong','1999-06-22', 13, 40, 14,8,'Note1','Huong7@fosft.com'),
        ('Do Thuan','1999-12-14', 19, 40, 12,9,'Note1','Huong8@fosft.com'),
        ('Do Doanh','2000-06-22', 15, 30, 10,10,'Note1','Huong9@fosft.com'),
        ('Pham Long','2004-06-22', 18, 40,10,11,'Note1','Huong11@fosft.com'),
        ('Pham Duc','2002-06-22', 10, 30, 16,12,'Note1','Huong12@fosft.com'),
        ('Pham Nghia','1997-06-22', 10, 23,17,13,'Note1','Huong13@fosft.com')
;
SELECT * from Trainee;
truncate table Trainee;

alter table Trainee
ADD Fsoft_Account VARCHAR(255) not null UNIQUE;


drop view trainee_pass;

create view trainee_pass as
select ET_IQ,ET_Gmath,ET_English
from Trainee
where (ET_IQ + ET_Gmath >=20) and ET_IQ >=8
 and ET_Gmath >=8 and ET_English >= 18
;
select * from trainee_pass;

select ET_IQ,ET_Gmath,ET_English,Birth_Date
from Trainee
where (ET_IQ + ET_Gmath >=20) and ET_IQ >=8
 and ET_Gmath >=8 and ET_English >= 18
group by Birth_Date;

select top 1 *, DATEDIFF(year, Birth_Date, GETDATE()) as age from Trainee order by len(Full_Name) desc;
