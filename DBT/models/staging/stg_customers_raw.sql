SELECT
    customer_id,
    customer_name,
    gender,
    city,
    country,
    signup_date
    from {{source('src','raw_customers')}}
