IF EXISTS (SELECT * FROM sys.databases WHERE Name='QLStudents')
DROP DATABASE QLStudents
GO
CREATE DATABASE QLStudents
GO
USE QLStudents
GO

CREATE TABLE Class(
	Class_ID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(10)
)
GO

CREATE TABLE Students
(
	Student_ID int PRIMARY KEY,
	Name varchar(40),
	Gender varchar(10)
)

CREATE TABLE StudentClass
(
	Class_ID int,
	Student_ID int,
	Status varchar(40),
	CONSTRAINT fk_Class FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID),
	CONSTRAINT fk_Student FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
)
INSERT INTO Class(Name) 
VALUES('Lop 6A'),('Lop 6B'),('Lop 7A'),('Lop 7B'),('Lop 8A')


INSERT INTO Students(Student_ID,Name,Gender)
VALUES(1,'LAN','NU'),(2,'HOA','NU'),(3,'NAM','NAM'),(4,'LONG','NAM'),(5,'TRUONG','NAM')
SELECT * FROM Students
SELECT * FROM StudentClass
SELECT * FROM Class
INSERT INTO StudentClass(Class_ID,Student_ID,Status)
VALUES(1,1,'Do'),(1,2,'Do'),(2,3,'Do'),(1,4,'Do'),(1,5,'Truot')


UPDATE Class
SET Name = 'Lop 9A'
WHERE Class_ID = 1;

DELETE StudentClass
WHERE Student_ID = 2

SELECT Status FROM StudentClass
Where Student_ID = 1

SELECT Status,Students.Name FROM StudentClass INNER JOIN Students
ON StudentClass.Student_ID = Students.Student_ID
WHERE StudentClass.Student_ID = 1

--Xóa bỏ các Ràng buộc Khóa ngoại của bảng StudentClass
ALTER TABLE StudentClass
DROP CONSTRAINT fk_Class
ALTER TABLE StudentClass
DROP CONSTRAINT fk_Student
--Xóa bỏ Ràng buộc Khóa chính của bảng Class
ALTER TABLE Class
DROP CONSTRAINT PK__Class__B09705577F5781C3
--Thêm mới Ràng buộc Khóa chính cho bảng Class
ALTER TABLE Class
ADD CONSTRAINT PK_Class
PRIMARY KEY(Class_ID)
--Thêm mới các Ràng buộc Khóa ngoại cho bảng StudentClass
ALTER TABLE StudentClass
ADD ID INT PRIMARY KEY IDENTITY

ALTER TABLE StudentClass
ADD CONSTRAINT FK_Class
FOREIGN KEY(Class_ID)
REFERENCES Class(Class_ID)

ALTER TABLE StudentClass
ADD CONSTRAINT FK_Student
FOREIGN KEY(Student_ID)
REFERENCES Students(Student_ID)

--Bổ sung thêm ràng buộc NOT NULL cho Class_ID, Student_ID trong bảng StudentClass
ALTER TABLE StudentClass
ALTER COLUMN Class_ID INT NOT NULL
ALTER TABLE StudentClass
ALTER COLUMN Student_ID INT NOT NULL
GO