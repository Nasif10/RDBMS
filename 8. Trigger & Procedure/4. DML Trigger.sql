CREATE DATABASE StudentManagement
USE StudentManagement

CREATE TABLE Student(Id int IDENTITY(1,1), Name varchar(50), Gender varchar(20), Class int NOT NULL, Fees int)

CREATE TABLE Student_Audit(AuditId int IDENTITY(1,1), AuditInfo varchar(70))

--for insert

CREATE TRIGGER student_insert_Audit
on Student
after insert
as
begin
	Declare @id int
	SELECT @id = id from inserted
	
	INSERT INTO Student_Audit 
	VALUES ('Student Id '+ Cast(@id as varchar(50)) + ' is added at ' + Cast(GETDATE() as varchar(50)))
end


INSERT INTO Student VALUES ('Arif', 'Male', 10, 3000)
SELECT * FROM Student_Audit


--for delete

CREATE TRIGGER student_delete_Audit
ON Student
after delete
as
begin
	Declare @id int
	SELECT @id = id from deleted
	
	INSERT INTO Student_Audit 
	VALUES ('Student Id '+ Cast(@id as varchar(50)) + ' is deleted at ' + Cast(GETDATE() as varchar(50) ))
end


DELETE FROM Student WHERE Id = 2
SELECT * FROM Student_Audit


--for update

CREATE TRIGGER student_update_Audit
ON Student
after update
as
begin
	Declare @id int
	Declare @oldfees int
	Declare @newfees int
	
	SELECT * INTO #Temp FROM inserted
	
	WHILE (EXISTS(SELECT Id FROM #Temp))
	begin
		SELECT TOP 1 @id = Id, @newfees = Fees from #Temp
		SELECT @oldfees = Fees from deleted where Id = @id
		
		if(@oldfees <> @newfees)
			INSERT INTO Student_Audit 
			VALUES ('Student Id '+ Cast(@id as varchar(2)) + ' changed fees from ' + Cast(@oldfees as varchar(7))+' to '+ Cast(@newfees as varchar(7))+  ' at ' + Cast(GETDATE() as varchar(20) ))
		DELETE FROM #Temp WHERE Id = @id
	end
end


UPDATE Student SET Fees = 4000 WHERE Id = 1
SELECT * FROM Student_Audit