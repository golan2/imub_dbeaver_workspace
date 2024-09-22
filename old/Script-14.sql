

with stats as (
select ROUND(add_constant_gain,5) as gain_3, count(*) _count
from ts_b3bcd37080ca44d1996d8f77250c4be9_pairs_calc
where dependent_variable='diesel_correct' and independent_variable='first_stage_wabt_5_6_avg'
group by ROUND(add_constant_gain,5)
having count(*) > 500
)
select * from stats order by _count desc

select * from models where model_id ='b3bcd370-80ca-44d1-996d-8f77250c4be9'




select dependent_variable, independent_variable, ROUND(add_constant_gain,5) as gain_3, count(*) _count
from ts_b3bcd37080ca44d1996d8f77250c4be9_pairs_calc
group by dependent_variable, independent_variable, ROUND(add_constant_gain,5)
having count(*) > 10000
limit 4

where dependent_variable='diesel_correct' and independent_variable='first_stage_wabt_5_6_avg'
