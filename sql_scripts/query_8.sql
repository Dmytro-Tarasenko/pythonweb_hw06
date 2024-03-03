-- Tutors = ['Dr. Benjamin Garrett', 'Proff. Susan Ellison', 'Dr. Renee Wilkins'
--           'Ph.D. Kimberly Brandt', 'Dr. Daniel Watkins', 'Ph.D. David Taylor']

SELECT sub.name, ROUND(AVG(mark), 3) as avg_mark, t.name
	FROM marks m
		INNER JOIN tutors t
			ON	m.tutor_id = t.id
		INNER JOIN subjects sub
			ON	m.subject_id = sub.id
	WHERE t.name = 'Proff. Susan Ellison'
	GROUP BY sub.name;
