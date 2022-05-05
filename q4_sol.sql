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

-- 4. List the names of students who have taken a course taught by professor v5 (name).
-- ANSWER:
-- Not sure if the query execution time improves because the original query doesn't produce a result.
-- After checking the provided tables, this seems like the correct answer
-- Examining the execution plan makes me think the query is inefficient because it performs 4 Full Table Scans resulting in 1000 rows being read
WITH profTeaches AS (SELECT prof.name AS profName,
							prof.id AS profID,
							teach.crsCode AS crsCode
					FROM professor AS prof
					INNER JOIN teaching AS teach ON prof.id = teach.profId
					WHERE prof.name = @v5),
	studTrans AS (SELECT trans.studID,
						trans.crsCode AS crsCode,
						stud.name AS studName
				FROM transcript as trans
				INNER JOIN student AS stud on trans.studID = stud.id)
            
SELECT *
FROM studTrans
INNER JOIN profTeaches ON studTrans.crsCode = profTeaches.crsCode