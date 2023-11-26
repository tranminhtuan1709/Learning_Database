-- Create database
CREATE DATABASE IF NOT EXISTS mydatabase;

-- Use particular database
USE MyDatabase;

-- Delete database
DROP DATABASE IF EXISTS mydatabase;

-- Create table
CREATE TABLE IF NOT EXISTS Student (
	id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(100),
    class INT,
    school VARCHAR(50),
    graduated BOOLEAN,
    school_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS School (
	id INT NOT NULL,
    name VARCHAR(50),
    address VARCHAR(50)
);

-- Add primarykey to table
ALTER TABLE School
ADD PRIMARY KEY(id);

-- Add foreign key to table
ALTER TABLE Student
ADD FOREIGN KEY(school_id) REFERENCES School(id);

-- Add multiple column to table
ALTER TABLE Student
ADD (sex VARCHAR(50), abc INT);

-- Delete column from table
ALTER TABLE Student
DROP abc;






