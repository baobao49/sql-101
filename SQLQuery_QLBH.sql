-- PHAN I
--cau 1
use QLBH
create table KHACHHANG (
MAKH char(4)CONSTRAINT PK_KH PRIMARY KEY,
HOTEN varchar(40),
DCHI varchar(50),
SODT varchar(20),
NGSINH smalldatetime check (NGSINH > '01/01/2024'),
DOANHSO money,
NGDK smalldatetime,
)
create table NHANVIEN (
MANV char(4) CONSTRAINT PK_NV PRIMARY KEY,
HOTEN varchar(40),
SODT varchar(20) unique,
NGVL smalldatetime constraint DF_NV Default(getdate()),
)
create table SANPHAM (
MASP char(4) CONSTRAINT PK_SP Primary key,
TENSP varchar(40),
DVT varchar(20),
NUOCSX varchar(40),
GIA money,
)
create table HOADON (
SOHD int constraint PK_HD Primary key,
NGHD smalldatetime,
MAKH char(4) constraint FK_HD_KH Foreign Key references KHACHHANG(MAKH),
MANV char(4) constraint FK_HD_NV Foreign Key references NHANVIEN(MANV),
TRIGIA money,
)
create table CTHD (
SOHD int references HOADON,
MASP char(4) references SANPHAM,
SL int,
)
--cau2 
ALter table SANPHAM add GHICHU varchar(20)
--cau3
ALter table KHACHHANG alter column  LOAIKH tinyint
--cau 4
Alter table SANPHAM alter column GHICHU varchar(100)
--cau 5
Alter table SANPHAM drop column GHICHU
--cau 6 Doi dinh dang
ALter table KHACHHANG alter column  LOAIKH varchar(20)
-- cau 7
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_DVT CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))
--cau 8
Alter table SANPHAM add check (GIA > 500)
--cau 9
Alter table CTHD ADD check (SL >= 1)
--cau 10
ALTER TABLE KHACHHANG ADD CHECK (NGDK > NGSINH)

-- cau 11

-- PHAN II
-- cau 1
SET DATEformat dmy
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) Values ('NV01','Nguyen Nhu Nhut','0927345678','2006/4/13')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) Values ('NV02','Le Thi Phi Yen','0987567390','21/4/2006')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) Values ('NV03','Nguyen Van B','0997047382','27/4/2006')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) Values ('NV04','Ngo Thanh Tuan','0913758498','24/6/2006')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) Values ('NV05','Nguyen Thi Truc Thanh','0918590387','20/7/2006')
SET DATEformat dmy
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960','13,060,000','22/07/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','3/4/1974','280,000','30/07/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/06/1980','3860000','05/08/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','09/03/1965','250000','02/10/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/03/1950','21000','28/10/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981','915000','24/11/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','06/04/1971','12500','01/12/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/01/1971','365000','13/12/2006')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','03/09/1979','70000','14/01/2007')
insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) Values ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','02/05/1983','67500','16/01/2007')

SELECT
    OBJECT_NAME(parent_object_id) AS TableName,
    name AS ConstraintName,
    definition
FROM
    sys.check_constraints
WHERE
    name = 'CK__KHACHHANG__571DF1D5';

Alter table KHACHHANG DROP constraint CK__KHACHHANG__NGSIN__37A5467C
Alter table KHACHHANG ADD CONSTRAINT CK__KHACHHANG__NGSIN__37A5467C CHECK (NGSINH < '01/01/2024')
Alter table KHACHHANG DROP constraint CK__KHACHHANG__571DF1D5

insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BC01','But chi','cay','Singapore','3000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BC02','But chi','cay','Singapore','5000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BC03','But chi','cay','Viet Nam','3500')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BC04','But chi','hop','Viet Nam','30000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BB01','But bi','cay','Viet Nam','5000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BB02','But bi','cay','Trung Quoc','7000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('BB03','But bi','hop','Thai Lan','100000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV01','Tap 100 giay mong','quyen','Trung Quoc','2500')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV02','Tap 200 giay mong','quyen','Trung Quoc','4500')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV03','Tap 100 giay tot','quyen','Viet Nam','3000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV04','Tap 200 giay tot','quyen','Viet Nam','5500')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV05','Tap 100 trang','chuc','Viet Nam','23000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV06','Tap 200 trang','chuc','Viet Nam','53000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('TV07','Tap 100 trang','chuc','Trung Quoc','34000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST01','So tay 500 trang','quyen','Trung Quoc','40000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST02','So tay loai 1','quyen','Viet Nam','55000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST03','So tay loai 2','quyen','Viet Nam','51000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST04','So tay','quyen','Thai Lan','55000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST05','So tay mong','quyen','Thai Lan','20000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST06','Phan viet bang','hop','Viet Nam','5000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST07','Phan khong bui','hop','Viet Nam','7000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST08','Bong bang','cai','Viet Nam','1000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST09','But long','cay','Viet Nam','5000')
insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) Values ('ST10','But long','cay','Trung Quoc','7000')


insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1001','3/07/2006','KH01','NV01','320000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1002','12/08/2006','KH01','NV02','840000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1003','23/08/2006','KH02','NV01','100000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1004','01/09/2006','KH02','NV01','180000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1005','20/10/2006','KH01','NV02','3800000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1006','16/10/2006','KH01','NV03','2430000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1007','28/10/2006','KH03','NV03','510000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1008','28/10/2006','KH01','NV03','440000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1009','28/10/2006','KH03','NV04','200000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1010','01/11/2006','KH01','NV01','5200000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1011','04/11/2006','KH04','NV03','250000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1012','30/11/2006','KH05','NV03','21000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1013','12/12/2006','KH06','NV01','5000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1014','31/12/2006','KH03','NV02','3150000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1015','01/01/2007','KH06','NV01','910000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1016','01/01/2007','KH07','NV02','12500')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1017','02/01/2007','KH08','NV03','35000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1018','13/01/2007','KH08','NV03','330000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1019','13/01/2007','KH01','NV03','30000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1020','14/01/2007','KH09','NV04','70000')
insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) VAlues ('1021','16/01/2007','KH10','NV03','67500')
insert into HOADON (SOHD,NGHD,MANV,TRIGIA) VAlues ('1022','16/01/2007','NV03','7000')
insert into HOADON (SOHD,NGHD,MANV,TRIGIA) VAlues ('1023','17/01/2007','NV01','330000')

insert into CTHD (SOHD,MASP,SL) Values ('1001','TV02','10')
insert into CTHD (SOHD,MASP,SL) Values ('1001','ST01','5')
insert into CTHD (SOHD,MASP,SL) Values ('1001','BC01','5')
insert into CTHD (SOHD,MASP,SL) Values ('1001','BC02','10')
insert into CTHD (SOHD,MASP,SL) Values ('1001','ST08','10')
insert into CTHD (SOHD,MASP,SL) Values ('1002','BC04','20')
insert into CTHD (SOHD,MASP,SL) Values ('1002','BB01','20')
insert into CTHD (SOHD,MASP,SL) Values ('1002','BB02','20')
insert into CTHD (SOHD,MASP,SL) Values ('1003','BB03','10')
insert into CTHD (SOHD,MASP,SL) Values ('1004','TV01','20')
insert into CTHD (SOHD,MASP,SL) Values ('1004','TV02','10')
insert into CTHD (SOHD,MASP,SL) Values ('1004','TV03','10')
insert into CTHD (SOHD,MASP,SL) Values ('1004','TV04','10')
insert into CTHD (SOHD,MASP,SL) Values ('1005','TV05','50')
insert into CTHD (SOHD,MASP,SL) Values ('1005','TV06','50')
insert into CTHD (SOHD,MASP,SL) Values ('1006','TV07','20')

insert into CTHD (SOHD,MASP,SL) Values ('1006','ST01','30')
insert into CTHD (SOHD,MASP,SL) Values ('1006','ST02','10')
insert into CTHD (SOHD,MASP,SL) Values ('1007','ST03','10')
insert into CTHD (SOHD,MASP,SL) Values ('1008','ST04','8')
insert into CTHD (SOHD,MASP,SL) Values ('1009','ST05','10')
insert into CTHD (SOHD,MASP,SL) Values ('1010','TV07','50')
insert into CTHD (SOHD,MASP,SL) Values ('1010','ST07','50')
insert into CTHD (SOHD,MASP,SL) Values ('1010','ST08','100')
insert into CTHD (SOHD,MASP,SL) Values ('1010','ST04','50')
insert into CTHD (SOHD,MASP,SL) Values ('1010','TV03','100')
insert into CTHD (SOHD,MASP,SL) Values ('1011','ST06','50')
insert into CTHD (SOHD,MASP,SL) Values ('1012','ST07','3')
insert into CTHD (SOHD,MASP,SL) Values ('1013','ST08','5')
insert into CTHD (SOHD,MASP,SL) Values ('1014','BC02','80')
insert into CTHD (SOHD,MASP,SL) Values ('1014','BB02','100')
insert into CTHD (SOHD,MASP,SL) Values ('1014','BC04','60')
insert into CTHD (SOHD,MASP,SL) Values ('1014','BB01','50')
insert into CTHD (SOHD,MASP,SL) Values ('1015','BB02','30')
insert into CTHD (SOHD,MASP,SL) Values ('1015','BB03','7')
insert into CTHD (SOHD,MASP,SL) Values ('1016','TV01','5')
insert into CTHD (SOHD,MASP,SL) Values ('1017','TV02','1')
insert into CTHD (SOHD,MASP,SL) Values ('1017','TV03','1')
insert into CTHD (SOHD,MASP,SL) Values ('1017','TV04','5')
insert into CTHD (SOHD,MASP,SL) Values ('1018','ST04','6')
insert into CTHD (SOHD,MASP,SL) Values ('1019','ST05','1')
insert into CTHD (SOHD,MASP,SL) Values ('1019','ST06','2')
insert into CTHD (SOHD,MASP,SL) Values ('1020','ST07','10')
insert into CTHD (SOHD,MASP,SL) Values ('1021','ST08','5')
insert into CTHD (SOHD,MASP,SL) Values ('1021','TV01','7')
insert into CTHD (SOHD,MASP,SL) Values ('1021','TV02','10')
insert into CTHD (SOHD,MASP,SL) Values ('1022','ST07','1')
insert into CTHD (SOHD,MASP,SL) Values ('1023','ST04','6')

