select * from customer where id=331

select * from site where id=320

select * from project where site_id=320	-- 226,227

select * from application where id >= 186

select * from component

select * from training


SELECT component_id, count(id) as total, count(id) filter (where visibility = 'public') as published FROM "training" WHERE tenant_id = '817ddeb6-cd6a-439a-9475-ab080d2e8912' GROUP BY "component_id"

SELECT component_id, count(id) as total, count(id) filter (where visibility = 'public') as published FROM "training"  GROUP BY "component_id"

SELECT component_id, count(id) as total, count(id) filter (where visibility = 'public') as published FROM "training" WHERE tenant_id = '817ddeb6-cd6a-439a-9475-ab080d2e8912' GROUP BY "component_id"

SELECT * FROM "training" WHERE component_id = 146 AND visibility = 'public' AND "training"."deleted_at" IS null

SELECT * FROM "component" WHERE "component"."application_id" IN (186,187) AND tenant_id = '817ddeb6-cd6a-439a-9475-ab080d2e8912' AND "component"."deleted_at" IS NULL

SELECT * FROM "site" WHERE tenant_id = '817ddeb6-cd6a-439a-9475-ab080d2e8912' AND "site"."deleted_at" IS NULL ORDER BY "site"."id" LIMIT 1


select * from application a where project_id =141

SELECT * from component c where application_id =116

SELECT * FROM "training" WHERE component_id = 91 and tenant_id =
