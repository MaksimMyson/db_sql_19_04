USE [db_sql_19_04]
GO

INSERT INTO Departments (Building, Name)
VALUES
    (1, 'Cardiology'),
    (2, 'Gastroenterology'),
    (3, 'General Surgery');

INSERT INTO Doctors (Name, Surname, Salary, Premium)
VALUES
    ('John', 'Smith', 80000, 5000),
    ('Anna', 'Johnson', 75000, 3000),
    ('Michael', 'Brown', 90000, 6000);


INSERT INTO Examinations (Name)
VALUES
    ('MRI'),
    ('Ultrasound'),
    ('Endoscopy');

INSERT INTO Wards (Name, Places, DepartmentId)
VALUES
    ('Ward A', 10, 1),
    ('Ward B', 15, 2),
    ('Ward C', 12, 3);

INSERT INTO Sponsors (Name)
VALUES
    ('Healthcare Foundation'),
    ('PharmaCorp'),
    ('Community Donors');

INSERT INTO Donations (Amount, DepartmentId, SponsorId)
VALUES
    (5000, 1, 1),
    (3000, 2, 2),
    (2000, 3, 3);