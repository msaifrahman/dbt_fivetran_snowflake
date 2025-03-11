with __dbt__cte__read_s3_stage_table as (
SELECT _DATA:city.id::string as id, 
_DATA:main.pressure::float as pressure,
_DATA:main.humidity::float as humidity,
_DATA:main.temp::float as temp,
_DATA:clouds.all::int as clouds_probability,
_DATA:weather[0].description::string as description,
PARSE_JSON(_DATA:time)::TIMESTAMP_NTZ as timestamp,
from PC_FIVETRAN_DB.S3.NYC_WEATHER
) select * from __dbt__cte__read_s3_stage_table