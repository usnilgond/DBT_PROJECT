SELECT
    order_id,
    customer_id,
    order_date,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_amount
FROM {{ source('src','raw_orders') }}