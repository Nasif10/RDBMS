CREATE DATABASE EMP
USE EMP

CREATE TABLE DEPARTMENT (
  DepartmentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  DepartmentName varchar(50) NOT NULL,
  NumberOfSection int NOT NULL,
  Budget money NOT NULL
)

INSERT INTO DEPARTMENT VALUES ('HR',1,200000),('IT',3,600000),
                              ('SALES',2,400000),('PURCHASE',2,350000),('ACCOUNTS',2,500000)


CREATE TABLE EMPLOYEE
( 
 EmployeeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
 EmployeeName varchar(50) NOT NULL,
 Salary numeric(7,2) NOT NULL,
 Phone nchar(11) NOT NULL UNIQUE,
 City varchar(50)DEFAULT 'Dhaka',
 DOB date,
 DepartmentId int NOT NULL 
 FOREIGN KEY REFERENCES DEPARTMENT(DepartmentId)
)

INSERT INTO EMPLOYEE (EmployeeName,Salary,Phone,City,DOB,DepartmentId)
VALUES('Jamal',16000.00,123456,'Khulna','1982-04-12',1),('Salam',17000.00,7865467,'Pabna','1980-05-05',1),
      ('Salma',17500.00,783463,'Pabna','1980-10-25',3),('Samsul',12000.00,3890876,'Dhaka','1984-02-17',3),
      ('Rahima',16500.00,68886,'Dhaka','1987-03-18',2),('Jamila',14000.00,764368,'Rajshahi','1986-07-05',2),
      ('Jahan',15000.00,7675756,'Khulna','1983-09-09',2),('Rakib',18000.00,677889,'Rajhahi','1983-07-16',5),
      ('Nusrat',18500.00,675733,'Dhaka','1985-07-08',4),('Nabil',20500.00,989733,'Khulna','1982-12-12',4)



--UNION 

(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')
 UNION
(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')



--UNION ALL 

(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')
 UNION ALL
(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')


--INTERSECT

(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')       
 INTERSECT
(SELECT EmployeeName,City FROM EMPLOYEE  WHERE City !='KHULNA')     



--EXCEPT  

(SELECT EmployeeName,City FROM EMPLOYEE )
 EXCEPT
(SELECT EmployeeName,City FROM EMPLOYEE WHERE City !='DHAKA')