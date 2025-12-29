CREATE TABLE FACULTIES (
    faculty_id INT IDENTITY(1,1) PRIMARY KEY,
    faculty_name NVARCHAR(50) NOT NULL
)

CREATE TABLE GROUPS (
    group_id INT IDENTITY(1,1) PRIMARY KEY,
    group_name NVARCHAR(20) NOT NULL,
    course_number INT NOT NULL,
    faculty_id INT NOT NULL,
    form_id INT NOT NULL,
    admission_year INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES FACULTIES(faculty_id),
    FOREIGN KEY (form_id) REFERENCES STUDY_FORMS(form_id)
)

CREATE TABLE STUDY_FORMS (
    form_id INT IDENTITY(1,1) PRIMARY KEY,
    form_name NVARCHAR(20) NOT NULL
)

CREATE TABLE TEACHERS (
    teacher_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    middle_name NVARCHAR(50),
    birth_date DATE NOT NULL,
    faculty_id INT NOT NULL,
    form_id INT NOT NULL,
    subject_name NVARCHAR(100) NOT NULL,
    hours_count INT NOT NULL,
    course_number INT NOT NULL,
    start_work_date DATE NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES FACULTIES(faculty_id),
    FOREIGN KEY (form_id) REFERENCES STUDY_FORMS(form_id)
)

CREATE TABLE STUDENTS (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    middle_name NVARCHAR(50),
    birth_date DATE NOT NULL,
    group_id INT NOT NULL,
    avg_score DECIMAL(3,1),
    admission_date DATE NOT NULL,
    FOREIGN KEY (group_id) REFERENCES GROUPS(group_id)
)


INSERT INTO FACULTIES (faculty_name) VALUES
(N'ФПМ'), (N'ФПК'), (N'ФПИ')

INSERT INTO STUDY_FORMS (form_name) VALUES
(N'очная'), (N'заочная')

INSERT INTO GROUPS (group_name, course_number, faculty_id, form_id, admission_year) VALUES
(N'ПО135', 1, 1, 1, 2015),
(N'ПО235', 2, 1, 1, 2014),
(N'ПО335', 3, 1, 1, 2013),
(N'ЗП135', 1, 2, 2, 2015),
(N'ЗП235', 2, 2, 2, 2014),
(N'ЗП335', 3, 2, 2, 2013),
(N'ПО145', 1, 3, 1, 2015),
(N'ЗП145', 1, 3, 2, 2015)

INSERT INTO STUDENTS (first_name, last_name, middle_name, birth_date, group_id, avg_score, admission_date) VALUES
(N'Петр', N'Федоренко', N'Романович', '1997-12-25', 1, 8.5, '2015-09-01'),
(N'Ольга', N'Зингел', NULL, '1985-12-25', 1, 7.8, '2015-09-01'),
(N'Надежда', N'Савицкаян', NULL, '1987-09-22', 2, 6.9, '2014-09-01'),
(N'Мария', N'Ковальчук', N'Евгеньевна', '1992-06-17', 2, 9.1, '2014-09-01'),
(N'Татьяна', N'Ковриго', N'Романовна', '1992-05-13', 3, 8.2, '2013-09-01'),
(N'Наталья', N'Шарапо', NULL, '1992-08-14', 3, 7.5, '2013-09-01'),
(N'Иван', N'Ковалев', N'Петрович', '1990-03-15', 4, 6.7, '2015-09-01'),
(N'Анна', N'Бойко', NULL, '1988-11-20', 5, 8.9, '2014-09-01'),
(N'Сергей', N'Остапенко', N'Васильевич', '1991-07-30', 6, 7.2, '2013-09-01'),
(N'Джон', N'Смит', NULL, '1995-04-12', 1, 7.9, '2015-09-01'),
(N'Сара', N'Джонсон', NULL, '1994-07-25', 2, 8.1, '2014-09-01'),
(N'Алексей', N'Сидоров', N'Иванович', '1996-03-15', 4, 6.5, '2015-09-01'),
(N'Елена', N'Коваленко', NULL, '1993-08-20', 5, 8.7, '2014-09-01')

