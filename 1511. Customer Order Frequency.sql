# Write your MySQL query statement below

select o.customer_id, name
from orders o 
left join customers c
on o.customer_id=c.customer_id
left join product p
on o.product_id=p.product_id
group by o.customer_id, name
having sum(if(left(order_date,7) = '2020-06',quantity,0) * price)>=100
and sum(if(left(order_date,7) = '2020-07',quantity,0) * price)>=100
