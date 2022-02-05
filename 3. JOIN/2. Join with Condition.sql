CREATE DATABASE Shop
USE Shop

CREATE TABLE Customer(
	CustomerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName varchar (50) NOT NULL,
	LastName varchar (50) NOT NULL,
	CustomerAddress varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	Country varchar (50) NOT NULL
);

INSERT INTO CUSTOMER VALUES ('Amy', 'Johnson', '11000 Beecher', 'Joliet',  'USA'),
                            ('Bill', 'Brown', '7312 Bettis Ave.', 'Pittsburg','USA'),
                            ('Janna', 'Smith', '200 E. Elm Apt. #32', 'Sparks','USA'),
                            ('Evette', 'LeBlanc', '207 Queens Quay West', 'Toronto','CA'),
                            ('Drew', 'Brisco', '1690 Hollis Street', 'Ottawa','CA')
	   
	   
CREATE TABLE CustomerOrder(
	OrderID int IDENTITY(101,1) NOT NULL PRIMARY KEY,
	OrderDate date NOT NULL,
	CustomerID int NOT NULL,
	Bill money NOT NULL
);

INSERT INTO CustomerOrder VALUES ('2019-01-13', 3, 12.9500),('2019-01-12', 5, 79500),
		                         ('2019-01-05', 2, 9.9500),('2019-01-07', 1, 129500),
								 ('2019-01-09', 5, 7.9500),('2019-01-04', 1, 79500),
								 ('2019-01-04', 5, 7.9500),('2019-01-06', 2, 129500),
								 ('2019-01-07', 3,  9.9500),('2019-01-08', 3, 59500),
								 ('2018-11-11', 9, 8.9500),('2018-12-12', 8, 99500)
		
	
--Where clause with Join
SELECT * FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID WHERE Bill >= 100000
	
--Group By with Join
SELECT COUNT(CustomerID), Country FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID GROUP BY Customer.Country 	
	
	
SELECT Customer.CustomerID,Customer.LastName, Customer.FirstName, CustomerOrder.Bill
FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
ORDER BY Customer.CustomerID



SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName, CustomerOrder.Bill
FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
WHERE Customer.LastName IN ('Smith', 'Brisco', 'Brown')
ORDER BY Customer.CustomerID	



SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName,CustomerOrder.OrderDate,
SUM(CustomerOrder.Bill) as 'Total Bill'
FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
WHERE CustomerOrder.OrderDate >= '2019-01-10'
GROUP BY Customer.CustomerID,Customer.LastName, Customer.FirstName,CustomerOrder.OrderDate



SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName,CustomerOrder.OrderDate,
SUM(CustomerOrder.Bill) as 'Total Bill'
FROM Customer INNER JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
WHERE CustomerOrder.OrderDate >= '2019-01-10'
GROUP BY Customer.CustomerID,Customer.LastName, Customer.FirstName,CustomerOrder.OrderDate
HAVING SUM(CustomerOrder.Bill)>10



SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName,CustomerOrder.OrderDate,CustomerOrder.Bill
FROM Customer LEFT JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID


SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName, SUM(CustomerOrder.Bill) as 'Total Bill'
FROM Customer LEFT JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
GROUP BY Customer.CustomerID,Customer.LastName, Customer.FirstName


SELECT Customer.CustomerID, Customer.LastName, Customer.FirstName, SUM(CustomerOrder.Bill) as 'Total Bill', CustomerOrder.OrderID
FROM Customer RIGHT JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID
GROUP BY Customer.CustomerID, Customer.LastName, Customer.FirstName, CustomerOrder.OrderID
ORDER BY CustomerOrder.OrderID DESC


SELECT Customer.CustomerID,CustomerOrder.CustomerID, Customer.LastName, Customer.FirstName,CustomerOrder.Bill
FROM Customer FULL JOIN CustomerOrder
ON Customer.CustomerID = CustomerOrder.CustomerID