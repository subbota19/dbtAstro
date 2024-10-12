{{
  config(
    materialized='table'
  )
}}

WITH customers_clean AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        signup_date
    FROM {{ ref('staging_customers') }}
)
SELECT * FROM customers_clean