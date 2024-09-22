
-- Migration BlackList
SELECT unnest(string_to_array(value, ',')) AS value
FROM settings
WHERE key = 'dlp_episode_migration_ignored_models_csv'
limit 2000;

SELECT m.model_id, m.status, m.metadata->>'name' as model_name, 
       m.metadata->>'component_type' as component_type, m.metadata->>'unit' as model_unit, 
       m.metadata->>'customer' as model_customer, m.metadata, m.tags_to_columns  
from models m
where model_id in (
SELECT unnest(string_to_array(value, ',')) AS value
FROM settings
WHERE key = 'dlp_episode_migration_ignored_models_csv'
)
order by model_id 


-- Migrated   MAR26=1090 | MAR27=1336 | MAR28=1466 | MAR31=1650
select count(*) from model_statistics ms where ms."type" ='error_histogram_per_variable'

-- Non Migrated
SELECT status, count(*) FROM "models"
where metadata->>'component_type' = 'dlp'
and model_id not in (
	select model_id from model_statistics ms where ms."type" ='error_histogram_per_variable'
)
group by status


(SELECT unnest(string_to_array(value, ',')) AS value
FROM settings
WHERE key = 'dlp_episode_migration_ignored_models_csv'
)
limit 555


SELECT substring(table_name FROM 4 FOR 32) AS table_part
FROM information_schema.tables
WHERE table_name LIKE 'ts_%%_pairs_calc'
and substring(table_name FROM 4 FOR 32) not in (
SELECT substring(table_name FROM 4 FOR 32) AS table_part
FROM information_schema.tables
WHERE table_name LIKE 'ts_%%_dlp_episode'
)

SELECT unnest(string_to_array(value, ',')) AS value
FROM settings
WHERE key = 'dlp_episode_migration_ignored_models_csv'
limit 2000;

select * from ts_cc6d1b78d17142d9bc03ed99bab32f42_pairs_calc
