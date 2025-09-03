--Q1
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    AdmissionDate DATETIME DEFAULT GETDATE()
)

--Q2
INSERT INTO Students1 (FirstName, LastName, DOB, Gender, Marks, AdmissionDate)
VALUES
('Rahul', 'Sharma', '2001-05-12', 'M', 85, '2024-08-01'),
('Priya', 'Kumari', '2002-09-20', 'F', 92, '2024-08-15'),
('Amit', 'Verma', '1999-12-11', 'M', 67, '2024-07-25'),
('Sneha', 'Patel', '2003-03-05', 'F', 78, '2024-08-28'),
('Karan', 'Singh', '2000-06-18', 'M', 55, '2024-07-30'),
('Neha', 'Reddy', '2001-01-22', 'F', 88, '2024-08-05'),
('Arjun', 'Mehta', '1998-11-09', 'M', 73, '2024-08-10')

select * from Students1

--Q3
SELECT * INTO Students1_Backup
FROM Students1

--Q4
--1
SELECT 
    FirstName, LastName, DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Students1

--2
SELECT 
    FirstName, LastName,
    YEAR(AdmissionDate) AS AdmissionYear,
    MONTH(AdmissionDate) AS AdmissionMonth
FROM Students1

--3
SELECT *
FROM Students1
WHERE AdmissionDate >= DATEADD(DAY, -30, GETDATE())

--Q5
--1
SELECT 
    MAX(Marks) AS HighestMarks,
    MIN(Marks) AS LowestMarks,
    AVG(Marks) AS AverageMarks
FROM Students1

--2
SELECT Gender, COUNT(*) AS Total
FROM Students1
GROUP BY Gender

--3
SELECT COUNT(*) AS StudentsBornAfter2000
FROM Students1
WHERE DOB > '2000-01-01'





