{{
  config(
    materialized='view'
  )
}}

WITH raw_marketing_campaigns AS (
    SELECT
        campaign_id,
        LOWER(channel) AS channel,
        CAST(start_date AS DATE) AS start_date,
        budget
    FROM {{ source('raw', 'marketing_campaigns') }}
)
SELECT * FROM raw_marketing_campaigns
