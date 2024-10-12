{{
  config(
    materialized='table'
  )
}}

WITH marketing_clean AS (
    SELECT
        campaign_id,
        channel,
        start_date,
        budget
    FROM {{ ref('staging_marketing_campaigns') }}
)
SELECT * FROM marketing_clean
