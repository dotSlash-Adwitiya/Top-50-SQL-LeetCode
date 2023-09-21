
# Problem Link : https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50
-- Problem statement : Fetch the movies which has their description NOT Boring and id is odd. 

SELECT * FROM Cinema WHERE id % 2 = 1 AND description <> "boring"
ORDER BY rating DESC;

