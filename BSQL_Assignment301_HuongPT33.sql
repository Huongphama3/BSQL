--Q1
insert into EMPLOYEE (EmpNo,EmpName,BirthDay,DeptNo,StartDate,Salary,Level,Status,Note,email)
values  (1,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,1,0, 'reply', 'Hung1@gmail.com'),
	(2,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,2,0, 'reply', 'Hung2@gmail.com'),
	(3,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,3,0, 'reply', 'Hung3@gmail.com'),
	(4,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,4,0, 'reply', 'Hung4@gmail.com'),
	(5,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,5,0, 'reply', 'Hung5@gmail.com'),
	(6,'Nguyen Hung','2000-02-02', 1, '2021-11-11',4000000,6,0, 'reply', 'Hung6@gmail.com')
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
--Q2
select EmpNo, EmpName, Department.DeptName 
from 
Employee JOIN Department ON Employee.DeptNo = Department.DeptNo;
--Q3
Select EmpName from Employee JOIN Emp_Skill ON Employee.EmpNo = Emp_Skill.EmpNo
JOIN Skill ON Skill.SkillNo = Emp_Skill.SkillNo WHERE SkillName IN ('C++', '.NET');
--Q4
--k có inf mng

--Q5
--Q6
Select EmpName, Email, count(SkillNo) from Employee JOIN Emp_Skill ON Employee.EmpNo = Emp_Skill.EmpNo
GROUP BY Employee.EmpNo, Employee.EmpName, Employee.Email
 ORDER BY  COUNT (SkillNo) ASC;
 
--Q7
select e.* from Employee e where (select count(*) from Emp_skill where Emp_Skill.EmpNo = e.EmpNo) > 1 and Status = 1 
--Q8

CREATE VIEW employee_name AS
SELECT e.EmpName, d.DeptName
FROM Employee e INNER JOIN Department d
ON e.DeptNo = d.DeptNo 
