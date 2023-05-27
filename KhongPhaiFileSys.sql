--dinh dang hien thi ngay thang trong phien lam viec cua nguoi dung trong he thong quan tri co so du lieu Oracle
alter session set NLS_DATE_FORMAT='dd/mm/yyyy';

--xoa bang kho
drop table Kho
drop table KhachHang
drop table HoaDon


CREATE TABLE Kho (
MaKho NVARCHAR2(5) PRIMARY KEY,
TenKho NVARCHAR2(40),
DiaChiKho NVARCHAR2(40),
CONSTRAINT CHK_MAKHO_Kho CHECK (REGEXP_LIKE(MaKho, '^KH\d{3}$'))
);
--muon dinh dang kieu nhap la KH001 thi duc lenh nay len cho  tao bang
--CONSTRAINT CHK_MAKHO_Kho CHECK (MaKho LIKE 'KH%' AND LENGTH(MaKho) = 5 AND REGEXP_LIKE(SUBSTR(MaKho, 3), '\d{3}'))

--user nao tao bang thi cap quyen them, xoa, sua o bang do
GRANT INSERT, UPDATE, DELETE ON Kho TO DTH195155_QLKho;
GRANT INSERT ON Kho TO DTH195155_QLKho;
GRANT UPDATE ON Kho TO DTH195155_QLKho;
GRANT DELETE ON Kho TO DTH195155_QLKho;

--Bang Kho. Mu?n insert th? ph?i c? quy?n do ch?nh user t?o b?ng cap
GRANT INSERT ON Kho TO DTH195155_QLKho;
insert into Kho values ('KH001','Kho hang 01','So 04 - Hung Vuong - An Giang');
insert into Kho values ('KH002','Kho hang 02','So 25 - Nguyen Van Cu - An Giang');
insert into Kho values ('KH003','Kho hang 03','So 120 - Tran Hung Dao - An Giang');
insert into Kho values ('KH004','Kho hang 04','So 45 - Ly Thai To - An Giang');
insert into Kho values ('KH005','Kho hang 05','So 85 - Dinh Tien Hoang - An Giang');
insert into Kho values ('KH006','Kho hang 06','So 95 - Bui Thi Xuan - An Giang');


CREATE TABLE KhachHang (
  MaKH NVARCHAR2(10) CONSTRAINT KhachHang_PK PRIMARY KEY,
  TenKH NVARCHAR2(40),
  DiaChiKH NVARCHAR2(30),
  DonViKH NVARCHAR2(30)
);
GRANT INSERT, UPDATE, DELETE ON KhachHang TO DTH195155_QLKho;
insert into KhachHang values ('CTA00001','Nguyen Dong De','Thot Not - Can Tho','');
insert into KhachHang values ('CTA00002','Tran Thi Dieu','TP. Can Tho','');
insert into KhachHang values ('CTA00003','Huynh Anh Dung','Thanh Tri - Soc Trang','');
insert into KhachHang values ('CTA00004','Mac Hong Diem','Cau Ngang - Tra Vinh','');
insert into KhachHang values ('CTA00005','Nguyen Thanh','Binh Minh - Vinh Long','');

insert into KhachHang values ('CTB00006','La Hong Ngan','Chau Phu - An Giang','');
insert into KhachHang values ('CTB00007','Huynh Van Dam','Tan Chau - An Giang','');
insert into KhachHang values ('CTB00008','Tran Van Doan','Tam Binh - Vinh Long','');
insert into KhachHang values ('CTB00009','Bui Truc Linh','Thoai Son - An Giang','');
insert into KhachHang values ('CTB00010','Pham Tan Loi','Mo Cay - Ben Tre','');


CREATE TABLE HoaDon (
  SoHD NVARCHAR2(5) CONSTRAINT HoaDon_PK PRIMARY KEY,
  NgayHD DATE,
  LoaiHD NVARCHAR2(10),
  MaKH NVARCHAR2(10),
  MaKho NVARCHAR2(5),
  TriGia FLOAT CONSTRAINT HoaDon_TriGia_CK CHECK(TriGia > 0),
  Thue FLOAT,
  TriGiaTang FLOAT,
  DienGiaiHD NVARCHAR2(50),
  CONSTRAINT HoaDon_KhachHang_FK FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
  CONSTRAINT HoaDon_Kho_FK FOREIGN KEY (MaKho) REFERENCES Kho(MaKho)
);
GRANT INSERT, UPDATE, DELETE ON HoaDon TO DTH195155_QLKho;

