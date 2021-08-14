# Write your MySQL query statement below

select ifnull(unique_id, null) as unique_id, name
from Employees e left join EmployeeUNI eu
on e.id=eu.id
