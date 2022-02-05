--Creating A Temporary Table

CREATE TABLE #Person
(
 Id int,
 Name varchar(50)
)

INSERT INTO #Person VALUES (1, 'Karim')
INSERT INTO #Person VALUES (2, 'Rahim')

SELECT * FROM #Person
DROP TABLE #Person

--Another method

SELECT Id, Name INTO #Person FROM CUSTOMER

SELECT * FROM #Person

SELECT Id, Name INTO #Person FROM CUSTOMER WHERE gender = 'Male'

SELECT * FROM #Person


--Global temporary tables

CREATE TABLE ##Person (Id int,Name varchar(50))
