select name from instructor;

select distinct dept_name from instructor

select id, salary from instructor

select * from instructor order by salary desc, name asc;

select dept_name, budget from department

select id, salary from instructor where salary > 85000
 
select name  from instructor where salary > 70000 and dept_name = 'CSE'


select name, instructor.dept_name, building from instructor, department
where instructor.dept_name= department.dept_name;

       
select name, course_id from instructor, teaches where instructor.id= teaches.id;


select instructor.* from instructor, teaches where instructor.ID= teaches.ID;


select distinct t.name from instructor as t, instructor as s
where t.salary > s.salary and s.dept_name = 'EEE';


--///String Operations///

select dept_name from department where building like '%ABC%';

select name from instructor where salary between 90000 and 100000;

select name from instructor where salary <= 100000 and salary >= 90000;


select name, course_id from instructor, teaches 
where instructor.id= teaches.id and dept_name = 'CSE';


select name from instructor where ID in (select i_id from advisor group by i_id having count(i_id) > 1)



--/// Set Operations ///

select distinct course_id from section where semester = 'Fall' and year= 2009;

select distinct course_id from section where semester = 'spring' and year= 2009;


(select course_id from section where semester = 'fall' and year= 2009)
union 
(select course_id from section where semester = 'spring' and year= 2010);


(select course_id from section where semester = 'fall' and year= 2009)
union all
(select course_id from section where semester = 'spring' and year= 2010);


(select course_id from section where semester = 'fall' and year= 2009)
intersect
(select course_id from section where semester = 'spring' and year= 2009);


(select course_id from section where semester = 'fall' and year= 2009)
except
(select course_id from section where semester = 'spring' and year= 2009);


--/// Null Values ///

select name from instructor where salary is null;
 
 
 
 --/// Aggregate Functions ///
 
select avg (salary) from instructor

select max(salary) from instructor
 
select avg (salary) from instructor where dept_name= 'CSE';

select avg (salary) as avg_salary from instructor where dept_name= 'CSE';

select count (distinct id) from teaches where semester = 'spring' and year = 2009;

select title from course where dept_name = 'CSE' and credit = 3

select dept_name, avg (salary) as avg_salary from instructor group by dept_name;

select avg(salary) as avg_salary from instructor group by dept_name

select max(tot_cred) as max_credit from student group by dept_name


select dept_name, count (distinct instructor.id) as instr_count
from instructor inner join teaches on instructor.ID = teaches.ID
where semester = 'fall' and year = 2009 group by dept_name;


select dept_name, avg (salary) as avg_salar from instructor
group by dept_name having avg (salary) > 80000;

              

select course_id, semester, year, sec_id, avg (tot_cred) 
from takes inner join student on takes.ID = student.ID
where year = 2009 group by course_id, semester, year, sec_id having count (student.id) >= 2;



--/// Nested Subqueries///

select course_id from section where semester = 'spring' and year= 2009


select distinct course_id from section
where semester = 'fall' and year= 2009 and
course_id in (select course_id from section where semester = 'Spring' and year= 2009);



select distinct course_id from section where semester = 'fall' and year= 2009 and course_id 
not in (select course_id from section where semester = 'Spring' and year= 2009);
                   -----------Same as---------------
(select course_id from section where semester = 'fall' and year= 2009)
except 
(select course_id from section where semester = 'spring' and year= 2009);
 
                             
select distinct name from instructor where name not in ('Farzad Ahmed', 'Mohsena Ashraf');



select count(distinct id) from takes 
where (course_id, sec_id, semester, year) in (select course_id, sec_id, semester, year
from teaches where teaches.id= 001);


select name from instructor where salary > some (select salary from instructor where dept_name = 'CSE');
                 -----------------------------
select distinct t.id, t.name from instructor as t, instructor as s    --/By Set Comparison
where t.salary > s.salary and s.dept_name = 'CSE';


select name from instructor where salary > all (select salary from instructor where dept_name = 'EEE');


select dept_name from instructor group by dept_name 
having avg (salary) >= all (select avg (salary) from instructor group by dept_name)


select course_id from section as s where semester = 'fall' and year= 2009 and exists (select * from 
section as t where semester = 'spring' and year= 2009 and s.course_id= t.course_id);



