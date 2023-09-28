Problem Link : https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50
Table: Employee
-- +---------------+---------+
-- | Column Name   |  Type   |
-- +---------------+---------+
-- | employee_id   | int     |
-- | department_id | int     |
-- | primary_flag  | varchar |
-- +---------------+---------+
-- (employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
-- employee_id is the id of the employee.
-- department_id is the id of the department to which the employee belongs.
-- primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.
 
-- Problem Statement : Fetch the employee's primary department along with empid. 
-- Catch is, if the emp has single department, then the primary_Flag will be 'N'
-- You also need to fetch employees with single department.

-- Method-1 : Subquery Solution
SELECT employee_id, department_id
FROM Employee WHERE primary_flag = 'Y' OR employee_id IN 
(SELECT employee_id FROM Employee GROUP BY employee_id HAVING COUNT(employee_id) = 1);

-- Problems Encountered : Subquery returns more than 1 row. 
-- So, I replaced - = (operator) with - IN Operator.

-- My error : I used where clause as : FROM Employee WHERE COUNT(employee_id) = 1)
-- That's wrong, rather my intention was to fetch the employees who have the count as 1.
-- so I used - HAVING.

-- Method-2 : UNION Solution

-- Step-1 : Fetch employees with 'Y' as their primary flag
SELECT employee_id, department_id
FROM Employee WHERE primary_flag = 'Y'
UNION  -- Step-3 : UNION Both result sets.
-- Step-2 : Fetch employees who have only single department
SELECT employee_id, department_id FROM Employee
GROUP BY employee_id HAVING COUNT(employee_id) = 1;
