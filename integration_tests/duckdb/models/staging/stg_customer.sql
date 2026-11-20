{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: raw_customer
derived_columns:
  RECORD_SOURCE: "!1"
  LOAD_DATETIME: BOOKING_DATE
  EFFECTIVE_FROM: BOOKING_DATE
hashed_columns:
  CUSTOMER_HK: CUSTOMER_ID
  NATION_HK: NATION_ID
  CUSTOMER_NATION_HK:
    - CUSTOMER_ID
    - NATION_ID
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - CUSTOMER_NAME
      - CUSTOMER_PHONE
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
    include_source_columns=true,
    source_model=metadata_dict['source_model'],
    derived_columns=metadata_dict['derived_columns'],
    hashed_columns=metadata_dict['hashed_columns']
) }}
