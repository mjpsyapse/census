Example redash:
```
with aggs(cnt, want_job, sex) as (
select
    count(*),
    peret1,
    pesex
from
    warehouse.census_2020
group by
    peret1,
    pesex
)
select
    c.cnt,
    kb_sex.value as sex,
    kb_job.value as want_job
from
    aggs c
left join
    warehouse.census_2020_kb kb_sex
on
    lower(kb_sex.column) = 'pesex' AND kb_sex.key = c.sex
left join
    warehouse.census_2020_kb kb_job
on
    lower(kb_job.column) = 'peret1' AND kb_job.key = c.want_job
where
    want_job is not null
```
