-- models/marts/customer_profile.sql

SELECT
  CONCAT(first_name, ' ', last_name) AS full_name,
  email,
  signup_date,
  DATE_PART('year', CURRENT_DATE) - DATE_PART('year', signup_date) AS years_with_company
FROM {{ ref('stg_customers') }}
