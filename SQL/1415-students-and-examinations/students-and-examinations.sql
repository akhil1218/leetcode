# Write your MySQL query statement below
with student_subjects as(
select s.student_id,s.student_name,e.subject_name,count(s.student_id) as attended_exams from Students s join Examinations e on s.student_id=e.student_id group by 1,2,3),
all_students as(
select student_id,student_name,subject_name from Students,Subjects)
select p.student_id,p.student_name,p.subject_name,coalesce(attended_exams,0) as attended_exams from all_students  p left join student_subjects q on p.student_id=q.student_id and p.subject_name=q.subject_name order by 1,3



