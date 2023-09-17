-- 1st Table - Sales : sale_id, product_id, year, qty, price PK-{sale_id, year}, FK-{product_id}.
-- 2nd Table - Product : product_id, name. Pk-{product_id}

-- Problem statement : We have to query the product_name, year, price for each sale_id in sales table

SELECT p.product_name, s.year, s.price FROM Sales s
INNER JOIN Product p USING(product_id);