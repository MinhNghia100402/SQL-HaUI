﻿go 
create database students
go
use students
go

create table students
(
	studentID nvarchar(12) primary key,
	studentName nvarchar(25) not null,
	dateofBirth datetime not null,
	email nvarchar(40),
	phone nvarchar(12),
	class nvarchar(10)
)

create table subjects
(
	subjectID nvarchar(10) primary key,
	subjectName nvarchar(25) not null
	)

create table mark 
(
	studentID nvarchar(12) primary key,
	subjectID nvarchar(10),
	theory tinyint,
	practical tinyint,
	Dates datetime,
	constraint fk_mar_std foreign key (studentID)
	references students(studentID),
	constraint fk_mar_sb foreign key (subjectID)
	references subjects(subjectID)
)

insert into students values (N'AV0807005',N' Mail Trung Hiếu ',11/10/1989 ,N'trunghieu@yahoo.com',0904115116,N'AV1'),

insert into subjects values (N'S001',N'SQL'),
							(N'S002',N'Java Simplefield'),
							(N'S003',N'Active Server Page')


insert into mark values  (N'AV0807005 ',N'S001 ',8,25,6/5/2008),