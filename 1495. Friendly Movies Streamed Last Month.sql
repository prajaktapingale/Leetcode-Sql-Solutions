# Write your MySQL query statement below

select distinct title
from TVProgram t inner join Content c
on t.content_id=c.content_id
where content_type='Movies' 
and Kids_content='Y' 
and month(program_date)=06 
and year(program_date)=2020
