--Students table
DROP TABLE IF EXISTS students;
CREATE TABLE students (
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	group_id INTEGER,
	CONSTRAINT un_stud_name UNIQUE (name),
	CONSTRAINT pk_student PRIMARY KEY (id AUTOINCREMENT),
	CONSTRAINT fn_group FOREIGN KEY (id) REFERENCES groups(id)
);


--Groups description table
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	CONSTRAINT un_group_name UNIQUE (name),
	CONSTRAINT pk_group PRIMARY KEY (id AUTOINCREMENT),
	CONSTRAINT fn_group FOREIGN KEY (id) REFERENCES students(group_id)
);

--Tutors table
DROP TABLE IF EXISTS tutors;
CREATE TABLE IF NOT EXISTS tutors (
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	CONSTRAINT un_tutor_name UNIQUE (name),
	CONSTRAINT pk_group PRIMARY KEY (id AUTOINCREMENT)
);

--Subjects table
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	tutor_id INTEGER NOT NULL,
	CONSTRAINT un_subject_name UNIQUE (name),
	CONSTRAINT pk_subject PRIMARY KEY (id AUTOINCREMENT),
	CONSTRAINT fn_tutor FOREIGN KEY (tutor_id) REFERENCES tutors(id)
	
);

--Marks table
DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
	mark INTEGER CHECK (mark > 0 AND mark <= 5),
	student_id INTEGER NOT NULL REFERENCES students(id),
	tutor_id INTEGER NOT NULL REFERENCES tutors(id),
	subject_id INTEGER NOT NULL REFERENCES subjects(id),
	recieved DATETIME DEFAULT CURRENT_TIMESTAMP
);

