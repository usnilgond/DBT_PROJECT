{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    o.product_id,
    o.quantity,
    o.unit_price,
    o.total_amount,

    c.customer_name,
    c.city,
    c.country,

    CURRENT_TIMESTAMP AS load_timestamp

FROM {{ ref('stg_orders_raw') }} o
JOIN {{ ref('stg_customers_raw') }} c
    ON o.customer_id = c.customer_id

{% if is_incremental() %}

WHERE o.order_date >= (
    SELECT MAX(order_date) FROM {{ this }}
)

{% endif %}