-- Groups = ['Group-1', 'Group-2', 'Group-3']

SELECT name	FROM students
	WHERE group_id = (SELECT id FROM groups WHERE name = 'Group-2');