# Problem link : https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50
# Problem Statement : Table : {id, name, department, managerId}
# No employee will be the manager of themselves that is, 
# No such employee will exists who have their own id as managerId

-- # Find the managers with at LEAST 5 direct reports !
-- # Solution : We basically need to find, the employees, with name who has an id in the 
--  # managerId column at least 5 times  

-- Compare all the id's one by one with the managerId Column and output the result if
-- any of them are present at least 5 times 
# Method - 1 : (USING Co-related subquery)
SELECT e1.name FROM Employee e1
WHERE 5 <= (
  SELECT COUNT(e2.managerId) FROM employee e2
  WHERE e1.id = e2.managerId
);

# Method - 2 : (Using Subquery)

-- We need to find the name of employee, who's id is present in the managerId column at least 5 times.

--  Step-1 : Find all the id's which are present 5 times in the managerId column By doing :
SELECT managerId FROM Employee
GROUP BY managerId HAVING COUNT(managerId) >= 5;

-- Step-2 : Now, look for the employee names who's id match with the managerId WHERE count >= 5
# SELECT name FROM Employee WHERE id = (subquery)

-- Full Subquery solution : 

SELECT name FROM Employee 
WHERE id = (  -- You can use = symbol or IN here.
  SELECT managerId FROM Employee
  GROUP BY managerId HAVING COUNT(managerId) >= 5
)

# Method - 3 : (using INNER JOIN)
-- We're certain that we'll have the values in mangerId column that are present in the 
-- id column only. So, we can use this as our base to perform an INNER JOIN
-- After performing the inner join, we'll have the matching records from both table where
-- the previous criteria is TRUE. So, now there can be multiple such records, so we can group them
-- by mangerId and Fetch whereever after grouping, the count is at least 5.
SELECT e1.name FROM Employee e1 
INNER JOIN Employee e2 WHERE e1.id = e2.managerId
GROUP BY e2.managerId HAVING COUNT(e2.managerId) >= 5;