--Q1
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName Varchar(50) NOT NULL UNIQUE
)

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name Varchar(50) NOT NULL,
    Age INT CHECK (Age >= 17),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName Varchar(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)
--Q2
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),(2, 'Mechanical'),(3, 'Electrical'),(4, 'Civil'),(5, 'Electronics')

INSERT INTO Students (StudentID, Name, Age, DepartmentID) VALUES
(101, 'Alice', 19, 1),  (102, 'Bob', 20, 2),(103, 'Charlie', 18, 3),(104, 'Diana', 22, 4),(105, 'Ethan', 21, 5)

INSERT INTO Courses (CourseID, CourseName, DepartmentID) VALUES
(201, 'DBMS', 1),(202, 'Thermodynamics', 2),(203, 'Circuits', 3),(204, 'Structures', 4),(205, 'Artificial Intelligence', 1)

--Q3
--Student age >20
SELECT * 
FROM Students
WHERE Age > 20

--Students who belong to the "Computer Science" dept
SELECT c.CourseID, c.CourseName
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science'

--Students details where department="Electronics"
SELECT s.StudentID, s.Name, s.Age
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Electronics'

--Students whose age is between 18 and 22
SELECT * 
FROM Students
WHERE Age BETWEEN 18 AND 22

--Q4
--Inner Joins
SELECT s.StudentID, s.Name AS StudentName, d.DepartmentName
FROM Students s
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID

--Left Joins
SELECT c.CourseID, c.CourseName, d.DepartmentName
FROM Courses c
LEFT JOIN Departments d ON c.DepartmentID = d.DepartmentID

--Right Joins
SELECT s.StudentID, s.Name AS StudentName, c.CourseName
FROM Students s
RIGHT JOIN Courses c ON s.DepartmentID = c.DepartmentID