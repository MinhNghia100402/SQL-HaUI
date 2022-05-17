go 
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

insert into students values (N'AV0807005',N' Mail Trung Hiếu ',11/10/1989 ,N'trunghieu@yahoo.com',0904115116,N'AV1'),							(N'AV0807006',N' Nguyễn Quý Hùng ',2/12/1988 ,N'quyhung@yahoo.com',0955667787 ,N'AV2'),							(N'AV0807007',N' Đỗ Đắc Huỳnh ',2/1/1990 ,N'dachuynh@yahoo.com',0988574747,N'AV2'),							(N'AV0807008',N' An Đăng Khuê ',6/3/1986 ,N'dangkhue@yahoo.com',0986757463,N'AV1'),							(N'AV0807009',N' Nguyễn Thị Tuyết Lan ',12/7/1989  ,N'tuyetlan@yahoo.com',0983310342,N'AV2'),							(N'AV0807010',N' Đinh Phụng Long ',2/12/1990,N'phunglong@yahoo.com',null,N'AV1'),							(N'AV0807011',N' Nguyễn Tuấn Nam ',2/3/1990 ,N'tuannam@yahoo.com',null,N'AV1')

insert into subjects values (N'S001',N'SQL'),
							(N'S002',N'Java Simplefield'),
							(N'S003',N'Active Server Page')


insert into mark values  (N'AV0807005 ',N'S001 ',8,25,6/5/2008),						 (N'AV0807006 ',N'S002 ',16,30,6/5/2008),						 (N'AV0807007 ',N'S001 ',10,13,6/5/2008),						 (N'AV0807008 ',N'S003 ',7,16,6/5/2008),						 (N'AV0807009 ',N'S003 ',9,30,6/5/2008),						 (N'AV0807010 ',N'S003 ',8,31,6/5/2008),						 (N'AV0807011 ',N'S002 ',12,11,6/5/2008)							select * from mark
