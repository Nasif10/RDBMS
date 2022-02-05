CREATE DATABASE EmployeeDB
USE EmployeeDB


CREATE TABLE Towns(TownID int IDENTITY(1,1) PRIMARY KEY NOT NULL, Name VARCHAR(50) NOT NULL)

INSERT INTO Towns VALUES ('Redmond'),('Seattle'),('Bellevue'),('Everett'),('Renton')

CREATE TABLE Addresses(
  AddressID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  AddressText VARCHAR(100) NOT NULL,
  TownID int NULL FOREIGN KEY REFERENCES Towns(TownID)
)

INSERT INTO Addresses VALUES ('101 Candy Rd.', 1),
                             ('1275 West Street', 1),
                             ('2137 Birchwood Dr', 1),
	                         ('390 Ridgewood Ct.', 2),
                             ('9666 Northridge Ct.', 2),
                             ('9752 Jeanne Circle', 3),
	                         ('8154 Via Mexico', 3),
                             ('80 Sunview Terrace', 4),
	                         ('2598 La Vista Circle', 5)

CREATE TABLE Projects(
  ProjectID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Description ntext NULL,
  StartDate smalldatetime NOT NULL,
  EndDate smalldatetime NULL
)

INSERT INTO Projects
VALUES ('Cycling Cap', 'Research, design and development of Cycling Cap. Traditional style with a flip-up brim; one-size fits all.', '20010601', '20030601'),	   
       ('Road-350-W', 'Research, design and development of Road-350-W. Cross-train, race, or just socialize on a sleek, aerodynamic bike designed for a woman.  Advanced seat technology provides comfort all day.', '20030601', NULL),
	   ('Road-450', 'Research, design and development of Road-450. A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.', '20010601', '20030601'),
       ('Touring-2000', 'Research, design and development of Touring-2000. The plush custom saddle keeps you riding all day,  and there''s plenty of space to add panniers and bike bags to the newly-redesigned carrier.  This bike has stability when fully-loaded.', '20021120 09:57:00', '20030601'),
       ('HL Touring Handlebars', 'Research, design and development of HL Touring Handlebars. A light yet stiff aluminum bar for long distance riding.', '20050516 16:34:00', NULL)

CREATE TABLE Departments(
  DepartmentID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name VARCHAR(50) NOT NULL,
  ManagerID int NOT NULL
)

INSERT INTO Departments
VALUES ('Management', 1), ('Sales',6), ('Marketing',9), ('Software Development',12), ('Quality Assurance',14)


CREATE TABLE Employees(
  EmployeeID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  JobTitle VARCHAR(50) NOT NULL,
  DepartmentID int NOT NULL FOREIGN KEY REFERENCES Departments(DepartmentID),
  ManagerID int NULL,
  HireDate smalldatetime NOT NULL,
  Salary money NOT NULL,
  AddressID int NULL FOREIGN KEY REFERENCES Addresses(AddressID)
)

INSERT INTO Employees
VALUES  ('Guy', 'Gilbert', 'Assistant Manager', 1, 1, '19980731', 12500, 1),
		('Kevin', 'Brown', 'Operations Coordinator', 3, 1, '19990226', 13500, 1),
		('Robert', 'Tamburelo', 'Engineering Manager', 4, 1, '19991212', 43300, 2),
		('Rob', 'Walters', 'Human Resources', 3, 1, '20000105', 29800, 2),
		('Thierry', 'Harris', 'IT Manager', 4, 1, '20000111', 25000, 3),
		('David', 'Bradley', 'Marketing Manager', 1, 6, '20000120', 37500, 4),
		('JoLynn', 'Dobney', 'Production Supervisor', 2, 6, '20000126', 25000, 4),
		('Ruth', 'Ellerbrock', 'Production Technician', 5, 6, '20000206', 13500, 5),
		('Gail', 'Erickson', 'Marketing Manager', 1, 9, '20000206', 32700, 6),
		('Barry', 'Johnson', 'Production Technician', 5, 9, '20000207', 13500, 6),
		('Jossef', 'Goldberg', 'Design Engineer', 4, 9, '20000224', 32700, 7),
		('Terri', 'Duffy', 'Marketing Manager', 1, 12, '20000303', 63500, 8),
		('Sidney', 'Higa', 'Production Technician', 5, 12, '20000305', 13500, 8),
		('Taylor', 'Maxwell', 'Production Supervisor', 1, 14, '20000311', 25000, 9),
		('Jeffrey', 'Ford',   'Production Technician', 5, 14, '20000323', 13500, 9),
        ('Kimberly', 'Zimmerman', 'Customer Support', 2, 14, '20020213', 13500, 9)
		
		

