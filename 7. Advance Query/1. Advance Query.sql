CREATE DATABASE ShopManagement
USE ShopManagement

CREATE TABLE Customer(	
	CustomerID int IDENTITY(1,1) PRIMARY KEY,
	FirstName varchar (50) ,
	LastName varchar (50) ,
	CustomerAddress varchar (50) ,
	City varchar (50) ,
	Country varchar (50)
)

INSERT INTO CUSTOMER VALUES ('Amy', 'Johnson', '11000 Beecher', 'Joliet',  'USA'),
                            ('Bill', 'Brown', '7312 Bettis Ave.', 'Pittsburg','USA'),
                            ('Janna', 'Smith', '200 E. Elm Apt. #32', 'Sparks','USA'),
                            ('Evette', 'LeBlanc', '207 Queens Quay West', 'Toronto','CA'),
                            ('Drew', 'Brisco', '1690 Hollis Street', 'Ottawa','CA')


CREATE TABLE CustomerOrder(	
	OrderID int IDENTITY(101,1) PRIMARY KEY,
	OrderDate date ,
	CustomerID int NOT NULL,
	Bill money ,
	Country varchar (50) ,
	SalesmanId int NOT NULL
)


INSERT INTO CustomerOrder 
VALUES  ('2019-01-13' , 3, 12.9500, 'USA',1005),('2019-01-12' , 5, 7.9500 , 'CA',1002),
		('2019-01-05' , 2, 9.9500 , 'USA',1003),('2019-01-07' , 1, 12.9500 , 'USA',1001),
		('2019-01-09' , 5, 7.9500 , 'CA',1005),('2019-01-04' , 1, 7.9500 , 'USA',1003),
		('2019-01-04' , 5, 7.9500 , 'CA',1004),('2019-01-06' , 2, 12.9500 , 'USA',1004),
		('2019-01-07' , 3,  9.9500 , 'USA',1005),('2019-01-08' , 3,  5.9500 , 'USA',1001),
		('2018-11-11' , 9, 8.9500 , 'CA',1004),('2018-12-12' , 8, 9.9500 , 'CA',1002)


CREATE TABLE  Salesman(
 SalesmanId int IDENTITY(1001,1) PRIMARY KEY,
 FirstName varchar(50),
 LastName varchar(50),
 Area varchar(15),
 YearOfService Int,
 Salary Decimal(7,2)
)

INSERT INTO Salesman VALUES ('Nicholas', 'Graham', 'Mirpur', 5, 20000),('Rachel', 'Wood', 'Dhanmondi', 9, 40000),
	                        ('Emily', 'Blunt', 'Shantinagar', 8, 35000),('Robert', 'Smith', 'Gulshan', 11, 50000),
	                        ('Amy', 'Watson', 'Banani', 3, 15000);



Select * From Customer 
WHERE CustomerID = (SELECT CustomerID FROM CustomerOrder WHERE OrderDate = '2019-01-13');

Select * From Customer 
WHERE CustomerID <= (SELECT CustomerID FROM CustomerOrder WHERE OrderDate = '2019-01-13');

Select * From Customer 
WHERE CustomerID BETWEEN (SELECT CustomerID FROM CustomerOrder WHERE OrderDate = '2019-01-13') AND 5;

Select * From Customer WHERE CustomerID 
BETWEEN (SELECT CustomerID FROM CustomerOrder WHERE OrderDate = '2019-01-13') AND 
(SELECT CustomerID FROM CustomerOrder WHERE OrderDate = '2019-01-12');


Select * From Customer 
WHERE CustomerID IN (SELECT CustomerID FROM CustomerOrder WHERE Bill>10);

Select * From Customer 
WHERE CustomerID >ANY(SELECT CustomerID FROM CustomerOrder WHERE Bill>10);

Select * From Customer 
WHERE CustomerID >SOME(SELECT CustomerID FROM CustomerOrder WHERE Bill>10);

Select * From Customer 
WHERE CustomerID >ALL(SELECT CustomerID FROM CustomerOrder WHERE Bill>10);

Select * From Customer 
WHERE CustomerID IN(SELECT CustomerID FROM CustomerOrder WHERE Bill>10 GROUP BY CustomerID);


SELECT CustomerID FROM CustomerOrder 
GROUP BY CustomerID HAVING 
AVG(BILL)>(SELECT AVG(BILL) FROM CustomerOrder);

SELECT ORDERID FROM CustomerOrder WHERE SalesmanId IN 
(SELECT SalesmanId FROM Salesman WHERE Salary > (SELECT AVG(SALARY) FROM Salesman));