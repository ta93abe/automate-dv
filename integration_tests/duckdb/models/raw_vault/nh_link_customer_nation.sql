{{ config(materialized='incremental') }}

{%- set src_pk = "CUSTOMER_NATION_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "NATION_HK"] -%}
{%- set src_payload = ["CUSTOMER_NAME"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set source_model = "stg_customer" -%}

{{ automate_dv.nh_link(
    src_pk=src_pk,
    src_fk=src_fk,
    src_payload=src_payload,
    src_extra_columns=none,
    src_eff=src_eff,
    src_ldts=src_ldts,
    src_source=src_source,
    source_model=source_model
) }}
