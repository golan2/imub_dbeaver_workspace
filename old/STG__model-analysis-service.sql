select * from ts_04cc2234f499423c892359d60f79c25b where "timestamp" >= '2023-08-25 06:10'

-- e2d113e0-c558-4b40-b255-c688f8a4d349        -- dlp [90 pairs]

 -- 9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b		-- Mordechai
 
 -- eea93a63-b37c-432d-b6e5-48bdfc275983		-- INF	| old-inf-like-master
 
 -- 0a9e0833-a113-4e3e-9a86-0ebdb1aeb654		-- INF | couldnt_think_of_a_name
 
 -- 440aef1e-b880-4cf6-83f1-8552db69e8a2		-- shap ok 

 -- c2cf325e-58e2-4078-ab90-408868a0530d		-- dlp [15 pairs]

 -- d67ebf13-b1e6-44a6-814e-bb520d4700af		-- INF
 
-- Utils



select * from locks l 

insert into locks (name, expires_at) values ('one', Now())

select * from settings s order by id

select * from migrations m 




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

	
	select * from models where model_id ='b132062b-56ab-4d5f-8cc0-4f0e44dd8d1a'



-- Model Statistics
select * from model_statistics ms 
where model_id in('b132062b-56ab-4d5f-8cc0-4f0e44dd8d1a' )
order by "type", model_id

-- DLP Models
SELECT (metadata->>'component_type')::text as model_type, * FROM "models" -- where (metadata->>'component_type')::text = 'inf'

SELECT *  FROM "models"
where metadata->>'component_type' = 'dlc'

--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~



select * from models where model_id ='59ac5803-8597-41b2-b3f2-fd61a58a5b45'

select * from ts_59ac5803859741b2b3f2fd61a58a5b45_dlp 

