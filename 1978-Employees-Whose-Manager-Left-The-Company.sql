
Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

--  Find the IDs of the employees whose salary is strictly less than $30000 
-- and whose manager left the company. 
-- When a manager leaves the company, their information is deleted from the Employees table,
--  but the reports still have their manager_id set to the manager that left.

-- Return the result table ordered by employee_id

---- !!!! Explanation : Basically, we need to lookup the employee_ids whose manager_ids are not present
---- !!!! in employee_id column 

SELECT employee_id FROM Employees 
-- # In the employee table, we need to look which manager_id doesn't exists in employee_id
WHERE manager_id NOT IN (
    # Fetch all employees
    SELECT employee_id FROM Employees WHERE manager_id 
)
AND salary < 30000
ORDER BY employee_id;


-- # Method - 2 
-- Use LEFT JOIN
