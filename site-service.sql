insert INTO "training"(created_at, updated_at, created_by, tenant_id, component_id, uuid, version) values(NOW(), NOW(), 'izik', '817ddeb6-cd6a-439a-9475-ab080d2e8912', 100, 'd67ebf13-b1e6-44a6-814e-bb520d4700af', 1);


select * from training t where uuid = 'e2d113e0-c558-4b40-b255-c688f8a4d349'

select * from component c where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and application_id = 47;

select * from application a  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and project_id =25;

select * from project p  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and site_id = 14 and id = 25;

select * from site s  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and id = 14;


select * from training -- where uuid = 'e2d113e0-c558-4b40-b255-c688f8a4d349';



select * from customer where id = 21 -- pottercorp

select * from site where id = 19 -- Kings Cross

select * from project p  where id = 37 -- Diesel Pool

select * from application a where id = 74 -- Optimization

select * from component c where id = 128 -- diesel_cloud

select * from component c where id = 148 -- old-inf-like-master        izik_dlp_1

select * from component c where application_id = 74 -- App = Optimization



select * from project p where site

select * from training t  where component_id = 146

select * from component c where id = 146 -- [Izik DLP 530d]  &  [Izik DLP 349]

select * from application a where id = 74 -- Optimization



select * from training t  where uuid='0a9e0833-a113-4e3e-9a86-0ebdb1aeb654'	-- inf_couldnt_think_of_a_name

select * from component c where id=147

select * from training t where uuid='9f2cd043-cdf8-4ddc-8b1f-2c8fb447197b'

select t.id, t.tenant_id, t.component_id, t.uuid as model_uuid, t."name" as model_name, t.description, c.name as component_name, c."type"  
from training t, component c 
where t.component_id = c.id and application_id = 74 -- uuid='eea93a63-b37c-432d-b6e5-48bdfc275983'



INSERT INTO public.component (
	id, 
	created_at, updated_at, created_by, 
	"version", tenant_id, application_id, 
	"type", "name", description)
VALUES(
	nextval('component_id_seq'::regclass), 
	NOW(), NOW(), '5b5cf242-3aa3-413d-b586-82c04daf9ab7',
	1, 'ef73050b-6048-4902-b12e-dc1166626c85', 74, 
	'inferential', 'old-inf-like-master', 's3://model-analysis-stg/models/eea93a63-b37c-432d-b6e5-48bdfc275983/');

select * from component c where application_id = 74

INSERT INTO public.training (
	created_at, updated_at, created_by, 
	"version", tenant_id, component_id, 
	uuid, "name", description, 
	trained_at, visibility)
values (
	NOW(), NOW(), '5b5cf242-3aa3-413d-b586-82c04daf9ab7', 
	1, 'ef73050b-6048-4902-b12e-dc1166626c85', 146, 
	'78ef6526-57ba-4952-bdf7-6ecdf527a467', 'chevron_pg_fcc_dlp', 'Big DLP from Shoham ab7 (11*7)', 
	NOW(), 'public');