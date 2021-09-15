--* show databases

--* use <database>
use university_profile;

--* altering table Student 
alter table Student add dob date after rollno;
alter table Student add yjoin integer after dob;
alter table student add gender char after yjoin;
alter table student add team char after gender;
alter table student drop column age;

--* updating the table Student
update student set dob = "2000-01-09", yjoin = 2019, gender = "M", team = "R" where name= "dwayne";
update student set dob = "2002-03-21", yjoin = 2019, gender = "M", team = "W" where name= "john";
update student set dob = "1999-09-11", yjoin = 2018, gender = "M", team = "A" where name="dave";
update student set dob = "2001-04-28", yjoin = 2019, gender = "M", team = "R" where name="randy";
update student set dob = "1999-02-13", yjoin = 2018, gender = "M", team = "G" where name="kane";
update student set dob = "2000-11-01", yjoin = 2019, gender = "M", team = "W" where name="tom";
insert into student (name,rollno,dob,yjoin,gender,team,math,sci,eng,social,sports) values ("carol",7,"2000-06-19",2018,"F","W",78,99,45,56,88);
insert into student (name,rollno,dob,yjoin,gender,team,math,sci,eng,social,sports) values ("wanda",21,"2001-08-10",2019,"F","R",42,73,59,63,65);
insert into student (name,rollno,dob,yjoin,gender,team,math,sci,eng,social,sports) values ("natasha",52,"2001-06-19",2019,"F","A",83,86,89,91,99);
insert into student (name,rollno,dob,yjoin,gender,team,math,sci,eng,social,sports) values ("gamora",34,"2001-06-19",2018,"F","G",84,93,79,94,85);
insert into student (name,rollno,dob,yjoin,gender,team,math,sci,eng,social,sports) values ("jean",46,"2000-06-19",2019,"F","G",98,97,84,87,72);

--* query from the table Student
select * from Student;

-- +---------+--------+------------+-------+--------+------+------+------+------+--------+--------+
-- | name    | rollno | dob        | yjoin | gender | team | math | sci  | eng  | social | sports |
-- +---------+--------+------------+-------+--------+------+------+------+------+--------+--------+
-- | dwayne  |     33 | 2000-01-09 |  2019 | M      | R    |   98 |   94 |   91 |     96 |     55 |
-- | john    |     58 | 2002-03-21 |  2019 | M      | W    |   70 |   87 |   77 |     98 |     67 |
-- | dave    |     27 | 1999-09-11 |  2018 | M      | A    |   54 |   68 |   98 |     96 |     77 |
-- | randy   |     56 | 2001-04-28 |  2019 | M      | R    |   69 |   75 |   65 |     67 |     98 |
-- | kane    |     11 | 1999-02-13 |  2018 | M      | G    |   86 |   95 |   52 |     57 |     73 |
-- | tom     |     50 | 2000-11-01 |  2019 | M      | W    |   76 |   84 |   62 |     74 |     81 |
-- | carol   |      7 | 2000-06-19 |  2018 | F      | W    |   78 |   99 |   45 |     56 |     88 |
-- | wanda   |     21 | 2001-08-10 |  2019 | F      | R    |   42 |   73 |   59 |     63 |     65 |
-- | natasha |     52 | 2001-06-19 |  2019 | F      | A    |   83 |   86 |   89 |     91 |     99 |
-- | gamora  |     34 | 2001-06-19 |  2018 | F      | G    |   84 |   93 |   79 |     94 |     85 |
-- | jean    |     46 | 2000-06-19 |  2019 | F      | G    |   98 |   97 |   84 |     87 |     72 |
-- +---------+--------+------------+-------+--------+------+------+------+------+--------+--------+

--* altering table Campus
alter table campus add pincode integer after loc;

--* updating the table Campus
update campus set pincode = 500043 where name = "mec";
update campus set pincode = 600012 where name = "muc";
update campus set pincode = 400076 where name = "mgt";
insert into campus(name,cid,loc,pincode,cap,law,engg,buss) values("mdc",106,"pun",411021,1700,false,true,true);
insert into campus(name,cid,loc,pincode,cap,law,engg,buss) values("mdd",109,"del",110001,1400,true,true,false);
insert into campus(name,cid,loc,pincode,cap,law,engg,buss) values("mvc",110,"vel",631001,1400,true,true,true);
insert into campus(name,cid,loc,pincode,cap,law,engg,buss) values("mbd",113,"bgl",560002,800,false,true,true);

--* query from the table Campus
select * from Campus;

-- +------+------+------+---------+------+------+------+------+
-- | name | cid  | loc  | pincode | cap  | law  | engg | buss |
-- +------+------+------+---------+------+------+------+------+
-- | mec  |  101 | hyd  |  500043 | 1000 |    1 |    1 |    1 |
-- | muc  |  104 | mad  |  600012 | 2000 |    0 |    1 |    1 |
-- | mgt  |  107 | bom  |  400076 | 1500 |    1 |    0 |    1 |
-- | mdc  |  106 | pun  |  411021 | 1700 |    0 |    1 |    1 |
-- | mdd  |  109 | del  |  110001 | 1400 |    1 |    1 |    0 |
-- | mvc  |  110 | vel  |  631001 | 1400 |    1 |    1 |    1 |
-- | mbd  |  113 | bgl  |  560002 |  800 |    0 |    1 |    1 |
-- +------+------+------+---------+------+------+------+------+
