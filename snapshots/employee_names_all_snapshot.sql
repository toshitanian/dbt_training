{% snapshot employee_names_all_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='check',
    check_cols='all',
  )
}}

select * from {{ source('staging', 'employees') }}

{% endsnapshot %}
