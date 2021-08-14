# Write your MySQL query statement below

select activity
from Friends
group by activity
having count(*) > (select min(counts) 
                  from (select activity, count(id) as counts 
                        from Friends 
                        group by activity)t1)
and count(*) < (select max(counts) 
                  from (select activity, count(id) as counts 
                        from Friends 
                        group by activity)t2)
