USE springboardopt;
-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 1. List the name of the student with id equal to v1 (id).
-- ANSWER:
-- After introducing an index to Student.id, this query resulted in the quickest execution time.
-- Without the index, this query still runs slightly faster than the original 
WITH cte AS (SELECT name
			FROM Student
			WHERE id = @v1)
            
SELECT *
FROM cte

