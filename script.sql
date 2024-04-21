USE [db_sql_19_04]
GO

SELECT D.Name
FROM Departments AS D
JOIN Departments AS D1 ON D.Building = D1.Building
WHERE D1.Name = 'Cardiology';

SELECT D.Name
FROM Departments AS D
WHERE D.Building IN (
    SELECT Building 
    FROM Departments 
    WHERE Name IN ('Gastroenterology', 'General Surgery')
);

SELECT TOP 1 D.Name
FROM Departments AS D
LEFT JOIN Donations AS Do ON D.Id = Do.DepartmentId
GROUP BY D.Name
ORDER BY SUM(ISNULL(Do.Amount, 0)) ASC;


SELECT Doc.Surname
FROM Doctors AS Doc
JOIN Doctors AS Doc1 ON Doc.Salary > Doc1.Salary
WHERE Doc1.Surname = 'Gerada';

SELECT W.Name
FROM Wards AS W
JOIN Departments AS D ON W.DepartmentId = D.Id
WHERE D.Name = 'Microbiology' AND W.Places > (
    SELECT AVG(W1.Places) 
    FROM Wards AS W1 
    JOIN Departments AS D1 ON W1.DepartmentId = D1.Id 
    WHERE D1.Name = 'Microbiology'
);

SELECT Doc.Name + ' ' + Doc.Surname
FROM Doctors AS Doc
JOIN Doctors AS Doc1 ON (Doc.Salary + Doc.Premium) > (Doc1.Salary + Doc1.Premium + 100)
WHERE Doc1.Surname = 'Davis';

SELECT DISTINCT D.Name
FROM Departments AS D
JOIN DoctorsExaminations AS DE ON D.Id = DE.WardId
JOIN Doctors AS Doc ON DE.DoctorId = Doc.Id
WHERE Doc.Name = 'Joshua' AND Doc.Surname = 'Bell';


SELECT S.Name
FROM Sponsors AS S
WHERE S.Id NOT IN (
    SELECT Do.SponsorId 
    FROM Donations AS Do 
    JOIN Departments AS D ON Do.DepartmentId = D.Id
    WHERE D.Name IN ('Neurology', 'Oncology')
);

SELECT Doc.Surname
FROM Doctors AS Doc
JOIN DoctorsExaminations AS DE ON Doc.Id = DE.DoctorId
WHERE DE.StartTime >= '12:00' AND DE.EndTime <= '15:00';
