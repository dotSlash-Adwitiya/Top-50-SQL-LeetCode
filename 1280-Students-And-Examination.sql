-- # Now, since we're given 3 tables,
-- # We need to count the records existing in examination corresponding to the combination of two attributes
-- # And further, these 2 attributes exist in 2 different table
-- # So, 1st - Perform a CROSS join in between of these 2 attributes
-- # Then find corresponding to this combo how many records exist in Examination table

SELECT st.student_id, st.student_name, sb.subject_name, COUNT(e.student_id) AS attended_exams 
FROM Students st
CROSS JOIN Subjects sb
LEFT JOIN Examinations e 
ON st.student_id = e.student_id
AND sb.subject_name = e.subject_name
GROUP BY st.student_id, st.student_name, sb.subject_name
ORDER BY st.student_id, sb.subject_name; 

-- # We need 4 columns in the resulting table, out of which 3 will always be unique. 
-- Hence, apply a group by
-- # on those 3 unique columns, 
-- And since we're counting the no of corresponding records in the examination table, 
-- then hence, we will use one of the column to count from the examination table.