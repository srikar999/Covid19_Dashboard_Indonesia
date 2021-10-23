create view INTERVIEW_DB.PLAYGROUND_PALAVARAPU_SRIKAR.GROWTH_PERCENTAGE_CALCULATION_REPORTING_DAILY as
select date, province, 
CASE WHEN PREVIOUS_DAY_NEW_CASES = 0 THEN 0 ELSE ((new_cases-PREVIOUS_DAY_NEW_CASES)/PREVIOUS_DAY_NEW_CASES)*100 end as new_cases_growth_percentage,
CASE WHEN PREVIOUS_DAY_NEW_deaths = 0 THEN 0 ELSE ((new_deaths-PREVIOUS_DAY_NEW_deaths)/PREVIOUS_DAY_NEW_deaths)*100 end as new_deaths_growth_percentage,
CASE WHEN PREVIOUS_DAY_NEW_recovered = 0 THEN 0 ELSE ((new_recovered-PREVIOUS_DAY_NEW_recovered)/PREVIOUS_DAY_NEW_recovered)*100 end as new_recovered_growth_percentage
from growth_percentage_wrt_lastavlbl_day;