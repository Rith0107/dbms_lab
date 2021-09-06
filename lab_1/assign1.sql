--* show databases

-- +--------------------+
-- | Database           |
-- +--------------------+
-- | information_schema |
-- | labwork            |
-- | mysql              |
-- | performance_schema |
-- | sys                |
-- +--------------------+

--* create <database> 
create database university_profile;

--* use <database>
use university_profile;

--* creating a table Student
create table Student(name varchar(20),rollno integer unique,age integer,math integer,sci integer,eng integer,social integer,sports integer);

--* insert into table Student
insert Student(name,rollno,age,math,sci,eng,social,sports) values("dwayne",33,21,98,94,91,96,55);
insert Student(name,rollno,age,math,sci,eng,social,sports) values("john",58,18,70,87,77,98,67);
insert Student(name,rollno,age,math,sci,eng,social,sports) values("dave",27,22,54,68,98,96,77);
insert Student(name,rollno,age,math,sci,eng,social,sports) values("randy",56,19,69,75,65,67,98);
insert Student(name,rollno,age,math,sci,eng,social,sports) values("kane",11,22,86,95,52,57,73);
insert Student(name,rollno,age,math,sci,eng,social,sports) values("tom",50,21,76,84,62,74,81);

--* query from the table Student
select * from Student;

-- +--------+--------+------+------+------+------+--------+--------+
-- | name   | rollno | age  | math | sci  | eng  | social | sports |
-- +--------+--------+------+------+------+------+--------+--------+
-- | dwayne |     33 |   21 |   98 |   94 |   91 |     96 |     55 |
-- | john   |     58 |   18 |   70 |   87 |   77 |     98 |     67 |
-- | dave   |     27 |   22 |   54 |   68 |   98 |     96 |     77 |
-- | randy  |     56 |   19 |   69 |   75 |   65 |     67 |     98 |
-- | kane   |     11 |   22 |   86 |   95 |   52 |     57 |     73 |
-- | tom    |     50 |   21 |   76 |   84 |   62 |     74 |     81 |
-- +--------+--------+------+------+------+------+--------+--------+

--* creating a table Campus
create table Campus(name varchar(20),cid integer unique,loc varchar(20),cap integer,law boolean,engg boolean,buss boolean);

--* insert into table Campus
insert Campus(name,cid,loc,cap,law,engg,buss) values("mec",101,"hyd",1000,true,true,true);
insert Campus(name,cid,loc,cap,law,engg,buss) values("muc",104,"mad",2000,false,true,true);
insert Campus(name,cid,loc,cap,law,engg,buss) values("mgt",107,"bom",1500,true,false,true);

--* query from the table Campus
select * from Campus;

-- +------+------+------+------+------+------+------+
-- | name | cid  | loc  | cap  | law  | engg | buss |
-- +------+------+------+------+------+------+------+
-- | mec  |  101 | hyd  | 1000 |    1 |    1 |    1 |
-- | muc  |  104 | mad  | 2000 |    0 |    1 |    1 |
-- | mgt  |  107 | bom  | 1500 |    1 |    0 |    1 |
-- +------+------+------+------+------+------+------+

-- Queries:

--1. Management wants to know the cid of colleges in the uni that can support law.
select cid from Campus where law = true;

--2. Faculty wanted to inspect all the details of Dave excluding english and social.
select name,rollno,age,math,sci,sports from Student where name = "dave";

--3. Management wants to know the name and roll no of students who have qualified for scholarship.Qualification parameter : math OR sci above 80
select name,rollno from Student where math>80 or sci>80;

--4. A teacher for social wants to know what are the distinct marks she gave her students.
select distinct social from Student;

--5. The english prof wishes to find the number of students failing in his class. Students below 70 fail. Count manually or pro tip : google count in sql. Both will be graded equally just trying to pique your curiosity.
select count(eng) from Student where eng<70;

--6. The stem field wants to find the best qualified student to be head of their club as per marks. List the students name and rollno. (stem is sci and math in this case)
select name,rollno from student where (math+sci)=(select max(math+sci) from student);

--7. The Dept. of stem wants to know the college location of the university that does not provide engineering.
select loc from Campus where engg = false; 

--8. What is the ratio of students in the campus that provides stem and does not provide stem (query and show Both will be graded equally just trying to pique your curiosity)
select sum(case when engg=true then cap else 0 end)/sum(case when engg=false then cap else 0 end) as engg_nonengg_ratio from campus;

--9. For all rounder find students who have score above 70 in all subj.
select name from Student where math>70 and sci>70 and eng>70 and social>70 and sports>70;

--10. Find the count of students in each group if I split the students as per every 20 roll numbers in one group.Note you can run multiple queries and count individually for this one or see if you can google a faster way with sql itself. Both will be graded equally just trying to pique your curiosity
select
case
 when rollno>0 and rollno<=20
 then '1-20'
 when rollno>20 and rollno<=40
 then '21-40'
 when rollno>40 and rollno<=60
 then '41-60'  
 else 'out_of_range' end as `Range`,
 count(1) as `Count`
 from student
 group by `Range`;
