# Write your MySQL query statement below
with all_subjects as(
select student_id,student_name,subject_name from Students,Subjects)
select a.student_id,a.student_name,a.subject_name,count(e.student_id) as attended_exams from all_subjects a left join Examinations e on a.student_id=e.student_id and a.subject_name=e.subject_name group by a.student_id,a.student_name,a.subject_name order by a.student_id,a.subject_name


