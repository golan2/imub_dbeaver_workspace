SELECT * FROM ts_16aa3335367c472481344d6d1c007d6a_agg_1day ; 

SELECT * FROM ts_d67ebf13b1e644a6814ebb520d4700af limit 100 ; 

SELECT * FROM "models" WHERE model_id = 'd67ebf13-b1e6-44a6-814e-bb520d4700af' 


SELECT isunseen,min(timestamp) as min_time,max(timestamp) as max_time,count(timestamp) as rows_count 
FROM (SELECT (data_source = 'unseen') as isunseen,timestamp FROM "ts_d67ebf13b1e644a6814ebb520d4700af") as seenUnseenTimestamps 
GROUP BY "isunseen"


SELECT data_source, min(timestamp), count(*) FROM "ts_d67ebf13b1e644a6814ebb520d4700af" group by data_source


SELECT isunseen,min(timestamp) as min_time,max(timestamp) as max_time,count(timestamp) as rows_count FROM (SELECT (data_source = 'unseen') as isunseen,timestamp FROM "ts_d67ebf13b1e644a6814ebb520d4700af") as seenUnseenTimestamps GROUP BY "isunseen"

 select * from models where model_id='d67ebf13-b1e6-44a6-814e-bb520d4700af'
 
 select * from model_statistics ms  where model_id='d67ebf13-b1e6-44a6-814e-bb520d4700af'
 
 select * from ts_d67ebf13b1e644a6814ebb520d4700af limit 1
 
 
SELECT date_bin('12 hour', timestamp, TIMESTAMP '2001-01-01 00:00:00') as timestamp,data_source FROM "ts_d67ebf13b1e644a6814ebb520d4700af" WHERE timestamp BETWEEN '2021-09-01 00:05:00' AND '2023-01-27 00:00:00' GROUP BY 1,data_source ORDER BY timestamp
