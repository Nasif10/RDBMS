CREATE DATABASE StudentManagement
USE StudentManagement

CREATE TABLE Student(Id int IDENTITY(1,1) PRIMARY KEY,Name varchar(50) NOT NULL,Gender varchar(20) NOT NULL,
                     Class int NOT NULL,Fees varchar(11) NULL,)

INSERT INTO Student VALUES ('Rahim', 'Male',8, 3000),('Karim', 'Male',9, 3500)



CREATE PROCEDURE get_student
AS
SELECT Id, Name FROM Student
GO;

--Execute Procedure
EXEC get_student;


--Procedure With Parameter

CREATE PROCEDURE get_student_by_id
@id int
AS
SELECT Id, Name FROM Student WHERE id = @id
GO;


EXEC get_student_by_id 1
