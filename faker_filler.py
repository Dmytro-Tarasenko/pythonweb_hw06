"""Faker drived database filler"""
import sqlite3
from faker import Faker
from faker.providers import DynamicProvider, date_time
from random import choice, randint
from collections import namedtuple

fake = Faker()
dt_fake = date_time.Provider(fake)

# Dynamic provider for the subjects
subjects = ['Math', 'Data Science', 'HTML+CSS', 'Machine Learning',
            'Statistics', 'Python Core', 'Computer Science', 'Algorithms']

# Dynamic provider for the scientific grades
science_grade_provider = DynamicProvider(
    provider_name="science_grade",
    elements=['Dr.', 'Ph.D.', 'Proff.', 'Dcnt.']
)


def named_tuple_factory(cursor, row):
    """Row factory for the sqlite3 - named tuple"""
    fields = [col[0] for col in cursor.description]
    Row = namedtuple(typename="Row",
                     field_names=fields)
    return Row(*row)

# Create a connection to the database
conn = sqlite3.connect('training.sqlite')
conn.row_factory = named_tuple_factory
cur = conn.cursor()

fake.add_provider(science_grade_provider)

for _ in range(300):
    tutor = fake.science_grade()+" "+fake.name()
    if _ % 59 == 0:
        cur.execute("INSERT INTO tutors (name) VALUES (?)", (tutor,))
        conn.commit()

for _ in range(3):
    groupname = f"Group-{_+1}"
    cur.execute("INSERT INTO groups (name) VALUES (?)", (groupname,))
    conn.commit()

for _ in range(50):
    student = fake.name()
    group = choice([1, 2, 3])
    cur.execute("INSERT INTO students (name, group_id) VALUES (?, ?)",
                (student, group))
    conn.commit()

for _ in range(8):
    subject = subjects[_]
    tutor = choice([1, 2, 3, 4, 5])
    cur.execute("INSERT INTO subjects (name, tutor_id) VALUES (?, ?)",
                (subject, tutor))
    conn.commit()

students = cur.execute("SELECT * FROM students").fetchall()
for ind, student in enumerate(students):
    stud_id = student.id
    for _ in range(8):
        subject = subjects[_]
        subject_id = (cur.execute("SELECT id FROM subjects WHERE name = ?",
                                 (subject,))
                      .fetchone().id)
        tutor_id = (cur.execute("SELECT tutor_id FROM subjects WHERE name = ?",
                            (subject,))
                    .fetchone().tutor_id)
        marks_num = randint(10, 20)
        for _ in range(marks_num):
            mark = randint(1, 5)
            print(f"Filling data for student ({student.name}) - {ind+1}/{len(students)} "
                  + f"{marks_num} marks for {subject}", end="\r")

            recieved = (dt_fake.date_time_this_year()
                        .strftime("%Y-%m-%d"))
            cur.execute("""INSERT INTO marks 
                                    (mark, student_id, tutor_id, subject_id, recieved) 
                                    VALUES (?, ?, ?, ?, ?)""",
                        (mark, stud_id, tutor_id, subject_id, recieved))
            conn.commit()

conn.close()
print("Filling data for students - Done!")
