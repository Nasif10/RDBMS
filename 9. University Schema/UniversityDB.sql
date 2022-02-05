CREATE DATABASE UniversityDB

USE UniversityDB


CREATE TABLE classroom (
  building varchar(20) NOT NULL,
  room_no varchar(7) NOT NULL,
  capacity int DEFAULT NULL,
  PRIMARY KEY (building,room_no)
)

INSERT INTO classroom VALUES ('1ABC','7A05',50),
                             ('2ABC','7A06',60),
							 ('3ABC','7B01',30),
							 ('4ABC','7B07',40),
							 ('5ABC','7B01',30),
							 ('6ABC','7B07',40),
							 ('7ABC','7A01',50),
							 ('7ABC','7A02',50),
							 ('7ABC','7B01',50),
							 ('7ABC','7B02',50);
							 

CREATE TABLE department (
  dept_name varchar(20) NOT NULL PRIMARY KEY,
  building varchar(20) NOT NULL,
  budget int DEFAULT NULL
)


INSERT INTO department VALUES ('CSE','7ABC', 90000),
                              ('ME','1ABC', 100000),
							  ('EEE','4ABC', 85000),
							  ('CE','2ABC', 120000),
							  ('TE','5ABC', 50000),
							  ('ARTS','3ABC', 80000),
							  ('IPE','6ABC', 70000);
							  
							  
							  
							  
CREATE TABLE course (
  course_id varchar(7) NOT NULL PRIMARY KEY,
  title varchar(50) DEFAULT NULL,
  dept_name varchar(20) DEFAULT NULL,
  credit decimal(3,2) CHECK (credit > 0),
  CONSTRAINT fk_course_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name)
)

INSERT INTO course VALUES ('CSE3100', 'Software Development-IV', 'CSE', 0.75),
                          ('CSE3101', 'MACS', 'CSE', 3.00),
                          ('CSE3103', 'Database', 'CSE', 3.00),
                          ('CSE3104', 'Database Lab', 'CSE', 1.50),
						  ('CSE3107', 'Microprocessor', 'CSE', 3.00),
						  ('CSE3108', 'Microprocessor Lab', 'CSE', 0.75),
                          ('CSE3109', 'Digital System Design', 'CSE', 3.00),
						  ('CSE3110', 'Digital System Design Lab', 'CSE', 0.75),                                                 
						  ('HUM3115', 'Economics and Accounting', 'ARTS', 3.00);							  



CREATE TABLE instructor (
  ID varchar(12) NOT NULL PRIMARY KEY,
  name varchar(50) DEFAULT NULL,
  dept_name varchar(20) DEFAULT NULL,
  salary int DEFAULT NULL,

  CONSTRAINT fk_instructor_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name)
)


INSERT INTO instructor VALUES ('001','Shafiul Alam', 'CSE', 200000),
                              ('002','Nazmus Sakib','CSE', 150000),
                              ('003','Farzad Ahmed','CSE', 100000),
							  ('004','Mohsena Ashraf','CSE', 80000),
							  ('005','Tanzilur Rahman','CSE', 40000),
							  ('006','Al Hasib','EEE', 100000),
							  ('007','Fahim Ahmed','EEE', 80000),
							  ('008','Sagar','ARTS', 40000);
							  
							  

CREATE TABLE student (
  ID varchar(20) NOT NULL PRIMARY KEY,
  name varchar(50) DEFAULT NULL,
  dept_name varchar(20) NOT NULL,
  tot_cred int DEFAULT NULL,

  CONSTRAINT fk_student_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name)
) 


INSERT INTO student VALUES ('180104001','Nasif','CSE',160),
                           ('180104002','Aasif','CSE',150),
						   ('180104003','Tasif','CSE',150),
						   ('180105001','Naim','EEE',170),
						   ('180105002','Zayed','EEE',170);



CREATE TABLE advisor (
  s_id varchar(20) NOT NULL PRIMARY KEY,
  i_id varchar(12) NOT NULL,
  
  CONSTRAINT fk_advisor_1 FOREIGN KEY (s_id) REFERENCES student (ID),
  CONSTRAINT fk_advisor_2 FOREIGN KEY (i_id) REFERENCES instructor (ID)
)

INSERT INTO advisor VALUES ('180104001','001'),
                           ('180104002','001'),
						   ('180104003','002');



CREATE TABLE prereq (
  course_id varchar(7) NOT NULL,
  prereq_id varchar(7) NOT NULL,
  PRIMARY KEY (course_id,prereq_id),
  CONSTRAINT fk_prereq_1 FOREIGN KEY (course_id) REFERENCES course (course_id),
  CONSTRAINT fk_prereq_2 FOREIGN KEY (prereq_id) REFERENCES course (course_id)
)

INSERT INTO prereq VALUES ('CSE3104','CSE3103'),
                          ('CSE3107','CSE3108');



