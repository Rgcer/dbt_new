-- models/staging/stg_customers.sql

WITH ranked_customers AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY first_name, last_name ORDER BY signup_date DESC) AS rn
  FROM {{ source('raw', 'raw_customers') }}
)

SELECT
  customer_id,
  first_name,
  last_name,
  email,
  signup_date
FROM ranked_customers
WHERE rn = 1
