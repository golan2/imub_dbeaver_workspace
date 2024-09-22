insert INTO "training"(created_at, updated_at, created_by, tenant_id, component_id, uuid, version) values(NOW(), NOW(), 'izik', '817ddeb6-cd6a-439a-9475-ab080d2e8912', 100, 'd67ebf13-b1e6-44a6-814e-bb520d4700af', 1);


select * from training t where tenant_id ='4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1'

select * from component c where tenant_id ='4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1' and application_id = 1;

select * from application a  where tenant_id ='4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1' and project_id =1;

select * from project p  where tenant_id ='4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1' and site_id=1 ;

select * from site s;


select * from training where uuid = '6b61ead3-c4db-4131-beee-c7543bc8f8e4';


select t.uuid, co."name" as componnent_name, a."name" as application_name, p."name" as project_name, s."name" as site_name, cu."name" as customer_name,
t.tenant_id
from training t, component co, application a, project p, site s, customer cu
where t.component_id = co.id 
and co.application_id = a.id
and a.project_id = p.id
and p.site_id = s.id 
and s.customer_id = cu.id 
and t."uuid" IN ('57899b65-34e7-4c65-98f4-3d2a13c5f1dd')


select * from customer where id = 21 -- pottercorp

select * from site where id = 19 -- Kings Cross

select * from project p  where id = 37 -- Diesel Pool

select * from application a where id = 74 -- Optimization

select * from component c where id = 128 -- diesel_cloud

select * from component c where id = 148 -- old-inf-like-master        izik_dlp_1

select * from component c where application_id = 74 -- App = Optimization



select * from project p

select * from training t  where component_id = 146

select * from component c where id = 146 -- [Izik DLP 530d]  &  [Izik DLP 349]

select * from application a where id = 74 -- Optimization



select * from training t  where uuid='0a9e0833-a113-4e3e-9a86-0ebdb1aeb654'	-- inf_couldnt_think_of_a_name

select * from component c where id=147

select * from training t where uuid='9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b'

select t.id, t.tenant_id, t.component_id, t.uuid as model_uuid, t."name" as model_name, t.description, c.name as component_name, c."type"  
from training t, component c 
where t.component_id = c.id 


INSERT INTO public.component (
	id, 
	created_at, updated_at, created_by, 
	"version", tenant_id, application_id, 
	"type", "name", description)
VALUES(
	nextval('component_id_seq'::regclass), 
	NOW(), NOW(), '5b5cf242-3aa3-413d-b586-82c04daf9ab7',
	1, '4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1', 1, 
	'dlc', 'dlc', 's3://model-analysis-stg/models/eea93a63-b37c-432d-b6e5-48bdfc275983/');

select id, type, name from component c where id IN (1,2,3,4,5)

INSERT INTO public.training (
	created_at, updated_at, created_by, 
	"version", tenant_id, 
	component_id, 
	uuid, 
	"name", 
	description, 
	trained_at, visibility)
values (
	NOW(), NOW(), '5b5cf242-3aa3-413d-b586-82c04daf9ab7', 
	1, '4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1', 
	4, -- 3 = DLP   4 = DLC
	'7286dbfc-bf73-4ffb-8001-8863a33ea734', -- ModelID goes here
	'Hunt Combo', 
	'hunt_tusc_combo_twr', 
	NOW(), 'public');
	
select * from training t where tenant_id ='4389e835-38b6-4f1b-ba17-c9c4e7b6cfd1'


SELECT * FROM "training" WHERE tenant_id = '59ac5803-8597-41b2-b3f2-fd61a58a5b45' AND uuid = '59ac5803-8597-41b2-b3f2-fd61a58a5b45' AND "training"."deleted_at" IS NULL ORDER BY "training"."id" LIMIT 1