CREATE DATABASE ShopManagement
USE ShopManagement

CREATE TABLE CUSTOMER
(
 CustomerId int IDENTITY(1,1) PRIMARY KEY,
 FirstName varchar(50) NOT NULL,
 LastName varchar(50) NOT NULL,
 AreaCode int NULL,
 Address varchar(200) NULL,
 Phone varchar(11) NULL
)


INSERT INTO CUSTOMER VALUES ('Karim', 'Rahman', 1203, 'Dhaka','0123')
INSERT INTO CUSTOMER VALUES ('Rahim', 'Rahman', 3100, 'Sylhet','0456')

INSERT INTO CUSTOMER (FirstName, LastName, AreaCode, Address, Phone) 
VALUES ('Rahim', 'Khan', 1307, 'Gulshan', '0145')


INSERT INTO CUSTOMER (LastName, FirstName) 
VALUES ('Ahmed', 'Hashim')

--DQL

SELECT * FROM CUSTOMER

SELECT CustomerId, FirstName FROM CUSTOMER



--ALTER TABLE

ALTER TABLE CUSTOMER 
ADD CustomerSince date

ALTER TABLE CUSTOMER
ALTER COLUMN CustomerSince datetime

ALTER TABLE CUSTOMER
DROP COLUMN CustomerSince


--Rename column
use ShopManagement
GO
sp_RENAME 'CUSTOMER.Address' , 'CustomerAddress', 'COLUMN'
GO


DELETE from CUSTOMER where ID = 1;


DELETE FROM CUSTOMER

INSERT INTO CUSTOMER (FirstName, LastName, AreaCode, CustomerAddress, Phone, CustomerSince) 
VALUES ('Nasif', 'Naz', 1209, 'Dhanmondi', '01677515829', '1994-05-18') 

INSERT INTO CUSTOMER (LastName, FirstName, AreaCode, CustomerAddress, Phone, CustomerSince) 
VALUES ('Nasif', 'Naz', 1307, 'Gulshan', '01677515829', '1994-05-18 23:59:59') 

--TRUNCATE Table

TRUNCATE TABLE CUSTOMER

--DROP Table

DROP TABLE customer

DROP DATABASE ShopManagement