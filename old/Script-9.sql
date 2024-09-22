select * from models where model_id = '0f83d974-cf5e-4b66-8823-109d0aba612d'

select * from model_statistics ms where model_id = '0f83d974-cf5e-4b66-8823-109d0aba612d'

select count(*) from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc where add_constant_gain='-infinity'

select independent_variable , dependent_variable, count()* 
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where add_constant_gain='-infinity'
group by independent_variable , dependent_variable

select *
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where add_constant_gain='-infinity' and independent_variable != 'i_16ti0827' and dependent_variable != 'i_16fi022'
limit 30


select episode_start, episode_end , add_constant_gain 
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where independent_variable = 'i_16ti0827' and dependent_variable = 'i_16fi022'
limit 10

2022-03-15 10:48:00.000 +0000
2022-03-16 06:40:00.000 +0000

  "i_16ti0827": "col1",


select * from ts_0f83d974cf5e4b668823109d0aba612d 
where timestamp >= limit 5



