-- models/marts/customer_order_summary.sql

SELECT
  customer_id,
  COUNT(order_id) AS total_orders,
  SUM(amount) AS total_spent,
  MAX(order_date) AS last_order_date
FROM {{ ref('stg_orders') }}
GROUP BY customer_id
