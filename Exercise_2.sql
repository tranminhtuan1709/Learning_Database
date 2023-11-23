create database if not exists Exercise_2;
use Exercise_2;

CREATE TABLE IF NOT EXISTS School (
    schoolID INT AUTO_INCREMENT,
    schoolName VARCHAR(100) NOT NULL,
    schoolAddress VARCHAR(100) NOT NULL,
    schoolPhone VARCHAR(20) NOT NULL,
    PRIMARY KEY (schoolID)
);

CREATE TABLE IF NOT EXISTS Student (
    studentID INT AUTO_INCREMENT,
    studentName VARCHAR(50) NOT NULL,
    studentPhone VARCHAR(20) NOT NULL,
    schoolID int,
    PRIMARY KEY (studentID),
    FOREIGN KEY (schoolID)
        REFERENCES School (schoolID)
);

create table if not exists Department (
	departmentID int,
    departmentName varchar(20) not null,
    departmentPhone varchar(20) not null
);


alter table Department
add column schoolID int;

alter table Department
add column departmentDean varchar(20) not null,
add primary key (departmentID),
add foreign key (schoolID) references School(schoolID);