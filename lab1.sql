
CREATE TABLE GROUPS (
    GroupID char(10) NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Course int NOT NULL
);

CREATE TABLE STUDENTS (
    StudentID int NOT NULL IDENTITY PRIMARY KEY,
    FirstName varchar(30) NOT NULL,
    LastName varchar(30) NOT NULL,
    Patronymic varchar(30),
    BirthDate date NOT NULL,
    GroupID char(10) NOT NULL
);

CREATE TABLE SUBJECTS (
    SubjectID int NOT NULL IDENTITY PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Hours int NOT NULL
);

CREATE TABLE PLAN (
    GroupID char(10) NOT NULL,
    SubjectID int NOT NULL,
    PRIMARY KEY (GroupID, SubjectID)
);


ALTER TABLE STUDENTS
ADD CONSTRAINT FK_Students_Groups FOREIGN KEY (GroupID)
REFERENCES GROUPS(GroupID);

ALTER TABLE PLAN
ADD CONSTRAINT FK_Plan_Groups FOREIGN KEY (GroupID)
REFERENCES GROUPS(GroupID);

ALTER TABLE PLAN
ADD CONSTRAINT FK_Plan_Subjects FOREIGN KEY (SubjectID)
REFERENCES SUBJECTS(SubjectID);


INSERT INTO GROUPS (GroupID, Name, Course) VALUES
('ПО135', 'ПО135', 1),
('ПО235', 'ПО235', 2),
('ПО335', 'ПО335', 3);

INSERT INTO STUDENTS (FirstName, LastName, Patronymic, BirthDate, GroupID) VALUES
('П.', 'Федоренко', 'Р.', '1997-12-25', 'ПО135'),
('О.', 'Зингел', NULL, '1985-12-25', 'ПО135'),
('Н.', 'Савицкаян', NULL, '1987-09-22', 'ПО235'),
('М.', 'Ковальчук', 'Е.', '1992-06-17', 'ПО235'),
('Т.', 'Ковриго', 'Р.', '1992-05-13', 'ПО335'),
('Н.', 'Шарапо', NULL, '1992-08-14', 'ПО335');

INSERT INTO SUBJECTS (Name, Hours) VALUES
('Физика', 200),
('Математика', 120),
('Основы алгоритмизации', 70),
('Проектирование БД', 130),
('Средства визуального программирования', 90),
('Объектно-ориентированное программирование', 70);


UPDATE STUDENTS
SET GroupID = '134'
WHERE GroupID = 'ПО135';


DELETE FROM GROUPS WHERE GroupID = 'ПО135';


UPDATE SUBJECTS
SET Hours = Hours + 30
WHERE Name IN ('Средства визуального программирования', 'Объектно-ориентированное программирование');


ALTER TABLE SUBJECTS ADD ControlForm varchar(20);

UPDATE SUBJECTS
SET ControlForm = CASE
    WHEN Name = 'Основы алгоритмизации' THEN 'Зачет'
    ELSE 'Экзамен'
END;


ALTER TABLE STUDENTS DROP COLUMN Patronymic;
