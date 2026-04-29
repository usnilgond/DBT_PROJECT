SELECT
    o.order_id,
    o.order_date,
    o.product_id,
    o.quantity,
    o.unit_price,
    o.total_amount,

    c.customer_name,
    c.city,
    c.country,
    c.signup_date,

    -- derived measures
    CASE 
        WHEN o.total_amount > 2000 THEN 'High Value'
        WHEN o.total_amount > 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category

FROM {{ ref('stg_orders_raw') }} o
JOIN {{ ref('stg_customers_raw') }} c
    ON o.customer_id = c.customer_id