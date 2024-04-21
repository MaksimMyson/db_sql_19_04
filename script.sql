USE [db_sql_19_04]
GO

CREATE TABLE NewCurators (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    FacultyId INT NOT NULL
);


CREATE TABLE Faculties (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Groups (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(10) NOT NULL UNIQUE,
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL
    
);


CREATE TABLE GroupsCurators (
    Id INT PRIMARY KEY IDENTITY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL
);


CREATE TABLE Lectures (
    Id INT PRIMARY KEY IDENTITY,
    Date DATE NOT NULL CHECK (Date <= GETDATE()),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL
);


CREATE TABLE Subjects (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY,
    IsProfessor BIT NOT NULL DEFAULT 0,
    Name NVARCHAR(MAX) NOT NULL,
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL
);


CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
    Surname NVARCHAR(MAX) NOT NULL,
    GroupId INT NOT NULL
    
);