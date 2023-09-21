SELECT p.project_id, 
ROUND(AVG(e.experience_years),2) as average_years
FROM Project p 
INNER JOIN Employee e 
USING (employee_id)
GROUP BY p.project_id;

-- GROUPING is not neccesarily done by the column we're trying to apply the aggregate() on !
-- It can be even done by the columns which we're trying to fetch