INSERT INTO TEACHERS (first_name, last_name, middle_name, birth_date, faculty_id, form_id, subject_name, hours_count, course_number, start_work_date) VALUES
(N'Иван', N'Петров', N'Сергеевич', '1975-03-15', 1, 1, N'Физика', 200, 1, '2010-09-01'),
(N'Мария', N'Сидорова', NULL, '1980-08-22', 1, 1, N'Математика', 120, 1, '2015-02-15'),
(N'Петр', N'Ковалев', N'Иванович', '1978-11-10', 1, 1, N'Основы алгоритмизации', 70, 2, '2012-03-20'),
(N'Ольга', N'Михайлова', N'Викторовна', '1982-05-30', 2, 2, N'Проектирование БД', 130, 2, '2018-09-01'),
(N'Андрей', N'Смирнов', NULL, '1970-12-05', 2, 2, N'Средства визуального программирования', 120, 3, '2005-01-10'),
(N'Елена', N'Козлова', N'Александровна', '1985-10-18', 1, 1, N'Объектно-ориентированное программирование', 100, 3, '2019-11-15'),
(N'Джон', N'Смит', NULL, '1983-04-12', 2, 2, N'Базы данных', 150, 2, '2020-02-01'),
(N'Сара', N'Джонсон', NULL, '1979-07-25', 1, 1, N'Веб-программирование', 110, 3, '2017-08-20')
GO

    
CREATE FUNCTION Сitizenship_f (@middle_name NVARCHAR(100))
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @RESULT NVARCHAR(20)
    IF @middle_name IS NULL OR LTRIM(RTRIM(@middle_name)) = ''
        SET @RESULT = N'иностранец'
    ELSE
        SET @RESULT = N'гражданин'
    RETURN @RESULT
END
GO

CREATE FUNCTION TEACHER_LOAD_F()
RETURNS TABLE
AS RETURN(
    SELECT 
        first_name, 
        last_name, 
        faculty_name,
        SUM(hours_count) AS TotalHours
    FROM TEACHERS t
    JOIN FACULTIES f ON t.faculty_id = f.faculty_id
    GROUP BY first_name, last_name, faculty_name
)
GO

CREATE TABLE COUNTS (
    Count_form INT,
    Count_stud INT
)
GO

INSERT INTO COUNTS (Count_form, Count_stud) 
SELECT 
    (SELECT COUNT(*) FROM STUDY_FORMS),
    (SELECT COUNT(*) FROM STUDENTS)
GO

CREATE TRIGGER tr_student_score_update
ON STUDENTS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(avg_score)
    BEGIN
        DECLARE @old_avg DECIMAL(3,1), @new_avg DECIMAL(3,1)
        DECLARE @faculty_id INT, @faculty_name NVARCHAR(50)
        
        SELECT @old_avg = avg_score FROM deleted
        SELECT @new_avg = avg_score FROM inserted
        
        -- Получаем факультет студента
        SELECT @faculty_id = g.faculty_id 
        FROM inserted i 
        JOIN GROUPS g ON i.group_id = g.group_id
        
        SELECT @faculty_name = faculty_name 
        FROM FACULTIES 
        WHERE faculty_id = @faculty_id
        
        IF @new_avg > @old_avg
            PRINT N'Средний балл студента на факультете ' + @faculty_name + N' повысился'
        ELSE IF @new_avg < @old_avg
            PRINT N'Средний балл студента на факультете ' + @faculty_name + N' понизился'
        ELSE
            PRINT N'Средний балл студента на факультете ' + @faculty_name + N' не изменился'
    END
END


CREATE TRIGGER tr_form_insert
ON STUDY_FORMS
AFTER INSERT
AS
BEGIN
    UPDATE COUNTS 
    SET Count_form = Count_form + (SELECT COUNT(*) FROM inserted)
    PRINT N'Добавлена новая форма обучения. Общее количество форм: ' + CAST((SELECT Count_form FROM COUNTS) AS NVARCHAR(10))
END


CREATE TRIGGER tr_form_delete
ON STUDY_FORMS
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM GROUPS g JOIN deleted d ON g.form_id = d.form_id)
    BEGIN
        PRINT N'Форма не может быть удалена, так как существуют связанные группы'
    END
    ELSE
    BEGIN
        DELETE FROM STUDY_FORMS 
        WHERE form_id IN (SELECT form_id FROM deleted)
        
        UPDATE COUNTS 
        SET Count_form = Count_form - (SELECT COUNT(*) FROM deleted)
        
        PRINT N'Форма успешно удалена. Общее количество форм: ' + CAST((SELECT Count_form FROM COUNTS) AS NVARCHAR(10))
    END
END



CREATE TRIGGER tr_student_delete
ON STUDENTS
AFTER DELETE
AS
BEGIN
    UPDATE COUNTS 
    SET Count_stud = Count_stud - (SELECT COUNT(*) FROM deleted)
    PRINT N'Удален студент. Общее количество студентов: ' + CAST((SELECT Count_stud FROM COUNTS) AS NVARCHAR(10))
END
