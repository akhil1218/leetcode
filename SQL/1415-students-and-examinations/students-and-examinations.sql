# Write your MySQL query statement below
with all_students as(
select student_id,student_name,subject_name from Students,Subjects)
select s.student_id,s.student_name,s.subject_name,count(e.subject_name) as attended_exams from all_students s left join Examinations e on s.student_id=e.student_id and s.subject_name=e.subject_name group by s.student_id,s.student_name,s.subject_name order by student_id,subject_name

