use master
go
create database QLBanHang
on primary 
(
	name = 'quanlibanhang_dat',
	filename = 'D:\qlbanhang.mdf',
	size = 5MB , maxsize = 20MB, filegrowth = 1MB
)
log on 
(
	name = ' qlbanhang_log',
	filename = 'D:\qlbanhang.ldf',
	size = 1MB , maxsize = 5MB, filegrowth = 1MB
)
go 
use QLBanHang
go

create table HangSX
(
	MaHangSX nchar(10) not null primary key,
	TenHang nvarchar (20) ,
	DiaChi nvarchar(30),
	SoDT nvarchar (20),
	Email nvarchar (30)
)

create table SanPham
(
	MaSP nchar (10) not null primary key,
	MaHangSX nchar (10) ,
	TenSP nvarchar (20),
	SoLuong int,
	MauSac nvarchar (20),
	GiaBan money ,
	DonViTinh nchar (10),
	Mota nvarchar(max),
	constraint fk_SanPham_Hangsx foreign key (MaHangSX)
		references HangSX(MaHangSX)
)

create table NhanVien
(
	MaNV nchar(10) primary key,
	TenNV nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDT nvarchar(20),
	Email nvarchar(30),
	TenPhong nvarchar(30)
)

create table PNhap
(
	SoHDN nchar (10) not null primary key ,
	MaNV nchar(10),
	NgayNhap date,
	constraint fk_PNhap_nv foreign key (MaNV)
		references NhanVien(MaNV)
)

create table Nhap
(
	SoHDN nchar(10) not null ,
	MaSP nchar (10)not null,
	SoLuongN int ,
	DonGia money ,
	constraint pk_Nhap primary key (SoHDN, MaSP),
	constraint fk_Nhap_PNhap foreign key (SoHDN)
		references PNhap(SoHDN),
	constraint fk_Nhap_SP foreign key (MaSP)
		references SanPham(MaSP)
)

create table PXuat
(
	SoHDX nchar(10) not null primary key,
	NgayXuat date,
	MaNV nchar (10),
	constraint fk_PXuat_NV foreign key (MaNV)
		references NhanVien(MaNV)
)
create table Xuat 
(
	SoHDX nchar(10) not null ,
	MaSP nchar (20) ,
	SoLuongX int ,
	constraint pk_xuat primary key (SoHDX ,MaSP),
	constraint fk_Xuat_PXuat foreign key (SoHDX)
		references PXuat(SoHDX)
)

insert into HangSX values(N'H01', N'Samsung', N'Korea', N'011082717', N'ss@gmail.xom.kr')
insert into HangSX values(N'H02', N'OPPO', N'China', N'08108626262', N'oppo@gmail.com.cn')
insert into HangSX values(N'H03', N'Vinfone', N'Viet Nam', N'011082717', N'vf@gmail.com.vn')

insert into NhanVien values(N'nv1',N'Nguyễn Thị Thu', N' Nữ', N'Hà Nội', N'0982626521' , N'thu@gmail.com', N' Kết Toán')
insert into NhanVien values(N'nv2',N'Lê Văn Nam', ' Nam', N'Bắc Ninh', N'0982626521' , N'nam@gmail.com', N'Vật Tư')
insert into NhanVien values(N'nv3',N'Trần Hòa Binh', N' Nữ', N'Hà Nội', N'0982626521' , N'hb@gmail.com', N' Kết Toán')

insert into SanPham values (N'SP01', N'H02', N'F1Plus', 100, N'xám' , 7000000,N'chiếc', N'hàng cận cao cấp')
insert into SanPham values (N'SP02', N'H01', N'galaxy note 11', 50, N'đỏ' , 19000000,N'chiếc', N'hàng cận cao cấp')
insert into SanPham values (N'SP03', N'H02', N'f3 lite', 200, N'nâu' , 3000000,N'chiếc', N'hàng cận cao cấp')
insert into SanPham values (N'SP04', N'H03', N'vjoy 3', 200, N'xám' , 1500000,N'chiếc', N'hàng cận cao cấp')
insert into SanPham values (N'SP05', N'H01', N'galaxy v21', 500, N'nâu' , 8000000,N'chiếc', N'hàng cận cao cấp')

insert into PNhap values (N'N01',N'NV01',N'05-02-2019')
insert into PNhap values (N'N02',N'NV02',N'07-04-2020')
insert into PNhap values (N'N03',N'NV02',N'17-05-2020')
insert into PNhap values (N'N04',N'NV03',N'22-03-2020')
insert into PNhap values (N'N05',N'NV01',N'07-07-2020')

