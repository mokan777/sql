
CREATE TABLE GROUPS (
    group_id INT NOT NULL,
    group_name NVARCHAR(100) NOT NULL,
    course_number INT NOT NULL,
    faculty NVARCHAR(50) NOT NULL,
    form NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_GROUPS PRIMARY KEY (group_id)
)

CREATE TABLE STUDENTS (
    student_id INT IDENTITY(1,1),
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    middle_name NVARCHAR(100),
    birth_date DATE NOT NULL,
    group_id INT NOT NULL,
    avg_score DECIMAL(3,1),
    CONSTRAINT PK_STUDENTS PRIMARY KEY(student_id)
)

CREATE TABLE SUBJECTS (
    subject_id INT NOT NULL,
    subject_name NVARCHAR(200) NOT NULL,
    hours_count INT NOT NULL,
    control_form NVARCHAR(50),
    self_study_hours INT,
    CONSTRAINT PK_SUBJECTS PRIMARY KEY (subject_id)
)

CREATE TABLE TEACHERS (
    teacher_id INT IDENTITY(1,1),
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    middle_name NVARCHAR(100),
    birth_date DATE NOT NULL,
    faculty NVARCHAR(50) NOT NULL,
    form NVARCHAR(20) NOT NULL,
    subject_name NVARCHAR(200) NOT NULL,
    hours_count INT NOT NULL,
    course_number INT NOT NULL,
    start_work_date DATE NOT NULL,
    CONSTRAINT PK_TEACHERS PRIMARY KEY(teacher_id)
)

CREATE TABLE [PLAN] (
    group_id INT NOT NULL,
    subject_id INT NOT NULL,
    CONSTRAINT PK_PLAN PRIMARY KEY (group_id, subject_id)
)


ALTER TABLE STUDENTS ADD CONSTRAINT FK_STUDENTS_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id)
ALTER TABLE [PLAN] ADD CONSTRAINT FK_PLAN_SUBJECTS FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id)
ALTER TABLE [PLAN] ADD CONSTRAINT FK_PLAN_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id)


INSERT INTO GROUPS (group_id, group_name, course_number, faculty, form) VALUES
(1, N'ПО135', 1, N'ФПМ', N'очная'),
(2, N'ПО235', 2, N'ФПМ', N'очная'),
(3, N'ПО335', 3, N'ФПМ', N'очная'),
(4, N'ЗП135', 1, N'ФПК', N'заочная'),
(5, N'ЗП235', 2, N'ФПК', N'заочная'),
(6, N'ЗП335', 3, N'ФПК', N'заочная')


INSERT INTO STUDENTS (first_name, last_name, middle_name, birth_date, group_id, avg_score) VALUES
(N'Петр', N'Федоренко', N'Романович', '1997-12-25', 1, 8.5),
(N'Ольга', N'Зингел', NULL, '1985-12-25', 1, 7.8),
(N'Надежда', N'Савицкаян', NULL, '1987-09-22', 2, 6.9),
(N'Мария', N'Ковальчук', N'Евгеньевна', '1992-06-17', 2, 9.1),
(N'Татьяна', N'Ковриго', N'Романовна', '1992-05-13', 3, 8.2),
(N'Наталья', N'Шарапо', NULL, '1992-08-14', 3, 7.5),
(N'Иван', N'Ковалев', N'Петрович', '1990-03-15', 4, 6.7),
(N'Анна', N'Бойко', NULL, '1988-11-20', 5, 8.9),
(N'Сергей', N'Остапенко', N'Васильевич', '1991-07-30', 6, 7.2)


INSERT INTO SUBJECTS (subject_id, subject_name, hours_count, control_form, self_study_hours) VALUES
(1, N'Физика', 200, N'Экзамен', 60),
(2, N'Математика', 120, N'Экзамен', 40),
(3, N'Основы алгоритмизации', 70, N'Зачет', 25),
(4, N'Проектирование БД', 130, N'Экзамен', 45),
(5, N'Средства визуального программирования', 120, N'Экзамен', 50),
(6, N'Объектно-ориентированное программирование', 100, N'Экзамен', 40),
(7, N'Базы данных', 150, N'Экзамен', 55),
(8, N'Веб-программирование', 110, N'Зачет', 35)


