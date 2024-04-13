{{
    config(
        tags=['staging']
    )
}}


WITH

interests AS (

    SELECT

       user_id as useri_id, event_id as eventi_id

    FROM {{ source('learning_platform', 'INTEREST') }}

)
SELECT * FROM interests