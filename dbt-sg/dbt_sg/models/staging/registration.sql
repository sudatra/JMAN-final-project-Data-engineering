{{
    config(
        tags=['staging']
    )
}}


WITH

registrations AS (

    SELECT

        user_id as userr_id, event_id as eventr_id

    FROM {{ source('learning_platform', 'REGISTRATION') }}

)
SELECT * FROM registrations