INSERT INTO TEACHERS (first_name, last_name, middle_name, birth_date, faculty, form, subject_name, hours_count, course_number, start_work_date) VALUES
(N'Иван', N'Петров', N'Сергеевич', '1975-03-15', N'ФПМ', N'очная', N'Физика', 200, 1, '2010-09-01'),
(N'Мария', N'Сидорова', NULL, '1980-08-22', N'ФПМ', N'очная', N'Математика', 120, 1, '2015-02-15'),
(N'Петр', N'Ковалев', N'Иванович', '1978-11-10', N'ФПМ', N'очная', N'Основы алгоритмизации', 70, 2, '2012-03-20'),
(N'Ольга', N'Михайлова', N'Викторовна', '1982-05-30', N'ФПК', N'заочная', N'Проектирование БД', 130, 2, '2018-09-01'),
(N'Андрей', N'Смирнов', NULL, '1970-12-05', N'ФПК', N'заочная', N'Средства визуального программирования', 120, 3, '2005-01-10'),
(N'Елена', N'Козлова', N'Александровна', '1985-10-18', N'ФПМ', N'очная', N'Объектно-ориентированное программирование', 100, 3, '2019-11-15'),
(N'Джон', N'Смит', NULL, '1983-04-12', N'ФПК', N'заочная', N'Базы данных', 150, 2, '2020-02-01'),
(N'Сара', N'Джонсон', NULL, '1979-07-25', N'ФПМ', N'очная', N'Веб-программирование', 110, 3, '2017-08-20')


INSERT INTO [PLAN] (group_id, subject_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6),
(4, 1), (4, 2), (5, 3), (5, 4), (6, 5), (6, 6)


SELECT last_name
FROM STUDENTS
WHERE last_name LIKE N'%б%' OR last_name LIKE N'%о%';


SELECT *
FROM STUDENTS
WHERE last_name LIKE N'К%' AND middle_name IS NULL;


SELECT *
FROM STUDENTS
WHERE LEN(last_name) >= 8;


SELECT *
FROM STUDENTS
WHERE LEN(last_name) <> 7 AND last_name LIKE N'%а%';


SELECT s.*
FROM STUDENTS s
JOIN GROUPS g ON s.group_id = g.group_id
WHERE g.faculty = N'ФПМ' AND g.form = N'очная' AND g.course_number IN (1, 2)
ORDER BY s.middle_name;


SELECT s.*
FROM STUDENTS s
JOIN GROUPS g ON s.group_id = g.group_id
WHERE g.faculty = N'ФПК' AND g.form = N'заочная' AND s.avg_score > 6
ORDER BY s.avg_score DESC;


SELECT *
FROM TEACHERS
WHERE faculty = N'ФПК'
ORDER BY form, last_name;


SELECT *
FROM TEACHERS
WHERE faculty = N'ФПМ' AND course_number = 1 AND hours_count > 100;


SELECT *
FROM TEACHERS
WHERE middle_name IS NULL AND DATEDIFF(YEAR, start_work_date, GETDATE()) > 3;


SELECT DISTINCT s.*
FROM SUBJECTS s
JOIN [PLAN] p ON s.subject_id = p.subject_id
JOIN GROUPS g ON p.group_id = g.group_id
WHERE g.faculty = N'ФПМ' AND g.course_number = 3;


SELECT t.course_number, t.form, CONCAT(t.last_name, ' ', t.first_name, ISNULL(' ' + t.middle_name, '')) AS teacher_name, t.subject_name, t.hours_count
FROM TEACHERS t
WHERE t.faculty = N'ФПК' AND t.hours_count > 100;


SELECT t.faculty, t.course_number, t.form, CONCAT(t.last_name, ' ', t.first_name) AS teacher_name, t.subject_name
FROM TEACHERS t
WHERE t.middle_name IS NULL;


SELECT last_name, first_name, middle_name, birth_date, DATEDIFF(YEAR, birth_date, DATEFROMPARTS(YEAR(GETDATE()), 1, 1)) AS age
FROM TEACHERS
WHERE DATEDIFF(YEAR, birth_date, DATEFROMPARTS(YEAR(GETDATE()), 1, 1)) > 30;

SELECT last_name, first_name, middle_name, birth_date, DATEDIFF(YEAR, birth_date, GETDATE()) AS age
FROM TEACHERS
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 35 AND 40
ORDER BY last_name;


SELECT last_name, first_name, middle_name, birth_date
FROM TEACHERS
WHERE MONTH(birth_date) = 10
ORDER BY birth_date ASC;
