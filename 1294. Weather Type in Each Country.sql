# Write your MySQL query statement below
select country_name, case
when avg_weather<=15 then 'Cold'
when avg_weather>=25 then 'Hot'
else 'Warm'
end as weather_type
from
(select w.country_id, c.country_name, avg(w.weather_state) as avg_weather
from weather w left join countries c
    on w.country_id=c.country_id
where month(w.day) = 11
group by w.country_id) t1
