{{
  config(
    materialized='view'
  )
}}

WITH raw_sales AS (
    SELECT
        CAST(sale_id AS INTEGER) AS sale_id,
        CAST(product_id AS INTEGER) AS product_id,
        CAST(customer_id AS INTEGER) AS customer_id,
        CAST(amount AS DOUBLE) AS amount,
        CAST(date AS DATE) AS date
    FROM {{ source('raw', 'sales') }}
)
SELECT * FROM raw_sales
