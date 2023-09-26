# Problem Link : https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50
-- Problem Statement : Fetch the num which is largest and appears only once. 

# Method - 1 :
-- Intuition :
-- Step-1 : 1st fetch all the number who're single - (having count = 1)
-- Step-2 : Then find the MAX(num) out of them

-- New learning : You can give an alias to a column and 
-- access that subquery column's result from its ALIAS in OUTER QUERY !

SELECT MAX(num) as num FROM 
                    (
                        SELECT MAX(num) as num 
                        FROM MyNumbers 
                        GROUP BY num HAVING COUNT(num) = 1
                    ) as unique_numbers;  