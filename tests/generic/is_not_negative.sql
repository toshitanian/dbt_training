{% test is_not_negative(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }}::integer < 0

{% endtest %}
