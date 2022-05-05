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

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
-- ANSWER:
-- This query reduces the rows examined from 6600 down to 600
-- This query also reduces the execution time by a decimal point (.0052 to .00078)

WITH cte AS (SELECT stud.name AS name,
					crs.deptId AS deptId
			FROM student AS stud
            INNER JOIN transcript AS trans ON stud.id = trans.studId
            INNER JOIN course AS crs ON trans.crsCode = crs.crsCode)
            
SELECT name
FROM cte
WHERE deptId = @v6 AND deptId NOT IN (@v7)

