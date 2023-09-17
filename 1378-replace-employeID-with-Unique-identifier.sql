
-- Problem Statement : You are given 2 tables, Employee - id, name : {id}-PK  And EmployeeUNI - id,unique_id : {id,unique_id}-PK. 
-- Find the employees_id with corresponding unique_id, if theere doesn't exists unique_id then ADD NULL in place of that
# Method - 1 
SELECT e2.unique_id, e1.name FROM Employees e1 
LEFT JOIN EmployeeUNI e2 ON e1.id = e2.id;


# Method - 2
-- USING(id) using CLAUSE is used to join two tables, it takes parameter as the common_column_name <<--- IMPORTANT!!
SELECT e2.unique_id, e1.name
FROM Employees e1
LEFT JOIN EmployeeUNI e2 USING(id);