
 -- e2d113e0-c558-4b40-b255-c688f8a4d349        -- dlp [90 pairs]

 -- 9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b		-- Mordechai
 
 -- eea93a63-b37c-432d-b6e5-48bdfc275983		-- INF	| old-inf-like-master
 
 -- 0a9e0833-a113-4e3e-9a86-0ebdb1aeb654		-- INF | couldnt_think_of_a_name
 
 -- 440aef1e-b880-4cf6-83f1-8552db69e8a2		-- shap ok 

 -- c2cf325e-58e2-4078-ab90-408868a0530d		-- dlp [15 pairs]

 -- d67ebf13-b1e6-44a6-814e-bb520d4700af		-- INF
 
-- Utils

select * from locks l 

select * from settings s order by id

select * from migrations m 

-- Models
select model_id, status, metadata->>'name' as model_name, metadata->>'unit' as model_unit, metadata->>'customer' as model_unit, metadata, tags_to_columns  from models 
where model_id in ('127f79b2-0d3d-47cc-b0da-5366ca58c679', 'ffdea061-fa26-4589-8b42-f45414351c18', '78ef6526-57ba-4952-bdf7-6ecdf527a467', 'e2d113e0-c558-4b40-b255-c688f8a4d349', 'c2cf325e-58e2-4078-ab90-408868a0530d', '9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b')

-- Model Statistics
select * from model_statistics ms 
where model_id ='ffdea061-fa26-4589-8b42-f45414351c18' --in ('78ef6526-57ba-4952-bdf7-6ecdf527a467', 'e2d113e0-c558-4b40-b255-c688f8a4d349', 'c2cf325e-58e2-4078-ab90-408868a0530d', '9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b')
order by "type", model_id

-- How many pairs?
SELECT COUNT(DISTINCT (independent_variable, dependent_variable)) 
FROM ts_78ef652657ba4952bdf76ecdf527a467_pairs_calc;

-- How many episodes?
select count(*)
FROM ts_ffdea061fa2645898b42f45414351c18_pairs_calc ts
group by ts.independent_variable, ts.dependent_variable
limit 1

-- Pairs
SELECT count(*) FROM "ts_78ef652657ba4952bdf76ecdf527a467_pairs_calc"

-- DLP Models
SELECT (metadata->>'component_type')::text as model_type, * FROM "models" -- where (metadata->>'component_type')::text = 'dlp'

-- Not Migrated
SELECT *  FROM "models"
where metadata->>'component_type' = 'dlp'
and model_id not in (
	select model_id from model_statistics ms where ms."type" ='error_histogram_per_variable'
)

	
--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~

-- NaN NaN NaN

select *
from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where episode_start >= '2022-09-20 00:00'
and episode_start <= '2022-09-30 03:15'
and independent_variable ='ti8916' and dependent_variable='fc1018'


update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
set ramp_gain=add_constant_gain 
where episode_start >= '2022-09-20 00:00'
and episode_start <= '2022-09-30 03:15'
and independent_variable ='ti8916' and dependent_variable='fc1018'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
set add_constant_gain = 'NaN'
where episode_start >= '2022-09-20 00:00'
and episode_start <= '2022-09-30 03:15'
and independent_variable ='ti8916' and dependent_variable='fc1018'

select add_constant_gain->>'ti8916__fc1018', * from ts_c2cf325e58e24078ab90408868a0530d_dlp_episode
where episode_start >= '2022-09-20 02:00'


INSERT INTO ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
(independent_variable, dependent_variable, episode_start, episode_end, data_source, add_constant_gain)
VALUES('x', 'y', '2022-08-01 00:00:00.000 +0000', '2022-08-01 09:54:00.000 +0000', 'train', 0);


--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~




--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~
-- {"ti8910__fc1018": 30, "ti8910__fc3400": 24, "ti8910__fc3401": 28, "ti8910__fi2002": 20, "ti8916__fc1018": 24, "ti8916__fc3400": 20, "ti8916__fc3401": 14, "ti8916__fi2002": 36, "total_feed__fc1018": 24, "total_feed__fc3400": 33, "total_feed__fc3401": 31, "total_feed__fi2002": 18, "ti8910__lab_diesel_temp90_utc_unbiased": 27, "ti8916__lab_diesel_temp90_utc_unbiased": 23, "total_feed__lab_diesel_temp90_utc_unbiased": 25}


select add_constant_gain ->> 'i_9fc1718__i_9fc3263' as gain_, error_value ->> 'i_9fc3263' as _error, *
from ts_b3bcd37080ca44d1996d8f77250c4be9_dlp_episode 
where (error_value ->> 'i_9fc3263')::numeric >= 14
and (error_value ->> 'i_9fc3263')::numeric < 14.01


select error_value ->> 'lab_diesel_temp90_utc_unbiased', * from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_dlp_episode 
where (error_value  -> 'lab_diesel_temp90_utc_unbiased')::text = 'null' 


SELECT bin_for_add_constant_gain->'i_9fc3263',count(bin_for_add_constant_gain->'i_9fc3263') FROM "ts_b3bcd37080ca44d1996d8f77250c4be9_dlp_episode" WHERE (error_value->>'i_9fc3263')::numeric >= 14.000000 AND (error_value->>'i_9fc3263')::numeric <= 14.010000 GROUP BY bin_for_add_constant_gain->'i_9fc3263'

