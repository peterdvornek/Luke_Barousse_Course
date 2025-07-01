/*
Question: What are the top paying full-time data analyst jobs in Tampa, FL?
- Identify the top 20 paying Data Anaylst roles that are available in Tampa, FL
- Add the specific skills required for these roles
- Only jobs that have salaries listed and are Full-Time
- Why? Highlight the opportunities for Data Analyst, in Tampa, FL
*/

-- Gets full-time Data Anaylst roles in Tampa FL
WITH full_time_data_analyst_tampa AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
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
    LIMIT 20
)

-- Skills required for full-time data analyst jobs in Tampa, FL

SELECT
    full_time_data_analyst_tampa.*,
    skills
FROM full_time_data_analyst_tampa
    INNER JOIN skills_job_dim ON full_time_data_analyst_tampa.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
