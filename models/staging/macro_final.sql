{{ config(materialized='table') }}

WITH tb1 as(
    select
    id ,
    first_name,
    last_name,
    salary,
    tax,
    salary+tax as final_amount
    from {{ref('macro')}}
    )
select * from tb1