--cau 2

Select * Into KHACHHANG1 From KHACHHANG
Select * Into SANPHAM1 From SANPHAM

--cau 3
Update SANPHAM1 SET GIA = GIA *1.05
Where NUOCSX = 'Thai Lan'

--cau 4
Update SANPHAM1 SET GIA = GIA *0.95
Where NUOCSX = 'Trung Quoc'

--cau 5
Update KHACHHANG1 SET LOAIKH = 'Vip'
Where NGDK <'1/1/2007' and DOANHSO >= 10000000
Update KHACHHANG1 SET LOAIKH = 'Vip'
Where NGDK > '1/1/2007' and DOANHSO >= 2000000

--Phan III
--cau 1
Select MASP,TENSP
From SANPHAM1
Where NUOCSX = 'Trung Quoc'

--cau 2
Select MASP,TENSP
From SANPHAM1
where DVT = 'cay' or DVT = 'quyen'

--cau 3
Select MASP,TENSP
From SANPHAM1
where LEFT(MASP,1) = 'B' and RIGHT(MASP,2) = '01'

--cau 4
Select MASP,TENSP
From SANPHAM1
Where NUOCSX = 'Trung Quoc' and GIA between 30000 and 40000

--cau5
select MASP, TENSP
FROM SANPHAM1
Where GIA between 30000 and 40000 AND NUOCSX IN ('Trung Quoc', 'Thai Lan')

--cau 6
Select SOHD,TRIGIA
From HOADON
Where NGHD between '1/1/2007' and '2/1/2007'

--cau 7
Select SOHD,TRIGIA
From HOADON
Where NGHD between '1/1/2007' and '2/1/2007'
Order by TRIGIA DESC

--cau 8
SELECT MAKH,HOTEN
FROM KHACHHANG1
WHERE MAKH IN (
				Select MAKH
				From HOADON
				WHERE NGHD between '1/1/2007' and '2/1/2007'
);

--cau 9
SET DATEformat dmy

SELECT SoHD, TriGia
FROM HoaDon, NhanVien
WHERE
	HoaDon.MaNV = NhanVien.MaNV
	AND HoTen = 'Nguyen Van B'
	AND NgHD = '28/10/2006'

--cau 10
SELECT DISTINCT SanPham.MaSP, TenSP
FROM SanPham, CTHD, KhachHang, HoaDon
WHERE
	CTHD.MaSP = SanPham.MaSP
	AND CTHD.SoHD = HoaDon.SoHD
	AND HoaDon.MaKH = KhachHang.MaKH
	AND HoTen = 'Nguyen Van A'
	AND MONTH(NGHD) = 10
	and YEAR(NGHD) = 2006

--cau 11

SELECT DISTINCT SOHD
From CTHD
WHERE MASP in ('BB01','BB02')

--cau 12
SELECT DISTINCT SOHD
From CTHD
WHERE MASP in ('BB01','BB02')
AND SL between 10 and 20

-- cau 13
SELECT DISTINCT SOHD
From CTHD
WHERE MASP = 'BB01'
AND SL between 10 and 20
intersect
SELECT DISTINCT SOHD
From CTHD
WHERE MASP = 'BB02'
AND SL between 10 and 20

--cau 14
SELECT DISTINCT SanPham.MaSP, TenSP
FROM HoaDon, SanPham, CTHD
WHERE
	HoaDon.SoHD = CTHD.SoHD
	AND CTHD.MaSP = SanPham.MaSP
	AND (NuocSX = 'Trung Quoc'
	OR NgHD = '1/1/2007')

--cau 15
SELECT DISTINCT MaSP, TenSP
FROM SanPham
Where[MASP] NOT IN (Select MASP From CTHD)

--cau 16
SELECT DISTINCT MaSP, TenSP
FROM SanPham
Where[MASP] Not In (
				Select MASP
				From CTHD,HOADON
				where
				CTHD.SOHD = HOADON.SOHD
				and year(HOADON.NGHD) = '2006'
);


-- cau 17
SELECT DISTINCT MaSP, TenSP
FROM SanPham
Where MASP NOT IN (
				SELECT DISTINCT SanPham.MaSP, TenSP
				FROM HoaDon, SanPham, CTHD
				WHERE
					HoaDon.SoHD = CTHD.SoHD
					AND CTHD.MaSP = SanPham.MaSP
					AND (NuocSX = 'Trung Quoc'
					OR YEAR(NgHD) = '2006')
);