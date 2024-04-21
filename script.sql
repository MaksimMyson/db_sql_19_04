USE [db_sql_19_04]
GO

SELECT Building
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000;


SELECT G.Name
FROM Groups AS G
JOIN Departments AS D ON G.DepartmentId = D.Id
WHERE D.Name = 'Software Development' AND G.Year = 5
GROUP BY G.Name
HAVING COUNT(LectureId) > 10;


SELECT G.Name
FROM Groups AS G
JOIN Students AS S ON G.Id = S.GroupId
GROUP BY G.Name
HAVING AVG(S.Rating) > (
    SELECT AVG(S2.Rating)
    FROM Students AS S2
    JOIN Groups AS G2 ON S2.GroupId = G2.Id
    WHERE G2.Name = 'D221'
);


SELECT T.Surname, T.Name
FROM Teachers AS T
WHERE T.Salary > (
    SELECT AVG(T2.Salary)
    FROM Teachers AS T2
    WHERE T2.IsProfessor = 1
);


SELECT G.Name
FROM Groups AS G
JOIN GroupsCurators AS GC ON G.Id = GC.GroupId
GROUP BY G.Name
HAVING COUNT(GC.CuratorId) > 1;


SELECT G.Name
FROM Groups AS G
JOIN Students AS S ON G.Id = S.GroupId
GROUP BY G.Name
HAVING AVG(S.Rating) < (
    SELECT MIN(AVG(S2.Rating))
    FROM Students AS S2
    JOIN Groups AS G2 ON S2.GroupId = G2.Id
    WHERE G2.Year = 5
    GROUP BY G2.Id
);


SELECT F.Name
FROM Faculties AS F
JOIN Departments AS D ON F.Id = D.FacultyId
GROUP BY F.Name
HAVING SUM(D.Financing) > (
    SELECT SUM(D2.Financing)
    FROM Departments AS D2
    JOIN Faculties AS F2 ON D2.FacultyId = F2.Id
    WHERE F2.Name = 'Computer Science'
);


SELECT Su.Name, T.Surname + ' ' + T.Name AS TeacherName
FROM Subjects AS Su
JOIN Lectures AS L ON Su.Id = L.SubjectId
JOIN Teachers AS T ON L.TeacherId = T.Id
GROUP BY Su.Name, TeacherName
ORDER BY COUNT(L.Id) DESC;


SELECT TOP 1 Su.Name
FROM Subjects AS Su
JOIN Lectures AS L ON Su.Id = L.SubjectId
GROUP BY Su.Name
ORDER BY COUNT(L.Id) ASC;


SELECT COUNT(DISTINCT S.Id) AS StudentCount, COUNT(DISTINCT Su.Id) AS SubjectCount
FROM Departments AS D
JOIN Groups AS G ON D.Id = G.DepartmentId
JOIN Students AS S ON G.Id = S.GroupId
JOIN Lectures AS L ON G.Id = L.GroupId
JOIN Subjects AS Su ON L.SubjectId = Su.Id
WHERE D.Name = 'Software Development';