--LEN Function
SELECT LEN('MS SQL Server')
SELECT Name, LEN(Name) FROM CUSTOMER

--UPPER() function
SELECT UPPER('sql')
SELECT UPPER(Name) FROM CUSTOMER

--REPLACE() function
SELECT REPLACE('It is a good tea at the famous tea store.', 'tea', 'coffee') result

SELECT Name, Address, REPLACE(Address, 'Tejgaon', 'Banani') AS New_address FROM CUSTOMER
UPDATE CUSTOMER SET Address = REPLACE(Address, 'Tejgaon', 'Banani') WHERE Address IS NOT NULL

--TRIM() function
SELECT TRIM('  Test string    ')
SELECT TRIM('.$' FROM '$$$Hello..')

UPDATE CUSTOMER SET Address = TRIM(Address)

--CONCAT() function
SELECT 'John' + ' ' + 'Doe' AS full_name
SELECT CONCAT('John', ' ', 'Doe') AS full_name

SELECT Name, CONCAT(Name, '_',  Age ) AS username FROM CUSTOMER ORDER BY Name


-- LEFT() function
SELECT LEFT('SQL Server',3) AS LeftName    
SELECT LEFT(Name,2) FROM CUSTOMER

--RIGHT() function
SELECT RIGHT('DHAKA 1215',4) AS RightPart   
SELECT RIGHT(Name,3) FROM CUSTOMER

--SUBSTRING() function
SELECT SUBSTRING('13-01-04-074',7,3) AS ROLL   
SELECT SUBSTRING(Address,1,3) FROM CUSTOMER

--REVERSE() function
SELECT REVERSE('MSSQL') AS REV 
SELECT REVERSE(EmployeeName) AS RevEmployeeName FROM EMPLOYEE

--CAST() function
SELECT CAST(57.58 AS INTEGER) AS IntValue
SELECT CAST(Budget AS INTEGER) AS Budget FROM DEPARTMENT

SELECT CONVERT(INTEGER,78.8)AS Int_Value
SELECT CONVERT(Integer,Budget) AS Int_Budget FROM DEPARTMENT