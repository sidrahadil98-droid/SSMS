CREATE DATABASE "School_db";

USE "School_db";


-- 1. Create Teacher Table
CREATE TABLE Teacher(
    t_id INT PRIMARY KEY IDENTITY(1,1),
    t_Name VARCHAR (255) NOT NULL,
    Gender VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL
);


INSERT INTO Teacher (t_Name, Gender, email) VALUES 
('Asif Khan', 'Male', 'asif@gmail.com'),
('Sana Ahmed', 'Female', 'sana@gmail.com'),
('Imran Ali', 'Male', 'imran@gmail.com'),
('Ayesha Malik', 'Female', 'ayesha@gmail.com'),
('Bilal Hussain', 'Male', 'bilal@gmail.com'),
('Fatima Noor', 'Female', 'fatima@gmail.com'),
('Kamran Shah', 'Male', 'kamran@gmail.com'),
('Hina Tariq', 'Female', 'hina@gmail.com');

-- 2. Create Course Table
CREATE TABLE Course(
    c_id INT PRIMARY KEY IDENTITY(1,1),
    c_Name VARCHAR (255) NOT NULL,
    t_id INT,
    FOREIGN KEY (t_id) REFERENCES Teacher (t_id)
);

-- FIXED: Included the t_id values to link courses to teachers
INSERT INTO Course (c_Name, t_id) VALUES 
('Database', 1),
('Web Development', 2),
('Python', 3),
('Java', 1),
('SQL', 4),
('Data Science', 5),
('JavaScript', 2),
('C++', 6);

SELECT * FROM student;
-- 3. Create Student Table 
CREATE TABLE student(
    std_id INT PRIMARY KEY IDENTITY(1,1),
    std_Name VARCHAR (255) NOT NULL,
    age INT NOT NULL,
    Gender VARCHAR (255) NOT NULL,
    city VARCHAR (255) NOT NULL,
    c_id INT, 
    FOREIGN KEY (c_id) REFERENCES Course (c_id)
);

-- FIXED: Explicitly included c_id values to map students to their courses
INSERT INTO student (std_Name, age, Gender, city, c_id) VALUES 
('Ali', 20, 'Male', 'Karachi', 1),
('Sara', 21, 'Female', 'Lahore', 2),
('Ahmed', 22, 'Male', 'Islamabad', 3),
('Ayesha', 19, 'Female', 'Karachi', 4),
('Usman', 23, 'Male', 'Multan', 5),
('Hina', 20, 'Female', 'Lahore', 6),
('Bilal', 24, 'Male', 'Peshawar', 7),
('Maham', 21, 'Female', 'Islamabad', 8),
('Hamza', 22, 'Male', 'Karachi', 1),
('Zainab', 20, 'Female', 'Quetta', 2);

-- 4. Corrected Join Query
SELECT 
    std.std_id, 
    std.std_Name, 
    std.age, 
    std.city, 
    std.Gender, 
    c.c_Name AS Course
FROM student AS std 
INNER JOIN Course AS c ON std.c_id = c.c_id;

-- 3 tables Full Joins
SELECT 
    std.std_id, 
    std.std_Name, 
    std.age, 
    std.city, 
    std.Gender, 
    c.c_Name AS Enrolled_Course,
    t.t_Name AS Teacher_Name -- Teacher ka naam yahan add kiya hai
FROM student AS std 
INNER JOIN Course AS c ON std.c_id = c.c_id
INNER JOIN Teacher AS t ON c.t_id = t.t_id; -- Teacher table ko connect kiya

