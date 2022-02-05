CREATE DATABASE ShopManagement
USE ShopManagement


CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE CHECK(CustomerNumber>1000),
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL DEFAULT 'Dhaka',
Phone varchar(11) NULL
)

--INSERT

INSERT INTO CUSTOMER (CustomerNumber, FirstName, LastName, AreaCode, Address, Phone) 
VALUES (1001, 'Rahim', 'Khan', 1213, 'Gulshan', '0123'),
       (1002, 'Kahim', 'Shafiq', 1209, 'Dhanmondi', '2345'),
       (1003, 'Hashim', 'Amla', 1231, 'Jatrabari', '3456')


--Insert Data Only in Specified Columns	   
INSERT INTO CUSTOMER (CustomerNumber, FirstName, LastName, Phone) 
VALUES (1004, 'Mofizur', 'Rahman', '4567'),
       (1005, 'Abir', 'Hossain', '5678'),
       (1006, 'Raihan', 'Rahman', '6789')	   


INSERT INTO CUSTOMER (CustomerNumber, FirstName, LastName, AreaCode, Address, Phone) 
VALUES (1002, 'Kashim', 'Sardar', 1102, 'Uttara', '01612457845')

INSERT INTO CUSTOMER (CustomerNumber, FirstName, LastName, AreaCode, Address, Phone) 
VALUES (-1002, 'Kashim', 'Sardar', 1102, 'Uttara', '01612457845')

INSERT INTO CUSTOMER (CustomerNumber, LastName, AreaCode, Address, Phone) 
VALUES (1004, 'Sardar', 1102, 'Uttara', '01612457845')



--UPDATE

UPDATE CUSTOMER set AreaCode = 46 where CustomerId = 2

UPDATE CUSTOMER SET AreaCode = 1219, Address = 'Khilgaon' WHERE CustomerID = 1;

UPDATE CUSTOMER set AreaCode = 1222 where CustomerId = 1 or CustomerId = 3

UPDATE CUSTOMER set AreaCode = 1230       


--DELETE

DELETE FROM CUSTOMER where CustomerId = 2

DELETE FROM CUSTOMER WHERE FirstName = 'Raihan'

DELETE FROM CUSTOMER


SELECT * FROM CUSTOMER