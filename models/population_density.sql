create view INTERVIEW_DB.PLAYGROUND_PALAVARAPU_SRIKAR.POPULATION_DENSITY_NEW_CASES_REPORTING as
select date,province,sum(base.new_cases) as cases,location.population_density from datewise_coviddata base
left outer join location_details location
on base.location_iso_code=location.location_iso_code
where province is not NULL
group by province,date,population_density
order by population_density desc;