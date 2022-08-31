{{
    config(
        materialized='incremental'
    )
}}
--
select
	"employee_id",
	concat("first_name", ' ', "last_name") as full_name
from
	"dbt_training"."raw"."employees"
where "employee_id" <> '{{ var("skip_employee_id") }}'

{% if is_incremental() %}

	and "employee_id" not in (select "employee_id" from {{ this }})

{% endif %}
