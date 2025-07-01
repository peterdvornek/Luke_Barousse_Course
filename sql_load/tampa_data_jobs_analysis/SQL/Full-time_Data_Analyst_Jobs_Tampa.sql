/*
Question: What are the top paying full-time data analyst jobs in Tampa, FL?
- Identify the top 20 paying Data Anaylst roles that are available in Tampa, FL
- Only jobs that have salaries listed and are Full-Time
- Why? Highlight the opportunities for Data Analyst, in Tampa, FL
*/

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
        LEFT JOIN company_dim
            ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Tampa, FL' AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    20

    