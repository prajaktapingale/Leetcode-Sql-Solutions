select min(log_id) as start_id, max(log_id) as end_id
from
(select log_id, row_number() over (order by log_id) as row_no
from logs) t1
group by log_id - row_no
