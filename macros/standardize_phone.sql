{% macro scrub_phone_number(column_name) %}
    CASE
        WHEN {{ column_name }} IS NULL THEN NULL
        ELSE REGEXP_REPLACE(
            REGEXP_REPLACE({{ column_name }}, '[^0-9]', ''),  -- Remove all non-numeric characters
            '(\d{3})(\d{3})(\d{4})',                     -- Match the numeric pattern
            '(\1) \2-\3'                                 -- Format as (XXX) XXX-XXXX
        )
    END
{% endmacro %}