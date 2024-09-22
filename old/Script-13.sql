drop table ts_c2cf325e58e24078ab90408868a0530d_episode_json

CREATE TABLE ts_c2cf325e58e24078ab90408868a0530d_episode_json (
  episode_end timestamptz NOT NULL PRIMARY KEY,
  add_constant_gain jsonb
);

WITH data_0 AS (
 select pc.episode_end, pc.dependent_variable, pc.independent_variable, pc.add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc pc
)
INSERT INTO ts_c2cf325e58e24078ab90408868a0530d_episode_json (episode_end, add_constant_gain)
SELECT episode_end, jsonb_agg(to_jsonb(data_0)- 'episode_end') AS add_constant_gain
FROM data_0
GROUP BY episode_end;

select * from ts_c2cf325e58e24078ab90408868a0530d_episode_json limit 3

explain analyze
SELECT episode_end, jsonb_array_elements(add_constant_gain)->>'add_constant_gain' AS add_constant_gain
FROM ts_c2cf325e58e24078ab90408868a0530d_episode_json
WHERE episode_end >= '2022-07-01 UTC' 
  AND episode_end <= '2022-10-02 UTC'
  AND add_constant_gain @> '[{"independent_variable": "ti8916", "dependent_variable": "fi2002"}]';

explain analyze
select episode_end, add_constant_gain from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
WHERE episode_end >= '2022-07-01 UTC' 
  AND episode_end <= '2022-10-02 UTC'
  and independent_variable='ti8916'
  and dependent_variable='fi2002'
  
  
ALTER TABLE ts_c2cf325e58e24078ab90408868a0530d_episode_json
ADD COLUMN add_constant_bin jsonb;


UPDATE ts_c2cf325e58e24078ab90408868a0530d_episode_json
SET add_constant_bin = jsonb_agg(
      jsonb_build_object(
        'add_constant_bin', floor(random() * 2)::int,
        'dependent_variable', elem->>'dependent_variable',
        'independent_variable', elem->>'independent_variable'
      )
    )
FROM jsonb_array_elements(add_constant_gain) elem;

  
--  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	