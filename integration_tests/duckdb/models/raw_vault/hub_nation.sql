{{ config(materialized='incremental') }}

{%- set src_pk = "NATION_HK" -%}
{%- set src_nk = "NATION_ID" -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set source_model = "stg_customer" -%}

{{ automate_dv.hub(
    src_pk=src_pk,
    src_nk=src_nk,
    src_extra_columns=none,
    src_ldts=src_ldts,
    src_source=src_source,
    source_model=source_model
) }}
