
-- Table : Teacher : {teacher_id, subject_id, dept_id}
-- Combo of subject_id + dept_id = PK
-- Find the number of UNIQUE subject taught by every teacher.
-- Every teacher here means we need to group the data by teachers_id and then look for unique subject 
-- taught by each of them and count them.

-- We can group by 1 column, then cnt the values corresponding to that grouped column. 
-- That's what we're doing here.
SELECT teacher_id, 
COUNT(DISTINCT subject_id) as cnt FROM Teacher
GROUP BY teacher_id;