--Subjects list:
-- 'Math', 'Data Science', 'HTML+CSS', 'Machine Learning',
-- 'Statistics', 'Python Core', 'Computer Science', 'Algorithms'
-- Groups = ['Group-1', 'Group-2', 'Group-3']

SELECT sub.name, g.name, AVG(mark) 
	FROM marks m
		INNER JOIN students stud
			ON m.student_id = stud.id
		INNER JOIN tutors t
			ON	m.tutor_id = t.id
		INNER JOIN subjects sub
			ON	m.subject_id = sub.id
		INNER JOIN groups g 
			ON g.id = stud.group_id
	WHERE m.subject_id = (SELECT id FROM subjects WHERE name = 'Data Science')
	GROUP BY g.name;
