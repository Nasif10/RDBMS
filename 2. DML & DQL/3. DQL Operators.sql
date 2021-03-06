CREATE DATABASE ShopManagement
USE ShopManagement

CREATE TABLE CUSTOMER
(
 CustomerId int IDENTITY(1,1) PRIMARY KEY,
 Name varchar(50) NOT NULL,
 Age int NOT NULL CHECK (Age>=18),
 Address varchar(200) NULL DEFAULT  'Dhaka',
 Salary decimal(18,2) NULL
)

INSERT INTO CUSTOMER (Name, Age, Address, Salary) 
VALUES ('Rahim', 32, 'Gulshan', 2000.00),('Karim', 25, 'Dhanmondi', 1500.00),
       ('Hashim', 23, 'Motijheel', 2000.00),('Khan', 25, 'Tejgaon', 6500.00),
       ('Rahman', 27, 'Tejgaon', 8500.00),('Mehedi', 22, 'Mohammadpur', 4500.00),
       ('Kashim', 24, 'Kakrail', 10000.00),('Kazi', 22, 'Kakrail', 1000.00)


CREATE TABLE ORDERS
(
OrderId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL,
Date date NULL,
Amount money NULL
)

INSERT INTO ORDERS VALUES (1,'2018-02-15',1230),(1,'2017-11-25',240),(1,'2013-04-05',1150),
                          (2,'2017-11-30',14300),(2,'2012-03-23',30),(2,'2018-02-15',260),
                          (3,'2013-05-19',1580),(3,'2012-10-22',458),(3,'2019-03-27',700)



SELECT * FROM CUSTOMER WHERE Age > 30
SELECT * FROM CUSTOMER WHERE Age >= 24
SELECT * FROM CUSTOMER WHERE Address <> 'Kakrail'

--AND, OR and NOT Operators

SELECT * FROM CUSTOMER WHERE Age >= 25 AND Salary >= 6500
SELECT * FROM CUSTOMER WHERE Address = 'Kakrail' AND Salary<10000

SELECT * FROM CUSTOMER WHERE AGE >= 25 OR SALARY >= 6500
SELECT * FROM CUSTOMER WHERE Address='Kakrail' OR Address='Dhanmondi'

SELECT * FROM CUSTOMER WHERE NOT Address='Kakrail'


--IN Operator

SELECT * FROM CUSTOMER WHERE Address IN ('Gulshan', 'Dhanmondi');
SELECT * FROM CUSTOMER WHERE AGE IN (22, 25, 27)
SELECT * FROM CUSTOMER WHERE Address NOT IN ('Gulshan', 'Dhanmondi');

--BETWEEN Operator

SELECT * FROM CUSTOMER WHERE AGE BETWEEN 23 AND 27
SELECT * FROM CUSTOMER WHERE Salary BETWEEN 5000 AND 10000

SELECT * FROM ORDERS WHERE Date BETWEEN '2018-01-01' AND '2020-01-01'

SELECT * FROM CUSTOMER WHERE AGE NOT BETWEEN 20 AND 30
SELECT * FROM CUSTOMER WHERE AGE BETWEEN 20 AND 30 AND CustomerId NOT IN (1,2,3)


--LIKE Operator

SELECT * FROM CUSTOMER WHERE SALARY LIKE '200%'
SELECT * FROM CUSTOMER WHERE NAME LIKE 'Ka%'
SELECT * FROM CUSTOMER WHERE NAME LIKE '%a%'
SELECT * FROM CUSTOMER WHERE NAME LIKE '_a%'

SELECT * FROM CUSTOMER WHERE NAME LIKE 'Ka%' AND (AGE >= 25 OR SALARY >= 6500)

--NULL Values
SELECT * FROM CUSTOMER WHERE AGE IS NOT NULL
SELECT * FROM CUSTOMER WHERE AGE IS NULL


-----Aggregate functions-----

SELECT AVG(Age) FROM CUSTOMER

SELECT COUNT(CustomerId) FROM CUSTOMER
SELECT COUNT(DISTINCT Address) FROM CUSTOMER
SELECT COUNT(Address) as NumberOfCustomers FROM CUSTOMER 
SELECT COUNT(*) FROM CUSTOMER WHERE NAME LIKE 'Ka%'

SELECT SUM(Salary) FROM CUSTOMER
SELECT STDEV(Salary) FROM CUSTOMER

SELECT Age, MAX(Salary) FROM CUSTOMER
SELECT SUM(Salary), AVG(Salary) FROM CUSTOMER

SELECT MIN(SALARY) FROM CUSTOMER WHERE AGE >= 25 
SELECT MAX(SALARY)-MIN(SALARY) FROM CUSTOMER WHERE AGE >= 25 


--Scalar functions

SELECT UPPER(Name) AS UpperCusName FROM CUSTOMER
UPDATE CUSTOMER SET Name=upper(Name)
SELECT len(Name) FROM CUSTOMER


--GROUP BY Statement

SELECT Address FROM CUSTOMER GROUP BY Address

SELECT COUNT(CustomerId), Address FROM CUSTOMER GROUP BY Address

SELECT Age, MAX(Salary) FROM CUSTOMER GROUP BY Age 

SELECT Age, MAX(Salary) FROM CUSTOMER WHERE Age >= 25 GROUP BY Age

SELECT Address, COUNT (CustomerId) FROM CUSTOMER GROUP BY Address HAVING COUNT(CustomerId) >= 2;

SELECT Address, COUNT (CustomerId) FROM CUSTOMER 
GROUP BY Address HAVING COUNT(CustomerId) >= 2 ORDER BY Address DESC

SELECT Address, COUNT (*) FROM CUSTOMER GROUP BY Address HAVING COUNT(*) >= 2;


--ANY and ALL Operators

SELECT ALL CustomerId FROM CUSTOMER WHERE TRUE

SELECT ProductName FROM Products
WHERE ProductID = ALL (SELECT ProductId FROM OrderDetails WHERE Quantity = 6 OR Quantity = 2);