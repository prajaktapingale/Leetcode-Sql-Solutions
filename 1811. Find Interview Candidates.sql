# Write your MySQL query statement below

with t1 as
(select contest_id, gold_medal as user_id
from contests
union
select contest_id, silver_medal
from contests
union
select contest_id, bronze_medal
from contests) ,

t2 as
(select gold_medal as user_id
from contests 
group by gold_medal
having count(gold_medal)>=3),

t3 as 
(select a.contest_id, a.user_id
from t1 a, t1 b, t1 c
 where a.contest_id=b.contest_id-1 and b.contest_id=c.contest_id-1
 and a.user_id=b.user_id and a.user_id=c.user_id) 

select distinct name, mail
from users u 
where user_id in (select user_id from t2 union all select user_id from t3)
