# Approach
-- I want to get sum of all the weights till the ith approach
-- I can get this by matching row of t turn with all the rows having turn <= t using the following query:
  SELECT q1.turn, SUM(q2.weight) as weight
  FROM Queue q1 JOIN Queue q2
  ON q1.turn >= q2.turn -- choose all turn smaller than q1.turn
  GROUP BY q1.turn -- to take the sum till smaller turn
  ORDER BY q1.turn; -- order by is for better visibility

-- NOTE : To calculate the sum till ith row, in this context can be done by [V.IMP] to solve this problem
-- Matching the columns <= turn values. That is the turn values, in 1st instance >= 2nd instance.


-- Whenever you need to calculate cummulative summ till a specific row, you need to find a column
-- Which defines the order of execution. In this case, the turn values defined which person will go in first.
-- So, q2.turn <= q1.turn. Ex : if q2.turn = 3. It will join all the records >= 3 in q1. instance

# Method - 1 Using INNER JOIN
SELECT q1.person_name FROM Queue q1
INNER JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000 
ORDER BY SUM(q2.weight) DESC
LIMIT 0,1;