{{
    config(
        tags=['staging']
    )
}}


WITH

user_skills AS (

    SELECT

       *

    FROM {{ source('learning_platform', 'USER_SKILL') }}

)
SELECT * FROM user_skills