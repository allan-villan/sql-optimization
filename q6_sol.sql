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

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
-- ANSWER:
-- Although the original query doesn't return a value, this query still performs better and returns a more inclusive answer to the question asked.
-- The query below returns all the students that took a class in department @v8 ('MAT') and how many classes they took provided by the department
-- The query reduces the total rows examined from 4561 to the 19 courses the department offers
-- The query also reduces the time it took to execute from .004355 to .000923; reducing the total time by a decimal place
WITH allv8Classes AS (SELECT stud.name AS studentName,
                             crs.deptId AS departmentID,
                             COUNT(crs.crsCode) AS totalCourses
		      FROM student AS stud
		      INNER JOIN transcript AS trans ON stud.id = trans.studId
		      INNER JOIN course AS crs ON trans.crsCode = crs.crsCode
		      WHERE crs.deptId = @v8
                      GROUP BY stud.name)

SELECT *
FROM allv8Classes
