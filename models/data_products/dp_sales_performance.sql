{{
  config(
    materialized='table'
  )
}}

SELECT
    extract('year' from date) AS sales_month,
    SUM(amount) AS total_sales,
    COUNT(DISTINCT sale_id) AS sales_count
FROM {{ ref('core_sales') }}
GROUP BY 1