insert into Nhap values ( N'N01', N'SP02', 10, 17000000)
insert into Nhap values ( N'N02', N'SP01', 30, 5000000)
insert into Nhap values ( N'N03', N'SP04', 20, 1200000)
insert into Nhap values ( N'N04', N'SP01', 10, 6200000)
insert into Nhap values ( N'N05', N'SP05', 20, 7000000)



insert into PXuat values ( N'X01', N'14-03-2019',N'NV02')
insert into PXuat values ( N'X02', N'05-06-2019',N'NV01')
insert into PXuat values ( N'X03', N'12-12-2020',N'NV03')
insert into PXuat values ( N'X04', N'02-06-2020',N'NV01')
insert into PXuat values ( N'X05', N'18-05-2020',N'NV02')

insert into Xuat values( N'X01', N'SP03', 5)
insert into Xuat values( N'X02', N'SP01', 3)
insert into Xuat values( N'X03', N'SP02', 1)
insert into Xuat values( N'X04', N'SP03', 2)
insert into Xuat values( N'X05', N'SP05', 1)

-- bài 1
-- ý A

Select Nhap.SoHDN, SanPham.MaSP, TenSP, SoLuongN, DonGia, NgayNhap, TenNV,
TenPhong
From Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
 Inner join PNhap on Nhap.SoHDN=PNhap.SoHDN
 Inner join NhanVien on PNhap.MaNV = NhanVien.MaNV
 Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
Where TenHang = N'Samsung' And Year(NgayNhap)= 2017
-- ý B
Select Top 10 Xuat.SoHDX, NgayXuat, SoLuongX
From Xuat Inner join PXuat on Xuat.SoHDX=PXuat.SoHDX
Where Year(NgayXuat)=2020
Order by SoLuongX DESC-- Ý CSelect top 10 MaSP, TenSP,GiaBan
From SanPham
Order by GiaBan DESC-- ý DSelect MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
From SanPham Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
Where TenHang = N'Samsung' And GiaBan Between 100.000 And 500.000-- ý ESelect Sum(SoLuongN*DonGia) As N'Tổng tiền nhập'
From Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
 Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
 Inner join PNhap on Nhap.SoHDN=PNhap.SoHDN
Where Year(NgayNhap)=2020 And TenHang = N'Samsung'-- ý FSelect Sum(SoLuong*GiaBan) As N'Tổng tiền xuất'
From Xuat Inner join SanPham on Xuat.MaSP = SanPham.MaSP
 Inner join PXuat on Xuat.SoHDX=PXuat.SoHDX
 Where NgayXuat = '06/14/2020' -- ý G Select Nhap.SoHDN,NgayNhap
From Nhap Inner join PNhap on Nhap.SoHDN=PNhap.SoHDN
Where Year(NgayNhap)=2020 And SoLuongN*DonGia =
 (Select Max(SoLuongN*DonGia)
 From Nhap Inner join PNhap on
Nhap.SoHDN=PNhap.SoHDN
 Where Year(NgayNhap)=2020 ) -- bài 2 -- ý A Select HangSX.MaHangSX, TenHang, Count(*) As N'Số lượng sp'
From SanPham Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
Group by HangSX.MaHangSX, TenHang-- ý BSelect SanPham.MaSP,TenSP, sum(SoLuong*DonGia) As N'Tổng tiền nhập'
From Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
 Inner join PNhap on PNhap.SoHDN=Nhap.SoHDN
Where Year(NgayNhap)=2020
Group by SanPham.MaSP,TenSP-- ý CSelect SanPham.MaSP,TenSP,sum(SoLuongX) As N'Tổng xuất'
From Xuat Inner join SanPham on Xuat.MaSP = SanPham.MaSP
 Inner join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
 Inner join PXuat on Xuat.SoHDX=PXuat.SoHDX
Where Year(NgayXuat)=2018 And TenHang = N'Samsung'
Group by SanPham.MaSP,TenSP
Having sum(SoLuong) >=10000-- ý Dselect distinct TenPhong,GioiTInh,count(*) as N'so luong' from NhanViengroup by TenPhong,GioiTInh-- ý ESelect distinct SanPham.MaHangSX,TenSP, sum(SoLuongN) As N'Tổng số lượng nhập'
From Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
 Inner join PNhap on PNhap.SoHDN=Nhap.SoHDN
Where Year(NgayNhap)=2018
Group by SanPham.MaHangSX,TenSP

-- ý F

create view tennv
as
select MaNV,TenNV
from NhanVien;

select * from tennv