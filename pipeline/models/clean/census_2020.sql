{% set category_columns = ([
    "hefaminc",     
    "pemlr",            
    "puretot",          
    "pudis",      
    "pudis1",     
    "pudis2",     
    "pemjot",     
    "hrhtype",    
    "peret1",     
    "pedwwnto",   
    "prmjind1",   
    "prdtocc2",   
    "peio1icd",   
    "peio2icd",   
    "pehrrsn1",   
    "pehrrsn2",   
    "pehrrsn3",   
    "gereg",      
    "gediv",      
    "gestfips",   
    "gtcbsasz",   
    "pemaritl",   
    "prpertyp",   
    "pesex",      
    "peeduca",    
    "ptdtrace",   
    "pehspnon",   
    "prdthsp",    
    "prfamtyp",   
    "penatvty",   
    "pemntvty",   
    "pefntvty",   
    "hrintsta",   
    "prcitshp"    
 ]) %}


{% set numeric_columns = ([  
    "pehrusl1",                
    "pehrusl2",                
    "pehruslt",                
 ])                        %}


{{
    config(
        materialized='incremental'
    )
}}

SELECT
    hrhhid || '-' || hrhhid2 || '-' || hryear4 || '-' || hrmonth || '-' || occurnum as id,   -- unique id
    {% for column_name in category_columns %}
    CASE 
        WHEN {{column_name}} IN (SELECT key FROM {{ source('warehouse', 'census_2020_kb') }} WHERE lower(column) = '{{column_name}}')
        THEN {{column_name}}
        ELSE NULL
    END AS {{column_name}},
    {% endfor %}
    {% for column_name in numeric_columns %}
    CASE 
        WHEN {{column_name}} = '-4' THEN -4
        WHEN
            CAST({{column_name}} AS INTEGER)
            BETWEEN
                (SELECT CAST(key AS INTEGER) FROM {{ source('warehouse', 'census_2020_kb') }} WHERE lower(column) = '{{column_name}}' AND value = 'MIN VALUE')
            AND
                (SELECT CAST(key AS INTEGER) FROM {{ source('warehouse', 'census_2020_kb') }} WHERE lower(column) = '{{column_name}}' AND value = 'MAX VALUE')
        THEN CAST({{column_name}} AS INTEGER)
        ELSE NULL
    END as {{column_name}},
    {% endfor %}
    CASE
        WHEN prtage = '' THEN NULL
        WHEN CAST(prtage AS INTEGER) BETWEEN 0 AND 85 THEN CAST(prtage AS INTEGER)
        ELSE NULL
    END AS prtage
FROM
    {{ source('warehouse', 'census_2020_data') }}
WHERE
    hrintsta = '1'
    {% if is_incremental() %}
    AND CAST(hrmonth as INTEGER) > (SELECT MAX(CAST(hrmonth AS INTEGER)) FROM {{ this }})
    {% endif %}
