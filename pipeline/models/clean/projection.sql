
SELECT
    HRHHID || '-' || HRHHID2 as id,    -- househould id
    HEFAMINC,   -- family income
    PEMLR,      -- employment status
    PURETOT,    -- retirement status
    PUDIS,      -- disability status
    PUDIS1,     -- disability affects work 1
    PUDIS2,     -- disability affects work 2
    PEMJOT,     -- number of jobs
    HRHTYPE,    -- household type
    PEHRUSL1,   -- main job hours
    PEHRUSL2,   -- alt job hours
    PEHRFTPT,   -- total job hours > 35
    PEHRUSLT,   -- total hours
    PERET1,     -- want a job?
    PEDWWNTO,   -- want any job?
    PRMJIND1,   -- broad occupation industry
    PRDTOCC2,   -- detailed occupation industry
    PEIO1ICD,   -- industry code primary job
    PEIO1OCD,   -- occupation code primary job
    PEIO2ICD,   -- industry code second job
    PEIO2OCD,   -- occupation code second job
    PEHRRSN1,   -- main reason work part time
    PEHRRSN2,   -- main reason no full time work
    PEHRRSN3,   -- reason working < 35h
    GEREG,      -- geographic region
    GEDIV,      -- geographic division
    GESTFIPS,   -- geographic state
    GTCBSASZ,   -- area population size
    PRTAGE,     -- age
    PEMARITL,   -- marital status
    PRPERTYP,   -- person type
    PESEX,      -- sex
    PEEDUCA,    -- education
    PTDTRACE,   -- race
    PEHSPNON,   -- hispanic/non hispanic
    PRDTHSP,    -- hispanic origin
    PRFAMTYP,   -- family type
    PENATVTY,   -- country of birth
    PEMNTVTY,   -- mother's country of birth
    PEFNTVTY,   -- father's country of birth
    PRCITSHP    -- citizenship
FROM
    hive.warehouse.census_2020_data
WHERE
    HRINTSTA = '1' -- complete interview
