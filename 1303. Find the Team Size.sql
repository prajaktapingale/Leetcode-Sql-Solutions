# Write your MySQL query statement below
select employee_id,
count(team_id) over (partition by team_id) as team_size
from employee
order by employee_id
