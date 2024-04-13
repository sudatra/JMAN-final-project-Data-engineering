{{
    config(
        tags=['staging']
    )
}}


WITH

users AS (

    SELECT

       *

    FROM {{ source('learning_platform', 'USER') }}

)
SELECT * FROM users