CREATE TABLE EmployeesProjects(
  EmployeeID int NOT NULL,
  ProjectID int NOT NULL FOREIGN KEY REFERENCES Projects(ProjectID),
  PRIMARY KEY (EmployeeID, ProjectID)
)

INSERT INTO EmployeesProjects
VALUES (1, 1),(2, 1),(3, 1),(4, 1),(5, 1), (6, 2),(7, 2),(8, 2), (9, 3),(10, 3),(11, 3), (12, 4),(13, 4), (14, 5),(15, 5),(16, 5)


ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Employees FOREIGN KEY(ManagerID) REFERENCES Employees(EmployeeID)
ALTER TABLE EmployeesProjects ADD CONSTRAINT FK_EmployeesProjects_Employees FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
ALTER TABLE Departments ADD CONSTRAINT FK_Departments_Employees FOREIGN KEY(ManagerID) REFERENCES Employees(EmployeeID)


------------------------------------------------------------------

SELECT TOP(5) e.EmployeeID, e.JobTitle, a.AddressID, a.AddressText 
FROM Employees e JOIN Addresses a ON e.AddressID = a.AddressID
ORDER BY a.AddressID


SELECT TOP(50) FirstName,LastName, t.Name as [Town], a.AddressText 
FROM Employees e JOIN Addresses a ON e.AddressID = a.AddressID
JOIN Towns t ON a.TownID=t.TownID
ORDER BY FirstName, LastName


SELECT TOP(50) e.FirstName,e.LastName,t.Name AS [Town], a.AddressText 
FROM Employees e LEFT JOIN Addresses a ON e.AddressID = a.AddressID
LEFT JOIN Towns t ON t.TownID=a.TownID
ORDER BY e.FirstName, e.LastName



SELECT EmployeeID,FirstName,LastName,d.Name FROM Employees e
JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE d.Name='Sales'
ORDER BY EmployeeID



SELECT TOP(5) e.EmployeeID,e.FirstName, e.Salary,d.Name FROM Employees e 
JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE e.Salary>15000
ORDER BY d.DepartmentID



SELECT TOP(3) e.EmployeeID,e.FirstName FROM Employees e
LEFT JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID



SELECT e.FirstName,e.LastName,e.HireDate,d.Name FROM Employees e
JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE HireDate>'1999-01-01' AND d.Name IN('Finance','Sales')
ORDER BY e.HireDate


SELECT * FROM Employees e
JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE e.HireDate >'1999-01-01' AND (d.Name ='Sales' OR d.Name ='Finance')



SELECT TOP(5) e.EmployeeID,e.FirstName,p.Name FROM Employees e
JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
JOIN Projects p ON ep.ProjectID=p.ProjectID
WHERE p.StartDate > '2002-08-13' AND p.EndDate IS NULL
ORDER BY e.EmployeeID



SELECT e.EmployeeID,e.FirstName, IIF(p.StartDate>='2005-01-01',NULL,p.Name) as ProjectName FROM Employees e
JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
JOIN Projects p ON ep.ProjectID=p.ProjectID
WHERE e.EmployeeID=24



SELECT e2.EmployeeID,e2.FirstName,e2.ManagerID,e1.FirstName AS ManagerName FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
WHERE e2.ManagerID IN (3,7) ORDER BY e2.EmployeeID



SELECT TOP(50) e2.EmployeeID,e2.FirstName+' '+ E2.LastName AS EmployeeName,e1.FirstName+' '+e1.LastName AS ManagerName,d.Name AS DepartmentName FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
JOIN Departments d ON e2.DepartmentID=d.DepartmentID
ORDER BY e2.EmployeeID



SELECT TOP(1) AVG(Salary) AS MinAverageSalary FROM Employees
GROUP BY DepartmentID ORDER BY AVG(Salary)