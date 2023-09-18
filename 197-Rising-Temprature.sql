# Problem Link : https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

-- # Problem Statement : You're given a table - Weather {id, recordDate,temprature}
-- # Find the datesID on which the temperature was greater than the previous day (YESTERDAY)


-- # Method - Use SELF-JOIN, DATEDIFF() is the function which subtracts 2 dates, 1st param > 2nd param to get a +ve value
SELECT w1.id FROM  Weather w1 
JOIN Weather w2 WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 
AND w1.recordDate > w2.recordDate;