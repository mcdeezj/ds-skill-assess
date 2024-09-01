SELECT unit_id, SUM(applicants), fiscal_year, fiscal_month
FROM funnel
GROUP BY unit_id;