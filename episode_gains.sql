------------------------------------------------------------------
-- Create Table

drop table ts_c2cf325e58e24078ab90408868a0530d_dlp_episode

truncate table ts_c2cf325e58e24078ab90408868a0530d_dlp_episode

select count(*) from ts_c2cf325e58e24078ab90408868a0530d_dlp_episode limit 3


CREATE TABLE ts_c2cf325e58e24078ab90408868a0530d_dlp_episode (
  episode_start timestamptz NOT NULL PRIMARY key,
  data_set text NOT NULL,
  add_constant_gain jsonb,
  bin_for_add_constant_gain jsonb
);

	
-- Populate Table - 

INSERT INTO ts_c2cf325e58e24078ab90408868a0530d_dlp_episode (episode_start, data_set, add_constant_gain, bin_for_add_constant_gain)
with 
minmax as (
	select 
		pc.dependent_variable, 
		pc.independent_variable, 
		min(pc.add_constant_gain)as min_, 
		max(pc.add_constant_gain) as max_
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
    group by pc.dependent_variable, pc.independent_variable
)
	SELECT 
		episode_end - interval '175 minutes',
		data_source,
		json_object_agg(CONCAT(pc.independent_variable, '__', pc.dependent_variable), pc.add_constant_gain) AS add_constant_gain,
		json_object_agg(CONCAT(pc.independent_variable, '__', pc.dependent_variable), width_bucket(pc.add_constant_gain, mm.min_, mm.max_+0.0001, 49) - 1) AS add_constant_bin
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc 
	join minmax mm on mm.dependent_variable = pc.dependent_variable and mm.independent_variable = pc.independent_variable 
GROUP BY episode_end, data_source;



-- Check Table

with 
episode_json As(  
	select episode_start, data_set, (add_constant_gain->'ti8916__fi2002')::float as add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_dlp_episode
)
,
pairs_calc as (
	select episode_end - interval '294 minutes' as episode_start, data_source, add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc where independent_variable='ti8916' and dependent_variable='fi2002'
)
select j.episode_start, j.add_constant_gain j_gain, p.add_constant_gain p_gain, (j.add_constant_gain - p.add_constant_gain) as diff_ 
from episode_json j,pairs_calc p 
where j.episode_start = p.episode_start and 
 (  j.add_constant_gain != p.add_constant_gain  or  j.data_set != p.data_source )


 
select * from ts_c2cf325e58e24078ab90408868a0530d_dlp_episode order by episode_start  limit 3

select episode_end-episode_start , episode_end - interval '294 minutes', * from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc order by episode_end limit 3


------------------------------------------------------------------
-- GetMinMaxTimeAndValue


explain analyze
SELECT min((add_constant_gain->'ti8910__fc1018')::float) AS min_value,
       max((add_constant_gain->'ti8910__fc1018')::float) AS max_value
FROM ts_c2cf325e58e24078ab90408868a0530d_dlp_episode;

select min(add_constant_gain), max(add_constant_gain) 
from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable='ti8910'
  and dependent_variable='fc1018'

select min(episode_end), max(episode_end), min(add_constant_gain), max(add_constant_gain), count(*)
from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc

------------------------------------------------------------------
 -- GetRawStoredPairs ( get gain values for pair )
explain analyze
SELECT episode_start, add_constant_gain->'ti8916__fi2002' AS add_constant_gain
FROM ts_c2cf325e58e24078ab90408868a0530d_dlp_episode
WHERE episode_start >= '2022-07-01 UTC' 
  AND episode_start <= '2022-10-02 UTC'

explain analyze
select episode_end, add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
WHERE episode_end >= '2022-07-01 UTC' 
  AND episode_end <= '2022-10-02 UTC'
  and independent_variable='ti8916'
  and dependent_variable='fi2002'
------------------------------------------------------------------
 -- GetGainsHistogramResponse
  
select bin_for_add_constant_gain->'ti8916__fi2002', count(*) 
from ts_c2cf325e58e24078ab90408868a0530d_dlp_episode 
group by bin_for_add_constant_gain->'ti8916__fi2002'
order by bin_for_add_constant_gain->'ti8916__fi2002'

  
------------------------------------------------------------------
 -- Interactions


  
--  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
/*
WITH data_0 AS (
 select pc.episode_end, pc.dependent_variable, pc.independent_variable, pc.add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
)
INSERT INTO ts_c2cf325e58e24078ab90408868a0530d_dlp_episode (episode_end, add_constant_gain)
SELECT episode_end, jsonb_agg(to_jsonb(data_0) - 'episode_end') AS add_constant_gain
FROM data_0
GROUP BY episode_end;

WITH data_0 AS (
	select pc.episode_end, pc.dependent_variable, pc.independent_variable, floor(random() * 50 + 1)::int as add_constant_bin 
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
)
,data_1 as (
	SELECT episode_end, jsonb_agg(to_jsonb(data_0)- 'episode_end') AS add_constant_bin
	FROM data_0
	GROUP BY episode_end
)
UPDATE ts_c2cf325e58e24078ab90408868a0530d_dlp_episode  
set add_constant_bin=data_1.add_constant_bin
from data_1
where ts_c2cf325e58e24078ab90408868a0530d_dlp_episode.episode_end = data_1.episode_end
*/
  
  
	select 
	pc.dependent_variable, 
	pc.independent_variable, 
	min(pc.add_constant_gain)as min_, 
	max(pc.add_constant_gain) as max_, 
	( min(pc.add_constant_gain) - max(pc.add_constant_gain) ) / 50 as scale_
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
    group by pc.dependent_variable, pc.independent_variable
    order by pc.dependent_variable, pc.independent_variable
  
  
  

