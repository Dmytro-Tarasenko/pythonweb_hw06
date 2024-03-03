SELECT students.name, AVG(marks.mark) AS average_mark
	FROM marks
	INNER JOIN students
		ON marks.student_id = students.id 
	WHERE marks.student_id = marks.student_id
	GROUP BY marks.student_id 
	ORDER BY AVG(marks.mark) DESC
	LIMIT 5;