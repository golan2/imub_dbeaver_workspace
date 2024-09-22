--
-- c2cf325e-58e2-4078-ab90-408868a0530d   ==> 15 pairs
-- 
-- where independent_variable='ti8916' and dependent_variable='lab_diesel_temp90_utc_unbiased'
-- 
-- ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
-- 1     episodes:    and add_constant_gain >= 0.3 and add_constant_gain <= 0.32
-- 7003  episodes:    and add_constant_gain >= 0.7 and add_constant_gain <= 0.74985
-- 15002 episodes:    and add_constant_gain >= 0.7 and add_constant_gain <= 0.841197b
-- 30020 episodes:    and add_constant_gain >= 0.2 and add_constant_gain <= 0.514685
-- 80001 episodes:    and add_constant_gain >= 0.2 and add_constant_gain <= 0.69925
--
--
--
--
-- e2d113e0-c558-4b40-b255-c688f8a4d349   ==> 90 pairs
--
-- where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op'
-- 
-- ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
-- 3     episodes:    and add_constant_gain >= 0.780600 and add_constant_gain <= 0.780703
-- 7000  episodes:    and add_constant_gain >= 0.7 and add_constant_gain <= 0.9
-- 15001 episodes:    and add_constant_gain >= 0.5 and add_constant_gain <= 0.794
-- 30000 episodes:    and add_constant_gain >= 0.3 and add_constant_gain <= 0.78915
--
--



select count(*) from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc


--  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

select * from settings




select * from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc


select count(*) 
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
and add_constant_gain >= 0.2 and add_constant_gain <= 0.69925

explain analyze
WITH data_0 AS (
		select episode_end 
		from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
		where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
		and add_constant_gain >= 0 and add_constant_gain <= 1
	)
	SELECT ts.independent_variable, ts.dependent_variable, array_remove(array_agg(ts.episode_end), NULL)
	from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc ts join data_0 
	on ts.episode_end = data_0.episode_end
	group by ts.independent_variable, ts.dependent_variable

	
	
--  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
	
	
select episode_end from ts_c2cf325e58e24078ab90408868a0530d_episodes
where lab_diesel_temp90_utc_unbiased_error >= 0.47
and lab_diesel_temp90_utc_unbiased_error <= 0.48
	                                           
	
SELECT date_trunc('day', episode_end - interval '5 minutes') AS timestamp, count(*) AS count
FROM ts_c2cf325e58e24078ab90408868a0530d_episodes
WHERE lab_diesel_temp90_utc_unbiased_error >= 0.47
AND lab_diesel_temp90_utc_unbiased_error <= 0.48
GROUP BY timestamp
ORDER BY timestamp;

--  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	
	
	
select count(*) from ts_e2d113e0c5584b40b255c688f8a4d349_episodes
	
	
	
	
	
	
	
select add_constant_gain, episode_start ,episode_end from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable ='ti8916'
and dependent_variable = 'lab_diesel_temp90_utc_unbiased'
and add_constant_gain  >= 0.4858092963695526
and add_constant_gain <= 0.4858092963695526
order by episode_start

select add_constant_gain ,episode_start, episode_end from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable ='ti8916'
and dependent_variable = 'lab_diesel_temp90_utc_unbiased'
and episode_end  >= '2021-05-04 00:00:00.000 +0000'
and episode_end  < '2021-05-06 00:0:00.000 +0000'
and add_constant_gain  >= 0.47
and add_constant_gain <= 0.48
order by episode_start

		



SELECT
  indexname AS index_name,
  indexdef AS index_definition,
  tablename AS table_name
FROM pg_catalog.pg_indexes
WHERE tablename = 'ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc';



ALTER TABLE public.ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
ADD COLUMN bin integer;

UPDATE public.ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
SET bin = floor(random() * 50) + 1;

explain analyze

explain analyze
WITH data_0 AS (
		select episode_end 
		from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
		where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
		and add_constant_gain >= 0 and add_constant_gain <= 1
	)
select independent_variable, dependent_variable, bin, count(*)
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc ts join data_0 
on ts.episode_end = data_0.episode_end
group by independent_variable, dependent_variable, bin

select distinct independent_variable, dependent_variable from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc


select independent_variable, dependent_variable, bin, count(*)
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc ts 
group by independent_variable, dependent_variable, bin

