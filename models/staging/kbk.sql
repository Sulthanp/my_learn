{{ config(materialized='table') }}

with tb1 as(
    select 
    name as n_k,
    post as num_k,
  from {{source('datafeed_shared_schema','kbk')}}
)
select * from tb1