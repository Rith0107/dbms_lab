-- ALTER AND UPDATING TABLES:

-- 1. Design a table marks_sem1.
-- a. It must contain all marks as seen in the student table.
-- b. One way to go about this is to create a copy of the student table and drop columns.
-- c. Make roll number the primary key

create table marks_sem1(rollno integer primary key,math integer,sci integer,eng integer,social integer, sports integer);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (7,78,99,45,56,88);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (11,86,95,52,57,73);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (21,42,73,59,63,65);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (27,54,68,98,96,77);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (33,98,94,91,96,55);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (34,84,93,79,94,85);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (46,98,97,84,87,72);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (50,76,84,62,74,81);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (52,83,86,89,91,99);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (56,69,75,65,67,98);
insert marks_sem1(rollno,math,sci,eng,social,sports) values (58,70,87,77,98,67);
select * from marks_sem1;
describe marks_sem1;

-- 2. Design a table faculty
-- a. Add columns and rows with given constraints

create table faculty(name varchar(20),fid char(4) primary key,subject varchar(20));
insert faculty(name,fid,subject) values ("kakashi",4003,"math");
insert faculty(name,fid,subject) values ("guy",5002,"sports");
insert faculty(name,fid,subject) values ("kurenai",5038,"eng");
 select * from faculty;
describe faculty;

-- 3. Design a table sem1
-- a. Add columns and rows with given constraints
-- b. Note - if the “mul” doesn't show up with you run “describe sem1;” then add a few rows and then alter the table

create table sem1(subj_id char(4) primary key,subject varchar(20),fid char(4),cap integer,campus integer);
insert sem1(subj_id,subject,fid,cap,campus) values(101,"math",4003,60,101);
insert sem1(subj_id,subject,fid,cap,campus) values(102,"sports",5002,70,101);
insert sem1(subj_id,subject,fid,cap,campus) values(105,"eng",5038,60,104);
alter table sem1 add foreign key(fid) references faculty(fid);
alter table sem1 add foreign key(campus) references campus(cid);
describe sem1;

-- 4. Update campus table
-- a. Make cid primary key

alter table campus add primary key (cid);

-- 5. Update student table
-- a. Drop not required columns (as shown below)
-- b. Add fk to rollno to sem1 rollno
-- c. Add cid
-- d. Add fk to cid to campus cid

alter table student drop math,drop sci,drop eng,drop social,drop sports;
update student 
    set cid= case rollno
    when 33 then 109
    when 58 then 101
    when 27 then 110
    when 56 then 104
    when 11 then 104
    when 50 then 101
    when 7 then 113
    when 21 then 107
    when 52 then 109
    when 34 then 109 
    when 46 then 110
    end;
alter table student add foreign key(rollno) references marks_sem1(rollno);
alter table student add foreign key(cid) references campus(cid);
alter table student alter dob set default "2001-01-01";
alter table student alter yjoin set default 2019;
alter table student alter gender set default "M";
alter table student alter team set default "R";
describe student;
