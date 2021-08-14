# Write your MySQL query statement below

select s.id, s.name 
from students s 
where s.department_id not in (select id from departments)
