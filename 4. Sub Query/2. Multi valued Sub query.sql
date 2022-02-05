CREATE DATABASE EMP
USE EMP

CREATE TABLE DEPARTMENT (
  DeptId int IDENTITY(1,1) PRIMARY KEY,
  DepartmentName varchar(50) NOT NULL,
  NumberOfSection int NOT NULL,
  Budget money NOT NULL
)

INSERT INTO DEPARTMENT VALUES ('HR',1,200000),('IT',3,600000),
                              ('SALES',2,400000),('PURCHASE',2,350000),('ACCOUNTS',2,500000)


CREATE TABLE EMPLOYEE
( 
 EmployeeId int IDENTITY(1,1) PRIMARY KEY,
 EmployeeName varchar(50) NOT NULL,
 Salary numeric(7,2) NOT NULL,
 Phone nchar(11) NOT NULL UNIQUE,
 City varchar(50) DEFAULT 'Dhaka',
 DOB date,
 DeptId int NOT NULL 
 FOREIGN KEY REFERENCES DEPARTMENT(DeptId)
)

INSERT INTO EMPLOYEE (EmployeeName,Salary,Phone,City,DOB,DeptId)
VALUES('Jamal',16000.00,123456,'Khulna','1982-04-12',1),('Salam',17000.00,7865467,'Pabna','1980-05-05',1),
      ('Salma',17500.00,783463,'Pabna','1980-10-25',3),('Samsul',12000.00,3890876,'Dhaka','1984-02-17',3),
      ('Rahima',16500.00,68886,'Dhaka','1987-03-18',2),('Jamila',14000.00,764368,'Rajshahi','1986-07-05',2),
      ('Jahan',15000.00,7675756,'Khulna','1983-09-09',2),('Rakib',18000.00,677889,'Rajhahi','1983-07-16',5),
      ('Nusrat',18500.00,675733,'Dhaka','1985-07-08',4),('Nabil',20500.00,989733,'Khulna','1982-12-12',4)
	 

--Scalar subquery
	 
SELECT * FROM EMPLOYEE WHERE DeptId = (SELECT DeptId FROM DEPARTMENT WHERE DepartmentName ='HR')

--Multi valued Subquery
--IN operator

SELECT * FROM EMPLOYEE WHERE EmployeeId IN (SELECT EmployeeId FROM EMPLOYEE WHERE City ='Dhaka')	  

SELECT * FROM EMPLOYEE WHERE EmployeeId NOT IN (SELECT EmployeeId FROM EMPLOYEE WHERE City ='Dhaka')

--ANY operator

SELECT * FROM EMPLOYEE WHERE Salary < 
ANY (SELECT Salary FROM EMPLOYEE WHERE EmployeeName ='Jamal' OR EmployeeName ='Jahan')

SELECT * FROM EMPLOYEE WHERE DeptId > ANY (SELECT DeptId FROM DEPARTMENT WHERE Budget > 300000.00)

--ALL operator

SELECT * FROM EMPLOYEE WHERE Salary < 
ALL (SELECT Salary FROM EMPLOYEE WHERE EmployeeName ='Jamal' OR EmployeeName ='Jahan')

SELECT * FROM EMPLOYEE WHERE DeptId > ALL (SELECT DeptId FROM DEPARTMENT WHERE Budget > 300000.00)

--EXISTS operator

SELECT * FROM EMPLOYEE WHERE EXISTS
(SELECT DepartmentId FROM DEPARTMENT 
WHERE EMPLOYEE.DepartmentId = DEPARTMENT.DepartmentId AND DEPARTMENT.DepartmentId =6)


SELECT * FROM EMPLOYEE WHERE NOT EXISTS (SELECT d.DepartmentId FROM DEPARTMENT as d JOIN EMPLOYEE as e 
on (e.DepartmentId=d.DepartmentId) WHERE d.DepartmentId = 6)

