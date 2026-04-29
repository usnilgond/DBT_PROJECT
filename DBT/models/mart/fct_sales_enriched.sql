SELECT
    country,
    city,

    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value

FROM {{ ref('int_orders_enriched') }}
GROUP BY country, city