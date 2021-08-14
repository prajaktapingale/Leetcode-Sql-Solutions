# Write your MySQL query statement below

select name as results
from
(select u.name
from Movie_rating mr inner join Users u
on mr.user_id=u.user_id
group by mr.user_id
order by count(mr.rating) desc, name
limit 1) t1
union
select title as results
from
(select title
from Movie_rating mr inner join Movies m
on mr.movie_id=m.movie_id
where month(created_at)=02 and year(created_at)=2020
group by mr.movie_id
order by avg(rating) desc, title
limit 1) t2
