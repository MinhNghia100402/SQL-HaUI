go 
create database QLBanHang1
go
use QLBanHang1
go

create table CongTy
(
	mact nvarchar(30) primary key not null,
	tenct nvarchar(30) ,
	trangthai nvarchar(30),
	thanhpho nvarchar(30)
	)

create table sanpham
(
	masp nvarchar(30) primary key not null,
	tensp nvarchar(30),
	mausac nvarchar(30),
	gia money,
	soluongco int
	)

create table cungung
(
	mact nvarchar(30) not null,
	masp nvarchar(30) not null,
	soluongban int,
	constraint fk_cu_ct foreign key (mact)
	references CongTy(mact),
	constraint fk_cu_sp foreign key (masp)
	references sanpham(masp)
)

insert into CongTy values (N'CT01',N'Công Ty A',N'Tốt',N'Hà Nội'),
						  (N'CT02',N'Công Ty B',N'Bình Thường',N'Hồ Chí Minh'),
						  (N'CT03',N'Công Ty C',N'Xấu',N'Đà Nẵng')

insert into sanpham values (N'SP01', N'San Pham A',N'Đỏ',20000,10000),
							(N'SP02', N'San Pham B',N'Tím',30000,50000),
							(N'SP03', N'San Pham C',N'Xanh',40000,60000)

insert into cungung values (N'CT01', N'SP02',3000),
							(N'CT01', N'SP03',2000),
							(N'CT02', N'SP01',4000),
							(N'CT02', N'SP03',6000),
							(N'CT03', N'SP03',5000),
							(N'CT03', N'SP01',7000)

select *from cungung