select * 
from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc t
where t.dependent_variable='fc3401' and t.independent_variable='ti8916'
limit 2


WITH data_0 AS (
		select episode_end 
		from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc
		where independent_variable='ti8910' and dependent_variable='fc3400' 
		and add_constant_gain >= 0.0051584244 and add_constant_gain <= 1.2172232
	)
	SELECT ts.independent_variable, ts.dependent_variable, array_remove(array_agg(ts.episode_end), NULL)
	from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc ts join data_0 
	on ts.episode_end = data_0.episode_end
	group by ts.independent_variable, ts.dependent_variable
    limit 1
    
    
    
select min(add_constant_gain)
from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc
where independent_variable='total_feed' and dependent_variable='fc3401' 

select * from model_statistics ms where model_id='9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b' and type='all_gain_histograms'

commit