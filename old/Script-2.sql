
select * from customer c where id = 21 -- Potter Corp

select * from site s where id = 19  -- Kings cross 

select * from project where id = 37 -- Diesel Pool

select * from application a where id = 74 -- Optimization

select * from component c where id in (128,131,133) -- diesel_cloud / Inf1_ger

select * from training t where component_id in (128,131)


select * from customer where id = 3	-- Delek

select * from site  where customer_id  = 3

select * from project p  where site_id = 3

select * from application a where project_id =3



select  id, tenant_id, component_id, uuid, name, description, visibility  from 	training -- where id = 23

select * from component c where id = 1

select * from application a where id = 3

select * from project p  where id = 2

select * from site  -- where id  =  

select * from customer


SELECT * FROM "site" WHERE customer_id = 13


