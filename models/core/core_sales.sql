{{
  config(
    materialized='table'
  )
}}

WITH sales_clean AS (
    SELECT
        sale_id,
        product_id,
        customer_id,
        amount,
        date
    FROM {{ ref('staging_sales') }}
)
SELECT * FROM sales_clean
