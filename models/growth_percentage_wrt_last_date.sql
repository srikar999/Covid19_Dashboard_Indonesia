create view INTERVIEW_DB.PLAYGROUND_PALAVARAPU_SRIKAR.PROVINCE_WISE_STATUS_PERCENTAGES as
select date,province,total_active_cASES,total_death_cases,total_recovered_cases,(total_active_cases/population)*100 as active_percentage,
(total_recovered_cases/population)*100 as recovered_percentage,
(total_death_cases/population)*100 as death_percentage,
((total_active_cASES+total_death_cases+total_recovered_cases)/population)*100 as affected_percentage  from 
(select date,province,sum(base.total_active_cASES) as total_active_cases,
sum(base.total_recovered) as total_recovered_cases,sum(base.total_deaths) as total_death_cases,location.population from datewise_coviddata base
left outer join location_details location
on base.location_iso_code=location.location_iso_code
group by province,date,population);