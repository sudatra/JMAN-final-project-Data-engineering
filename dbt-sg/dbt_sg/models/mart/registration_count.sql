{{
    config(
        tags=['mart']
    )
}}

WITH 

registration AS (
    SELECT
        *
    FROM {{ ref('registration') }}
),

event AS (
    SELECT
     *
    FROM {{ref('event')}}
),

registration_detail AS (
    SELECT r.eventr_id, e.name,e.date, e.capacity,r.userr_id FROM event as e 
    JOIN registration as r
    on r.eventr_id=e.event_id
),

count_event AS (
    SELECT  eventr_id, name, count(userr_id) as total_registered, capacity from registration_detail
    group by eventr_id, name, capacity
)

select * from count_event