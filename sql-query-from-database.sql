-- the select statement was incorrect and was missing the "Sum of applicants" field the R script expects. 
-- for readability I also indented the script
SELECT 
    unit_id, 
    SUM(applicants) AS sum_of_applicants, 
    fiscal_year, fiscal_month
FROM 
    funnel
GROUP BY 
    unit_id; 
    -- added missing fields
    fiscal_year, fiscal_month;
    