-- CREATE DB
create database "2509C2";

--USE DB
use "2509C2";

--delete DB
drop  Employee;

CREATE TABLE Employee(
	id INT PRIMARY KEY IDENTITY(1,1),
	empName VARCHAR (255) NOT NULL,
	designation VARCHAR (255) NOT NULL,
	salary INT NOT NULL,
	city VARCHAR (255) NOT NULL,
	depId INT  
);

--Single Record Insert 
INSERT INTO Employee VALUES('Hania', 'Full-Stack Developer', 125000, 'Hyderabad', null);

--Read Table record
SELECT * FROM Employee;

INSERT INTO Employee VALUES
('Hanzala', 'QA Developer', 75000, 'Lahore', null),
('Imran', 'Backend Developer', 85000, 'Lahore', null),
('Rayyan', 'Product Manager', 80000, 'Islamabad', null),
('Nabeel', 'Frontend Developer', 120000, 'Karachi', null),
('Sarah', 'Senior Marketing Agent', 83000, 'Multan', null),
('Saqib', 'UIUX  Designer', 95000, 'Karachi', null),
('Sidrah', 'Mob App Developer', 178000, 'Islamabad', null);

--DISTINCT different 
SELECT DISTINCT city FROM Employee;

--Delete Record
DELETE FROM Employee where id=1;

--Update records
Update Employee set salary = 220000 where city = 'Karachi';

Update Employee set empName= 'Tahir', designation='Product Manager' where id=2;

--where clause
-- srf Product Manager ka data show hu
SELECT empName, designation from Employee where designation='Product Manager';

-- where not Product Manager k alawa sab ka data show hu
SELECT empName, designation from Employee where not designation='Product Manager';

-- AND
SELECT empName, designation, salary from Employee where not designation='Product Manager'
AND salary<=88000;
 
--OR
SELECT empName, designation, salary from Employee where not designation='Product Manager'
OR salary > 88000;

SELECT id, empName, designation, salary from Employee where not designation='Product Manager'
OR salary > 88000;

SELECT id, empName, designation, salary from Employee where designation='Product Manager'
OR salary < 88000;

-- between (2 se 6 tak ka record show hu) 
SELECT * FROM Employee where id between 2 and 6;

-- Like && Search Query %%
Select * FROM Employee where city like '%Ka%';

Select * FROM Employee where designation like '%Mo%';

Select * FROM Employee where city like '%Mu%' AND designation like '%Senior%' ;

-- IN 
Select * FROM Employee where city IN ('Islamabad');

-- ORDER BY
Select * FROM Employee order by empName asc;

Select * FROM Employee order by salary desc;

-- Top 4 
Select top 4 * FROM Employee ;

Select top 70 percent * FROM Employee ;

-- aggregate function
SELECT COUNT(empName) as total_employees FROM Employee;

SELECT MIN(salary) as min_salary FROM Employee;

SELECT Max(salary) as max_salary FROM Employee;

SELECT SUM(salary) as total_salary FROM Employee;

SELECT AVG(salary) as avg_salary FROM Employee;

SELECT AVG(salary) as avg_salary FROM Employee;

SELECT CONCAT(empName, 'has a designation of' , designation, 'has a salary of ', salary) as EmpDetails FROM Employee;
