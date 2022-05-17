use master
go 
create database tuan1
on primary 
(
	name = 'tuan1',
	filename = 'D:\tuan1.mdf',
	size = 5MB , maxsize = 20MB, filegrowth = 1MB
	)