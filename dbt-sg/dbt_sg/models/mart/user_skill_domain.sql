{{
    config(
        tags=['mart']
    )
}}

WITH

skill AS (
    SELECT
        *
    FROM {{ ref('skill') }}
),

user_skill AS (
    SELECT
        *
    FROM {{ ref('user_skill') }}
),

user_skill_domain as (
    select 
    *
    from user_skill as us
    join skill as s 
    on s.id=us.skill_id 
),

user_skill_domain_count as (
    select user_id, domain_name, count(skills)
    from user_skill_domain
    group by domain_name, user_id
    order by user_id asc
)

select * from user_skill_domain_count