--Bang HoaDon
insert into HoaDon values ('001',to_date('01/03/2013','dd/mm/yyyy'),'Nhap','CTA00001','KH004',20000,0.05,0,'');
insert into HoaDon values ('002',to_date('01/02/2013','dd/mm/yyyy'),'Xuat','CTA00002','KH001',30000,0.05,0,'');
insert into HoaDon values ('003',to_date('01/04/2013','dd/mm/yyyy'),'Nhap','CTA00003','KH002',15000,0.05,0,'');
insert into HoaDon values ('004',to_date('20/01/2013','dd/mm/yyyy'),'Nhap','CTA00004','KH005',16000,0.1,0,'');
insert into HoaDon values ('005',to_date('13/03/2013','dd/mm/yyyy'),'Xuat','CTB00006','KH002',34000,0.1,0,'');

insert into HoaDon values ('006',to_date('24/01/2013','dd/mm/yyyy'),'Xuat','CTB00007','KH001',32000,0.05,0,'');

insert into HoaDon values ('007',to_date('04/03/2013','dd/mm/yyyy'),'Nhap','CTB00008','KH002',24000,0.1,0,'');
insert into HoaDon values ('008',to_date('04/4/2013','dd/mm/yyyy'),'Xuat','CTB00009','KH003',35000,0.1,0,'');
insert into HoaDon values ('009',to_date('15/03/2013','dd/mm/yyyy'),'Nhap','CTA00001','KH004',39000,0.1,0,'');
insert into HoaDon values ('010',to_date('26/03/2013','dd/mm/yyyy'),'Nhap','CTA00002','KH001',37000,0.05,0,'');

insert into HoaDon values ('011',to_date('11/03/2013','dd/mm/yyyy'),'Xuat','CTA00003','KH002',23000,0.05,0,'');
insert into HoaDon values ('012',to_date('4/01/2013','dd/mm/yyyy'),'Xuat','CTB00006','KH003',36000,0.1,0,'');
insert into HoaDon values ('013',to_date('30/01/2013','dd/mm/yyyy'),'Nhap','CTB00007','KH002',78000,0.1,0,'');
insert into HoaDon values ('014',to_date('16/03/2013','dd/mm/yyyy'),'Nhap','CTB00008','KH001',25000,0.1,0,'');
insert into HoaDon values ('015',to_date('15/03/2013','dd/mm/yyyy'),'Xuat','CTB00006','KH005',56000,0.05,0,'');

select * from khachhang;
select * from kho;
select * from hoadon;

--Cap quyen select b?ng khach hàng cho user Khach hang
GRANT SELECT ON KhachHang TO DTH195155_KhachHang;

--Cap quyen select, insert, update tat ca bang cho user DTH195155_KeToan
GRANT SELECT, INSERT, UPDATE ON Kho TO DTH195155_KeToan;
GRANT SELECT, INSERT, UPDATE ON KhachHang TO DTH195155_KeToan;
GRANT SELECT, INSERT, UPDATE ON HoaDon TO DTH195155_KeToan;


--cap quyen cho role r_all
GRANT SELECT, INSERT, UPDATE, DELETE ON kho TO r_All;
GRANT SELECT, INSERT, UPDATE, DELETE ON khachhang TO r_All;
GRANT SELECT, INSERT, UPDATE, DELETE ON hoadon TO r_All;


GRANT SELECT, UPDATE, INSERT, DELETE ON KhachHang TO r_All;
GRANT SELECT, UPDATE, INSERT, DELETE ON Kho TO r_All;
GRANT SELECT, UPDATE, INSERT, DELETE ON HoaDon TO r_All;


--l?nh select ? BAN_GD
select * from DTH195155_QLKho.hoadon;

--l?nh ? qu?n tr?
UPDATE DTH195155_QLKho.hoadon
SET DTH195155_QLKho.hoadon.TriGiaTang = DTH195155_QLKho.hoadon.TriGia * 1.1
WHERE MaKH LIKE 'CTA%';

select * from DTH195155_QLKho.hoadon


--Dang nhap vao ke toan
UPDATE DTH195155_QLKho.hoadon
SET TriGiaTang = TriGia * 1.1
WHERE MaKH LIKE 'CTA%'


