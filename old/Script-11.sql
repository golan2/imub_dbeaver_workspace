

select  independent_variable, dependent_variable from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc limit 100



select count(*) 
from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc 
where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
and add_constant_gain >= 0.3 and add_constant_gain <= 0.78915










-- ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
-- 3     episodes:    and add_constant_gain >= 0.780600 and add_constant_gain <= 0.780703
-- 7000  episodes:    and add_constant_gain >= 0.7 and add_constant_gain <= 0.9
-- 15001 episodes:    and add_constant_gain >= 0.5 and add_constant_gain <= 0.794
-- 30000 episodes:    and add_constant_gain >= 0.3 and add_constant_gain <= 0.78915


select count(*) 
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
and add_constant_gain >= 0.3 and add_constant_gain <= 0.78915




explain analyze
select * from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='tc670146_pv' and dependent_variable='fc670007_am_op'
and episode_end in (
		select episode_end 
		from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
		where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
		and add_constant_gain >= 0.5 and add_constant_gain <= 0.794
		)
