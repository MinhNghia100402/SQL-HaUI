go 
create database DeptEmp
go
use DeptEmp
go

create table Department
(
	DepartmentNo integer primary key,
	DepartmentName char(25) not null,
	Locations char(25) not null
)

create table Employee
(
	EmpNo integer primary key,
	Fname varchar(15) not null,
	Lname varchar(15) not null,
	Job varchar (25) not null,
	HireDate datetime not null,
	Salary numeric not null,
	Commision numeric ,
	DepartmentNo integer,
	constraint fk_emp_dp foreign key (DepartmentNo)
	references Department(DepartmentNo)
)

insert into Department values (10,N'Accounting',N'Melbourne'),
							  (20,N'Research',N'Adealide'),
							  (30,N'Sales',N'Sydney'),
							  (40,N'Operations ',N'Perth')

insert into Employee values (1,N'John',N'Smith',N'Clerk',17/12/1980 ,800,null,20),
							(2,N'Peter',N'Allen',N'Salesman ',20/2/1981  ,1600,300,20),
							(3,N'kate',N'Ward',N'Salesman ',22/2/1981 ,1250,500,20),
							(4,N'Jack',N'Jones',N'Manager',02/4/1981 ,2975,null,20),
							(5,N'Joe',N'Martin',N'Salesman ',28/8/1981  ,1250,1400,20)

