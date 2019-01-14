select * 
from survey
limit 10;


select question, count(question) as responses
from survey
group by 1;


select *
from quiz
limit 5;

select *
from home_try_on
limit 5;

select *
from purchase
limit 5;


with funnel as(select q.user_id,
 case 
 when h.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_home_try_on,
 h.number_of_pairs,
 case 
 when p.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_purchase
 from quiz as 'q'
 left join home_try_on as 'h'
 on q.user_id = h.user_id
 left join purchase as 'p'
 on h.user_id = p.user_id)
select *
from funnel
limit 10;


with funnel as(select q.user_id,
 case 
 when h.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_home_try_on,
 h.number_of_pairs,
 case 
 when p.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_purchase
 from quiz as q
 left join home_try_on as h
 on q.user_id = h.user_id
 left join purchase as p
 on h.user_id = p.user_id)
select is_home_try_on, is_purchase, count(is_home_try_on) as number
from funnel
group by 1, 2;


with funnel as(select q.user_id,
 case 
 when h.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_home_try_on,
 h.number_of_pairs,
 case 
 when p.user_id not null then 'TRUE'
 else 'FALSE'
 end as is_purchase
 from quiz as q
 left join home_try_on as h
 on q.user_id = h.user_id
 left join purchase as p
 on h.user_id = p.user_id)
select is_purchase, number_of_pairs, count(is_purchase) as number
from funnel
where number_of_pairs not null
group by 1, 2;


select style, count(style) as number
from quiz
group by 1;


select product_id, count(product_id) as number
from purchase
group by 1;


select model_name, color, count(*) as number
from purchase
group by 1, 2;


select model_name, count(*) as number
from purchase
group by 1;


select shape, count(*) as number
from quiz
group by 1;


select price, count(*) as cost
from purchase
group by 1;


select fit, count(*) as number
from quiz
group by 1;


select question, response, count(*) as number
from survey
group by 1, 2;

