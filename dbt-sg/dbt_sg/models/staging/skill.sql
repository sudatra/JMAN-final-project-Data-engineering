{{
    config(
        tags=['staging']
    )
}}


WITH

skills AS (

    SELECT

       *

    FROM {{ source('learning_platform', 'SKILL') }}

)
SELECT * FROM skills