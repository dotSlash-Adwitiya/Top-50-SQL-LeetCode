
#Problem Link : https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50
# Problem Statement : Write a solution to report the customer ids from the Customer table 
# that bought all the products in the Product table.

# Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+

# Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+

# Output : 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+

SELECT customer_id FROM Customer  
GROUP BY customer_id 
-- DISTINCT Keyword is very crucial in this context.
-- It helps in finding DISTINCT Product keys
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- Ex : If we have : {1,5}, {1,5}, {1,5}, {1,6} : 
-- Then due to DISTINCT Keyword This will be counted as - 2. 
-- Because, we're trying to count the DISTINCT Values present in product_key Column (2nd column)

