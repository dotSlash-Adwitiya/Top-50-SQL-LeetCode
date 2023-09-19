# Problem Link : https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50
-- Problem Statement : Given 2 tables Employee : {empId, name, supervisor, salary}, PK : {empId}
-- Bonus {empId, bonus}, FK : {empId}
-- We need to fetch the employee, with bonus < 1000, and for employees who doesn't receive the bonus FETCH NULL FOR THEM
-- A littile more break down - If the bonus table doesn't have a corresponding record reffering to the employee
-- in the employee, table for them we have to fetch null 

-- # ERROR Where I got stuck : 
-- # I need to fetch all the emp from the left table, where bonus < 1000
-- # AND if bonus doesn't exists then fetch null corresponding to them

-- # New Learning : You can use - WHERE CLAUSE after performing a JOIN

# Method - 1 :-
-- Using Left JOIN : 
SELECT e.name, b.bonus
FROM Employee e 
LEFT JOIN Bonus b USING(empId)
WHERE b.bonus < 1000 || b.bonus IS NULL;

# Method - 2 :-
-- Using RIGHT JOIN (Taking emp table on the right and bonus on left !)
SELECT e.name, b.bonus
FROM Bonus b 
RIGHT JOIN Employee e USING(empId)
WHERE b.bonus < 1000 || b.bonus IS NULL;