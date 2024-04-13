{{
    config(
        tags=['mart']
    )
}}
WITH
registrations AS (
    SELECT
        *
    FROM {{ ref('registration') }}
),

event AS (
    SELECT
     *
    FROM {{ref('event')}}
),

user as (
    select 
    *
    from {{ref('user')}} 
),

registration_event as (
    select r.userr_id , e.* 
    from registrations r
    left join event e on e.event_id=r.eventr_id
),

user_registration_event as (
    select r.* , u.* 
    from registration_event r
    left join user u on u.id=r.userr_id
)

select * from user_registration_event