PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Students (
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    github VARCHAR(30) PRIMARY KEY
    );
INSERT INTO "Students" VALUES('Jane','Hacker','jhacks');
INSERT INTO "Students" VALUES('Sarah','Developer','sdevelops');
CREATE TABLE Projects (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(30),
description TEXT,
max_grade INTEGER);
INSERT INTO "Projects" VALUES(1,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(2,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(3,'Shopping Site','Melon shopping site',40);
INSERT INTO "Projects" VALUES(4,'Breakout','Fun with a ball and bricks',100);
INSERT INTO "Projects" VALUES(5,'Sonic','Rapscallion hedgehog adventure',75);
CREATE TABLE Grades (
id INTEGER PRIMARY KEY AUTOINCREMENT,
student_github VARCHAR(30),
project_title VARCHAR(30),
grade INTEGER);
INSERT INTO "Grades" VALUES(1,'jhacks','Markov',10);
INSERT INTO "Grades" VALUES(2,'jhacks','Blockly',2);
INSERT INTO "Grades" VALUES(3,'sdevelops','Markov',50);
INSERT INTO "Grades" VALUES(4,'sdevelops','Blockly',100);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('Projects',5);
CREATE VIEW ReportCardView AS 
SELECT Students.first_name, Students.last_name, Projects.title, Grades.grade, Projects.max_grade
FROM Students
JOIN Grades ON (Students.github = Grades.student_github)
JOIN Projects ON (Grades.project_title = Projects.title);
COMMIT;
