# Problem Link : https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&envId=top-sql-50
-- Problem statement : Fetch the no of classes, having at least 5 students enrolled.

SELECT class 
FROM Courses 
GROUP BY class HAVING COUNT(*) >= 5;