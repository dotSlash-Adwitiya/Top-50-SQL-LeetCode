
# Problem Link : https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50
-- Problem Statement : Find the confirmation rate of all the users and the corresponding ids.
-- The problem requires us to fetch the average as - (Sum of records as 'confirmed' / Total records)
-- New Learning : 0/0 in MySQL will result in NULL
-- NOTE : Joins are executed first then followed by the filtering of the where clause
SELECT s1.user_id, ROUND(COALESCE(
    -- #  AVG Formulat : SUM / Total
    -- # Calculate all the records that have action = 'confirmed'
    SUM( 
        -- # If there are no confirmed records then return 0
        CASE 
            WHEN c1.action = 'confirmed' THEN 1
            ELSE 0
        END
    )
    /
    -- # If there isn't any corresponding record, then this will return NULL,
    -- # Hence use - COALESCE() or NULLIF()
    COALESCE((SELECT COUNT(c1.user_id)), 0)
        ,0)
        , 2)
AS confirmation_rate
FROM Signups s1 
LEFT JOIN Confirmations c1 USING (user_id)
GROUP BY s1.user_id;


# Method - 2
-- USING AVG Function !
SELECT s.user_id,
     ROUND(COALESCE(
                    AVG(
                        CASE
                            WHEN c.action = 'confirmed' THEN 1
                            ELSE 0 
                        END
                        -- IF(c.action = 'confirmed',1,0) IF() works just like ternary operator
                        )
                 ,0)
        , 2)
AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c USING (user_id)
GROUP BY s1.user_id;

-- # Method - 3 Using AVG()
SELECT s.user_id,ROUND(
     AVG(if(c.action = 'confirmed', 1, 0)), 2) as confirmation_rate
FROM Signups s 
LEFT JOIN Confirmations c USING(user_id) GROUP BY c.user_id; 


-- # Method - 4 : Using Common Table Expressions (CTE)

WITH cte AS (
    SELECT a.user_id,
           CASE WHEN b.action = 'confirmed' THEN 1 ELSE 0 END AS confirmed_user,
           CASE WHEN b.action = 'timeout' THEN 1 ELSE 0 END AS timeout_user
    FROM Signups a
    LEFT JOIN Confirmations b ON a.user_id = b.user_id
),
cte2 AS (
    SELECT user_id, 
           SUM(confirmed_user) AS total_confirmed,
           SUM(timeout_user) AS total_timeout,
           SUM(confirmed_user + timeout_user) AS total_request
    FROM cte
    GROUP BY user_id
)
SELECT user_id, 
       ROUND(SUM(IFNULL(total_confirmed / total_request, 0)), 2) AS CONFIRMATION_RATE
FROM cte2
GROUP BY user_id;


-- Practice-1 : NEW LEARNING from below solution :-
-- IF(specify condition on which you want to count as n, n (value you want to add as the condition is satisfied), ELSE - 0)
-- You need to GROUP by based on the table on which you're performing a join.
-- 
SELECT s.user_id, 
ROUND(
    AVG(
        IF(c.action = "confirmed", 1, 0)
    )
, 2) as confirmation_rate
FROM Signups s
LEFT JOIN   
Confirmations c
ON (s.user_id = c.user_id)
GROUP BY s.user_id;

-- You need to take under consideration :-
-- GROUP BY : If one table has the possibility, that it may not contain
-- some records that are present in another table
-- that is, if the left table can have some records that aren't there in right table,
-- THEN - YOu must GROUP BY the Left TAble only !!! Else the solution isn't gonna work !!