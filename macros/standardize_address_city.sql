{% macro standardize_address_city(column_name) %}
    upper({{ column_name }})
{% endmacro %}