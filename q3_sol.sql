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

-- 3. List the names of students who have taken course v4 (crsCode).
-- ANSWER:
-- This query has a lower query cost and execution runtime than the original.
WITH cte AS (SELECT name
			FROM Student
            INNER JOIN transcript ON Student.id = transcript.studID
            WHERE crsCode = @v4)
            
SELECT *
FROM cte