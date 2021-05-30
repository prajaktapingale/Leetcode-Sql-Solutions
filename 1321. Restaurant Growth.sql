/* Write your T-SQL query statement below */

select visited_on, 
sum(sum(amount)) over (order by visited_on rows between 6 preceding and current row) as 'amount',
round(cast(sum(sum(amount)) over (order by visited_on rows between 6 preceding and current row) AS float)/7.0 ,2) as 'average_amount' 
from customer 
group by visited_on
order by visited_on
offset 6 rows
