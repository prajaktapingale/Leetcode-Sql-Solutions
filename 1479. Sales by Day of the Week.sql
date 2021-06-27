# Write your MySQL query statement below
select i.item_category as Category, 
sum(case when dayname(order_date)='Monday' then quantity else 0 end) as 'Monday',
sum(case when dayname(order_date)='Tuesday' then quantity else 0 end) as 'Tuesday',
sum(case when dayname(order_date)='Wednesday' then quantity else 0 end) as 'Wednesday',
sum(case when dayname(order_date)='Thursday' then quantity else 0 end) as 'Thursday',
sum(case when dayname(order_date)='Friday' then quantity else 0 end) as 'Friday',
sum(case when dayname(order_date)='Saturday' then quantity else 0 end) as 'Saturday',
sum(case when dayname(order_date)='Sunday' then quantity else 0 end) as 'Sunday'
from Orders o right join Items i
on o.item_id=i.item_id
group by i.item_category
order by i.item_category
