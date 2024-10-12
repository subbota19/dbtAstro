{{
  config(
    materialized='table'
    )
}}

WITH campaign_sales AS (
    SELECT
        m.campaign_id,
        m.channel,
        COUNT(DISTINCT s.sale_id) AS attributed_sales,
        SUM(s.amount) AS attributed_revenue
    FROM {{ ref('core_sales') }} s
    JOIN {{ ref('core_marketing_campaigns') }} m
      ON s.date >= m.start_date
    GROUP BY m.campaign_id, m.channel
)

SELECT * FROM campaign_sales