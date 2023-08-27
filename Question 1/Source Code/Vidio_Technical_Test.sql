create database vidio_technical_test;
use vidio_technical_test;

# Question 1

# Create student table
create table student(
student_id int,
student_name varchar(50),
age int
);

# Create classroom table
create table classroom(
classroom_id int,
student_id int
);

# Insert value for the tables
insert into student(student_id, student_name, age)
values (1, 'john', 15),(2, 'marqueez', 16),(3, 'chip', 14),(4, 'marley', 14);

insert into classroom(classroom_id, student_id)
values (123, 1),(234, 2),(123, 4);

# 1a) Find out what classroom that has no students on those table using SQL
select * from student left join classroom on student.student_id = classroom.student_id where(classroom_id is null);

# 1b) Could you display what classroom_id that each student has ? use SQL
select classroom_id, count(distinct student_id) as total_students from classroom group by classroom_id;

# 1c) Create a group for students that have age > 15 is called “high school” and age < 16 called “middle school”, and count how many students that belong to that group.
select * from student;
select student_name, age, if(age > 15, 'high school', 'middle school') as student_grouping from student;
select if(age > 15, 'high school', 'middle school') as student_grouping, count(age) as total_students from student group by student_grouping;

# 1d) Create SQL that give output that marqueez is the oldest student
select * from student where age in (select max(age) from student);

# 1e) Find out the cumulative age from the students table for each student record, like the table below.
set @cummulative_age := 0;
select student_id, student_name, age, (@cummulative_age := @cummulative_age + age) as cummulative_age from student order by cummulative_age;

# End of Question 1