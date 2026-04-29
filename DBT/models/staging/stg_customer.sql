SELECT
    customer_key,
    customer_id,
    name,
    gender,
    city,
    country,
    segment
FROM {{source('raw','dim_customer')}}