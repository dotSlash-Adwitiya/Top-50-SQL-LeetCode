# Problem Link : https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50
-- Problem Statement : Tables - Transactions{id int, country VARCHAR, state enum, amt int, trans_date DATE}
-- We're required to fetch followingthings : Year + Month, Total transaction count,
-- Cnt of transactions which are approved, Total amount of every transaction
-- Amount of total approved transactions
-- For EVERY -->> country fetch the above for every month  

-- # LPAD() :LPAD(MONTH(order_date), 2, '0') uses the LPAD function to ensure that the month part always has two digits. If the month is a single digit (e.g., '1' for January), it adds a '0' to the left, making it '01'. If the month is already two digits (e.g., '10' for October), it doesn't change it.
SELECT CONCAT(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, '0')) AS month, country, 
        COUNT(*) as trans_count, 
        
        -- # COUNT wherever state is approved
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
        SUM(amount)  AS trans_total_amount ,
        
        -- # Sum the amount wherever state is approved 
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM Transactions 
GROUP BY country, month;
