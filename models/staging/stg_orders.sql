-- models/staging/stg_orders.sql

WITH cleaned AS (
  SELECT
    order_id,
    customer_id,
    TRY_TO_DATE(order_date, 'YYYY-MM-DD') AS order_date,
    amount
  FROM {{ source('raw', 'raw_orders') }}
  WHERE order_id IS NOT NULL AND amount > 0
)

SELECT * FROM cleaned
