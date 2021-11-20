use employee_management_sysstem

create table EMPLOYEE(
	  EmpNo int primary key IDENTITY(1,1),
	  EmpName nvarchar(50) not null,
	  BirthDay date not null,
	  DeptNo int not null,
	  MgrNo int not null,
	  StartDate date not null,
	  Salary money not null,
	  Level int not null,
	  Status int not null,
	  Note text
)

create table SKILL (
	SkillNo int primary key IDENTITY(1,1),
	SkillName varchar(50),
	Note text
)

create table EMP_SKILL(
	SkillNo int,
	EmpNo int ,
	SkillLevel int,
	RegDate date,
	Decription text
	Foreign Key (EmpNo) references EMPLOYEE(EmpNo),
	Foreign Key (SkillNo) references SKILL(SkillNo)
)

create table DEPARTMENT (
	DeptNo int primary key IDENTITY(1,1) ,
	DeptName varchar(50),
	Note text
)


--- bai 2.1


Alter table EMPLOYEE add email varchar(50) unique;
--- bai 2.2
Alter table EMPLOYEE add constraint MgrNo default 0 for MgrNo;
insert into EMPLOYEE (EmpName,BirthDay,DeptNo,StartDate,Salary,Level,Status,Note,email)
values  ('Nguyen Hung','2000-02-02', 1007, '2021-11-11',4000000,5,0, 'reply', 'Hung@gmail.com');

---bai 3
ALTER TABLE Employee
ADD FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo); 

alter table EMP_SKILL
drop column Decription;

--bài 4
insert into EMPLOYEE (EmpName,BirthDay,DeptNo,StartDate,Salary,Level,Status,Note,email)
values  ('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,1,0, 'reply', 'Hung1@gmail.com'),
	('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,2,0, 'reply', 'Hung2@gmail.com'),
	('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,3,0, 'reply', 'Hung3@gmail.com'),
	('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,4,0, 'reply', 'Hung4@gmail.com'),
	('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,5,0, 'reply', 'Hung5@gmail.com'),
	('Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,6,0, 'reply', 'Hung6@gmail.com')
;
insert into SKILL(SkillName,Note)
values ('Skill 1', 'Note1'),
		('Skill 2', 'Note1'),
		('Skill 3', 'Note1'),
		('Skill 4', 'Note1'),
		('Skill 5', 'Note1')
;
insert into DEPARTMENT(DeptName,Note)
values ('Dept 1','Note2'),
		('Dept 2','Note2'),
		('Dept 3','Note2'),
		('Dept 4','Note2'),
		('Dept 5','Note2')
;
insert into EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate)
values (1,2,5,'2021-11-11'),
		(2,2,1,'2021-11-11'),
		(3,2,2,'2021-11-11'),
		(4,2,3,'2021-11-11'),
		(5,2,4,'2021-11-11')
;
CREATE VIEW EMPLOYEE_TRACKING AS
SELECT EmpNo, EmpName, Level
FROM EMPLOYEE
WHERE Level >= 3 AND Level <=5; 