with 
minmax as (
	select 
		pc.dependent_variable, 
		pc.independent_variable, 
		min(pc.add_constant_gain)as min_, 
		max(pc.add_constant_gain) as max_
		--( max(pc.add_constant_gain) - min(pc.add_constant_gain) ) / 50 as scale_
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
    group by pc.dependent_variable, pc.independent_variable
),
gainush as (
	SELECT episode_end - interval '5 minutes',
	 data_source,
	 json_object_agg(CONCAT(independent_variable, '__', dependent_variable), add_constant_gain) AS add_constant_gain,
	FROM ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
	GROUP BY episode_end, data_source
),
histush as (
	select 
		pc.dependent_variable, pc.independent_variable, pc.add_constant_gain,
		width_bucket(pc.add_constant_gain, mm.min_, mm.max_+0.0001, 49) - 1 as bin_index
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc 
	join minmax mm on mm.dependent_variable = pc.dependent_variable and mm.independent_variable = pc.independent_variable 
)
select h.bin_index, add_constant_gain --min(add_constant_gain), max(add_constant_gain), count(*)
from histush h
where h.independent_variable='ti8916' and h.dependent_variable='lab_diesel_temp90_utc_unbiased' 
and h.bin_index in (0,1,2, 49,50,51,52)
order by h.bin_index
--group by h.bin_index





intermediate as (
	select 
		pc.dependent_variable, pc.independent_variable, 
		pc.add_constant_gain, mm.min_, mm.max_,
		pc.add_constant_gain - mm.min_ as xDiff,
		cast ( (pc.add_constant_gain - mm.min_)/(scale_) as INTEGER) as binIdx,
		scale_
	from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc 
	join minmax mm on mm.dependent_variable = pc.dependent_variable and mm.independent_variable = pc.independent_variable 
),
select h.add_constant_gain, h.bin_index, i.binIdx
from histush h, intermediate i
where h.dependent_variable = i.dependent_variable 
and h.independent_variable = i.independent_variable 
and h.add_constant_gain = i.add_constant_gain
and h.independent_variable='ti8916' and h.dependent_variable='lab_diesel_temp90_utc_unbiased' and h.bin_index in (0,1,2, 49,50,51,52)



select *
from intermediate
where independent_variable='ti8916' and dependent_variable='lab_diesel_temp90_utc_unbiased' and bin_index in (0,1,2)
--group by independent_variable, dependent_variable, bin_index
order by bin_index



INSERT INTO ts_c2cf325e58e24078ab90408868a0530d_dlp_episode (episode_start, data_set, add_constant_gain, add_constant_bin)
SELECT episode_end - interval '5 minutes',
 data_source,
 json_object_agg(CONCAT(independent_variable, '__', dependent_variable), add_constant_gain) AS add_constant_gain,
 json_object_agg(CONCAT(independent_variable, '__', dependent_variable), floor(random() * 50 + 1)::int ) AS add_constant_bin
FROM ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
GROUP BY episode_end, data_source;




select * from models ms where model_id ='c2cf325e-58e2-4078-ab90-408868a0530d'

select * from model_statistics ms where model_id ='c2cf325e-58e2-4078-ab90-408868a0530d'

delete from model_statistics ms where model_id ='c2cf325e-58e2-4078-ab90-408868a0530d' and type in ('all_gain_histograms', 'opacities')


update 

-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 

select * from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable = 'ti8916' and dependent_variable = 'fc1018' 
and episode_end >= '2020-09-30 06:00:00.000'
and episode_end <= '2020-09-30 06:35:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc set ramp_gain=null
where independent_variable = 'ti8916' and dependent_variable = 'fc1018'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc set add_constant_gain = 'infinity'
where independent_variable = 'ti8916' and dependent_variable = 'fc1018' and episode_end ='2020-09-30 06:00:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc set add_constant_gain = 'NaN'
where independent_variable = 'ti8916' and dependent_variable = 'fc1018' and episode_end ='2020-09-30 06:10:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc set add_constant_gain = '-infinity'
where independent_variable = 'ti8916' and dependent_variable = 'fc1018' and episode_end ='2020-09-30 06:15:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_pairs_calc set add_constant_gain = 0
where independent_variable = 'ti8916' and dependent_variable = 'fc1018' and episode_end ='2020-09-30 06:35:00.000'


-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 

select episode_end, fc1018_error from ts_c2cf325e58e24078ab90408868a0530d_episodes
where episode_end >= '2020-09-30 06:00:00.000'
and episode_end <= '2020-09-30 06:35:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error='infinity'
where episode_end ='2020-09-30 06:00:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error='NaN'
where episode_end ='2020-09-30 06:10:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error='-infinity'
where episode_end ='2020-09-30 06:15:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error=0
where episode_end ='2020-09-30 06:35:00.000'


update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error=13.639904975891113
where episode_end ='2020-09-30 06:00:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error=11.43165397644043
where episode_end ='2020-09-30 06:10:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error=10.591507911682129
where episode_end ='2020-09-30 06:15:00.000'

update ts_c2cf325e58e24078ab90408868a0530d_episodes set fc1018_error=9.591507911682129
where episode_end ='2020-09-30 06:35:00.000'


select * from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc 

select episode_start, (add_constant_gain->'ti8910__lab_diesel_temp90_utc_unbiased')::numeric as add_constant_gain from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_dlp_episode where episode_start='2019-02-04 13:25:00.000'

select independent_variable, dependent_variable, count(*) 
from ts_9f2cd043cdf84ddc8b1f2c8fb447197b_pairs_calc 
where add_constant_gain = 0
group by independent_variable, dependent_variable 
order by independent_variable, dependent_variable


select * from ts_bd09ffb0276a49c9acd5d0b59bfc256e_dlp_episode limit 10
