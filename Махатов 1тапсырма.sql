CREATE TABLE teachers (id SERIAL PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TABLE subjects (id SERIAL PRIMARY KEY, name VARCHAR NOT NULL, teacher_id INT REFERENCES teachers(id));
CREATE TABLE students (id SERIAL PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TABLE marks (id SERIAL PRIMARY KEY, student_id INT REFERENCES students(id), subject_id INT REFERENCES subjects(id), mark INT CHECK (mark BETWEEN 1 AND 10));

INSERT INTO teachers (name) VALUES
('Erlan agai'),
('Madina apai'),
('Serik agai');

INSERT INTO students (name) VALUES
('Alisher'),
('Dana'),
('Miras'),
('Kamila'),
('Rustem');

INSERT INTO subjects (name, teacher_id) VALUES
('Алгебра', 1),
('География', 2),
('Литература', 3),
('Программирование', 1),
('Физкультура', 2);

INSERT INTO marks (student_id, subject_id, mark) VALUES
(1, 1, 6), 
(1, 4, 8),
(2, 1, 9),  
(3, 2, 7),  
(4, 3, 5),  
(5, 4, 10), 
(1, 5, 8),  
(2, 5, 7),  
(3, 1, 10),  
(4, 2, 6), 
(5, 3, 9);

SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM subjects;
SELECT * FROM marks;

SELECT t.id AS teacher_id, t.name AS teacher_name, COUNT(DISTINCT m.student_id) AS student_count
FROM teachers t
JOIN subjects s ON t.id = s.teacher_id
JOIN marks m ON s.id = m.subject_id
GROUP BY t.id, t.name
ORDER BY student_count DESC;
