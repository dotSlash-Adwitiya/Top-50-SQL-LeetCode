
-- Problem statement : Given 3 sides of a triangle, check if these 3 sides will form a triangle.

# Method - 1 : Using CASE WHEN THEN END
SELECT x,y,z, 
            CASE 
                WHEN x+y > z AND x+z > y AND z+y > x THEN 'Yes'
                ELSE 'No'
            END AS triangle
FROM Triangle;


# Method - 2 : Using IF()
SELECT *, IF(x+y>z AND y+z>x AND z+x>y, "Yes", "No") AS triangle FROM Triangle;