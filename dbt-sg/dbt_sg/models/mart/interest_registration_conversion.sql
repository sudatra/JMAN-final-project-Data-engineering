{{
    config(
        tags=['mart']
    )
}}
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

interest AS (
    SELECT
     *
    FROM {{ref('interest')}}
),

event_interest AS (
    SELECT i.*, e.*
    FROM interest AS i
    JOIN event AS e ON i.eventi_id = e.event_id
),

event_register AS (
    SELECT r.*, e.*
    FROM registration AS r
    JOIN event AS e ON r.eventr_id = e.event_id
)

SELECT
    e.event_id ,
    e.name,
    COALESCE(
        (COUNT(DISTINCT CASE WHEN ei.useri_id IS NOT NULL THEN ei.useri_id END) /
        NULLIF(COUNT(DISTINCT CASE WHEN er.userr_id IS NOT NULL THEN er.userr_id END), 0)) * 100,
        0
    ) AS conversion_rate
FROM event AS e
LEFT JOIN event_interest AS ei ON e.event_id = ei.eventi_id
LEFT JOIN event_register AS er ON e.event_id = er.eventr_id
GROUP BY e.event_id, e.name
