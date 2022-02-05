CREATE DATABASE UserDb
USE UserDb

CREATE TABLE Users(
 Id BIGINT PRIMARY KEY IDENTITY(1,1),
 Username VARCHAR(30) UNIQUE NOT NULL,
 Password VARCHAR(26) NOT NULL,
 ProfilePicture VARBINARY(900),
 LastLoginTime DATETIME,
 IsDeleted BIT,
)

INSERT INTO Users VALUES ('Mimi','cdjashbc',56565454,'2010-10-10 23:59:59',0),
                         ('Ivan','vjkv',5611,'2011-10-10 21:59:59',1),
                         ('Stoyan','fdvfvv',6516,'2020-10-10 20:59:59',0),
                         ('Koko','vfvdv',262,'2015-10-10 23:59:59',1)


CREATE DATABASE CarRental 
USE CarRental


CREATE TABLE Categories(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 CategoryName NVARCHAR(30) NOT NULL,
 DailyRate FLOAT(2) NOT NULL,
 WeeklyRate FLOAT(2) NOT NULL,
 MonthlyRate FLOAT(2) NOT NULL,
 WeekendRate FLOAT(2) NOT NULL
)

INSERT INTO Categories VALUES ('Cars', 20, 100, 400, 30), 
	                          ('Vagoon', 20, 100, 400, 30), 
                              ('Motor', 20, 100, 400, 30)

CREATE TABLE Cars
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 PlateNumber NVARCHAR(10) NOT NULL,
 Manufacturer NVARCHAR(30) NOT NULL,
 Model NVARCHAR(30) NOT NULL,
 CarYear DATE NOT NULL,
 CategoryId INT,
 Doors TINYINT NOT NULL,
 Picture VARBINARY(MAX),
 Condition NVARCHAR(20),
 Available BIT NOT NULL
)

ALTER TABLE Cars DROP COLUMN Available 
ALTER TABLE Cars ADD Available CHAR(10)


INSERT INTO Cars VALUES ('CA1884CV', 'VW','Audi','2000', 1,4,6561651,'new','Yes'), 
                        ('CA1854CV', 'VW','VW', '1996',  1,4,65498651,'new','Yes'),
                        ('CA4584CV', 'VW','BWM','2005',  1,4,56565165,'old','NO')


CREATE TABLE Employees
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 FirstName NVARCHAR(10),
 LastName NVARCHAR(30),
 Title NVARCHAR(100) NOT NULL,
 Notes NVARCHAR(300)
)

INSERT INTO Employees VALUES ('Ivan','Petrov','Manager','Nice person'), 
	                         ('Stoyan','Petrov','Assistant','Nice person'), 
	                         ('Miro','Petrov','Manager','Awful person')


CREATE TABLE Customers
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 DriverLicenceNumber NVARCHAR(30),
 FullName NVARCHAR(50) NOT NULL,
 Address NVARCHAR(100),
 City NVARCHAR(100) NOT NULL,
 ZIPCode TINYINT,
 Notes NVARCHAR(300)
)

ALTER TABLE Customers DROP COLUMN ZIPCode
ALTER TABLE Customers ADD ZIPCode CHAR(15)

INSERT INTO Customers VALUES ('abc', 'Ivan Ivanov','23 street','Plovdiv','4589','Nice'),
                             ('def', 'Stoyan Ivanov','26 street','Sofia','5623','Nice')



CREATE TABLE RentalOrders
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 EmployeeId INT NOT NULL,
 CustomerId INT NOT NULL,
 CarId INT NOT NULL,
 TankLevel FLOAT(2),
 KilometrageStart INT,
 KilometrageEnd INT NOT NULL,
 TotalKilometrage INT NOT NULL,
 StartDate DATE NOT NULL,
 EndDate DATE NOT NULL,
 TotalDays DATE NOT NULL,
 RateApplied FLOAT(2) NOT NULL,
 TaxRate FLOAT(2) NOT NULL,
 OrderStatus NVARCHAR(15) NOT NULL,
 Notes NVARCHAR(15) NOT NULL,
)


ALTER TABLE RentalOrders DROP COLUMN TotalDays
ALTER TABLE RentalOrders ADD TotalDays INT NOT NULL


INSERT INTO RentalOrders
VALUES (1,2,3,0.25,15,20000,20015,'2000-10-01','2005-10-10',0.22,0.55,'bought','Perfect',200),
       (1,3,2,0.25,15,20000,20015,'2000-10-01','2005-10-10',0.22,0.55,'bought','Perfect',200),
       (1,2,2,0.25,15,20000,20015,'2000-10-01','2005-10-10',0.22,0.55,'bought','Perfect',200)
	   