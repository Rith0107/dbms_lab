-- QUERIES:

-- 1. Recreate the original student table using joins
select * from student cross join marks_sem1 on student.rollno=marks_sem1.rollno;

-- 2. Show only name and sports score from sem1 of all students
select student.name,marks_sem1.sports from student cross join marks_sem1 on student.rollno=marks_sem1.rollno;

-- 3. Show name,math marks, roll no of students who study in a campus offering law.
select student.name,marks_sem1.math,marks_sem1.rollno from student inner join marks_sem1 on student.rollno=marks_sem1.rollno inner join campus on campus.cid=student.cid where campus.law=1;

-- 4. Write left join and right join queries on campus and student table. In the output file simply mention the difference in rows you encountered and what did you see in the extra row for certain columns. Try to understand why that happened.
select * from student left join campus on student.cid=campus.cid;
select * from student right join campus on student.cid=campus.cid;
