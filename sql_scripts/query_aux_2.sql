--Subjects list:
-- 'Math', 'Data Science', 'HTML+CSS', 'Machine Learning',
-- 'Statistics', 'Python Core', 'Computer Science', 'Algorithms'
-- Groups = ['Group-1', 'Group-2', 'Group-3']
-- 'Data Science' 'Group-2' => 2 results

SELECT stud.name, mark, sub.name, g.name, recieved 
	FROM marks m
		INNER JOIN students stud
			ON m.student_id = stud.id
		INNER JOIN subjects sub
			ON	m.subject_id = sub.id
		INNER JOIN groups g 
			ON g.id = stud.group_id
	WHERE sub.name  = 'Data Science' 
		AND g.name = 'Group-2'
		AND recieved = (SELECT MAX(recieved) FROM marks m2
							INNER JOIN students stud2
								ON m2.student_id = stud2.id
							INNER JOIN subjects sub2
								ON	m2.subject_id = sub2.id
							INNER JOIN groups g2 
								ON g2.id = stud2.group_id
							WHERE sub2.name = 'Data Science'
								AND g2.name = 'Group-2');