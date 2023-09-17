
# Solution 1
SELECT name FROM CUSTOMER WHERE referee_id <> 2 OR referee_id IS NULL;

# Solution 2 
SELECT name  FROM Customer WHERE COALESCE(referee_id,0) <> 2;

-- Herec COLAESC used to replace NULL values with 0. Basically :
-- CASE
--  WHEN referee_id = NULL THEN 0
-- END 
