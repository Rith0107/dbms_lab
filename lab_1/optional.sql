--OPTIONAL QUERIES:

--11. Class teacher wants to find the student name and rollno with the maximum avg in all subjects. ( google sum or avg)
select name,rollno from student where ((math+sci+eng+social+sports)/5)=(select max((math+sci+eng+social+sports)/5) from student);

--12. An inquisitive student wants to find out the names of students whose names have the letter ‘a’ in the second position of their name
select name from student where name like '_a%';

--13. A math faculty wants to focus on the weak students first so he wants to see the names and marks of the students in asc order of marks
select name,math from student ORDER BY math ASC;
