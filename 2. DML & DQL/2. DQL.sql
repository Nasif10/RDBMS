CREATE DATABASE ShopManagement
USE ShopManagement


CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL DEFAULT  'Dhaka',
Phone varchar(11) NULL
)



INSERT INTO CUSTOMER (FirstName, LastName, AreaCode, Address, Phone) 
VALUES ('Rahim', 'Khan', 1000, 'Palton', '0123'),
       ('Kahim', 'Shafiq', 1209, 'Dhanmondi', '0234'),
       ('Hashim', 'Amla', 1213, 'Gulshan', '0345'),
	   ('Karim', 'Janat', 1213, 'Gulshan', '0456')
	   
INSERT INTO CUSTOMER (FirstName, LastName, Phone)  VALUES ('Mofizur', 'Rahman', '0567'),
                                                          ('Abir', 'Hossain', '0678'),
                                                          ('Raihan', 'Rahman', '0789')


--SELECT

SELECT * FROM CUSTOMER

SELECT CustomerId, FirstName, LastName FROM CUSTOMER

--WHERE

SELECT * FROM CUSTOMER WHERE CustomerId = 1

SELECT * FROM CUSTOMER WHERE AreaCode > 1210

--Test for NULL Values
SELECT CustomerId, FirstName, Phone FROM CUSTOMER WHERE AreaCode IS NULL


--Alias for Columns
SELECT FirstName AS 'First Name', LastName AS 'Last Name' FROM CUSTOMER
SELECT FirstName + ' ' + LastName AS 'Customer Name' FROM CUSTOMER


--TOP Clause
SELECT TOP 3 * FROM CUSTOMER
SELECT TOP 50 PERCENT * FROM Customer


--ORDER BY

SELECT * FROM CUSTOMER ORDER BY FirstName

SELECT * FROM CUSTOMER ORDER BY Address, FirstName

SELECT * FROM CUSTOMER ORDER BY FirstName DESC

SELECT * FROM CUSTOMER ORDER BY FirstName ASC , LastName DESC


--DISTINCT Statement

SELECT DISTINCT Address FROM CUSTOMER

--Copying the existing table's columns

SELECT * INTO CUSTOMERBackup FROM CUSTOMER

SELECT * INTO CUSTOMERDhaka FROM CUSTOMER where Address='Dhaka'