select * from models  where model_id='9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b'
 
select * from model_statistics ms where model_id='e2d113e0-c558-4b40-b255-c688f8a4d349'

select count(*) from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc

SELECT * FROM "models" where metadata->>'component_type' = 'dlp'


 -- 9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b		--Mordechai
 
 -- eea93a63-b37c-432d-b6e5-48bdfc275983		-- INF	| old-inf-like-master
 
 -- 0a9e0833-a113-4e3e-9a86-0ebdb1aeb654		-- INF | couldnt_think_of_a_name
 
 -- 440aef1e-b880-4cf6-83f1-8552db69e8a2		-- shap ok 

 -- c2cf325e-58e2-4078-ab90-408868a0530d		-- dlp 

 -- d67ebf13-b1e6-44a6-814e-bb520d4700af		-- INF


SELECT isunseen,min(timestamp) as min_time,max(timestamp) as max_time,count(timestamp) as rows_count 
FROM (SELECT (data_source = 'unseen') as isunseen,timestamp FROM "ts_d67ebf13b1e644a6814ebb520d4700af") as seenUnseenTimestamps 
GROUP BY "isunseen"


SELECT data_source, min(timestamp), count(*) FROM "ts_d67ebf13b1e644a6814ebb520d4700af" group by data_source



select "dependent_variable","independent_variable","episode_start","episode_end", episode_start + interval '294 MINUTE' as start_, (EXTRACT(EPOCH FROM episode_end) - EXTRACT(EPOCH FROM episode_start))/60 as DiffMinutes,"data_source","add_constant_gain" from "ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc" 
where independent_variable='fc670021_pv' and dependent_variable='fc670007_am_op' 
and episode_end >= '2021-09-16 UTC' and episode_end < '2021-09-18' --and add_constant_gain >= 0.351 and add_constant_gain <=0.352
order by episode_start desc 

 
 
  
 select * from model_statistics ms where model_id='0a9e0833-a113-4e3e-9a86-0ebdb1aeb654'	--couldnt_think_of_a_name

 select * from model_statistics ms where model_id='eea93a63-b37c-432d-b6e5-48bdfc275983'	--another inf
 
 select * from ts_d67ebf13b1e644a6814ebb520d4700af limit 1
 
 select * from ts_021e7b289fbc48be8ac663766c284611_agg_1day limit 1
 
 
SELECT date_bin('12 hour', timestamp, TIMESTAMP '2001-01-01 00:00:00') as timestamp,data_source FROM "ts_d67ebf13b1e644a6814ebb520d4700af" WHERE timestamp BETWEEN '2021-09-01 00:05:00' AND '2023-01-27 00:00:00' GROUP BY 1,data_source ORDER BY timestamp



select * from locks l 



select * from model_statistics ms where model_id ='c2cf325e-58e2-4078-ab90-408868a0530d' -- dlp

select * from model_statistics ms where model_id ='ffdea061-fa26-4589-8b42-f45414351c18'




select count(*) from ts_c2cf325e58e24078ab90408868a0530d

select count(*) from ts_c2cf325e58e24078ab90408868a0530d_agg_1day tcceeaadad  

select count(*) from ts_ffdea061fa2645898b42f45414351c18

select count(*) from ts_ffdea061fa2645898b42f45414351c18_agg_1day tcceeaadad  





SELECT tablename, indexname, * FROM pg_indexes WHERE indexname = 'idx_dep_indep_episode'


--CREATE UNIQUE INDEX idx_dep_indep_episode ON public.ts_c2cf325e58e24078ab90408868a0530d_pairs_calc USING btree (independent_variable, dependent_variable, episode_start, episode_end)

select * from settings s 
