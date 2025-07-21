{{ config(materialized='table') }}

with tb1 as(
    select 
    name as n_m,
    mandal as m,
    post as p_m,
    pincode as pin
  from {{source('datafeed_shared_schema','kbk')}}
)
select * from tb1