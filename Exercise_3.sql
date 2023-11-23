create database if not exists Exercise_3;
use Exercise_3;

CREATE TABLE IF NOT EXISTS Courses (
    courseID VARCHAR(20),
    courseName VARCHAR(50),
    courseCredit INTEGER,
    PRIMARY KEY (courseID)
);

CREATE TABLE IF NOT EXISTS Students (
    studentID VARCHAR(20),
    studentName VARCHAR(50),
    studentSex VARCHAR(10),
    studentAge INTEGER,
    studentBirth DATE,
    courseID VARCHAR(20),
    PRIMARY KEY (studentID),
    FOREIGN KEY (courseID)
        REFERENCES Courses (courseID)
);

insert into Courses (courseID, courseName, courseCredit)
values
("0000", "Computer architecture", 4),
("0001", "Statistic and Propability", 3),
("0002", "Data structure and Algorithm", 3),
("0003", "Object oriented programming", 3),
("0004", "Database", 3),
("0005", "Baseball", 2),
("0006", "English B1", 5);

SELECT 
    *
FROM
    courses
WHERE
    courseCredit = 3
LIMIT 2;