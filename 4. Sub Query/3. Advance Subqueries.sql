CREATE DATABASE EMP
USE EMP

CREATE TABLE Department(dep_id int PRIMARY KEY, dep_name varchar(20),dep_location varchar(20))

INSERT INTO Department VALUES (1001, 'FINANCE', 'SYDNEY'),(2001, 'AUDIT', 'MELBOURNE'),(3001, 'MARKETING', 'PERTH'),(4001, 'PRODUCTION', 'BRISBANE')
	  
CREATE TABLE Salary_grade(grade int PRIMARY KEY,min_sal int,max_sal int)							  

INSERT INTO Salary_grade VALUES (1, 800, 1300),(2, 1301, 1500),(3, 1501, 2100),(4, 2101, 3100),(5, 3101, 9999)


CREATE TABLE Employees(emp_id int IDENTITY(1,1) PRIMARY KEY,emp_name varchar(15),job_name varchar(15),manager_id int,
                       hire_date date,salary decimal(10,2),commission decimal(7,2),dep_id int)

INSERT INTO Employees VALUES('KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL,1001),
						   ('BLAZE', 'MANAGER',1, '1991-05-01', 2750.00, NULL,3001),
                           ('CLARE', 'MANAGER', 1 , '1991-06-09', 2550.00, NULL, 1001),
					       ('JONAS', 'MANAGER', 1 , '1991-04-02', 2957.00, NULL, 2001),
					       ('SCARLET', 'ANALYST', 4 , '1997-04-19', 3100.00, NULL, 2001),
					       ('FRANK', 'ANALYST', 4 , '1991-12-03', 3100.00, NULL, 2001),
					       ('SANDRINE', 'CLERK', 6 , '1990-12-18',  900.00, NULL, 2001),
					       ('ADELYN', 'SALESMAN', 2 , '1991-02-20', 1700.00, 400.00, 3001),
					       ('WADE', 'SALESMAN', 2 , '1991-02-22', 1350.00, 600.00, 3001),
					       ('MADDEN', 'SALESMAN', 2 , '1991-09-28', 1350.00, 1500.00, 3001),
					       ('TUCKER', 'SALESMAN', 2 , '1991-09-08', 1600.00, 0.00, 3001),
					       ('ADNRES', 'CLERK', 5 , '1997-05-23', 1200.00, NULL, 2001),
					       ('JULIUS', 'CLERK', 2 , '1991-12-03', 1050.00, NULL, 3001),
					       ('MARKER', 'CLERK', 3 , '1992-01-23', 1400.00, NULL, 1001)


SELECT * FROM employees WHERE emp_id IN (SELECT manager_id FROM employees)

SELECT emp_id,emp_name,job_name,hire_date, DATEDIFF(YEAR,hire_date,GETDATE()) "Experience"
FROM employees WHERE emp_id IN (SELECT manager_id FROM employees)


SELECT * FROM employees e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal AND s.grade IN (2, 3)


SELECT * FROM employees
WHERE salary > (SELECT salary FROM employees WHERE emp_name = 'JONAS')


SELECT * FROM employees WHERE job_name = (SELECT job_name FROM employees WHERE emp_name = 'FRANK') 


SELECT * FROM employees WHERE hire_date < (SELECT hire_date FROM employees WHERE emp_name = 'ADELYN')


SELECT * FROM employees e, department d WHERE d.dep_id = 2001 AND e.dep_id = d.dep_id
AND e.job_name IN (SELECT e.job_name FROM employees e, department d WHERE e.dep_id = d.dep_id AND d.dep_id =1001)


SELECT * FROM employees WHERE salary 
IN (SELECT salary FROM employees e WHERE e.emp_name IN ('FRANK', 'BLAZE') AND employees.emp_id <> e.emp_id)


SELECT * FROM employees WHERE job_name = (SELECT job_name FROM employees WHERE emp_name = 'MARKER')
OR salary> (SELECT salary FROM employees WHERE emp_name = 'ADELYN');


SELECT * FROM employees WHERE salary > (SELECT max(salary+commission) FROM employees WHERE job_name = 'SALESMAN');


SELECT * FROM employees e, department d WHERE d.dep_location 
IN ('PERTH','BRISBANE') AND e.dep_id = d.dep_id 
AND e.hire_date < (SELECT e.hire_date FROM employees e WHERE e.emp_name = 'BLAZE')


SELECT * FROM employees WHERE hire_date < (SELECT max(hire_date) FROM employees
WHERE manager_id IN (SELECT emp_id FROM employees WHERE emp_name = 'KAYLING'))


SELECT * FROM employees WHERE salary IN 
(SELECT max(salary) FROM employees WHERE dep_id IN
(SELECT d.dep_id FROM department d WHERE d.dep_name = 'MARKETING'))


SELECT * FROM employees e,salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal AND s.grade IN (4, 5)
AND e.emp_id IN (SELECT e.emp_id FROM employees e WHERE e.job_name IN ('MANAGER','ANALYST'))


SELECT * FROM employees e WHERE e.dep_id IN (SELECT d.dep_id FROM department d WHERE d.dep_name IN ('FINANCE','AUDIT'))
AND e.salary >(SELECT salary FROM employees WHERE emp_name = 'ADELYN')
AND e.hire_date < (SELECT hire_date FROM employees WHERE emp_name = 'FRANK') 
AND e.emp_id IN (SELECT e.emp_id FROM employees e, salary_grade s WHERE e.salary BETWEEN s.min_sal AND s.max_sal AND s.grade IN (3,4) )
ORDER BY e.hire_date ASC