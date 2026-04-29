SELECT
    sales_key,
    customer_key,
    product_id,
    sale_date,
    quantity,
    unit_price,
    total_amount
FROM {{ source('raw', 'fact_sales') }}