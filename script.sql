USE [db_sql_19_04]
GO

INSERT INTO Curators (Name, Surname)
VALUES
    ('John', 'Smith'),
    ('Anna', 'Johnson'),
    ('Michael', 'Brown');

INSERT INTO Departments (Building, Financing, Name, FacultyId)
VALUES
    (1, 100000, 'Computer Science', 1),
    (2, 90000, 'Software Development', 1),
    (3, 120000, 'Electrical Engineering', 2);

INSERT INTO Faculties (Name)
VALUES
    ('Engineering'),
    ('Computer Science');

INSERT INTO Groups (Name, Year, DepartmentId)
VALUES
    ('D221', 2, 2),
    ('E101', 1, 3),
    ('C301', 3, 1);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Lectures (Date, SubjectId, TeacherId)
VALUES
    ('2023-04-25', 1, 1),
    ('2023-04-26', 2, 2),
    ('2023-04-27', 3, 3);

INSERT INTO Subjects (Name)
VALUES
    ('Mathematics'),
    ('Programming'),
    ('Electronics');

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname)
VALUES
    (1, 'Dr. Emily', 95000, 'Johnson'),
    (0, 'Prof. Robert', 85000, 'Lee'),
    (1, 'Dr. Maria', 105000, 'Garcia');


INSERT INTO Students (Name, Rating, Surname, GroupId)
VALUES
    ('Alex', 4, 'Smith', 1),
    ('Emma', 5, 'Brown', 2),
    ('Daniel', 3, 'Johnson', 3);

INSERT INTO Subjects (Name)
VALUES
    ('Physics'),
    ('Chemistry'),
    ('Biology');
