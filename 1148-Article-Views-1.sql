
-- Its important to note WHY SELF-JOIN won't work here, because we want to match only the records corresponding to current record.
-- And self joint author_id = viewer_id will return the result if 1 id is found in any row of another column !

-- Solution-1, using CASE
# Method-1
SELECT id
FROM (
    SELECT DISTINCT CASE
        WHEN author_id = viewer_id THEN author_id
        ELSE 0 
    END as id
    FROM Views
) as t
WHERE id <> 0
ORDER BY author_id;

-- Whenever your subquery returns a column, make sure you CREATE AN ALIAS for that column, 
-- so that you can directly access it in the outer query ! [IMP !!] 

-- Since in the below query, we haven't written any else, for the remaining records
-- that don't match the WHEN-THEN Criteria, the case statement will return NULL.

# Method-2
SELECT id
FROM (
    SELECT DISTINCT CASE
        WHEN author_id = viewer_id THEN author_id
    END as id
    FROM Views
) as t
WHERE id IS NOT NULL
ORDER BY id;

-- An even more simpler solution
# Method-3
SELECT DISTINCT v1.author_id AS id
FROM Views v1
WHERE v1.author_id = v1.viewer_id
ORDER BY id ASC;

