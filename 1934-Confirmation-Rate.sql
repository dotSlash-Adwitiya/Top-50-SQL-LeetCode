
-- The problem requires us to fetch the average as - (Sum of records as 'confirmed' / Total records)
-- New Learning : 0/0 in MySQL will result in NULL

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