CREATE TABLE time_slot (
  time_slot_id varchar(10) NOT NULL PRIMARY KEY,
  day varchar(3) DEFAULT NULL,
  start_time time DEFAULT NULL,
  end_time time DEFAULT NULL
)

INSERT INTO time_slot VALUES ('S1','SUN','08:00','08:50'),
                             ('S2','SUN','08:50','09:40'),
							 ('S3','SUN','09:40','10:30'),							 
							 ('S4','SUN','10:30','11:20'),
                             ('S5','SUN','11:20','12:10'),
							 ('S6','SUN','12:10','13:00'),							 
							 ('S7','SUN','13:00','13:50'),
                             ('S8','SUN','13:50','14:40'),
							 ('S9','SUN','14:40','15:30'),							 
							 ('S10','SUN','15:30','16:20'),
                             ('S11','SUN','16:20','17:10'),
							 ('S12','SUN','17:10','18:00'),							 
							 ('FS1','SUN','08:00','10:30'),							 
							 ('FS2','SUN','10:30','13:00'),
                             ('FS3','SUN','13:00','15:30'),
							 ('FS4','SUN','15:30','18:00'),												 							 
							 ('S13','MON','08:00','08:50'),
                             ('S14','MON','08:50','09:40'),
							 ('S15','MON','09:40','10:30'),							 
							 ('S16','MON','10:30','11:20'),
                             ('S17','MON','11:20','12:10'),
							 ('S18','MON','12:10','13:00'),							 
							 ('S19','MON','13:00','13:50'),
                             ('S20','MON','13:50','14:40'),
							 ('S21','MON','14:40','15:30'),							 
							 ('S22','MON','15:30','16:20'),
                             ('S23','MON','16:20','17:10'),
							 ('S24','MON','17:10','18:00'),							 
							 ('FS5','MON','08:00','10:30'),
                             ('FS6','MON','10:30','13:00'),
							 ('FS7','MON','13:00','15:30'),							 
							 ('FS8','MON','15:30','18:00'),											 
							 ('S25','TUE','08:00','08:50'),
                             ('S26','TUE','08:50','09:40'),
							 ('S27','TUE','09:40','10:30'),							 
							 ('S28','TUE','10:30','11:20'),
                             ('S29','TUE','11:20','12:10'),
							 ('S30','TUE','12:10','13:00'),							 
							 ('S31','TUE','13:00','13:50'),
                             ('S32','TUE','13:50','14:40'),
							 ('S33','TUE','14:40','15:30'),							 
							 ('S34','TUE','15:30','16:20'),
                             ('S35','TUE','16:20','17:10'),
							 ('S36','TUE','17:10','18:00'),						 
							 ('FS9','TUE','08:00','10:30'),
                             ('FS10','TUE','10:30','13:00'),
							 ('FS11','TUE','13:00','15:30'),							 
							 ('FS12','TUE','15:30','18:00');
							 
							 

CREATE TABLE section (
  course_id  varchar(7) NOT NULL,
  sec_id  varchar(2) NOT NULL,
  semester  varchar(20) NOT NULL,
  year  int NOT NULL,
  building  varchar(20) DEFAULT NULL,
  room_no  varchar(7) NOT NULL,
  time_slot_id  varchar(10) NOT NULL,
  
  PRIMARY KEY (course_id,sec_id,semester,year),
  CONSTRAINT fk_section_1 FOREIGN KEY (building, room_no) REFERENCES classroom (building, room_no),
  CONSTRAINT fk_section_2 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id),
  CONSTRAINT fk_section_3 FOREIGN KEY (course_id) REFERENCES course (course_id)
)


INSERT INTO section VALUES ('CSE3100', 'A', 'fall', 2009, '7ABC', '7B01', 'FS2'),
                           ('CSE3101', 'A', 'fall', 2009, '7ABC', '7A01', 'S1'),
                           ('CSE3103', 'A', 'fall', 2009, '7ABC', '7A01', 'S2'),
						   ('CSE3104', 'A', 'fall', 2009, '7ABC', '7B01', 'FS4'),
						   ('CSE3107', 'A', 'fall', 2009, '7ABC', '7A01', 'S3'),
                           ('CSE3108', 'A', 'fall', 2009, '7ABC', '7B01', 'FS6'),
						   ('CSE3109', 'A', 'fall', 2009, '7ABC', '7A01', 'S7'),
                           ('CSE3110', 'A', 'fall', 2009, '7ABC', '7B01', 'FS5'),
						   ('HUM3115', 'A', 'fall', 2009, '7ABC', '7A01', 'S8'),

                           ('CSE3100', 'B', 'fall', 2009, '7ABC', '7B02', 'FS1'),
                           ('CSE3101', 'B', 'fall', 2009, '7ABC', '7A02', 'S4'),
                           ('CSE3103', 'B', 'fall', 2009, '7ABC', '7A02', 'S5'),
						   ('CSE3104', 'B', 'fall', 2009, '7ABC', '7B02', 'FS3'),
						   ('CSE3107', 'B', 'fall', 2009, '7ABC', '7A02', 'S6'),
                           ('CSE3108', 'B', 'fall', 2009, '7ABC', '7B02', 'FS5'),
						   ('CSE3109', 'B', 'fall', 2009, '7ABC', '7A02', 'S10'),
                           ('CSE3110', 'B', 'fall', 2009, '7ABC', '7B02', 'FS6'),
						   ('HUM3115', 'B', 'fall', 2009, '7ABC', '7A02', 'S11'),
						   
						   ('CSE3100', 'A', 'spring', 2009, '7ABC', '7B01', 'FS2'),
                           ('CSE3101', 'A', 'spring', 2009, '7ABC', '7A01', 'S1'),
                           ('CSE3103', 'A', 'spring', 2009, '7ABC', '7A01', 'S2'),
						   ('CSE3104', 'A', 'spring', 2009, '7ABC', '7B01', 'FS4'),
						   ('CSE3107', 'A', 'spring', 2009, '7ABC', '7A01', 'S3'),
                           ('CSE3108', 'A', 'spring', 2009, '7ABC', '7B01', 'FS6'),
						   ('CSE3109', 'A', 'spring', 2009, '7ABC', '7A01', 'S7'),
                           ('CSE3110', 'A', 'spring', 2009, '7ABC', '7B01', 'FS5');



