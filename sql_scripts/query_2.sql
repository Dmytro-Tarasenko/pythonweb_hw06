--Subjects list:
-- 'Math', 'Data Science', 'HTML+CSS', 'Machine Learning',
-- 'Statistics', 'Python Core', 'Computer Science', 'Algorithms'

SELECT students.name, AVG(marks.mark) AS average_mark
	FROM marks
	INNER JOIN students
		ON marks.student_id = students.id 
	WHERE marks.student_id = marks.student_id AND subject_id = (
			SELECT id FROM subjects WHERE name = 'HTML+CSS'
		)
	GROUP BY marks.student_id 
	ORDER BY AVG(marks.mark) DESC
	LIMIT 1;