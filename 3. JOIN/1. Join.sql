CREATE DATABASE ShopManagement
USE ShopManagement

CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
Name varchar(50) NOT NULL,
Age int NOT NULL CHECK (Age >= 18),
Address varchar(200) NULL  DEFAULT  'Dhaka',
Salary decimal(18,2) NULL
)

CREATE TABLE ORDERS
(
OrderId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
Date date NULL,
Amount money NULL
) 

INSERT INTO CUSTOMER (Name, Age, Address, Salary) 
VALUES ('Rahim', 32, 'Gulshan', 2000.00),
       ('Karim', 25, 'Dhanmondi', 1500.00),
       ('Hashim', 23, 'Motijheel', 2000.00),
       ('Khan', 25, 'Tejgaon', 6500.00),
       ('Rahman', 27, 'Tejgaon', 8500.00),
       ('Mehedi', 22, 'Mohammadpur', 4500.00),
       ('Kashim', 24, 'Kakrail', 10000.00),
       ('Kazi', 22, 'Kakrail', 1000.00)


INSERT INTO ORDERS (CustomerId, Date, Amount)
VALUES (2,'02-15-2008',1230),
       (4,'11-25-2007',240),
       (3,'04-05-2013',1150),
       (2,'11-30-2007',14300),
       (5,'03-23-2012',30),
       (7,'02-15-2008',260),
       (5,'05-19-2013',1580),
       (3,'10-22-2012',458),
       (2,'03-27-2009',700)


--INNER JOIN

SELECT CUSTOMER.CustomerId , Name, Age, Amount, Date FROM 
CUSTOMER INNER JOIN ORDERS
ON CUSTOMER.CustomerId = ORDERS.CustomerId

--LEFT JOIN
 
SELECT CUSTOMER.CustomerId , Name, Age, Amount,Date, Orders.OrderID FROM 
CUSTOMER LEFT JOIN ORDERS
ON CUSTOMER.CustomerId = ORDERS.CustomerId

--RIGHT JOIN 

SELECT CUSTOMER.CustomerId , Name, Age, Amount, Date FROM 
CUSTOMER RIGHT JOIN ORDERS
ON CUSTOMER.CustomerId = ORDERS.CustomerId


--FULL JOIN

SELECT CUSTOMER.CustomerId , Name, Orders.OrderId FROM
CUSTOMER FULL JOIN ORDERS
ON CUSTOMER.CustomerId = ORDERS.CustomerId


-----Self JOIN-----

CREATE TABLE Employee
(
 empId int IDENTITY(1,1) PRIMARY KEY,
 empName varchar(50) NOT NULL,
 empSalary int NOT NULL,
 managerId int
)

INSERT INTO Employee (empName,empSalary,managerId)
VALUES ('Rahim', 20000, 5),
       ('Karim', 50000, NULL),
	   ('Tanvir',30000, 5),
	   ('Bijoy', 25000, 2),
	   ('Naim',  60000, NULL)
     
SELECT E1.empName as 'Employee Name', E2.empName as 'Employee Name'
FROM Employee E1 INNER JOIN Employee E2
ON 	E1.managerId = E2.empId


--Cross Join
SELECT * FROM Employee E1 CROSS JOIN Employee E2