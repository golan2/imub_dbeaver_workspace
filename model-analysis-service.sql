select * from models where model_id in ('c2cf325e-58e2-4078-ab90-408868a0530d')

select * from model_statistics where model_id='c2cf325e-58e2-4078-ab90-408868a0530d' order by updated_at desc

select count(*) from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc

select dependent_variable,independent_variable, count(*) from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc group by dependent_variable,independent_variable

select count(*) from (select distinct dependent_variable,independent_variable from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc ) as t

select independent_variable, dependent_variable, bin, count(*)
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
and add_constant_gain >= 0 and add_constant_gain <= 1


select count(*)
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='pc670009_pv' and dependent_variable='lpg_rate' and add_constant_gain >= 0.2 and add_constant_gain <=0.6

ts_c2cf325e58e24078ab90408868a0530d_bins


select independent_variable, dependent_variable, episode_end, add_constant_gain  
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc  
whwere episode_end in (
	select episode_end 
	from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
	where independent_variable='pc670009_pv' and dependent_variable='lpg_rate' and add_constant_gain >= 0.2 and add_constant_gain <=0.3
) 


SELECT dependent_variable,independent_variable, array_remove(array_agg(add_constant_gain), NULL) as add_constant_gain, null as ramp_gain, null as stochastic_gain  
FROM "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" 
WHERE episode_end in (
	select episode_end from "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' and add_constant_gain >= 0.700000 and add_constant_gain <= 0.780703
	) 
GROUP BY dependent_variable,independent_variable


select distinct independent_variable from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc

select distinct dependent_variable from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc


select independent_variable, dependent_variable, array_agg(add_constant_gain)  
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc  
where episode_end in (
	select episode_end 
	from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
	where independent_variable='pc670009_pv' and dependent_variable='lpg_rate' and add_constant_gain >= 0.2 and add_constant_gain <=0.21
)
group by independent_variable, dependent_variable


select "dependent_variable","independent_variable","episode_start","episode_end", episode_start + interval '294 MINUTE' as start_, (EXTRACT(EPOCH FROM episode_end) - EXTRACT(EPOCH FROM episode_start))/60 as DiffMinutes,"data_source","add_constant_gain" from "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" 
where independent_variable='pc670009_pv' and dependent_variable='fc670703_pv' 
and episode_end >= '2022-08-01 UTC' and episode_end < '2022-08-02'
order by episode_start ASC 

alter table ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc drop middle 

-- delete from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where independent_variable='x' and dependent_variable='y' 

select "dependent_variable","independent_variable","episode_start","episode_end", episode_start + interval '300 MINUTE' as start_, add_constant_gain
from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where independent_variable='x'

INSERT INTO ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
(independent_variable, dependent_variable, episode_start, episode_end, data_source, add_constant_gain)
VALUES('x', 'y', '2022-07-31 00:00:00.000 +0000', '2022-07-31 00:00:00.000 +0000', 'train', 0);

INSERT INTO ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc
(independent_variable, dependent_variable, episode_start, episode_end, data_source, add_constant_gain)
VALUES('x', 'y', '2022-08-01 00:00:00.000 +0000', '2022-08-01 09:54:00.000 +0000', 'train', 0);

select "dependent_variable","independent_variable","episode_start","episode_end", episode_start + interval '294 MINUTE' as start_, (EXTRACT(EPOCH FROM episode_end) - EXTRACT(EPOCH FROM episode_start))/60 as DiffMinutes,"data_source","add_constant_gain" from "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" 
where independent_variable='x' and dependent_variable='y' 
and episode_end >= '2022-08-01 UTC' and episode_end < '2022-08-02'
order by episode_start ASC 



SELECT * FROM "models" where metadata->>'component_type' = 'dlp'


select * from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_episodes 


SELECT min(episode_end) as min_time,max(episode_end) as max_time,min(add_constant_gain) as min_gain,max(add_constant_gain) as max_gain FROM "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" WHERE "dependent_variable" = 'fc670703_pv' AND "independent_variable" = 'pc670009_pv'

SELECT "episode_start","episode_end","data_source","add_constant_gain" FROM "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" WHERE "dependent_variable" = 'fc670703_pv' AND "independent_variable" = 'pc670009_pv' AND episode_end >= '2022-08-01 00:00:00' AND episode_end <= '2022-08-01 00:00:05' AND data_source IN ('train') ORDER BY episode_start


SELECT "dependent_variable","independent_variable","episode_start","episode_end","data_source","add_constant_gain","ramp_gain","stochastic_gain" FROM "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" WHERE "dependent_variable" = 'fc670703_pv' AND "independent_variable" = 'pc670009_pv' limit 10





SELECT
  table_name,
  column_name,
  data_type,
  is_nullable,
  ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc';

select count(*) from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where add_constant_gain > -0.14497832 and add_constant_gain < -0.14497830


SELECT
/*    conname AS constraint_name,
    contype AS constraint_type,
    indkey AS index_columns,
    relname AS table_name*/ *
FROM pg_catalog.pg_constraint
JOIN pg_catalog.pg_class
ON pg_catalog.pg_class.oid = pg_catalog.pg_constraint.conrelid
WHERE relname = 'ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc'
AND contype IN ('p', 'u', 'c');

select * from pg_catalog.pg_constraint

select * from pg_catalog.pg_class

select  attname,  typname 
FROM pg_catalog.pg_attribute
JOIN pg_catalog.pg_type ON pg_catalog.pg_type.oid = pg_catalog.pg_attribute.atttypid
WHERE attrelid = (SELECT oid FROM pg_catalog.pg_class WHERE relname = 'ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc')
AND attnum IN (SELECT attnum FROM pg_catalog.pg_attribute WHERE attname = 'add_constant_gain');




alter table ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc


select episode_end from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' and add_constant_gain >= 0.780600 and add_constant_gain <= 0.780703


select * from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc 
where independent_variable='pc670009_pv' and dependent_variable='fc670007_am_op'
and episode_end in (select episode_end from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' and add_constant_gain >= 0.780600 and add_constant_gain <= 0.780703)
order by episode_end



 SELECT * FROM "ts_c2cf325e58e24078ab90408868a0530d_pairs_calc" WHERE "dependent_variable" = 'pc670009_pv' -- AND "independent_variable" = 'fc670703_pv' 
 --AND add_constant_gain >= 0.700000 AND add_constant_gain <= 0.900000


delete from model_statistics where model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d_'

UPDATE model_statistics SET model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d_' WHERE model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d';

delete from models where model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d_'

UPDATE models SET model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d_' WHERE model_id = 'c2cf325e-58e2-4078-ab90-408868a0530d';


select * from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc limit 10

SELECT * FROM "models" where metadata->>'component_type' = 'dlp'

 -- e2d113e0-c558-4b40-b255-c688f8a4d349        -- 

 -- 9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b		-- Mordechai
 
 -- eea93a63-b37c-432d-b6e5-48bdfc275983		-- INF	| old-inf-like-master
 
 -- 0a9e0833-a113-4e3e-9a86-0ebdb1aeb654		-- INF | couldnt_think_of_a_name
 
 -- 440aef1e-b880-4cf6-83f1-8552db69e8a2		-- shap ok 

 -- c2cf325e-58e2-4078-ab90-408868a0530d		-- dlp 

 -- d67ebf13-b1e6-44a6-814e-bb520d4700af		-- INF


_CREATE TABLE ts_c2cf325e58e24078ab90408868a0530d_bins (
	independent_variable text NOT NULL,
	dependent_variable text NOT NULL,
	episode_end timestamptz NOT NULL,
	data_source text NOT NULL,
	add_constant_gain smallint NULL
);