CREATE TABLE takes (
  ID varchar(20) NOT NULL,
  course_id varchar(7) NOT NULL,
  sec_id varchar(2) NOT NULL,
  semester varchar(20) NOT NULL,
  year int NOT NULL,
  grade varchar(2) DEFAULT NULL,
  PRIMARY KEY (ID, course_id, sec_id, semester, year),
  CONSTRAINT fk_takes_1 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year),
  CONSTRAINT fk_takes_2 FOREIGN KEY (ID) REFERENCES student (ID)
)


INSERT INTO takes VALUES ('180104001','CSE3100','B','fall',2009,'A+'),
                         ('180104001','CSE3101','B','fall',2009,'B+'),
						 ('180104001','CSE3103','B','fall',2009,'A'),
                         ('180104001','CSE3104','B','fall',2009,'A'),
						 ('180104001','CSE3107','B','fall',2009,'A+'),
						 ('180104001','CSE3108','B','fall',2009,'A+'),
                         ('180104001','CSE3109','B','fall',2009,'A'),
						 ('180104001','CSE3110','B','fall',2009,'A'),
                         ('180104001','HUM3115','B','fall',2009,'A+'),					
						 ('180104002','CSE3100','B','fall',2009,'A'),
                         ('180104002','CSE3101','B','fall',2009,'A'),
						 ('180104002','CSE3103','B','fall',2009,'A-'),
						 ('180104002','CSE3104','B','fall',2009,'A'),
                         ('180104002','CSE3107','B','fall',2009,'A'),
						 ('180104002','CSE3108','B','fall',2009,'A-'),
						 ('180104002','CSE3109','B','fall',2009,'A-'),
                         ('180104002','CSE3110','B','fall',2009,'A-');						 
						 


CREATE TABLE teaches (
  ID varchar(12) NOT NULL,
  course_id varchar(7) NOT NULL,
  sec_id varchar(2) NOT NULL,
  semester varchar(20) NOT NULL,
  year int NOT NULL,
  PRIMARY KEY (ID,course_id,sec_id,semester,year),

  CONSTRAINT fk_teaches_1 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year),
  CONSTRAINT fk_teaches_2 FOREIGN KEY (ID) REFERENCES instructor (ID)
)

INSERT INTO teaches VALUES ('001','CSE3101','A','fall',2009),
                           ('002','CSE3103','A','fall',2009),
						   ('002','CSE3104','A','fall',2009),
                           ('003','CSE3107','A','fall',2009),
						   ('003','CSE3108','A','fall',2009),
                           ('004','CSE3109','A','fall',2009),
						   ('004','CSE3110','A','fall',2009),
						   ('005','CSE3100','A','fall',2009),
                           ('008','HUM3115','A','fall',2009),

                           ('001','CSE3101','B','fall',2009),
                           ('002','CSE3103','B','fall',2009),
						   ('002','CSE3104','B','fall',2009),
                           ('003','CSE3107','B','fall',2009),
						   ('003','CSE3108','B','fall',2009),
                           ('004','CSE3109','B','fall',2009),
						   ('004','CSE3110','B','fall',2009),
						   ('005','CSE3100','B','fall',2009),
                           ('008','HUM3115','B','fall',2009),
						   
						   ('001','CSE3101','A','spring',2009),
                           ('002','CSE3103','A','spring',2009),
						   ('002','CSE3104','A','spring',2009),
                           ('003','CSE3107','A','spring',2009),
						   ('003','CSE3108','A','spring',2009),
                           ('004','CSE3109','A','spring',2009),
						   ('004','CSE3110','A','spring',2009),
						   ('005','CSE3100','A','spring',2009);