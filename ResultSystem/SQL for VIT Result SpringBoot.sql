CREATE DATABASE IF NOT EXISTS vit_result;
USE vit_result;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prn VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(100) NOT NULL,
    semester INT NOT NULL
);

CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE marks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    
    mse DECIMAL(5,2) NOT NULL,
    ese DECIMAL(5,2) NOT NULL,

    CONSTRAINT fk_marks_student
        FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_marks_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT unique_student_subject
        UNIQUE (student_id, subject_id),

    CONSTRAINT check_mse
        CHECK (mse >= 0 AND mse <= 30),

    CONSTRAINT check_ese
        CHECK (ese >= 0 AND ese <= 70)
);

SELECT * FROM subjects;

INSERT INTO students (prn, name, branch, semester) VALUES
('VIT2026001', 'Sanket Tendulkar', 'Computer Engineering', 5),
('VIT2026002', 'Rahul Patil', 'Computer Engineering', 5),
('VIT2026003', 'Amit Sharma', 'Computer Engineering', 5),
('VIT2026004', 'Priya Deshmukh', 'Computer Engineering', 5),
('VIT2026005', 'Neha Kulkarni', 'Computer Engineering', 5);

SELECT * FROM students;

INSERT INTO subjects (subject_code, name) VALUES
('CS201', 'Data Structures and Algorithms'),
('CS202', 'Operating Systems'),
('CS203', 'Database Management Systems'),
('CS204', 'Object Oriented Programming');

INSERT INTO marks (student_id, subject_id, mse, ese) VALUES
(1, 1, 25, 62),
(1, 2, 24, 58),
(1, 3, 27, 65),
(1, 4, 26, 60);

INSERT INTO marks (student_id, subject_id, mse, ese) VALUES
(2, 1, 22, 55),
(2, 2, 25, 60),
(2, 3, 24, 57),
(2, 4, 27, 63);

INSERT INTO marks (student_id, subject_id, mse, ese) VALUES
(3, 1, 28, 65),
(3, 2, 27, 64),
(3, 3, 26, 62),
(3, 4, 29, 66);

INSERT INTO marks (student_id, subject_id, mse, ese) VALUES
(4, 1, 20, 48),
(4, 2, 22, 52),
(4, 3, 23, 55),
(4, 4, 21, 50);

INSERT INTO marks (student_id, subject_id, mse, ese) VALUES
(5, 1, 26, 61),
(5, 2, 23, 59),
(5, 3, 28, 64),
(5, 4, 25, 62);

SELECT 
    s.prn,
    s.name,
    s.branch,
    s.semester,
    sub.name AS subject,
    m.mse,
    m.ese,
    (m.mse + m.ese) AS total_marks
FROM students s
JOIN marks m 
    ON s.id = m.student_id
JOIN subjects sub 
    ON m.subject_id = sub.id
ORDER BY s.prn, sub.id;

SELECT
    s.prn,
    s.name,
    SUM(m.mse) AS total_mse,
    SUM(m.ese) AS total_ese,
    SUM(m.mse + m.ese) AS total_marks,
    400 AS maximum_marks,
    ROUND((SUM(m.mse + m.ese) / 400) * 100, 2) AS percentage
FROM students s
JOIN marks m
    ON s.id = m.student_id
GROUP BY s.id, s.prn, s.name;

SELECT
    s.prn,
    s.name,
    s.branch,
    s.semester,
    sub.name AS subject,
    m.mse,
    m.ese,
    (m.mse + m.ese) AS total_marks
FROM students s
JOIN marks m
    ON s.id = m.student_id
JOIN subjects sub
    ON m.subject_id = sub.id
WHERE s.prn = 'VIT2026001'
ORDER BY sub.id;

SELECT
    s.prn,
    s.name,
    s.branch,
    s.semester,
    SUM(m.mse + m.ese) AS total_marks,
    ROUND((SUM(m.mse + m.ese) / 400) * 100, 2) AS percentage
FROM students s
JOIN marks m
    ON s.id = m.student_id
WHERE s.prn = 'VIT2026001'
GROUP BY s.id, s.prn, s.name, s.branch, s.semester;

SELECT
    s.prn,
    s.name,
    sub.name AS subject,
    m.mse,
    m.ese,
    (m.mse + m.ese) AS total_marks,

    CASE
        WHEN (m.mse + m.ese) >= 90 THEN 'A+'
        WHEN (m.mse + m.ese) >= 80 THEN 'A'
        WHEN (m.mse + m.ese) >= 70 THEN 'B+'
        WHEN (m.mse + m.ese) >= 60 THEN 'B'
        WHEN (m.mse + m.ese) >= 50 THEN 'C'
        WHEN (m.mse + m.ese) >= 40 THEN 'D'
        ELSE 'F'
    END AS grade

FROM students s
JOIN marks m
    ON s.id = m.student_id
JOIN subjects sub
    ON m.subject_id = sub.id
WHERE s.prn = 'VIT2026001';

SELECT
    s.prn,
    s.name,
    sub.name AS subject,
    (m.mse + m.ese) AS total_marks,

    CASE
        WHEN (m.mse + m.ese) >= 40 THEN 'PASS'
        ELSE 'FAIL'
    END AS result

FROM students s
JOIN marks m
    ON s.id = m.student_id
JOIN subjects sub
    ON m.subject_id = sub.id
WHERE s.prn = 'VIT2026001';

DESCRIBE students;
DESCRIBE subjects;
DESCRIBE marks;