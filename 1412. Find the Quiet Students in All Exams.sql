# Write your MySQL query statement below

with t1 as
(select exam_id, student_id, score,
dense_rank() over (partition by exam_id order by score) as mn,
dense_rank() over (partition by exam_id order by score desc) as mx
from exam)

select distinct t1.student_id, student_name
from t1 inner join student s
on t1.student_id=s.student_id
where t1.student_id not in (select student_id from t1 where mn=1 or mx=1)
