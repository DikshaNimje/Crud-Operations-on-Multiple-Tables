-- Create the CompanyDb database
CREATE DATABASE CompanyDb;

-- Use the CompanyDb database
USE CompanyDb;

-- Create the Department table
CREATE TABLE Department
(
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Create the Employee table
CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Salary DECIMAL(18, 2) NOT NULL,
    Designation NVARCHAR(50) NOT NULL,
    DepartmentID INT,
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Remove the redundant ALTER TABLE statement
-- Do not add columns that already exist

-- Select all records from Employee
SELECT * FROM Employee;

-- Select all records from Department
SELECT * FROM Department;


SET IDENTITY_INSERT Department ON;

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');


INSERT INTO Employee (Name, DepartmentID, Salary, Designation)
VALUES 
('John Doe',1, 50000.00, 'HR Manager'),
('Jane Smith',2, 80000.00, 'Software Engineer'),
('Alice Brown', 3, 70000.00, 'Financial Analyst'),
('Bob White',4, 60000.00, 'Marketing Specialist'),
('Eve Green', 5, 55000.00, 'Sales Executive');


SET IDENTITY_INSERT Department OFF;

UPDATE Employee
SET Name = 'Diksha Nimje'
WHERE DepartmentID = 1;

UPDATE Employee
SET Name = 'Isha Nimje'
WHERE DepartmentID = 2;

UPDATE Employee
SET Name = 'Roshni Shahu'
WHERE DepartmentID = 3;

UPDATE Employee
SET Name = 'Kalyani Raut'
WHERE DepartmentID = 4;

UPDATE Employee
SET Name = 'Mayank Nimje'
WHERE DepartmentID = 5;

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    e.Salary,
    e.Designation,
    d.DepartmentName
FROM 
    Employee e
JOIN 
    Department d ON e.DepartmentID = d.DepartmentID;


ALTER TABLE Employee
ADD 
    password NVARCHAR(100);



ALTER TABLE Employee
ADD Password NVARCHAR(100);


UPDATE Employee
SET Password = 'Ishan@123'
WHERE EmployeeID = 2;

UPDATE Employee
SET Password = 'Roshni@789'
WHERE EmployeeID = 3;

UPDATE Employee
SET Password = 'Kalyani@999'
WHERE EmployeeID = 4;

UPDATE Employee
SET Password = 'Mayank@123'
WHERE EmployeeID = 5;


SELECT * FROM Employee;
