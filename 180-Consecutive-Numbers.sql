
-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 

-- Find all numbers that appear at least three times consecutively.

-- Here, we need a num which appears thrice, consecutively.
-- Because of the word - Consecutive, we can't use group by or Count to find the solution
-- So, we can basically create 3 instance of our table, then join each of them on a certain condition

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
INNER JOIN logs l2 ON l2.num = l1.num AND l2.id = l1.id + 1
INNER JOIN logs l3 ON l3.num = l2.num AND l3.id = l2.id + 1; -- Or (l1.id+2).

-- l1.id = l2.id + 1 AND l2.num = l1.num : This will join 2 instances where id is consecutive and num too.
-- l3.id = l2.id + 1 (Or l3.id = l1.id + 2) AND l2.num = l3.num (Or l1.num = l3.num)
-- The above line will join the table l2 on l3 whereever the consecutive ids (after l1.id's tables) are
-- found to be the same
