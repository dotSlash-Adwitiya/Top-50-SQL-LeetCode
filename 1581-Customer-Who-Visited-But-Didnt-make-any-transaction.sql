
-- # Problem statement : 2 Tables - 1st table Visits : {visit_id, customer_id}, 2nd Table : {transaction_id, visit_id, amount}
-- # We need to query the customer_id for the customers who visited but didn't made any transaction. And the count of such visits.

-- The corelated subquery will fetch me the vis id
-- Check how many visit_id are not found in the transaction table, if they're not found then
-- our subquery will return 0
-- So, if it returns 0, that means this row must be included in our result set !

-- Group BY is important here, because we need to find the count() of visits made by the customer without making any transaction, and there can be multiple such visits

SELECT v.customer_id, COUNT(v.customer_id) as count_no_trans FROM Visits v
    WHERE 0 = (
    SELECT COUNT(t.visit_id) FROM Transactions t 
    WHERE t.visit_id = v.visit_id
  ) GROUP BY v.customer_id;