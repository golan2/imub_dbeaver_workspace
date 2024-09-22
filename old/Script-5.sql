insert INTO "training"(created_at, updated_at, created_by, tenant_id, component_id, uuid, version) values(NOW(), NOW(), 'izik', '817ddeb6-cd6a-439a-9475-ab080d2e8912', 100, 'd67ebf13-b1e6-44a6-814e-bb520d4700af', 1);


select * from training t where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' --and component_id = 100;

select * from component c where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and application_id = 47;

select * from application a  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and project_id =25;

select * from project p  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and site_id = 14 and id = 25;

select * from site s  where tenant_id ='817ddeb6-cd6a-439a-9475-ab080d2e8912' and id = 14;