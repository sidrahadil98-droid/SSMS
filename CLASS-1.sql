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


SELECT CONCAT(empName, 'has a designation of' , designation,
'has a salary of ', salary) as EmpDetails FROM Employee;

SELECT * FROM Employee;

-- Sub Queries
SELECT empName, salary FROM Employee where salary < (SELECT AVG(salary) as avg_salary FROM Employee
);

SELECT empName, salary FROM Employee where salary > (SELECT AVG(salary) as avg_salary FROM Employee);

SELECT empName, salary FROM Employee where salary >  (SELECT MIN(salary) as min_salary FROM Employee);
SELECT empName, salary FROM Employee where salary <  (SELECT MAX(salary) as max_salary FROM Employee);

-- Group BY

SELECT city, COUNT(id) as EmpCount FROM Employee GROUP BY city;

SELECT city, MAX(salary) as MaxSalary FROM Employee GROUP BY city;

SELECT city, MIN(salary) as MinSalary FROM Employee GROUP BY city;

SELECT city, SUM(salary) as TotalSalary FROM Employee GROUP BY city;

INSERT INTO Employee(empName, designation, salary,city, depId) VALUES
('Bisma', 'Manager', 98000, 'Karachi', null),
('Humaira', 'Manager', 125000, 'Lahore', null),
('Iqra', 'Manager', 330000, 'Islamabad', null);

SELECT designation, COUNT(id) as EmpCount FROM Employee Group BY designation having designation = 'Manager';

-- New TABLE OF DEPARTMENT
	CREATE TABLE Department(
		depId INT PRIMARY KEY IDENTITY(1,1),
		depName VARCHAR(50) NOT NULL
	);

INSERT INTO Department VALUES
('Academics'), ('SRO'), ('TECH'), ('Marketing'), ('Exam');

SELECT * FROM Department;

INSERT INTO Department VALUES
('Placement'), ('Admin');

--Truncate Table
TRUNCATE TABLE Department;

DROP TABLE Employee;

CREATE TABLE Employee(
	id INT PRIMARY KEY IDENTITY(1,1),
	empName VARCHAR (255) NOT NULL,
	designation VARCHAR (255) NOT NULL,
	salary INT NOT NULL,
	city VARCHAR (255) NOT NULL,
	depId INT  
	FOREIGN KEY (depId) references Department(depId)
	--FK   own table key   ref      table-name(table key)     
);

INSERT INTO Employee(empName, designation, salary, city, depId) VALUES
('Ahad', 'CAH', 480000, 'Karachi', 1),
('Hanzala', 'Faculty Member', 80000, 'Karachi', 1),
('Imran', 'Netword Assistant', 88000, 'Karachi', 3),
('Rayyan', 'Admin Manager', 1280000, 'Karachi', 7),
('Nabeel', 'SRO Head', 82000, 'Karachi', 2),
('Farmil', 'Senior Marketing Agent', 90000, 'Karachi', 4),
('Fasiha', 'Batch Coordinator', 75000, 'Karachi', 1),
('Sidrah', 'Manager Academics', 178000, 'Karachi', 1),
('Bisma', 'Examination Head', 265000, 'Karachi', 5),
('Iqra',  'DCAH', 190000, 'Karachi', 1),
('Humaira', 'SRO', 330000, 'Karachi', 2);

SELECT * FROM Employee;

-- INNER JOIN cooman data fetch
SELECT empName, designation, depName, city, salary FROM Employee as emp
INNER JOIN Department as d on emp.depId = d.depId;

INSERT INTO Employee(empName, designation, salary, city)VALUES
('Fahad', 'CAH', 480000, 'Karachi');



-- LEFT JOIN 
SELECT empName, designation, depName, city, salary FROM Employee as emp
LEFT JOIN Department as d on emp.depId = d.depId; 

SELECT empName, designation, depName, city, salary FROM Department as d 
LEFT JOIN  Employee as emp on d.depId =  emp.depId; 

-- RIGHT JOIN
SELECT empName, designation, depName, city, salary FROM Employee as emp
RIGHT JOIN Department as d on emp.depId = d.depId;

SELECT empName, designation, depName, city, salary FROM Department as d 
RIGHT JOIN  Employee as emp on d.depId =  emp.depId; 

--FULL OUTER JOIN
SELECT empName, designation, depName, city, salary FROM Employee as emp
FULL OUTER JOIN Department as d on emp.depId = d.depId;

