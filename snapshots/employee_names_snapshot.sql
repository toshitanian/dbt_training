{% snapshot employee_names_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='timestamp',
    updated_at='loaded_at',
  )
}}

select * from {{ source('staging', 'employees') }}

{% endsnapshot %}
