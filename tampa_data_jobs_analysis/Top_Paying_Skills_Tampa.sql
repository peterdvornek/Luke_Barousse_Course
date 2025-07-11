/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focus on roles with specified salaries, in Tampa, FL
- Why? Ite reveals how different skills impact salary levels for Data Analyst
and helps identify the most finacially rewarding skills to aquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Tampa, FL'
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT
    25