-- QUERIES:

-- 1. Suppose we are having a vaccination drive and someone suggests we give the vaccines as per age.
-- We want to vaccinate the eldest student first and youngest last with nobody under 18( as there
-- might be people under 18). Make a list containing name, rno and age in descending order of age.
select name,rollno,year(curdate()) - year(dob) as age from student where (year(curdate()) - year(dob))>=18 order by age desc;

-- 2. Suppose the college was holding an event for sports for the students, one of the sports sections
-- has a minimum age of 20 years for participating. Now give a count of women and men separately
-- that qualify for this event from the students table. 
select count(*) as male_count from student where gender = "M" and year(curdate())-year(dob)>=20;
select count(*) as female_count from student where gender = "F" and year(curdate())-year(dob)>=20;

-- 3. Display number of students whose maths score is more than the class avg score in all subjects.
select count(*) as math_greaterthan_avg from student where math>(select avg((math+sci+eng+social+sports)/5) from student);

-- 4. Suppose the university expansion team was looking at how they should expand further and in
-- what areas of the country. As of now they currently need the ratio of campus capacity that is in
-- the south to the west zone of the country. 
select sum(case when pincode>=500000 and pincode<700000 then cap else 0 end)/sum(case when pincode>=300000 and pincode<500000 then cap else 0 end) as south_west_ratio from campus;

-- 5. This year the college has decided to not only award the student who came first in the college(from
-- any batch/joining yrs) but also the student who has come second. Find the student who has the
-- second highest avg in the table.
select name,((math+sci+eng+social+sports)/5) as average from student order by average desc limit 1,1;

-- 6. Display student’s name, rno, avg marks (“avg_marks”), score status (“score_status”) where score
-- status is “High” if above average and “Low” if below average. 
select name, rollno,(math+sci+eng+social+sports)/5 as avg_marks ,if(((math+sci+eng+social+sports)/5)>(select avg((math+sci+eng+social+sports)/5)  from student),"High","Low") as score_status from student;

