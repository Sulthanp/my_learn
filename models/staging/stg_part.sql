{{ config(materialized='table') }}

WITH tb1 as(
    select
    P_PARTKEY AS PARTKEY ,
	P_NAME AS NAME,
	P_MFGR AS MFGR,
	P_BRAND AS BRAND,
	P_TYPE AS TYPE,
	P_SIZE ,
	P_CONTAINER AS CONTAINER,
	P_RETAILPRICE AS RETAILPRICE,
	P_COMMENT AS COMMENT
from {{source('datafeed_shared_schema','raw_part')}})
select * from tb1