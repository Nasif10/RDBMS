CREATE VIEW Order_View 
AS
SELECT C.*  FROM 
CUSTOMER C INNER JOIN ORDERS O
ON C.CustomerId = O.CustomerId 

SELECT * FROM Order_View


CREATE VIEW Order_View_without_salary 
AS
SELECT C.Name, C.Age, C.Address, O.Amount, O.Date FROM 
CUSTOMER C INNER JOIN ORDERS O ON C.CustomerId = O.CustomerId

SELECT * FROM Order_View_without_salary 

 