go 
create database sv
go

create table sinhvien
(
	masv nvarchar(30) primary key not null,
	tensv nvarchar(30),
	que nvarchar(30)
)

create table mon
(
	mamh nvarchar(30) primary key not null,
	tenmh nvarchar(30),
	sotc int
	)
create table kq
(
	masv nvarchar(30) not null,
	mamh nvarchar (30) not null,
	diem float,
	constraint fk_kq_sv foreign key (masv)
	references sinhvien(masv),
	constraint fk_kq_mh foreign key (mamh)
	references mon(mamh)
)
insert into sinhvien values (N'SV01',N'Vũ Minh Nghĩa',N'Tuyên Quang'),
							(N'SV02',N'Vũ Minh b',N'Hà Nội'),
							(N'SV03',N'Nguyễn Văn B',N'Bắc Ninh'),
							(N'SV04',N'Phạm Văn C',N'Thái Nguyên')
insert into mon values (N'MH01',N'Giải Tích',3),
						(N'MH02',N'Triết Học',3),
						(N'MH03',N'Hệ Quản Trị CSDL',3)
select * from mon

insert into kq values (N'SV01',N'MH02',9),
					  (N'SV01',N'MH03',8),
					  (N'SV02',N'MH01',8.5),
					  (N'SV02',N'MH03',10),
					  (N'SV03',N'MH01',7),
					  (N'SV03',N'MH02',9.5)

select * from kq