SELECT * FROM ts_98fe6ab331764edaa322b57bbe15c98d where "timestamp" >= '2024-05-03 14:00' order by "timestamp" 


--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~

 -- e2d113e0-c558-4b40-b255-c688f8a4d349        -- dlp [90 pairs]

 -- 9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b		-- Mordechai
 
 -- eea93a63-b37c-432d-b6e5-48bdfc275983		-- INF	| old-inf-like-master
 
 -- 0a9e0833-a113-4e3e-9a86-0ebdb1aeb654		-- INF | couldnt_think_of_a_name
 
 -- 440aef1e-b880-4cf6-83f1-8552db69e8a2		-- shap ok 

 -- c2cf325e-58e2-4078-ab90-408868a0530d		-- dlp [15 pairs]

 -- d67ebf13-b1e6-44a6-814e-bb520d4700af		-- INF
 
-- Utils

select * from locks l
delete from locks where name='DlpEpisodeMigrationJob'
insert into locks (name, expires_at) values ('one', Now())

select * from settings s order by id

select * from models order by model_id 

-- Models
select
metadata->>'component_type' as ModelType,
model_id,
extra_metadata,
status, metadata->>'name' as model_name, metadata->>'unit' as model_unit, metadata->>'customer' as model_customer, metadata->>'full_site' as model_site, metadata, tags_to_columns  from models
where metadata->>'component_type' = 'dlc'
and status = 'loaded'

where model_id in (
    '122ddc31-e3e5-4cc1-90fa-ae07413306ab',
    'b9dd355d-2096-40df-8be0-fc55d008ef8d'
    'b132062b-56ab-4d5f-8cc0-4f0e44dd8d1a'
	)



-- Model Statistics
select * from model_statistics ms 
where model_id ='ffdea061-fa26-4589-8b42-f45414351c18' --in ('ffdea061-fa26-4589-8b42-f45414351c18', '78ef6526-57ba-4952-bdf7-6ecdf527a467', 'e2d113e0-c558-4b40-b255-c688f8a4d349', 'c2cf325e-58e2-4078-ab90-408868a0530d', '9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b')
order by "type", model_id

-- How many pairs
WITH data_0 AS (
    SELECT episode_start, jsonb_object_keys(add_constant_gain) AS keys FROM ts_9b72f88c4aab49cb9d97d6d0fea65e68_dlp_episode
),
data_1 AS (
    SELECT episode_start, count(*) as json_size from data_0 GROUP BY episode_start
)
SELECT 
    min(json_size) AS min_json_size, max(json_size) AS max_json_size, avg(json_size) AS avg_json_size FROM data_1

-- List all pairs
SELECT distinct jsonb_object_keys(add_constant_gain) AS pair_name
FROM ts_78ef652657ba4952bdf76ecdf527a467_dlp_episode
order by pair_name

-- How many episodes?
select count(*)
FROM ts_ffdea061fa2645898b42f45414351c18_pairs_calc ts
group by ts.independent_variable, ts.dependent_variable
limit 1

select count(*)
FROM ts_78ef652657ba4952bdf76ecdf527a467_dlp_episode


-- Pairs
SELECT count(*) FROM "ts_78ef652657ba4952bdf76ecdf527a467_pairs_calc"

-- DLP Models
SELECT (metadata->>'component_type')::text as model_type, * FROM "models" -- where (metadata->>'component_type')::text = 'dlp'


--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~
-- MIGRATION

delete from model_statistics ms 
where model_id ='78ef6526-57ba-4952-bdf7-6ecdf527a467'
and "type" = 'error_histogram_per_variable';

delete from locks where name='DlpEpisodeMigrationJob'





-- Not Migrated (error_histogram_per_variable)
SELECT *  FROM "models"
where metadata->>'component_type' = 'dlp'
and model_id not in (
	select model_id from model_statistics ms where ms."type" ='error_histogram_per_variable'
)

-- Not Migrated (based on tables)
SELECT substring(table_name FROM 4 FOR 32) AS table_part
FROM information_schema.tables
WHERE table_name LIKE 'ts_%%_pairs_calc'
and   substring(table_name FROM 4 FOR 32) not in (
	SELECT substring(table_name FROM 4 FOR 32) AS table_part
	FROM information_schema.tables
	WHERE table_name LIKE 'ts_%%_dlp_episode'
)

-- Migrate Ignore List
SELECT unnest(string_to_array(value, ',')) AS value
FROM settings
WHERE key = 'dlp_episode_migration_ignored_models_csv';

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


-- delete from ts_e2d113e0c5584b40b255c688f8a4d349_pairs_calc where independent_variable='x' and dependent_variable='y'

--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~



--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~


SELECT relname AS table_name, 
       reltuples::bigint AS row_count
FROM pg_class
WHERE relname LIKE 'ts\_%\_dlp\_episode' ESCAPE '\'
order by row_count desc 
limit 100000

SELECT 
    relname AS table_name,
    n_live_tup AS row_count
FROM 
    pg_stat_user_tables

    
DO $$
DECLARE
    m_table_name TEXT;
    row_count BIGINT;
BEGIN
    FOR m_table_name IN 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_name LIKE 'ts\_%\_dlp\_episode' ESCAPE '\' AND table_schema = 'public' 
    LOOP
        EXECUTE 'SELECT COUNT(*) FROM ' || m_table_name INTO row_count;
        RAISE NOTICE '%, %', m_table_name, row_count;
    END LOOP;
END $$;

