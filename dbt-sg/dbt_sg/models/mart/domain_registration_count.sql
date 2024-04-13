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
    SELECT r.eventr_id, e.name,e.date, e.capacity,r.userr_id, e.domain FROM event as e 
    JOIN registration as r
    on r.eventr_id=e.event_id
),

count_event AS (
    SELECT  domain, count(userr_id) as registrations, eventr_id, capacity from registration_detail
    group by domain,eventr_id,capacity
),

percentage_domain AS (
    SELECT  domain, sum(registrations) as total_registrations,  sum(capacity) as total_capacity from count_event
    group by domain
)

select * from percentage_domain