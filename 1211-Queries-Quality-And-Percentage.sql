
-- Method - 1 :- (W/O 0 AVG() Function)
SELECT query_name, 
    # Definition of avg given in Q
    ROUND((SUM(rating/position)/COUNT(*)),2) as quality,
     
    # We only need to add it to the sum, if an only if the records has rating < 3. 
    ROUND(SUM(
                CASE WHEN rating < 3 THEN 1
                     ELSE 0
                END
             ) * 100.0 / COUNT(*), 2) as poor_query_percentage 
FROM Queries
GROUP BY query_name;

-- Method - 2 Using AVG()
SELECT query_name,
-- We have to first conver the rating into decimal which can be done by multiplying it by 1.0
  ROUND(AVG((rating * 1.0 )/position), 2) AS quality,

  ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as poor_query_percentage
FROM Queries
GROUP BY query_name;

