# Write your MySQL query statement below

-- # The timestamps need to be of same process, one process id, could exist in another machine_id
-- # So, we first need to group by machine_id, then process_id, then activity_type must be = start and end
-- # Then the timestamp from which we're subtracting, must be > then the one which is to be subtracted

-- # Method - 1 : INNER JOIN
SELECT A1.machine_id, ROUND(AVG(A2.timestamp-A1.timestamp),3) as processing_time
FROM Activity A1 JOIN Activity A2 

-- # Following conditions on which we need to perform a JOIN
WHERE A1.machine_id = A2.machine_id
AND A1.process_id = A2.process_id 
AND A1.activity_type = 'start' 
AND A2.activity_type = 'end' 

-- In the end, we need the result set, GROUPED_BY machined_id
GROUP BY machine_id ORDER BY machine_id;