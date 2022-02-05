CREATE DATABASE StudentManagement
USE StudentManagement

CREATE TABLE Student
(
 Id int IDENTITY(1,1) PRIMARY KEY,
 Name varchar(50) NOT NULL,
 Gender varchar(20) NOT NULL,
 Class int NOT NULL,
 Fees varchar(11) NULL,
)


INSERT INTO Student VALUES ('Rahim', 'Male',8, 3000),('Karim', 'Male',9, 3500)


-- AFTER trigger

create trigger student_for_insert
on Student
after insert
as
begin
	print 'Student inserted';
end



alter trigger student_for_insert
on Student
after insert
as
begin
	select * from inserted
end


--for delete
create trigger student_for_delete
on Student
after delete
as
begin
	select * from deleted
end


create trigger student_for_delete
on Student
for delete
as
begin
	Rollback
	print 'You can not delete record';
end



--for update
create trigger student_for_update
on Student
after update
as
begin
	select * from inserted
	select * from deleted
end