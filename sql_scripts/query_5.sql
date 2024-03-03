-- Courses by tutor
-- Tutors = ['Dr. Benjamin Garrett', 'Proff. Susan Ellison', 'Dr. Renee Wilkins'
--           'Ph.D. Kimberly Brandt', 'Dr. Daniel Watkins', 'Ph.D. David Taylor']

SELECT name FROM subjects
	WHERE tutor_id  = (SELECT id FROM tutors 
						WHERE name = 'Dr. Renee Wilkins');
