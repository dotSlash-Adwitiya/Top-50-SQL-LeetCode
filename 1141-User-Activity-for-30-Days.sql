

--  New things Learnt :
-- You need to group by the columns, corresponding to which you have to COUNT()
-- Ex : I needed to count the users corresponding to the DATES.
-- So, in this scenario I'll group by the DATES, Not the USERS!
-- My Errors always :Confused from which column should I be groupping by.
-- When to use COUNT(DISTINCT)
-- 

SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users 
FROM Activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date; 