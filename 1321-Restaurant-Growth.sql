# Problem Link : https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.

# -- Learnings :- 
-- How to execute Sub query - VERY BASIC THING
-- DATE_SUB() and DATE_ADD()
-- INTERVAL N DAY/MONTH/YEAR
-- Use of Co-related SubQuery.


SELECT 
    c3.visited_on,
    (
        SELECT SUM(amount) 
        FROM Customer c1 
        WHERE c1.visited_on BETWEEN DATE_SUB(c3.visited_on, INTERVAL 6 DAY) AND c3.visited_on
    ) AS amount,    
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM Customer c2
            WHERE c2.visited_on BETWEEN DATE_SUB(c3.visited_on, INTERVAL 6 DAY) AND c3.visited_on
        ),
        2
    ) AS average_amount
FROM Customer c3
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer 
)
GROUP BY visited_on
ORDER BY visited_on;


