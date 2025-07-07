{{ config(materialized='table') }}

WITH tb1 as(
    select
    id ,
    first_name,
    last_name,
    salary,
    tax,
    ({{calculate_amount('salary','tax')}}) as total_amount
    from {{source('datafeed_shared_schema','macro_data')}})
select * from tb1