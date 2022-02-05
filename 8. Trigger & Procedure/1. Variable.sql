--declare variables
DECLARE @name VARCHAR(10);
SET @name = 'ABC'
print @name

--Declaring and assigning value
DECLARE @name VARCHAR(10) = 'Rahim'

SELECT * FROM CUSTOMER WHERE Name = @name

--variable in LIKE operator
DECLARE @name VARCHAR(10) = '%him'
SELECT * FROM CUSTOMER WHERE Name LIKE @name