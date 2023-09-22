# Write your MySQL query statement below

SELECT ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) 
            /COUNT(*) * 100.0
         ,2) as immediate_percentage
FROM Delivery
-- Perform above operations on the data that's fetched from below !
-- NEw learning : You can use a Parentheseis() along wit the where clause 
-- and specify certain attributes to search in
WHERE (customer_id, order_date) IN  -- Step-3 : Search for cid and odate 
(
    SELECT customer_id, MIN(order_date) -- Step-2 Fetch 1st date and customer
    FROM Delivery
    GROUP BY customer_id  -- Step-1
);