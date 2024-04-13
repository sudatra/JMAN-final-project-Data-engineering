{{
    config(
        tags=['staging']
    )
}}


WITH

events AS (

    SELECT

       *

    FROM {{ source('learning_platform', 'EVENT') }}

)
SELECT * FROM events