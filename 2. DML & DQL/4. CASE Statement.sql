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


INSERT INTO ORDERS (CustomerId, Date, Quantity, Amount)
VALUES (2,'02-15-2008',10, 1230),
       (4,'11-25-2007',5, 240),
       (3,'04-05-2013',30, 1150),
       (2,'11-30-2007',40, 14300),
       (5,'03-23-2012',1, 30),
       (7,'02-15-2008',3, 260),
       (5,'05-19-2013',25, 1580),
       (3,'10-22-2012',8, 458),
       (2,'03-27-2009',12, 700)
	  
	  
SELECT Name,
CASE
	WHEN salary < 10000 THEN 'Below 10000'
	WHEN salary >= 10000 THEN 'Above 10000'
END
FROM CUSTOMER
ORDER BY salary DESC


SELECT CustomerId, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM ORDERS	   