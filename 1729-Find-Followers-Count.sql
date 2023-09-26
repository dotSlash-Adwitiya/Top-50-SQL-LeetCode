# Problem Link : https://leetcode.com/problems/find-followers-count/?envType=study-plan-v2&envId=top-sql-50
-- Problem Statement : Find the count of followers for every user
-- Table Structure : Followers{user_id, follower_id}

SELECT user_id, COUNT(follower_id) as followers_count 
FROM Followers GROUP BY user_id ORDER BY user_id ASC;