select distinct s.id, s.name from student as s where not exists ((select course_id
from course where dept_name = 'CSE') except (select t.course_id from takes as t where s.id = t.id));



select T.course_id from course as T where 1 <= (select count(R.course_id)
from section as R where T.course_id= R.course_id and R.year = 2009);



select t.course_id from course as t where not unique (select r.course_id from section as r
where t.course_id= r.course_id and r.year = 2009);


--/// Subqueries in the From Clause///

select dept_name, avg salary 
from (select dept_name, avg (salary) as avg salary from instructor group by dept_name) 
where avg salary > 80000;
               
			   

select max (tot salary) from (select dept_name, sum(salary) from instructor group by dept_name) as 
dept total (dept_name, tot salary);


select dept_name, (select count(*) from instructor where 
department.dept_name = instructor.dept_name) as num_instructors from department;


select distinct student.id from (student join takes using(id)) join (instructor join teaches using(id)) 
using(course_id, sec_id, semester, year) where instructor.name = 'Shafiul Alam'



select id, name from instructor where salary = (select max(salary) from instructor)



--/// JOIN Operation///

select * from student join takes on student.ID = takes.ID
select * from student, takes where student.ID = takes.ID;  


select student.name, takes.grade from 
student inner join takes on student.id = takes.id;


select student.name, takes.grade from 
student inner join takes on student.id = takes.id where takes.year = '2009';


select course.title from course
inner join section on section.course_id = course.course_id
where section.semester = 'fall' and section.year = 2009


select course.title from course
inner join section on section.course_id = course.course_id
where section.semester = 'spring' and section.year = 2009


select instructor.name from instructor
inner join advisor on instructor.id = advisor.i_id
inner join student on advisor.s_id = student.id
where student.id = '180104001'



select section.course_id, section.sec_id, count(id) from section
inner join takes on takes.course_id = section.course_id
where section.semester = 'fall' and section.year = 2009
group by section.course_id, section.sec_id



select max(enrollment) from (select count(id) as enrollment from 
section natural join takes where semester = 'fall' and year = 2009
group by course_id, sec_id)


select ID, salary + salary * 1.10 from instructor where dept_name = 'CSE'


select ID from student natural left outer join takes where course_id is null;


select course.course_id, sec_id, building, room_no from course
inner join section on course.course_id = section.course_id 
where course.dept_name = 'CSE' and section.semester = 'fall' and section.year = 2009;



select student.id, student.name from student
inner join takes on student.id = takes.id
inner join section on takes.course_id = section.course_id
where building = '7ABC'


select student.id, student.name from student
inner join takes on student.id = takes.id
inner join section on takes.course_id = section.course_id
where section.room_no= '7A01'



select student.id, student.name from student
inner join takes on student.id = takes.id
inner join section on takes.course_id = section.course_id
inner join teaches on section.course_id = teaches.course_id
inner join instructor on teaches.id = instructor.id where instructor.name = 'Shafiul Alam'



select count(takes.ID) as total_stud from takes 
inner join section on section.course_id = takes.course_id 
inner join course on course.course_id = section.course_id
where title = 'Database'



select sum(salary) from instructor
inner join department on instructor.dept_name = department.dept_name
where department.building = '7ABC' and department.dept_name = 'CSE'



select course.title from course
inner join section on course.course_id = section.course_id and time_slot_id in (select time_slot_id from
time_slot where start_time between '10:00' and '12:00')



select course.title from course
inner join prereq on course.course_id = prereq.course_id
where prereq.prereq_id = 'CSE3103'


select title from course where course_id in (select course_id from prereq 
group by course_id,prereq_id having count(prereq_id) > 2)



select DISTINCT student.id, student.name from student
inner join takes on student.id = takes.id
where takes.grade = 'A-' or takes.grade = 'A' or takes.grade = 'A+'



select count(ID) from student where student.ID IN (select takes.ID from takes where takes.grade ='B')



select distinct student.id, student.name from student
inner join takes on student.id = takes.id
where takes.semester = 'fall' and takes.year = '2009'



select DISTINCT classroom.building from classroom
inner join section on classroom.building = section.building
inner join course on course.course_id = section.course_id
where course.title = 'MACS'


select classroom.building, classroom.room_no from classroom
inner join section on classroom.building = section.building
where section.semester = 'fall' and section.year = '2009';
