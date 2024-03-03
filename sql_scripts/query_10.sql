-- Students [ Adrian Hughes, Amber Salazar, Amber Warren, Anna Aguilar, Anna Austin,
--            Anna Norton, Barbara Arnold, Charles Olsen, Daniel Carter, David Edwards,
--            Deborah Thomas, Dennis Anderson, Derrick Adams, Jacob Daniel, Johnathan Flores,
--            Jonathan Gregory, Jonathan Mitchell, Julia Smith, Kathryn Anderson, Krista Baxter,
--            Lisa Lewis, Lisa Perry, Lynn Swanson, Maria Burgess, Mary Martinez, Mary Taylor,
--            Melissa Shaffer, Michael Alvarez, Michael Cooper, Michael Smith, Misty George,
--            Molly Graham, Natasha Calderon, Nathan Alvarez, Olivia Miller MD, Patricia Greer,
--            Patrick Thompson, Paula Hart, Rachel Fox, Randy Irwin, Rebecca West, Robert Pope,
--            Robert Williams, Savannah Moss, Scott Baker, Sherri Cline, Susan Montgomery,
--            Veronica Martinez, William Castaneda, William Kent ]
-- -- Tutors = ['Dr. Benjamin Garrett', 'Proff. Susan Ellison', 'Dr. Renee Wilkins'
--           'Ph.D. Kimberly Brandt', 'Dr. Daniel Watkins', 'Ph.D. David Taylor']

SELECT stud.name, sub.name, t.name
	FROM marks m
		INNER JOIN students stud
			ON m.student_id = stud.id
		INNER JOIN subjects sub
			ON m.subject_id  = sub.id
		INNER JOIN tutors t
			ON m.tutor_id  = t.id
	WHERE stud.name = 'Paula Hart' 
		AND t.name = 'Dr. Benjamin Garrett'
	GROUP BY sub.name;