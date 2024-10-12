{{
  config(
    materialized='view'
  )
}}

WITH raw_customers AS (
    SELECT
        customer_id,
        LOWER(first_name) AS first_name,
        LOWER(last_name) AS last_name,
        CAST(signup_date AS DATE) AS signup_date
    FROM {{ source('raw', 'customers') }}
)
SELECT * FROM raw_customers
