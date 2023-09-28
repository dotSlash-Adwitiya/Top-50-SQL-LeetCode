
SELECT e1.employee_id, e1.name, COUNT(e2.reports_to) as reports_count,
    ROUND(AVG(e2.age)) as average_age
 FROM Employees e1
 
-- Perform an inner JOIN wherever, we find that the emp_id = reports_to
INNER JOIN Employees e2 ON e1.employee_id = e2.reports_to

-- NEW Learning : Using Group BY will help us grouping the value, so now if use the aggregate function
-- Then the NULL VALUES Won't come in result output !
GROUP BY e1.employee_id, e1.name
ORDER BY employee_id;

-- USE-CASE for group by : 
-- 1. Eliminate Duplicate values
-- 2. Eliminate NULL VALUES, if they're coming in the result output.