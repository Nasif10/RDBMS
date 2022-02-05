CREATE DATABASE Shop
USE Shop

--PRIMARY KEY

CREATE TABLE CUSTOMER
(
CustomerId int PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL,
Phone varchar(11) NULL
)

--FOREIGN KEY

CREATE TABLE ORDERS
(
OrderId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
OrderDate date NULL,
OrderAmount money NULL
) 

INSERT INTO CUSTOMER (CustomerId, FirstName, LastName, AreaCode, Address, Phone) 
VALUES (1001, 'Rahim', 'Khan', 1307, 'Gulshan', '0123'),
       (1002, 'Kahim', 'Rahman', 1202, 'Dhanmondi', '0234'),
       (1003, 'Hashim','Mehedi', 1307, 'Gulshan', '0345')
	   
INSERT INTO ORDERS (CustomerId, OrderDate, OrderAmount) 
VALUES (1001, '2021-10-10', 1000),
       (1002, '2021-10-15', 1200),
       (1002, '2021-10-16', 1850)	   
	   
	   
--UNIQUE Constraint
--CHECK Constraint
--DEFAULT Constraint

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


--PRIMARY KEY constraint on multiple columns

CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1),
CustomerNumber int NOT NULL CHECK(CustomerNumber>1000),
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL  DEFAULT  'Dhaka',
Phone varchar(11) NULL
CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustomerId, CustomerNumber)
)


ALTER TABLE ORDERS
DROP CONSTRAINT PK__ORDERS__C3905BCF0425A276;

ALTER TABLE ORDERS
DROP CONSTRAINT FK__ORDERS__Customer__060DEAE8;

ALTER TABLE ORDERS
ADD PRIMARY KEY (OrderId);

ALTER TABLE ORDERS
ADD FOREIGN KEY (CustomerId) REFERENCES CUSTOMER (CustomerId);