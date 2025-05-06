﻿use master
create database QLNHANG
use QLNHANG
	Create table KHACHHANG
	(
		MaKhachHang Char(10) NOT NULL,
		TenKhachHang Nvarchar(50) NOT NULL,
		SoDienThoai Char(10) NULL UNIQUE Check (SoDienThoai Like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		DiaChi Nvarchar(50) NULL,
	Primary Key (MaKhachHang)
	) 
	go

	Create table MONAN
	(
		MaMonAn Char(10) NOT NULL,
		TenMon Nvarchar(50) NOT NULL,
		DonViTinh Nvarchar(50) NOT NULL,
		DonGia Money NOT NULL,
		TrangThai Nvarchar(50) NOT NULL Check ((TrangThai = N'Còn Món') or (TrangThai = N'Hết Món')),
		MaNhom Char(10) NOT NULL,
		SoLuongCon int NOT NULL,
	Primary Key (MaMonAn)
	) 
	go
	Create table NHANVIEN
	(
		MaNhanVien Char(10) NOT NULL,
		HoTen Nvarchar(50) NOT NULL,
		NgaySinh Datetime NULL,
		GioiTinh Nchar(5) NULL,
		SoDienThoai Char(10) NULL Unique Check (SoDienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		DiaChi Ntext NULL,
		ChucVu Nvarchar(50) NOT NULL,
		MaQuanLy Char(10) NULL,
		LuongCoBan Money NULL,
	Primary Key (MaNhanVien)
	) 
	go

	Create table NHOMMONAN
	(
		MaNhom Char(10) NOT NULL,
		TenNhom Nvarchar(50) NOT NULL,
	Primary Key (MaNhom)
	) 
	go

	Create table BAN
	(
		MaBan Char(10) NOT NULL,
		LoaiBan Nvarchar(50) NOT NULL,
		SoLuongCho Integer NOT NULL,
		TrangThai Nvarchar(50) NOT NULL Check ((TrangThai = N'Còn Bàn') or (TrangThai = N'Hết Bàn')),
	Primary Key (MaBan)
	) 
	go

	Create table CHITIETDATBAN
	(
		MaKhachHang Char(10) NOT NULL,
		MaBan Char(10) NOT NULL,
		SoLuongBan Integer NOT NULL,
	Primary Key (MaKhachHang,MaBan)
	) 
	go

	Create table DANHGIA
	(
		MaKhachHang Char(10) NOT NULL,
		MaMonAn Char(10) NOT NULL,
		NoiDungDanhGia Nvarchar(100) NULL,
		ThoiGianDanhGia Datetime NULL,
		DiemDanhGia Nvarchar(20) NULL,
	Primary Key (MaKhachHang,MaMonAn)
	) 
	go

	Create table CALAMVIEC
	(
		MaCa Char(10) NOT NULL,
		GioBatDau Datetime NOT NULL,
		GioKetThuc Datetime NOT NULL,
	Primary Key (MaCa)
	) 
	go

	Create table NHANVIEN_CALAMVIEC
	(
		NgayLam Datetime NOT NULL,
		MaNhanVien Char(10) NOT NULL,
		MaCa Char(10) NOT NULL,
	Primary Key (MaNhanVien,MaCa)
	) 
	go

	Create table KHUYENMAI
	(
		MaKhuyenMai Char(10) NOT NULL,
		TenKhuyenMai Nvarchar(30) NOT NULL,
		MoTa Nvarchar(50) NOT NULL,
	Primary Key (MaKhuyenMai)
	) 
	go

	Create table HOADON
	(
		MaHoaDon Char(10) NOT NULL,
		MaNhanVienLap Char(10) NOT NULL,
		NgayLapHoaDon Datetime NOT NULL,
		TongTienTruocGiam Money NULL,
		SoTienGiam Money NULL,
		TongTienPhaiTra Money NOT NULL,
		TrangThai Nvarchar(50) NOT NULL Check ((TrangThai = N'Đã thanh toán') or (TrangThai = N'Chưa thanh toán')),
		MaKhuyenMai Char(10)  NULL,
		MaKhachHang Char(10) NOT NULL,
	Primary Key (MaHoaDon)
	) 
	go

	Create table PHIEUNHAPHANG
	(
		MaPhieuNhap Char(10) NOT NULL,
		NgayTao Datetime NOT NULL,
		SoLuong Integer NOT NULL,
		NhaCungCap Nvarchar(50) NOT NULL,
		MaNhanVienNhap Char(10) NOT NULL,
	Primary Key (MaPhieuNhap)
	) 
	go

	Create table NGUYENLIEU
	(
		MaNguyenLieu Char(10) NOT NULL,
		TenNguyenLieu Nvarchar(50) NULL,
		Loai Nvarchar(30) NOT NULL,
		NgaySanXuat Datetime NOT NULL,
		HanSuDung Datetime NOT NULL,
		GiaBan Money NOT NULL,
		DonViTinh Nvarchar(30) NOT NULL,
	Primary Key (MaNguyenLieu)
	) 
	go

	Create table NGUYENLIEU_MonAN
	(
		MaMonAn Char(10) NOT NULL,
		MaNguyenLieu Char(10) NOT NULL,
		SoLuong Integer NOT NULL,
	Primary Key (MaMonAn,MaNguyenLieu)
	) 
	go

	Create table CHITIETNHAPHANG
	(
		MaNguyenLieu Char(10) NOT NULL,
		MaPhieuNhap Char(10) NOT NULL,
		SoLuongNhap Integer NOT NULL,
		DonGia Money NOT NULL,
		ThanhTien Money NOT NULL,
	Primary Key (MaNguyenLieu,MaPhieuNhap)
	) 
	go

	Create table PHIEUTHONGKE
	(
		MaPhieu Char(10) NOT NULL,
		NgayThongKe Datetime NOT NULL,
		DoanhThu Money NOT NULL,
		Thu Money NOT NULL,
		Chi Money NOT NULL,
		MaNhanVien Char(10) NOT NULL,
	Primary Key (MaPhieu)
	) 
	go

	Create table CHITIETHOADON
	(
		MaHoaDon Char(10) NOT NULL,
		MaMonAn Char(10) NOT NULL,
		SoLuong Integer NOT NULL,
	Primary Key (MaHoaDon,MaMonAn)
	) 
	go

Alter table CHITIETDATBAN add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DANHGIA add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DanhGia add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table CHITIETHOADON add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table NHANVIEN add  foreign key(MaQuanLy) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUTHonGKE add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaNhanVienLap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUNHAPHANG add  foreign key(MaNhanVienNhap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table MONAN add  foreign key(MaNhom) references NHOMMONAN (MaNhom)  on update no action on delete no action 
go
Alter table CHITIETDATBAN add  foreign key(MaBan) references BAN (MaBan)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaCa) references CALAMVIEC (MaCa)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhuyenMai) references KHUYENMAI (MaKhuyenMai)  on update no action on delete no action 
go
Alter table CHITIETHOADon add  foreign key(MaHoaDon) references HOADON (MaHoaDon)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaPhieuNhap) references PHIEUNHAPHANG (MaPhieuNhap)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go


insert into KHACHHANG values 
--(MaKhachHang, TenKhachHang, SoDienThoai, DiaChi)
('KH031', N'Hoàng Gia Huy', '0920154470', N'416 Nguyễn Trãi, Q5'),
('KH032', N'Đặng Nhật Quân', '0972750775', N'102 Lý Thường Kiệt, Q10'),
('KH033', N'Võ Hải Bình', '0990926027', N'789 Cách Mạng Tháng 8, Q3'),
('KH034', N'Ngô Thị Nam', '0969882772', N'203 Điện Biên Phủ, Q Bình Thạnh'),
('KH035', N'Bùi Thanh Huy', '0948125366', N'202 Điện Biên Phủ, Q Bình Thạnh'),
('KH036', N'Phạm Thanh Sơn', '0938299117', N'418 Nguyễn Trãi, Q5'),
('KH037', N'Bùi Gia Dung', '0978072682', N'121 Lý Thường Kiệt, Q10'),
('KH038', N'Hoàng Phúc Hùng', '0933490814', N'421 Nguyễn Trãi, Q5'),
('KH039', N'Trần Thị Chi', '0939890476', N'791 Cách Mạng Tháng 8, Q3'),
('KH040', N'Đỗ Thị Huy', '0997852752', N'209 Điện Biên Phủ, Q Bình Thạnh'),
('KH041', N'Võ Hoài Tú', '0962908082', N'456 Nguyễn Trãi, Q5'),
('KH042', N'Đặng Hải Tú', '0941608448', N'101 Lý Thường Kiệt, Q10'),
('KH043', N'Lê Hải Việt', '0954595045', N'406 Nguyễn Trãi, Q5'),
('KH044', N'Phạm Phúc Dương', '0929726094', N'123 Lê Văn Sỹ, Q3'),
('KH045', N'Trần Gia Sơn', '0986421640', N'204 Điện Biên Phủ, Q Bình Thạnh'),
('KH046', N'Ngô Gia Hùng', '0969369484', N'212 Điện Biên Phủ, Q Bình Thạnh'),
('KH047', N'Lê Khánh Phong', '0922286527', N'206 Điện Biên Phủ, Q Bình Thạnh'),
('KH048', N'Nguyễn Gia An', '0995867440', N'111 Lý Thường Kiệt, Q10'),
('KH049', N'Hoàng Gia Dung', '0911861274', N'123 Trần Hưng Đạo, Q1'),
('KH050', N'Ngô Hải Quân', '0989001980', N'108 Lý Thường Kiệt, Q10'),
('KH051', N'Nguyễn Gia Hân', '0911111111', N'12 Nguyễn Huệ, Q1'),
('KH053', N'Lê Thanh Tú', '0911111112', N'45 Nguyễn Văn Cừ, Q5'),
('KH055', N'Trần Văn Duy', '0911111113', N'78 Lý Thường Kiệt, Q10'),
('KH056', N'Phan Thị Mai', '0911111114', N'123 Cách Mạng Tháng 8, Q3'),
('KH059', N'Đỗ Minh Nhật', '0911111115', N'22 Điện Biên Phủ, Q Bình Thạnh'),
('KH060', N'Lê Minh Tân', '0911111116', N'99 Trần Hưng Đạo, Q1');


insert into NHOMMonAN values
--(MaNhom, TenNhom)
('NM01', N'Món Khai Vị'),
('NM02', N'Món Chính'),
('NM03', N'Tráng Miệng'),
('NM04', N'Đồ Uống'),
('NM05', N'Món Ăn Nhanh'),
('NM06', N'Món Ăn Sáng'),
('NM07', N'Món Ăn Chay'),
('NM08', N'Món Lẩu'),
('NM09', N'Món Đặc Biệt'),
('NM10', N'Món Truyền Thống'),
('NM11', N'VIP'),
('NM12', N'Luxury'),
('NM13', N'Đặc biệt'),
('NM14', N'Giới hạn'),
('NM15', N'Độc lạ');



insert into CALAMVIEC values 
--(MaCa, GioBatDau, GioKetThuc) 
('C01', '07:00', '11:00'),
('C02', '11:00', '14:00'),
('C03', '14:00', '17:00'),
('C04', '17:00', '22:00'),
('C05', '07:00', '22:00'),
('C06', '22:00', '02:00');



insert into KHUYENMAI values
--(MaKhuyenMai, TenKhuyenMai, MoTa)
('KM01', N'Khuyến mãi 1', N'Giảm 10% khi gọi món Cơm tấm'),
('KM02', N'Khuyến mãi 2', N'Miễn phí chè ba màu cho nhóm ≥5 người'),
('KM03', N'Khuyến mãi 3', N'Miễn phí chè ba màu cho nhóm ≥6 người'),
('KM04', N'Khuyến mãi 4', N'Tặng chè ba màu cho hóa đơn > 200k'),
('KM05', N'Khuyến mãi 5', N'Giảm 20% cho hóa đơn 14h–17h'),
('KM06', N'Khuyến mãi 6', N'Combo 249k: 3 món + tráng miệng'),
('KM07', N'Khuyến mãi 7', N'Combo 199k: 3 món + tráng miệng'),
('KM08', N'Khuyến mãi 8', N'Combo 249k: 2 món chính + 2 nước'),
('KM09', N'Khuyến mãi 9', N'Giảm 15% khi gọi món Cơm tấm'),
('KM10', N'Khuyến mãi 10', N'Giảm 25% hóa đơn trong giờ 14h–17h'),
('KM11', N'Khuyến mãi 11', N'Giảm 15% khi gọi món Bún bò Huế'),
('KM12', N'Khuyến mãi 12', N'Combo 199k: 2 món chính + 2 nước'),
('KM13', N'Khuyến mãi 13', N'Tặng trà đào cho hóa đơn > 100k'),
('KM14', N'Khuyến mãi 14', N'Miễn phí súp cua cho nhóm ≥5 người'),
('KM15', N'Khuyến mãi 15', N'Combo 249k: 2 món chính + 2 nước'),
('KM16', N'Khuyến mãi 16', N'Tặng gỏi cuốn cho hóa đơn > 150k'),
('KM17', N'Khuyến mãi 17', N'Giảm 20% hóa đơn trong giờ 14h–17h'),
('KM18', N'Khuyến mãi 18', N'Combo 249k: 2 món chính + 2 nước'),
('KM19', N'Khuyến mãi 19', N'Combo 299k: 3 món + tráng miệng'),
('KM20', N'Khuyến mãi 20', N'Giảm 25% khi gọi món Bún bò Huế'),
('KM21', N'Khuyến mãi 21', N'Miễn phí trà đào cho nhóm ≥6 người'),
('KM22', N'Khuyến mãi 22', N'Giảm 15% khi gọi món Bún bò Huế'),
('KM23', N'Khuyến mãi 23', N'Giảm 15% hóa đơn trong giờ 18h–20h'),
('KM24', N'Khuyến mãi 24', N'Giảm 25% hóa đơn trong giờ 14h–17h'),
('KM25', N'Khuyến mãi 25', N'Tặng trà đào cho hóa đơn > 150k');



insert into NGUYENLIEU values
--(MaNguyenLieu, TenNguyenLieu, Loai, NgaySanXuat, HanSuDung, GiaBan, DonViTinh) 
('NL001', N'Thịt bò', N'Thịt', '2025-03-22', '2025-05-28', 198194, N'nguyên gói'),
('NL002', N'Thịt gà', N'Thịt', '2025-03-08', '2025-08-28', 49849, N'bó'),
('NL003', N'Thịt heo', N'Thịt', '2025-03-11', '2025-06-12', 60385, N'gói'),
('NL004', N'Tôm sú', N'Hải sản', '2025-03-11', '2025-06-17', 90251, N'gói'),
('NL005', N'Cua biển', N'Hải sản', '2025-03-27', '2025-06-22', 68085, N'bó'),
('NL006', N'Cá hồi', N'Hải sản', '2025-03-22', '2025-09-05', 61591, N'bó'),
('NL007', N'Cá lóc', N'Hải sản', '2025-03-14', '2025-07-26', 77141, N'nguyên hộp'),
('NL008', N'Mực ống', N'Hải sản', '2025-03-26', '2025-07-13', 96258, N'chai'),
('NL009', N'Trứng gà', N'Trứng', '2025-03-24', '2025-07-26', 86713, N'chai'),
('NL010', N'Trứng vịt', N'Trứng', '2025-03-03', '2025-08-12', 117693, N'nguyên hộp'),
('NL011', N'Gạo', N'Gạo', '2025-03-04', '2025-08-20', 113245, N'gói'),
('NL012', N'Bún tươi', N'Tinh bột', '2025-03-05', '2025-07-27', 90531, N'kg'),
('NL013', N'Phở khô', N'Tinh bột', '2025-03-09', '2025-05-31', 195295, N'lít'),
('NL014', N'Mì trứng', N'Tinh bột', '2025-03-26', '2025-06-02', 152015, N'lít'),
('NL015', N'Nước mắm', N'Gia vị', '2025-03-28', '2025-08-10', 26899, N'nguyên chai'),
('NL016', N'Nước tương', N'Gia vị', '2025-03-12', '2025-07-23', 82794, N'gói'),
('NL017', N'Muối', N'Gia vị', '2025-03-01', '2025-07-26', 133154, N'kg'),
('NL018', N'Đường', N'Gia vị', '2025-03-15', '2025-07-23', 182955, N'hộp'),
('NL019', N'Tiêu đen', N'Gia vị', '2025-03-21', '2025-08-15', 167399, N'nguyên hộp'),
('NL020', N'Ớt', N'Rau củ', '2025-03-19', '2025-06-18', 171982, N'hộp'),
('NL021', N'Tỏi', N'Gia vị', '2025-04-02', '2025-06-17', 120778, N'lít'),
('NL022', N'Hành tím', N'Gia vị', '2025-03-27', '2025-06-16', 180156, N'nguyên hộp'),
('NL023', N'Cà rốt', N'Rau củ', '2025-03-21', '2025-07-03', 136978, N'nguyên gói'),
('NL024', N'Khoai tây', N'Rau củ', '2025-03-14', '2025-06-02', 123683, N'nguyên gói'),
('NL025', N'Bắp cải', N'Rau củ', '2025-03-22', '2025-05-27', 124481, N'hộp'),
('NL026', N'Xà lách', N'Rau củ', '2025-03-23', '2025-06-22', 21851, N'nguyên hộp'),
('NL027', N'Dầu ăn', N'Gia vị', '2025-03-15', '2025-05-26', 49946, N'gói'),
('NL028', N'Sữa đặc', N'Khác', '2025-03-21', '2025-07-06', 145193, N'nguyên hộp'),
('NL029', N'Gừng', N'Gia vị', '2025-03-15', '2025-05-23', 187755, N'bó'),
('NL030', N'Hành lá', N'Rau củ', '2025-03-26', '2025-06-16', 38239, N'gói'),
('NL031', N'Nho đỏ Pháp', N'Trái cây', '2025-03-19', '2025-06-05', 39418, N'nguyên hộp'),
('NL032', N'Nho trắng Ý', N'Trái cây', '2025-03-27', '2025-07-17', 133432, N'nguyên gói'),
('NL033', N'Gạo nếp cái hoa vàng', N'Gạo', '2025-03-31', '2025-06-12', 172263, N'nguyên hộp'),
('NL034', N'Men rượu truyền thống', N'Gia vị', '2025-03-24', '2025-06-01', 180658, N'nguyên chai'),
('NL035', N'Siro chanh dây', N'Đồ uống', '2025-03-30', '2025-07-27', 109018, N'nguyên hộp'),
('NL036', N'Siro đào', N'Đồ uống', '2025-03-26', '2025-07-18', 66186, N'nguyên hộp'),
('NL037', N'Soda', N'Đồ uống', '2025-03-31', '2025-06-17', 175019, N'nguyên hộp'),
('NL038', N'Tonic', N'Đồ uống', '2025-03-29', '2025-07-06', 159205, N'nguyên chai'),
('NL039', N'Đá viên tinh khiết', N'Đồ uống', '2025-03-27', '2025-06-07', 122104, N'nguyên chai'),
('NL040', N'Rượu nền vodka', N'Đồ uống', '2025-04-01', '2025-06-29', 198143, N'nguyên gói');

insert into BAN values 
--(MaBan, LoaiBan, SoLuongCho, TrangThai)
('B031', N'Bàn thường', 4, N'Còn bàn'),
('B032', N'Bàn thường', 2, N'Còn bàn'),
('B033', N'Bàn luxury', 6, N'Hết bàn'),
('B034', N'Bàn VIP', 8, N'Hết bàn'),
('B035', N'Bàn thường', 4, N'Còn bàn'),
('B036', N'Bàn thường', 4, N'Hết bàn'),
('B037', N'Bàn luxury', 6, N'Còn bàn'),
('B038', N'Bàn VIP', 10, N'Còn bàn'),
('B039', N'Bàn thường', 2, N'Hết bàn'),
('B040', N'Bàn thường', 4, N'Còn bàn'),
('B041', N'Bàn thường', 4, N'Còn bàn'),
('B042', N'Bàn thường', 2, N'Hết bàn'),
('B043', N'Bàn Luxury bản giới hạn', 20, N'Hết bàn'),
('B044', N'Bàn VIP', 8, N'Còn bàn'),
('B045', N'Bàn thường', 4, N'Hết bàn'),
('B046', N'Bàn thường', 2, N'Còn bàn'),
('B047', N'Bàn luxury', 6, N'Còn bàn'),
('B048', N'Bàn VIP', 10, N'Hết bàn'),
('B049', N'Bàn thường', 4, N'Còn bàn'),
('B050', N'Bàn thường', 4, N'Còn bàn');

insert into MonAN values
--(MaMonAn, TenMon, DonViTinh, DonGia, TrangThai, MaNhom, SoLuongCon)
('MA031', N'Gỏi cuốn', N'Cái', 57366, N'Còn Món', 'NM01', 148),
('MA032', N'Nem rán', N'Phần', 51743, N'Còn Món', 'NM01', 140),
('MA033', N'Bánh xèo miền Tây', N'Cái', 55812, N'Còn Món', 'NM01', 174),
('MA034', N'Cơm tấm sườn bì', N'Đĩa', 77576, N'Còn Món', 'NM02', 126),
('MA035', N'Phở bò tái', N'Tô', 46799, N'Còn Món', 'NM02', 80),
('MA036', N'Bún bò Huế', N'Tô', 39088, N'Còn Món', 'NM02', 168),
('MA037', N'Mì Quảng', N'Tô', 41394, N'Còn Món', 'NM06', 149),
('MA038', N'Bánh cuốn nóng', N'Đĩa', 61210, N'Còn Món', 'NM06', 103),
('MA039', N'Bánh mì chảo', N'Phần', 32857, N'Còn Món', 'NM05', 85),
('MA040', N'Xôi gà', N'Hộp', 56263, N'Còn Món', 'NM06', 59),
('MA041', N'Chè ba màu', N'Ly', 45233, N'Còn Món', 'NM03', 173),
('MA042', N'Bánh bèo Huế', N'Chén', 40596, N'Còn Món', 'NM03', 116),
('MA043', N'Súp cua', N'Tô', 47032, N'Còn Món', 'NM03', 107),
('MA044', N'Trà đào cam sả', N'Ly', 67836, N'Còn Món', 'NM04', 79),
('MA045', N'Sinh tố bơ', N'Ly', 42623, N'Còn Món', 'NM04', 165),
('MA046', N'Coca Cola', N'Chai', 60083, N'Còn Món', 'NM04', 176),
('MA047', N'Lẩu hải sản', N'Nồi', 70732, N'Còn Món', 'NM08', 178),
('MA048', N'Lẩu bò nhúng giấm', N'Nồi', 56354, N'Còn Món', 'NM08', 77),
('MA049', N'Cơm chay thập cẩm', N'Đĩa', 74433, N'Còn Món', 'NM07', 138),
('MA050', N'Bún riêu chay', N'Tô', 72982, N'Còn Món', 'NM07', 174),
('MA051', N'Tôm hùm nướng phô mai', N'Phần', 1530771, N'Còn Món', 'NM09', 79),
('MA052', N'Lẩu cá hồi Sapa', N'Nồi', 2361439, N'Còn Món', 'NM08', 171),
('MA053', N'Bò Wagyu nướng đá', N'Phần', 1791654, N'Còn Món', 'NM09', 90),
('MA054', N'Cua hoàng đế hấp', N'Phần', 2079513, N'Còn Món', 'NM09', 71),
('MA055', N'Combo hải sản đặc biệt', N'Set', 2293877, N'Còn Món', 'NM09', 157),
('MA056', N'Rượu Hennessy Paradis', N'Chai', 3400000, N'Còn Món', 'NM04', 14),
('MA057', N'Rượu Hibiki 21 năm', N'Chai', 4100000, N'Còn Món', 'NM04', 15),
('MA058', N'Rượu Yamazaki 18 năm', N'Chai', 4500000, N'Còn Món', 'NM04', 12),
('MA059', N'Rượu Glenfiddich 21 năm', N'Chai', 6600000, N'Còn Món', 'NM04', 6),
('MA060', N'Rượu MaCallan Rare Cask', N'Chai', 3300000, N'Còn Món', 'NM04', 5),
('MA061', N'Rượu Laphroaig 25 năm', N'Chai', 4200000, N'Còn Món', 'NM04', 6),
('MA062', N'Rượu Highland Park 18 năm', N'Chai', 8400000, N'Còn Món', 'NM04', 6),
('MA063', N'Rượu Louis XIII mini', N'Chai', 7100000, N'Còn Món', 'NM04', 7),
('MA064', N'Rượu Dom Pérignon Rose', N'Chai', 8200000, N'Còn Món', 'NM04', 11),
('MA065', N'Rượu Krug Vintage', N'Chai', 5700000, N'Còn Món', 'NM04', 6),
('MA066', N'Rượu Vang Ý Tignanello', N'Chai', 3100000, N'Còn Món', 'NM04', 15),
('MA067', N'Rượu Bordeaux Grand Cru', N'Chai', 9100000, N'Còn Món', 'NM04', 10),
('MA068', N'Rượu Rémy Martin Club', N'Chai', 7200000, N'Còn Món', 'NM04', 5),
('MA069', N'Rượu Glenlivet 18 năm', N'Chai', 6300000, N'Còn Món', 'NM04', 8),
('MA070', N'Rượu Beluga Gold Line', N'Chai', 3700000, N'Còn Món', 'NM04', 13);


insert into NHANVIEN values
--(MaNhanVien, HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) QUẢN LÝ
('NV040', N'Ngô Gia Bình', '1996-07-11', N'Nam', '0977613007', N'Đà Nẵng', N'Quản lý', NULL, 7200000),
('NV042', N'Nguyễn Thanh Nam', '1994-09-18', N'Nam', '0953878843', N'TP.HCM', N'Quản lý', NULL, 7400000),
('NV047', N'Ngô Gia Tú', '1997-02-07', N'Nữ', '0968427260', N'Hải Phòng', N'Quản lý', NULL, 8550000),
('NV051', N'Nguyễn Nhật Lan', '1994-06-24', N'Nam', '0998832020', N'Cần Thơ', N'Quản lý', NULL, 5650000),
('NV053', N'Đặng Khánh Hùng', '1995-02-13', N'Nữ', '0942463808', N'Đà Nẵng', N'Quản lý', NULL, 7800000);

insert into NHANVIEN values
--(MaNhanVien, HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) NHÂN VIÊN
('NV032', N'Phạm Minh An', '1997-11-20', N'Nam', '0940899397', N'Cần Thơ', N'Phục vụ', 'NV040', 7200000),
('NV033', N'Ngô Phúc Phong', '1999-10-10', N'Nam', '0984331446', N'TP.HCM', N'Phục vụ', 'NV040', 9200000),
('NV037', N'Lê Hải Phong', '1994-12-27', N'Nữ', '0978402962', N'Cần Thơ', N'Phục vụ', 'NV040', 7300000),
('NV046', N'Phạm Gia Lan', '1993-05-05', N'Nữ', '0994819319', N'TP.HCM', N'Đầu bếp', 'NV040', 9500000),
('NV050', N'Bùi Thị Tú', '1995-05-14', N'Nam', '0918742201', N'Bình Dương', N'Thu ngân', 'NV040', 7200000),
('NV031', N'Lê Thanh Dung', '1994-12-01', N'Nữ', '0999680763', N'Cần Thơ', N'Đầu bếp', 'NV040', 6100000),
('NV034', N'Lê Phúc Phong', '1995-03-21', N'Nam', '0935549587', N'TP.HCM', N'Đầu bếp', 'NV040', 10300000),
('NV035', N'Đỗ Thanh Việt', '1994-11-11', N'Nam', '0961348290', N'Bình Dương', N'Kế toán', 'NV040', 10250000),
('NV036', N'Đỗ Phúc Việt', '1996-07-14', N'Nữ', '0999486872', N'Hà Nội', N'Phục vụ', 'NV040', 5650000),
('NV038', N'Ngô Khánh Linh', '1997-08-11', N'Nữ', '0994366622', N'Bình Dương', N'Phục vụ', 'NV040', 9050000),
('NV039', N'Đặng Gia Hùng', '1999-01-04', N'Nam', '0969194871', N'Cần Thơ', N'Đầu bếp', 'NV040', 9200000),
('NV041', N'Bùi Thanh Nam', '1999-10-09', N'Nữ', '0955892146', N'Bình Dương', N'Phục vụ', 'NV040', 6900000),
('NV043', N'Ngô Khánh Hùng', '1998-07-14', N'Nữ', '0913742021', N'Cần Thơ', N'Đầu bếp', 'NV042', 6600000),
('NV044', N'Trần Quốc An', '1994-12-24', N'Nữ', '0986902868', N'Đà Nẵng', N'Kế toán', 'NV042', 9300000),
('NV045', N'Nguyễn Hải Nam', '1993-07-01', N'Nam', '0929638223', N'Cần Thơ', N'Thu ngân', 'NV040', 11400000),
('NV048', N'Nguyễn Văn An', '1995-02-08', N'Nữ', '0916129886', N'Hà Nội', N'Phục vụ', 'NV047', 10400000),
('NV049', N'Võ Minh Linh', '1999-07-11', N'Nam', '0949581184', N'TP.HCM', N'Phục vụ', 'NV047', 9000000),
('NV052', N'Đỗ Gia Nam', '1997-07-08', N'Nam', '0988376941', N'Hải Phòng', N'Đầu bếp', 'NV051', 7500000),
('NV054', N'Hoàng Nhật Dung', '1999-05-25', N'Nữ', '0964553581', N'Hải Phòng', N'Đầu bếp', 'NV051', 8400000),
('NV055', N'Trần Hải Lan', '1999-05-03', N'Nam', '0997015796', N'Cần Thơ', N'Thu ngân', 'NV051', 9550000),
('NV056', N'Trần Nhật Dung', '1995-10-19', N'Nữ', '0978896061', N'Hà Nội', N'Đầu bếp', 'NV042', 7550000),
('NV057', N'Nguyễn Khánh Việt', '1997-10-08', N'Nam', '0917769511', N'Đà Nẵng', N'Đầu bếp', 'NV047', 5300000),
('NV058', N'Ngô Văn Linh', '1993-02-04', N'Nữ', '0975927226', N'Hải Phòng', N'Phục vụ', 'NV051', 9950000),
('NV059', N'Phạm Thị Bình', '1999-10-26', N'Nữ', '0987254189', N'Đà Nẵng', N'Đầu bếp', 'NV040', 5150000),
('NV060', N'Đặng Thị Chi', '1996-03-06', N'Nữ', '0958625131', N'Đà Nẵng', N'Phục vụ', 'NV053', 10500000);


insert into PHIEUNHAPHANG values
--(MaPhieuNhap, NgayTao, SoLuong, NhaCungCap, MaNhanVienNhap)
('PN001', '2025-04-02', 120, N'Nhà cung cấp A', 'NV036'),
('PN002', '2025-04-13', 90, N'Nhà cung cấp miền Tây', 'NV052'),
('PN003', '2025-04-03', 85, N'Nhà cung cấp miền Tây', 'NV059'),
('PN004', '2025-04-08', 130, N'Kho nguyên liệu chế biến', 'NV057'),
('PN005', '2025-04-02', 75, N'Kho nguyên liệu chế biến', 'NV051'),
('PN006', '2025-04-14', 110, N'Kho nguyên liệu chế biến', 'NV035'),
('PN007', '2025-04-15', 92, N'Nhà cung cấp miền Tây', 'NV042'),
('PN008', '2025-04-07', 40, N'Nhập rượu cao cấp', 'NV052'),
('PN009', '2025-04-01', 65, N'Thực đơn mới', 'NV057'),
('PN010', '2025-04-15', 88, N'Thực đơn mới', 'NV037'),
('PN011', '2025-04-01', 95, N'Định kỳ tuần', 'NV051'),
('PN012', '2025-04-11', 55, N'Nhập rượu cao cấp', 'NV045'),
('PN013', '2025-04-13', 98, N'Nhà cung cấp miền Tây', 'NV041'),
('PN014', '2025-04-11', 72, N'Định kỳ tuần', 'NV032'),
('PN015', '2025-04-12', 106, N'Định kỳ tuần', 'NV059'),
('PN016', '2025-04-04', 38, N'Nhập rượu cao cấp', 'NV031'),
('PN017', '2025-04-03', 42, N'Nhập rượu cao cấp', 'NV031'),
('PN018', '2025-04-03', 64, N'Nhập rượu cao cấp', 'NV034'),
('PN019', '2025-04-06', 70, N'Kho nguyên liệu chế biến', 'NV050'),
('PN020', '2025-04-07', 79, N'Kho nguyên liệu chế biến', 'NV046');



insert into PHIEUTHonGKE values 
--(MaPhieu, NgayThongKe, DoanhThu, Thu, Chi, MaNhanVien) 
('PTK001', '2025-04-01', 6172575, 3774009, 2398566, 'NV045'),
('PTK002', '2025-04-02', 5655660, 202159, 5453501, 'NV041'),
('PTK003', '2025-04-03', 1029781, -4366427, 5396209, 'NV060'),
('PTK004', '2025-04-04', 1153305, -2780992, 3934298, 'NV043'),
('PTK005', '2025-04-05', 30128904, 30128904, 0, 'NV056'),
('PTK006', '2025-04-06', 2492996, 975460, 1517536, 'NV039'),
('PTK007', '2025-04-07', 9789191, 5010582, 4778609, 'NV040'),
('PTK008', '2025-04-08', 3023701, 697299, 2326402, 'NV046'),
('PTK009', '2025-04-09', 12552934, 12552934, 0, 'NV055'),
('PTK010', '2025-04-10', 16271450, 16271450, 0, 'NV045'),
('PTK011', '2025-04-11', 9192085, 6543172, 2648912, 'NV043'),
('PTK012', '2025-04-12', 7112232, 5569227, 1543004, 'NV033'),
('PTK013', '2025-04-13', 5687236, 15808678, 5685656, 'NV041'),
('PTK014', '2025-04-14', 12379565, 11108119, 1271445, 'NV036'),
('PTK015', '2025-04-15', 1016609, -2268396, 3285006, 'NV060');


insert into CHITIETNHAPHANG values
--(MaPhieuNhap, MaNguyenLieu, SoLuongNhap, DonGia, ThanhTien) 
('PN001', 'NL011', 5.59, 116134, 649189.06),
('PN001', 'NL035', 5.78, 177290, 1024736.20),
('PN001', 'NL031', 8.77, 183810, 1612013.70),
('PN001', 'NL002', 2.44, 86300, 210572.00),
('PN002', 'NL023', 8.12, 98397, 798983.64),
('PN002', 'NL001', 3.73, 113453, 423179.69),
('PN002', 'NL014', 9.07, 131070, 1188804.90),
('PN002', 'NL012', 7.67, 52215, 400489.05),
('PN002', 'NL030', 4.21, 132497, 557812.37),
('PN003', 'NL015', 2.8, 186557, 522359.60),
('PN003', 'NL007', 3.3, 169985, 560950.50),
('PN003', 'NL038', 5.21, 110355, 574949.55),
('PN003', 'NL021', 8.63, 105390, 909515.70),
('PN004', 'NL020', 8.82, 129840, 1145188.80),
('PN004', 'NL033', 8.55, 50757, 433972.35),
('PN004', 'NL031', 4.91, 29221, 143475.11),
('PN004', 'NL022', 9.37, 64436, 603765.32),
('PN005', 'NL030', 8.84, 51173, 452369.32),
('PN005', 'NL005', 10.0, 26360, 263600.00),
('PN005', 'NL032', 9.01, 105276, 948536.76),
('PN005', 'NL003', 8.34, 35070, 292983.80),
('PN006', 'NL022', 1.06, 65925, 69880.50),
('PN006', 'NL017', 3.88, 174087, 675451.56),
('PN006', 'NL025', 3.4, 35747, 121539.80),
('PN006', 'NL038', 7.42, 43278, 321157.56),
('PN006', 'NL031', 1.26, 66226, 83444.76),
('PN007', 'NL034', 2.69, 152443, 410073.67),
('PN007', 'NL005', 9.62, 124354, 1196368.48),
('PN007', 'NL002', 7.44, 104742, 779268.48),
('PN008', 'NL028', 2.1, 198183, 416184.30),
('PN008', 'NL016', 9.42, 53714, 505968.88),
('PN008', 'NL025', 9.82, 196464, 1928871.48),
('PN008', 'NL005', 1.85, 164628, 304561.80),
('PN009', 'NL014', 2.4, 150228, 360547.20),
('PN009', 'NL030', 5.86, 21072, 123493.92),
('PN009', 'NL017', 1.36, 81168, 110388.48),
('PN010', 'NL017', 6.22, 70702, 439968.44),
('PN010', 'NL018', 5.64, 22931, 129354.84),
('PN010', 'NL036', 8.32, 39696, 330396.72),
('PN011', 'NL017', 3.84, 25112, 96429.12),
('PN011', 'NL020', 4.68, 165259, 773011.32),
('PN011', 'NL037', 6.48, 144183, 933289.84),
('PN012', 'NL019', 5.83, 49656, 289513.48),
('PN012', 'NL023', 5.28, 119208, 629388.24),
('PN013', 'NL013', 5.05, 113504, 573191.20),
('PN013', 'NL016', 4.06, 103812, 421478.72),
('PN013', 'NL035', 6.95, 110007, 764548.65),
('PN013', 'NL003', 7.84, 71067, 557167.28),
('PN014', 'NL026', 3.81, 185847, 708064.07),
('PN014', 'NL011', 9.06, 112795, 1021683.70),
('PN015', 'NL021', 2.43, 59052, 143488.36),
('PN015', 'NL039', 8.8, 159035, 1399488.00),
('PN016', 'NL009', 7.99, 194862, 1557396.38),
('PN016', 'NL015', 6.61, 30047, 198626.67),
('PN016', 'NL008', 2.74, 164047, 449493.00),
('PN016', 'NL036', 9.51, 181835, 1731561.85),
('PN017', 'NL031', 5.18, 107302, 556915.36),
('PN017', 'NL037', 1.82, 42780, 77879.60),
('PN018', 'NL004', 2.04, 159734, 325848.36),
('PN018', 'NL011', 6.47, 70198, 454197.06),
('PN018', 'NL035', 7.44, 107853, 801424.32),
('PN018', 'NL028', 6.38, 56938, 363654.44),
('PN018', 'NL033', 2.57, 96895, 249011.15),
('PN019', 'NL039', 8.27, 32106, 265429.62),
('PN019', 'NL001', 7.07, 177089, 1250870.23),
('PN020', 'NL024', 9.38, 84976, 797222.88),
('PN020', 'NL013', 6.46, 71288, 460900.48),
('PN020', 'NL008', 2.88, 43186, 124359.68),
('PN020', 'NL039', 1.9, 126647, 240629.30);

insert into NGUYENLIEU_MONAN values
--(MaMonAn, MaNguyenLieu, SoLuong)
('MA038', 'NL002', 2),
('MA046', 'NL015', 1),
('MA037', 'NL035', 1),
('MA058', 'NL003', 1),
('MA044', 'NL015', 1),
('MA032', 'NL036', 1),
('MA065', 'NL027', 1),
('MA068', 'NL018', 2),
('MA031', 'NL011', 1),
('MA052', 'NL018', 1),
('MA052', 'NL007', 1),
('MA037', 'NL023', 2),
('MA069', 'NL017', 2),
('MA060', 'NL035', 1),
('MA055', 'NL006', 1),
('MA070', 'NL024', 1),
('MA035', 'NL003', 1),
('MA049', 'NL006', 2),
('MA037', 'NL025', 1),
('MA054', 'NL011', 1),
('MA044', 'NL018', 1),
('MA035', 'NL039', 1),
('MA065', 'NL016', 1),
('MA055', 'NL018', 2),
('MA066', 'NL015', 1),
('MA034', 'NL015', 2),
('MA051', 'NL026', 1),
('MA044', 'NL037', 2),
('MA051', 'NL014', 1),
('MA056', 'NL030', 1),
('MA039', 'NL016', 2),
('MA065', 'NL017', 2),
('MA058', 'NL038', 1),
('MA045', 'NL009', 1),
('MA036', 'NL004', 2),
('MA040', 'NL011', 2),
('MA058', 'NL039', 1),
('MA055', 'NL039', 2),
('MA064', 'NL017', 2),
('MA031', 'NL008', 1),
('MA065', 'NL018', 2),
('MA052', 'NL008', 1),
('MA041', 'NL030', 1),
('MA047', 'NL033', 2),
('MA063', 'NL007', 2),
('MA050', 'NL033', 1),
('MA040', 'NL024', 2),
('MA065', 'NL034', 2),
('MA069', 'NL021', 1),
('MA038', 'NL024', 2),
('MA050', 'NL016', 1),
('MA067', 'NL006', 1),
('MA062', 'NL005', 2),
('MA065', 'NL009', 1),
('MA061', 'NL036', 1),
('MA064', 'NL039', 1),
('MA044', 'NL035', 2),
('MA043', 'NL020', 1),
('MA054', 'NL029', 2),
('MA059', 'NL008', 1),
('MA035', 'NL022', 1),
('MA031', 'NL005', 1),
('MA033', 'NL022', 1),
('MA046', 'NL018', 1),
('MA067', 'NL037', 1),
('MA061', 'NL027', 1),
('MA037', 'NL028', 1),
('MA057', 'NL030', 2),
('MA034', 'NL007', 1),
('MA043', 'NL035', 1),
('MA058', 'NL012', 1),
('MA046', 'NL005', 1),
('MA066', 'NL007', 1),
('MA065', 'NL001', 2),
('MA046', 'NL011', 1),
('MA061', 'NL014', 2),
('MA034', 'NL011', 1),
('MA055', 'NL017', 2),
('MA060', 'NL019', 1),
('MA066', 'NL032', 1),
('MA049', 'NL014', 2),
('MA068', 'NL035', 1),
('MA051', 'NL004', 1),
('MA061', 'NL033', 2),
('MA064', 'NL011', 1),
('MA063', 'NL006', 2),
('MA046', 'NL026', 1),
('MA067', 'NL016', 1),
('MA033', 'NL040', 1),
('MA068', 'NL037', 1),
('MA047', 'NL014', 1),
('MA051', 'NL016', 1),
('MA039', 'NL020', 1),
('MA035', 'NL001', 1),
('MA067', 'NL007', 1);


insert into HOADON values
--(MaHoaDon, MaNhanVienLap, NgayLapHoaDon, TongTienTruocGiam, SoTienGiam, TongTienPhaiTra, TrangThai, MaKhuyenMai, MaKhachHang)
('HD201', 'NV057', '2025-04-09', 10224815, 0, 7574842, N'Chưa thanh toán', 'KM14', 'KH039'),
('HD202', 'NV034', '2025-04-10', 9353646, 20000, 10513336, N'Đã thanh toán', 'KM16', 'KH033'),
('HD203', 'NV042', '2025-04-11', 8108980, 0, 8758091, N'Chưa thanh toán', NULL, 'KH031'),
('HD204', 'NV060', '2025-04-14', 4759064, 50000, 9376758, N'Đã thanh toán', 'KM01', 'KH038'),
('HD205', 'NV036', '2025-04-05', 12964988, 0, 13453924, N'Chưa thanh toán', 'KM01', 'KH032'),
('HD206', 'NV051', '2025-04-05', 13615130, 10000, 14025555, N'Đã thanh toán', 'KM11', 'KH037'),
('HD207', 'NV060', '2025-04-12', 6482494, 0, 5315042, N'Chưa thanh toán', NULL, 'KH041'),
('HD208', 'NV060', '2025-04-01', 6024622, 0, 3230469, N'Đã thanh toán', NULL, 'KH060'),
('HD209', 'NV039', '2025-04-07', 14641854, 0, 6043523, N'Đã thanh toán', NULL, 'KH035'),
('HD210', 'NV057', '2025-04-02', 3173814, 0, 3673646, N'Đã thanh toán', NULL, 'KH055'),
('HD211', 'NV056', '2025-04-08', 1023969, 0, 1042566, N'Chưa thanh toán', NULL, 'KH040'),
('HD212', 'NV060', '2025-04-07', 7629062, 20000, 1697388, N'Đã thanh toán', 'KM04', 'KH051'),
('HD213', 'NV044', '2025-04-03', 4397672, 0, 1029781, N'Đã thanh toán', NULL, 'KH047'),
('HD214', 'NV053', '2025-04-02', 7253692, 50000, 1731138, N'Đã thanh toán', 'KM25', 'KH044'),
('HD215', 'NV039', '2025-04-09', 4594582, 10000, 1642819, N'Chưa thanh toán', 'KM06', 'KH051'),
('HD216', 'NV040', '2025-04-09', 1021315, 0, 402992, N'Đã thanh toán', NULL, 'KH048'),
('HD217', 'NV033', '2025-04-09', 8686214, 0, 1148131, N'Đã thanh toán', NULL, 'KH036'),
('HD218', 'NV058', '2025-04-10', 6605998, 0, 1887597, N'Đã thanh toán', NULL, 'KH042'),
('HD219', 'NV038', '2025-04-06', 1021315, 20000, 360638, N'Chưa thanh toán', 'KM22', 'KH037'),
('HD220', 'NV039', '2025-04-02', 3579182, 10000, 250876, N'Đã thanh toán', 'KM03', 'KH059'),
('HD221', 'NV058', '2025-04-11', 4759064, 0, 433994, N'Chưa thanh toán', 'KM12', 'KH056'),
('HD222', 'NV057', '2025-04-13', 4054490, 0, 792158, N'Chưa thanh toán', NULL, 'KH050'),
('HD223', 'NV049', '2025-04-05', 1586907, 0, 343543, N'Đã thanh toán', NULL, 'KH045'),
('HD224', 'NV059', '2025-04-15', 3306137, 50000, 1016609, N'Chưa thanh toán', 'KM20', 'KH049'),
('HD225', 'NV039', '2025-04-01', 6482494, 0, 1769033, N'Chưa thanh toán', NULL, 'KH037'),
('HD226', 'NV042', '2025-04-01', 9560640, 10000, 423951, N'Chưa thanh toán', 'KM14', 'KH060'),
('HD227', 'NV031', '2025-04-04', 1586907, 0, 1153305, N'Chưa thanh toán', NULL, 'KH041'),
('HD228', 'NV060', '2025-04-13', 6024622, 10000, 1886183, N'Chưa thanh toán', 'KM09', 'KH034'),
('HD229', 'NV048', '2025-04-05', 3839909, 0, 721675, N'Đã thanh toán', NULL, 'KH031'),
('HD230', 'NV050', '2025-04-13', 6287185, 0, 1659207, N'Chưa thanh toán', NULL, 'KH053');

insert into DANHGIA values 
--(MaKhachHang, MaMonAn, NoiDungDanhGia, ThoiGianDanhGia, DiemDanhGia)
('KH036', 'MA047', N'Hơi mặn nhưng ổn.', '2025-04-05', '1'),
('KH044', 'MA043', N'Rất hài lòng với món này!', '2025-04-01', '3'),
('KH036', 'MA042', N'Ngon xuất sắc!', '2025-04-06', '5'),
('KH046', 'MA031', N'Bình thường, không có gì đặc biệt.', '2025-04-11', '4'),
('KH034', 'MA034', N'Hơi mặn nhưng ổn.', '2025-04-07', '2'),
('KH045', 'MA046', N'Thức ăn nguội, phục vụ chậm.', '2025-04-11', '4'),
('KH045', 'MA036', N'Giá hơi cao nhưng đáng.', '2025-04-12', '4'),
('KH046', 'MA038', N'Bình thường, không có gì đặc biệt.', '2025-04-05', '3'),
('KH038', 'MA039', N'Bình thường, không có gì đặc biệt.', '2025-04-01', '3'),
('KH032', 'MA044', N'Bình thường, không có gì đặc biệt.', '2025-04-08', '1'),
('KH034', 'MA032', N'Trình bày đẹp, món ngon.', '2025-04-10', '2'),
('KH038', 'MA034', N'Rất hài lòng với món này!', '2025-04-14', '5'),
('KH034', 'MA033', N'Không hợp khẩu vị lắm.', '2025-04-07', '1'),
('KH032', 'MA039', N'Rất hài lòng với món này!', '2025-04-13', '4'),
('KH041', 'MA050', N'Thức ăn nguội, phục vụ chậm.', '2025-04-02', '2'),
('KH031', 'MA050', N'Trình bày đẹp, món ngon.', '2025-04-01', '5'),
('KH033', 'MA041', N'Hơi mặn nhưng ổn.', '2025-04-01', '2'),
('KH044', 'MA046', N'Rất hài lòng với món này!', '2025-04-07', '5'),
('KH045', 'MA044', N'Rất đáng tiền, sẽ quay lại.', '2025-04-06', '5'),
('KH049', 'MA038', N'Món ăn ngon, sẽ quay lại!', '2025-04-15', '5');

insert into CHITIETDATBAN values
--(MAKHACHHANG, MaBan, SOLUonGBAN)
('KH031', 'B031', 5),
('KH032', 'B032', 5),
('KH033', 'B033', 10),
('KH034', 'B034', 9),
('KH035', 'B035', 8),
('KH036', 'B036', 2),
('KH037', 'B037', 10),
('KH038', 'B038', 9),
('KH039', 'B039', 8),
('KH040', 'B040', 3),
('KH041', 'B041', 10),
('KH042', 'B042', 10),
('KH043', 'B043', 5),
('KH044', 'B044', 2),
('KH045', 'B045', 8),
('KH046', 'B046', 9),
('KH047', 'B047', 7),
('KH048', 'B048', 7),
('KH049', 'B049', 2),
('KH050', 'B050', 10);


insert into NHANVIEN_CALAMVIEC values
--(NgayLam, MaNhanVien, MaCa)
('2025-04-12', 'NV042', 'C03'),
('2025-04-12', 'NV058', 'C06'),
('2025-04-11', 'NV054', 'C03'),
('2025-04-12', 'NV057', 'C02'),
('2025-04-12', 'NV052', 'C04'),
('2025-04-12', 'NV060', 'C05'),
('2025-04-11', 'NV041', 'C02'),
('2025-04-12', 'NV034', 'C01'),
('2025-04-10', 'NV051', 'C02'),
('2025-04-10', 'NV056', 'C01'),
('2025-04-12', 'NV032', 'C06'),
('2025-04-10', 'NV045', 'C03'),
('2025-04-11', 'NV060', 'C03'),
('2025-04-12', 'NV057', 'C06'),
('2025-04-12', 'NV052', 'C05'),
('2025-04-11', 'NV040', 'C04'),
('2025-04-11', 'NV055', 'C06'),
('2025-04-11', 'NV041', 'C04'),
('2025-04-10', 'NV046', 'C01'),
('2025-04-11', 'NV034', 'C03'),
('2025-04-12', 'NV035', 'C03'),
('2025-04-12', 'NV032', 'C02'),
('2025-04-12', 'NV043', 'C01'),
('2025-04-11', 'NV040', 'C05'),
('2025-04-11', 'NV036', 'C04'),
('2025-04-10', 'NV051', 'C06'),
('2025-04-12', 'NV047', 'C04'),
('2025-04-11', 'NV058', 'C04'),
('2025-04-10', 'NV033', 'C04'),
('2025-04-12', 'NV053', 'C06'),
('2025-04-12', 'NV037', 'C02'),
('2025-04-12', 'NV050', 'C01'),
('2025-04-12', 'NV031', 'C06'),
('2025-04-12', 'NV038', 'C05'),
('2025-04-12', 'NV039', 'C04'),
('2025-04-12', 'NV044', 'C03'),
('2025-04-12', 'NV048', 'C05'),
('2025-04-12', 'NV049', 'C04'),
('2025-04-12', 'NV059', 'C06');


insert into CHITIETHOADON values
--(MaHoaDon, MaMonAn, SoLuong)
('HD201', 'MA043', 4),
('HD201', 'MA048', 5),
('HD202', 'MA043', 2),
('HD202', 'MA037', 5),
('HD202', 'MA032', 3),
('HD202', 'MA049', 2),
('HD202', 'MA058', 5),
('HD203', 'MA057', 4),
('HD203', 'MA062', 4),
('HD203', 'MA036', 3),
('HD203', 'MA069', 4),
('HD203', 'MA054', 2),
('HD204', 'MA049', 2),
('HD204', 'MA047', 3),
('HD205', 'MA057', 2),
('HD205', 'MA051', 5),
('HD205', 'MA050', 5),
('HD205', 'MA058', 3),
('HD206', 'MA033', 1),
('HD206', 'MA067', 4),
('HD207', 'MA060', 1),
('HD207', 'MA065', 5),
('HD207', 'MA050', 4),
('HD207', 'MA039', 1),
('HD208', 'MA064', 1),
('HD208', 'MA035', 1),
('HD208', 'MA042', 2),
('HD209', 'MA059', 4),
('HD209', 'MA038', 3),
('HD209', 'MA056', 1),
('HD209', 'MA069', 2),
('HD210', 'MA052', 1),
('HD210', 'MA048', 1),
('HD210', 'MA068', 2),
('HD210', 'MA043', 4),
('HD210', 'MA058', 2),
('HD211', 'MA035', 1),
('HD211', 'MA033', 3),
('HD212', 'MA052', 5),
('HD212', 'MA040', 2),
('HD212', 'MA061', 2),
('HD213', 'MA036', 3),
('HD213', 'MA052', 4),
('HD213', 'MA053', 2),
('HD213', 'MA038', 3),
('HD214', 'MA038', 1),
('HD214', 'MA057', 4),
('HD214', 'MA061', 1),
('HD215', 'MA058', 2),
('HD215', 'MA037', 3),
('HD216', 'MA041', 1),
('HD216', 'MA037', 4),
('HD216', 'MA055', 2),
('HD216', 'MA043', 2),
('HD217', 'MA051', 4),
('HD217', 'MA031', 2),
('HD218', 'MA045', 3),
('HD218', 'MA056', 5),
('HD219', 'MA057', 1),
('HD219', 'MA058', 4),
('HD220', 'MA034', 2),
('HD220', 'MA048', 5),
('HD220', 'MA060', 5),
('HD220', 'MA062', 2),
('HD221', 'MA044', 4),
('HD221', 'MA064', 4),
('HD221', 'MA034', 3),
('HD222', 'MA031', 4),
('HD222', 'MA059', 1),
('HD222', 'MA048', 1),
('HD223', 'MA050', 5),
('HD223', 'MA060', 3),
('HD224', 'MA070', 1),
('HD224', 'MA038', 3),
('HD224', 'MA032', 5),
('HD224', 'MA069', 3),
('HD224', 'MA037', 1),
('HD225', 'MA063', 2),
('HD225', 'MA054', 3),
('HD225', 'MA036', 4),
('HD225', 'MA067', 1),
('HD226', 'MA062', 2),
('HD226', 'MA070', 5),
('HD227', 'MA056', 5),
('HD227', 'MA037', 4),
('HD227', 'MA040', 5),
('HD228', 'MA035', 2),
('HD228', 'MA063', 3),
('HD228', 'MA067', 2),
('HD229', 'MA060', 5),
('HD229', 'MA049', 1),
('HD229', 'MA039', 1),
('HD229', 'MA038', 5),
('HD230', 'MA042', 1),
('HD230', 'MA070', 2),
('HD230', 'MA043', 2);



-------------------------------------------------READ------------------------------------
-- DANH SÁCH TẤT CẢ BẢNG - select TOÀN BỘ DỮ LIỆU
select * from KHACHHANG
select * from MONAN
select * from NHOMMONAN
select * from NHANVIEN
select * from BAN
select * from CHITIETDATBAN
select * from DANHGIA
select * from CALAMVIEC
select * from NHANVIEN_CALAMVIEC
select * from KHUYENMAI
select * from HOADON
select * from CHITIETHOADON
select * from PHIEUNHAPHANG
select * from CHITIETNHAPHANG
select * from NGUYENLIEU
select * from NGUYENLIEU_MONAN
select * from PHIEUTHONGKE
--Kiểm tra tốc độ truy vấn
--Kiểm tra thời gian
set statistics time on
set statistics time off

--Kiểm tra tài nguyên
set statistics io on
set statistics io off
-- 1. MÓN ĂN BÁN CHẠY NHẤT (được gọi nhiều nhất)
set statistics io on
set statistics time on
select top 1 ct.MaMonAn, m.TenMon, sum(ct.SoLuong) as SoLuongBan
from CHITIETHOADON ct
join MONAN m on ct.MaMonAn = m.MaMonAn
group by ct.MaMonAn, m.TenMon
order by sum(ct.SoLuong) desc;
set statistics time off
set statistics io off
go
--top 5 món ăn bán chạy nhất
select top 5 ma.TenMon, sum(ct.SoLuong) as TongSoLuongBan
from CHITIETHOADON ct
join MONAN ma on ct.MaMonAn = ma.MaMonAn
group by ma.TenMon
order by TongSoLuongBan desc;

-- 2. MÓN ĂN TỒN KHO NHIỀU NHẤT (ít được gọi → tồn kho cao)
select top 1 MaMonAn, TenMon, SoLuongCon
from MONAN
order by SoLuongCon desc;
go

-- ======================================================================================
-- 3. TÌM MÓN ĂN THEO TÊN (dùng like)
-- Ví dụ: tìm tất cả món có từ "cơm"
select * from MONAN
where TenMon like N'%cơm%';
go
-- ======================================================================================
---- 4. NHÂN VIÊN CÓ NHIỀU HOÁ ĐƠN LẬP NHẤT
select top 1 nv.MaNhanVien, nv.HoTen, count(hd.MaHoaDon) as SoLuongHoaDon
from HOADON hd
join NHANVIEN nv on hd.MaNhanVienLap = nv.MaNhanVien
group by nv.MaNhanVien, nv.HoTen
order by count(hd.MaHoaDon) desc;
go

-- ======================================================================================
-- 5. DANH SÁCH MÓN ĂN ĐƯỢC GỌI TRONG BÀN (theo lịch sử đặt bàn)
-- Truy vấn món ăn trong một bàn cụ thể (ví dụ: bàn B031)
select db.MaBan, b.LoaiBan, ma.TenMon, cthd.SoLuong
from CHITIETDATBAN db
join BAN b on db.MaBan = b.MaBan
join HOADON hd on db.MaKhachHang = hd.MaKhachHang
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn
where db.MaBan = 'B031';
go

-- ======================================================================================
-- 6. CHI TIẾT PHIẾU NHẬP HÀNG
select p.MaPhieuNhap, nl.TenNguyenLieu, c.SoLuongNhap, c.DonGia, c.ThanhTien
from CHITIETNHAPHANG c
join NGUYENLIEU nl on c.MaNguyenLieu = nl.MaNguyenLieu
join PHIEUNHAPHANG p on c.MaPhieuNhap = p.MaPhieuNhap;
go

-- ======================================================================================
-- 7. DOANH THU, LỢI NHUẬN THEO NGÀY
select convert(date, NgayThongKe) as Ngay, 
       sum(DoanhThu) as TongDoanhThu, 
       sum(Thu - Chi) as LoiNhuan
from PHIEUTHONGKE
group by convert(date, NgayThongKe)
order by Ngay;
go
-- ======================================================================================
---- 8. DOANH THU, LỢI NHUẬN THEO THÁNG
select year(NgayThongKe) as Nam, 
       month(NgayThongKe) as Thang,
       sum(DoanhThu) as TongDoanhThu,
       sum(Thu - Chi) as LoiNhuan
from PHIEUTHONGKE
group by year(NgayThongKe), month(NgayThongKe)
order by Nam, Thang;
go

-- ======================================================================================
---- 9. THÔNG TIN CHI TIẾT NHÂN VIÊN (kèm tên quản lý)
select nv.*, ql.HoTen as TenQuanLy
from NHANVIEN nv
left join NHANVIEN ql on nv.MaQuanLy = ql.MaNhanVien;
go

-- ======================================================================================
-- 10. THÔNG TIN CHI TIẾT HÓA ĐƠN (kèm món ăn)
select hd.MaHoaDon, hd.NgayLapHoaDon, kh.TenKhachHang, nv.HoTen as NhanVienLap, 
       km.TenKhuyenMai, hd.TongTienPhaiTra, ma.TenMon, cthd.SoLuong
from HOADON hd
join KHACHHANG kh on hd.MaKhachHang = kh.MaKhachHang
join NHANVIEN nv on hd.MaNhanVienLap = nv.MaNhanVien
left join KHUYENMAI km on hd.MaKhuyenMai = km.MaKhuyenMai
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn;
go

-- ======================================================================================
-- 11. NGUYÊN LIỆU SẮP HẾT HẠN (trong vòng 7 ngày tới)
select MaNguyenLieu, TenNguyenLieu, HanSuDung
from NGUYENLIEU
where HanSuDung <= dateadd(day, 7, getdate())
order by HanSuDung;
go
-- ======================================================================================
-- 12. LỊCH SỬ ĐẶT BÀN & GỌI MÓN CỦA KHÁCH
-- Lịch sử đặt bàn:
select kh.MaKhachHang, kh.TenKhachHang, db.MaBan, b.LoaiBan, db.SoLuongBan
from CHITIETDATBAN db
join BAN b on db.MaBan = b.MaBan
join KHACHHANG kh on db.MaKhachHang = kh.MaKhachHang;
go
-- ======================================================================================
-- Lịch sử gọi món (thông qua hóa đơn):
select kh.MaKhachHang, kh.TenKhachHang, hd.MaHoaDon, ma.TenMon, cthd.SoLuong
from HOADON hd
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn
join KHACHHANG kh on hd.MaKhachHang = kh.MaKhachHang;
go

-- ======================================================================================
--13.Thống kê số lượng đơn hàng mỗi ngày
select convert(DATE, NgayLapHoaDon) as Ngay, count(*) as SoHoaDon
from HOADON
group by convert(DATE, NgayLapHoaDon)
order by Ngay;

---------------------------------------------update------------
-- 1. Cập nhật giá món ăn
update MONAN
set DonGia = 85000
where MaMonAn = 'MA034';

-- 2. Cập nhật số lượng món ăn còn lại
update MONAN
set SoLuongCon = SoLuongCon - 2
where MaMonAn = 'MA034';

-- 3. Cập nhật trạng thái bàn
update BAN
set TrangThai = N'Hết bàn'
where MaBan = 'B031';

-- 4. Cập nhật mã khuyến mãi trong hóa đơn
update HOADON
set MaKhuyenMai = 'KM05'
where MaHoaDon = 'HD202';

-- 5. Cập nhật trạng thái hóa đơn
update HOADON
set TrangThai = N'Đã thanh toán'
where MaHoaDon = 'HD202';
-----------------------------------------------------delete-----------------
-- 1. Xóa món ăn theo mã
delete from MONAN
where MaMonAn = 'MA005';

-- 2. Xóa hóa đơn (chú ý ràng buộc khóa ngoại)
delete from CHITIETHOADON
where MaHoaDon = 'HD205';

delete from HOADON
where MaHoaDon = 'HD205';

-- 3. Xóa nhân viên (phải xử lý các bảng liên quan trước)
delete from NHANVIEN_CALAMVIEC
where MaNhanVien = 'NV041';

delete from NHANVIEN
where MaNhanVien = 'NV041';

-- 4. Xóa khách hàng
delete from CHITIETDATBAN where MaKhachHang = 'KH050';
delete from HOADON where MaKhachHang = 'KH050';
delete from KHACHHANG where MaKhachHang = 'KH050';


-- ===================== THỐNG KÊ & BÁO CÁO =====================

-- 1. đếm số lượng bản ghi theo nhóm (group by, count)

-- đếm số lượng món ăn theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    count(MONAN.MaMonAn) as SoLuongMonAn,
    sum(MONAN.SoLuongCon) as TongSoLuongCon
from NHOMMONAN
left join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom
group by NHOMMONAN.TenNhom;

-- đếm số lượng hóa đơn theo trạng thái
select 
    TrangThai,
    count(MaHoaDon) as SoLuongHoaDon
from HOADON
group by TrangThai;

-- đếm số lượng bàn theo loại bàn và trạng thái
select 
    LoaiBan,
    TrangThai,
    count(MaBan) as SoLuongBan
from BAN
group by LoaiBan, TrangThai;

-- đếm số lượng đánh giá theo điểm đánh giá
select 
    DiemDanhGia,
    count(*) as SoLuongDanhGia
from DANHGIA
group by DiemDanhGia;

-- đếm số lượng phiếu nhập hàng theo nhà cung cấp
select 
    NhaCungCap,
    count(MaPhieuNhap) as SoLuongPhieuNhap
from PHIEUNHAPHANG
group by NhaCungCap;

-- đếm số lượng nhân viên theo chức vụ
select 
    ChucVu,
    count(MaNhanVien) as SoLuongNhanVien
from NHANVIEN
group by ChucVu;

-- đếm số lượng ca làm việc của nhân viên
select 
    NHANVIEN.HoTen,
    count(NHANVIEN_CALAMVIEC.MaCa) as SoLuongCaLam
from NHANVIEN
left join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien
group by NHANVIEN.HoTen;

-- đếm số lượng khách hàng đặt bàn
select 
    KHACHHANG.TenKhachHang,
    count(CHITIETDATBAN.MaBan) as SoLuongBanDat
from KHACHHANG
left join CHITIETDATBAN on KHACHHANG.MaKhachHang = CHITIETDATBAN.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- đếm số lượng hóa đơn sử dụng khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    count(HOADON.MaHoaDon) as SoLuongHoaDon
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- đếm số lượng món ăn tồn kho
select 
    NHOMMONAN.TenNhom,
    sum(MONAN.SoLuongCon) as TongSoLuongTonKho,
    count(case when MONAN.SoLuongCon <= 10 then 1 end) as SoMonGanHet
from MONAN
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
group by NHOMMONAN.TenNhom;

-- 2. tính tổng doanh thu, tổng số lượng sản phẩm đã bán (sum, avg)

-- tính tổng doanh thu và doanh thu trung bình theo ngày
select 
    convert(date, NgayLapHoaDon) as Ngay,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by convert(date, NgayLapHoaDon);

-- tính tổng số lượng món ăn đã bán theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- tính tổng chi phí nhập hàng theo nhà cung cấp
select 
    PHIEUNHAPHANG.NhaCungCap,
    sum(CHITIETNHAPHANG.ThanhTien) as TongChiPhiNhap,
    avg(CHITIETNHAPHANG.ThanhTien) as ChiPhiNhapTrungBinh
from PHIEUNHAPHANG
join CHITIETNHAPHANG on PHIEUNHAPHANG.MaPhieuNhap = CHITIETNHAPHANG.MaPhieuNhap
group by PHIEUNHAPHANG.NhaCungCap;

-- tính tổng số tiền giảm giá theo khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    sum(HOADON.SoTienGiam) as TongTienGiam,
    avg(HOADON.SoTienGiam) as TienGiamTrungBinh
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- tính tổng số lượng nguyên liệu nhập theo loại nguyên liệu
select 
    NGUYENLIEU.Loai,
    sum(CHITIETNHAPHANG.SoLuongNhap) as TongSoLuongNhap,
    avg(CHITIETNHAPHANG.SoLuongNhap) as SoLuongNhapTrungBinh
from NGUYENLIEU
join CHITIETNHAPHANG on NGUYENLIEU.MaNguyenLieu = CHITIETNHAPHANG.MaNguyenLieu
group by NGUYENLIEU.Loai;

-- tính tổng lương cơ bản theo chức vụ nhân viên
select 
    ChucVu,
    sum(LuongCoBan) as TongLuongCoBan,
    avg(LuongCoBan) as LuongCoBanTrungBinh
from NHANVIEN
group by ChucVu;

-- tính tổng số bàn đã đặt theo khách hàng
select 
    KHACHHANG.TenKhachHang,
    sum(CHITIETDATBAN.SoLuongBan) as TongSoBanDat,
    avg(CHITIETDATBAN.SoLuongBan) as SoBanDatTrungBinh
from CHITIETDATBAN
join KHACHHANG on CHITIETDATBAN.MaKhachHang = KHACHHANG.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- tính tổng số món ăn đã bán theo món
select 
    MONAN.TenMon,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by MONAN.TenMon;

-- tính tổng doanh thu theo tháng
select 
    year(NgayLapHoaDon) as Nam,
    month(NgayLapHoaDon) as Thang,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by year(NgayLapHoaDon), month(NgayLapHoaDon)
order by Nam, Thang;

-- tính tổng doanh thu theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong * MONAN.DonGia) as TongDoanhThu,
    avg(CHITIETHOADON.SoLuong * MONAN.DonGia) as DoanhThuTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- 3. XÂY DỰNG BÁO CÁO TỪ DỮ LIỆU TRONG HỆ THỐNG

-- Báo cáo doanh thu chi tiết theo ngày và nhân viên
select 
    convert(date, hoadon.NgayLapHoaDon) as Ngay,
    nhanvien.HoTen as NhanVienLap,
    nhanvien.ChucVu as ChucVuNhanVien,
    count(distinct hoadon.MaHoaDon) as SoHoaDon,
    sum(hoadon.TongTienPhaiTra) as TongDoanhThu,
    sum(chitiethoadon.SoLuong) as TongSoLuongMonBan,
    avg(hoadon.TongTienPhaiTra) as DoanhThuTrungBinhHoaDon
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by convert(date, hoadon.NgayLapHoaDon), nhanvien.HoTen, nhanvien.ChucVu
order by Ngay desc;

-- Báo cáo món ăn bán chạy nhất
select 
    monan.TenMon,
    nhommonan.TenNhom,
    sum(chitiethoadon.SoLuong) as TongSoLuongBan,
    sum(chitiethoadon.SoLuong * monan.DonGia) as TongDoanhThuMon,
    count(distinct danhgia.MaKhachHang) as SoLuongDanhGia,
    avg(case 
        when danhgia.DiemDanhGia = N'5 sao' then 5 
        when danhgia.DiemDanhGia = N'4 sao' then 4 
        when danhgia.DiemDanhGia = N'3 sao' then 3 
        when danhgia.DiemDanhGia = N'2 sao' then 2 
        when danhgia.DiemDanhGia = N'1 sao' then 1 
        else 0 
    end) as DiemDanhGiaTrungBinh
from chitiethoadon
join monan on chitiethoadon.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join hoadon on chitiethoadon.MaHoaDon = hoadon.MaHoaDon
left join danhgia on monan.MaMonAn = danhgia.MaMonAn
where hoadon.TrangThai = N'Đã thanh toán'
group by monan.TenMon, nhommonan.TenNhom
order by TongSoLuongBan desc;

-- Báo cáo nhập hàng chi tiết
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    nhanvien.ChucVu as ChucVuNhanVien,
    phieunhaphang.NhaCungCap,
    sum(chitietnhaphang.SoLuongNhap) as TongSoLuongNhap,
    sum(chitietnhaphang.ThanhTien) as TongChiPhiNhap,
    count(distinct chitietnhaphang.MaNguyenLieu) as SoLoaiNguyenLieu
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
group by phieunhaphang.MaPhieuNhap, phieunhaphang.NgayTao, nhanvien.HoTen, nhanvien.ChucVu, phieunhaphang.NhaCungCap
order by phieunhaphang.NgayTao desc;

-- Báo cáo đặt bàn và sử dụng bàn
select 
    ban.MaBan,
    ban.LoaiBan,
    ban.TrangThai as TrangThaiBan,
    count(chitietdatban.MaKhachHang) as SoLuongDatBan,
    sum(chitietdatban.SoLuongBan) as TongSoBanDat,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from ban
left join chitietdatban on ban.MaBan = chitietdatban.MaBan
left join khachhang on chitietdatban.MaKhachHang = khachhang.MaKhachHang
group by ban.MaBan, ban.LoaiBan, ban.TrangThai
order by ban.MaBan;

-- Báo cáo hóa đơn chi tiết
select 
    hoadon.MaHoaDon,
    hoadon.NgayLapHoaDon,
    nhanvien.HoTen as NhanVienLap,
    khachhang.TenKhachHang,
    sum(chitiethoadon.SoLuong) as TongSoLuongMon,
    hoadon.TongTienPhaiTra,
    khuyenmai.TenKhuyenMai,
    hoadon.SoTienGiam
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by hoadon.MaHoaDon, hoadon.NgayLapHoaDon, nhanvien.HoTen, 
         khachhang.TenKhachHang, hoadon.TongTienPhaiTra, khuyenmai.TenKhuyenMai, hoadon.SoTienGiam
order by hoadon.NgayLapHoaDon desc;

-- Báo cáo thống kê tài chính
select 
    phieuthongke.MaPhieu,
    phieuthongke.NgayThongKe,
    nhanvien.HoTen as NhanVienLap,
    phieuthongke.DoanhThu,
    phieuthongke.Thu,
    phieuthongke.Chi,
    (phieuthongke.Thu - phieuthongke.Chi) as LoiNhuan
from phieuthongke
join nhanvien on phieuthongke.MaNhanVien = nhanvien.MaNhanVien
order by phieuthongke.NgayThongKe desc;

-- Báo cáo nguyên liệu sử dụng cho món ăn
select 
    monan.TenMon,
    nhommonan.TenNhom,
    nguyenlieu.TenNguyenLieu,
    nguyenlieu.Loai,
    nguyenlieu_monan.SoLuong as SoLuongNguyenLieuCanDung,
    nguyenlieu.DonViTinh
from nguyenlieu_monan
join monan on nguyenlieu_monan.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join nguyenlieu on nguyenlieu_monan.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by monan.TenMon;

-- Báo cáo nhân viên và ca làm việc
select 
    nhanvien.HoTen,
    nhanvien.ChucVu,
    count(nhanvien_calamviec.MaCa) as SoLuongCaLam,
    string_agg(concat(calamviec.MaCa, ': ', convert(varchar, calamviec.GioBatDau, 108), ' - ', convert(varchar, calamviec.GioKetThuc, 108)), ', ') as LichLamViec
from nhanvien
left join nhanvien_calamviec on nhanvien.MaNhanVien = nhanvien_calamviec.MaNhanVien
left join calamviec on nhanvien_calamviec.MaCa = calamviec.MaCa
group by nhanvien.HoTen, nhanvien.ChucVu
order by nhanvien.HoTen;

-- Báo cáo chi tiết sử dụng khuyến mãi
select 
    khuyenmai.TenKhuyenMai,
    khuyenmai.MoTa,
    count(hoadon.MaHoaDon) as SoLuongHoaDon,
    sum(hoadon.SoTienGiam) as TongTienGiam,
    avg(hoadon.SoTienGiam) as TienGiamTrungBinh,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from hoadon
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
group by khuyenmai.TenKhuyenMai, khuyenmai.MoTa
order by SoLuongHoaDon desc;

-- Báo cáo chi tiết phiếu nhập hàng để in
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    phieunhaphang.NhaCungCap,
    nguyenlieu.TenNguyenLieu,
    chitietnhaphang.SoLuongNhap,
    chitietnhaphang.DonGia,
    chitietnhaphang.ThanhTien
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
join nguyenlieu on chitietnhaphang.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by phieunhaphang.MaPhieuNhap, nguyenlieu.TenNguyenLieu;

--> Giao dịch: 

-- 1. Giao dịch: Tạo hoá đơn

create proc sp_TaoHoaDon
    @MaHoaDon char(10),
    @MaNhanVien char(10),
    @NgayLap datetime,
    @TongTien money,
    @GiamGia money,
    @PhaiTra money,
    @TrangThai nvarchar(50),
    @MaKhuyenMai char(10),
    @MaKhachHang char(10),
    @ChiTiet table (MaMonAn char(10), SoLuong int)
as
begin
    begin transaction
    begin try
        if exists (select MaHoaDon from HOADON where MaHoaDon = @MaHoaDon)
            raiserror(N'Mã hóa đơn đã tồn tại', 16, 1)

        insert into HOADON values (@MaHoaDon, @MaNhanVien, @NgayLap, @TongTien, @GiamGia, @PhaiTra, @TrangThai, @MaKhuyenMai, @MaKhachHang)
       
        insert into CHITIETHOADON (MaHoaDon, MaMonAn, SoLuong)
        select @MaHoaDon, MaMonAn, SoLuong from @ChiTiet

        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

--Transaction
-- 2. Giao dịch: Nhập hàng và chi tiết nguyên liệu
create proc sp_NhapHang
    @MaPhieu char(10),
    @NgayTao datetime,
    @SoLuong int,
    @NhaCungCap nvarchar(50),
    @MaNV char(10)
as
begin
    begin transaction
    begin try
        insert into PHIEUNHAPHANG values (@MaPhieu, @NgayTao, @SoLuong, @NhaCungCap, @MaNV)
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

-- 3. Giao dịch: Hủy hóa đơn
create proc sp_HuyHoaDon
    @MaHoaDon char(10)
as
begin
    begin transaction;
    begin try
        delete from CHITIETHOADON where MaHoaDon = @MaHoaDon
        delete from HOADON where MaHoaDon = @MaHoaDon
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

-- 4. Giao dịch: Đánh dấu hóa đơn đã hoàn tiền
create proc sp_HoanTienHoaDon
    @MaHoaDon char(10)
as
begin
    begin transaction
    begin try
        update HOADON
        set TrangThai = N'Đã hoàn tiền'
        where MaHoaDon = @MaHoaDon
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

-- 5. Giao dịch: Gộp bàn
create proc sp_gopBan
    @MaKH char(10),
    @MaBanCu char(10),
    @MaBanMoi char(10)
as
begin
    begin transaction
    begin try
        update CHITIETDATBAN
        set MaBan = @MaBanMoi
        where MaKhachHang = @MaKH AND MaBan = @MaBanCu

        update BAN set TrangThai = N'Còn Bàn' where MaBan = @MaBanCu
        update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBanMoi

        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go



--> Thủ tục

--> Thủ tục thêm một món ăn


go
	create proc sp_ThemMonAn(@MaMonAn char(10),@TenMon nvarchar(50),@DonViTinh nvarchar(50),@DonGia money,@TrangThai nvarchar(50),@MaNhom nvarchar(50),@SoLuong int)
	as
	begin
		if(exists(select *from MONAN where MaMonAn = @MaMonAn))
			print(N'Đã tồn tại món ăn đó')
		else
			begin 
				insert into MONAN values(@MaMonAn,@TenMon,@DonViTinh,@DonGia,@TrangThai,@MaNhom,@SoLuong)
				print(N'Thêm thành công')
			end
	end
go

--exec sp_ThemMonAn 'MA005',N'Trà đào',N'Cốc',20000,N'Còn món','NM03',12
--select *from MONAN
--> Thủ tục cập nhật món ăn
go
	create proc sp_CapNhatSoLuongMonAn(@MaMonAn char(10),@SoLuongMoi int)
	as
	begin
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			print(N'Không tồn tại món ăn đó')
		else
			begin
				update MONAN set SoLuongCon = @SoLuongMoi where MaMonAn = @MaMonAn
				print(N'Cập nhật thành công')
			end
	end
go
--exec sp_CapNhatSoLuongMonAn 'MA005',40
--select *from MONAN

--> Thủ tục
go
	create proc sp_XoaMonAn(@MaMonAn char(10))
	as
	begin
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			print(N'Không tồn tại món ăn đó')
		else
			begin
				delete from MONAN where MaMonAn = @MaMonAn
				print(N'Xóa thành công')
			end
	end
go
--exec sp_XoaMonAn 'MA005'
--select *from MONAN

--> Thủ tục tìm kiếm món ăn theo từ ví dụ: Bánh tráng -> Bánh tráng trộn, bánh tráng nướng ....
go
	create proc sp_TimMonAn(@KeyWord nvarchar(50))
	as
	begin
		select *from MONAN where TenMon like N'%' + @KeyWord + N'%'
	end
go
--exec sp_TimMonAn N'gà'

-->Thủ tục cập nhật lại giá món ăn
go
	create proc sp_CapNhatGiaMonAn(@MaMonAn char(10),@GiaMoi money)
	as
	begin
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			print(N'Không tồn tại món ăn đó')
		else
			begin
				update MONAN set DonGia = @GiaMoi where MaMonAn = @MaMonAn
				print(N'Cập nhật thành công')
			end
	end
go

--> Thủ tục thêm bàn mới
go
	create proc sp_ThemBan(@MaBan char(10),@LoaiBan Nvarchar(50),@SoLuongCho int,@TrangThai nvarchar(50))
	as 
	begin
		if(exists(select *from BAN where MaBan = @MaBan))
			print(N'Đã tồn tại mã bàn đó')
		else
			begin
				insert into BAN values(@MaBan,@LoaiBan,@SoLuongCho,@TrangThai)
				print(N'Thêm thành công')
			end
	end
go


--exec sp_ThemBan 'B03',N'Bàn tròn',6,N'Còn Bàn'
--select *from BAN

--> Cập nhật trạng thái bàn
go
	create proc sp_CapNhatTrangThaiBan(@MaBan char(10),@TrangThaiMoi nvarchar(50))
	as
	begin
		if(not exists(select *from BAN where MaBan = @MaBan))
			print(N'Không tồn tại mã bàn đó')
		else
			begin
				update BAN set TrangThai = @TrangThaiMoi where MaBan = @MaBan
				print(N'Cập nhật thành công')
			end
	end
go
--exec sp_CapNhatTrangThaiBan 'B03',N'Hết Bàn'
--select *from BAN

--> Xóa bàn 
go
	create proc sp_XoaBan(@MaBan char(10))
	as
	begin
		if(not exists(select *from BAN where MaBan = @MaBan))
			print(N'Không tồn tại mã bàn đó')
		else
			begin
				delete from BAN where MaBan = @MaBan
				print(N'Xóa thành công')
			end
	end
go

--exec sp_XoaBan 'B03'
--select *from BAN

--> Thủ tục thêm khách hàng
go
	create proc sp_ThemKhachHang (@MaKhachHang char(10),@TenKhachHang nvarchar(50),@SoDienThoai char(10),@DiaChi nvarchar(50))
	as
	begin
		if(exists(select *from KHACHHANG where MaKhachHang = @MaKhachHang))
			print(N'Đã tồn tại khách hàng này')
		else
			begin
				insert into KHACHHANG values(@MaKhachHang,@TenKhachHang,@SoDienThoai,@DiaChi)
				print(N'Thêm thành công')
			end
	end
go

--exec sp_ThemKhachHang 'KKH001',N'Hoàng Văn Quyết','0374823461',N'48 Hồ Tùng Mậu'
--select *from KHACHHANG

--> Thủ tục cập nhật thông tin khách hàng
go
	create proc sp_CapNhatThongTinKhachHang(@MaKhachHang char(10),@DiaChi nvarchar(50),@SoDienThoai char(10))
	as
	begin
		if(not exists(select *from KHACHHANG where MaKhachHang = @MaKhachHang))
			print(N'Không tồn tại khách hàng này')
		else
			begin
				update KHACHHANG set DiaChi = @DiaChi,SoDienThoai = @SoDienThoai where MaKhachHang = @MaKhachHang
				print(N'Cập nhật thành công')
			end
	end
go
--exec sp_CapNhatThongTinKhachHang 'KKH001',N'40 Hồ Tùng Mậu','0762823461'
--select *from KHACHHANG

--> Thêm ca làm việc 
go
	create proc sp_ThemCaLamViec(@MaCa char(10),@GioBatDau datetime,@GioKetThuc datetime)
	as
	begin
		if(exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Đã tồn tại ca làm việc đó')
		else
			begin
				insert into CALAMVIEC values(@MaCa,@GioBatDau,@GioKetThuc)
				print(N'Thêm thành công')
			end
	end
go
--> Sửa giờ làm việc của ca đó
go
	create proc sp_SuaGioLamViec(@MaCa char(10),@GioBatDau datetime,@GioKetThuc datetime)
	as
	begin
		if(not exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Không tồn tại ca làm việc đó')
		else
			begin
				Update CALAMVIEC set GioBatDau = @GioBatDau, GioKetThuc = @GioKetThuc where MaCa = @MaCa
				print(N'Cập nhật thành công thành công')
			end
	end
go
--> Xóa ca làm việc 
go
	create proc sp_XoaCaLamViec(@MaCa char(10))
	as
	begin
		if(not exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Không tồn tại ca làm việc đó')
		else
			begin
				delete from CALAMVIEC where MaCa = @MaCa
				print(N'Xóa thành công')
			end
	end
go

--> Thêm nguyên liệu mới
go
	create proc sp_ThemNguyenLieu(@MaNguyenLieu char(10),@TenNguyenLieu nvarchar(50),@Loai nvarchar(50),@NgaySanXuat Datetime,@HanSuDung datetime,@GiaBan money,@DonViTinh nvarchar(30))
	as
	begin
		if(exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Đã tồn tại nguyên liệu đó')
		else
			begin
				insert into NGUYENLIEU values(@MaNguyenLieu,@TenNguyenLieu,@Loai,@NgaySanXuat,@HanSuDung,@GiaBan,@DonViTinh)
				print(N'Thêm thành công')
			end
	end
go
--> Điều chỉnh nguyên liệu
go
	create proc sp_DieuChinhNguyenLieu(@MaNguyenLieu char(10),@GiaBan money)
	as
	begin
		if(not exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Không tồn tại nguyên liệu đó')
		else
			begin
				update NGUYENLIEU set GiaBan = @GiaBan where MaNguyenLieu = @MaNguyenLieu
				print(N'Điều chỉnh thành công')
			end
	end
go

-->Xóa nguyên liệu
go
	create proc sp_XoaNguyenLieu(@MaNguyenLieu char(10))
	as
	begin
		if(not exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Không tồn tại nguyên liệu đó')
		else
			begin
				delete from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu
				print(N'Xóa thành công')
			end
	end
go

-->Thêm nhân viên
go
	create proc sp_ThemNhanVien(@MaNhanVien char(10),@HoTen nvarchar(50),@NgaySinh Datetime,@GioiTinh nchar(5),@SoDienThoai char(10),@DiaChi ntext,@Chucvu nvarchar(50),@MaQuanLy char(10),@LuongCoBan money)
	as
	begin
		if(exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Đã tồn tại nhân viên đó')
		else
			begin 
				insert into NHANVIEN values(@MaNhanVien,@HoTen,@NgaySinh,@GioiTinh,@SoDienThoai,@DiaChi,@Chucvu,@MaQuanLy,@LuongCoBan)
				print(N'Thêm thành công')
			end
	end
go
-->Xóa nhân viên
go
	create proc sp_XoaNhanVien(@MaNhanVien char(10))
	as
	begin
		if(not exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Không tồn tại nhân viên đó')
		else
			begin
				delete from NHANVIEN where MaNhanVien = @MaNhanVien
				print(N'Xóa thành công')
			end
	end
go
--> Sửa thông tin nhân viên
go
	create proc sp_SuaThongTinNhanVien(@MaNhanVien char(10),@SoDienThoai char(10),@DiaChi ntext,@ChucVu nvarchar(50),@LuongCoBan money)
	as
	begin
		if(not exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Không tồn tại nhân viên đó')
		else
			begin
				update NHANVIEN set SoDienThoai = @SoDienThoai,DiaChi = @DiaChi, ChucVu = @ChucVu, LuongCoBan = @LuongCoBan where MaNhanVien = @MaNhanVien
				print(N'Xóa thành công')
			end
	end
go

--> Hàm
--> Hàm trả về tên của người dùng với Mã khách hàng nhập từ bàn phím
go
	create function fn_TraVeTenKhachHang(@MaKhachHang char(10))
	returns nvarchar(50)
	as
	begin
		declare @TenKhachHang nvarchar(50)
		set @TenKhachHang = (select TenKhachHang from KHACHHANG where MaKhachHang = @MaKhachHang)
		return @TenKhachHang
	end
go

--select dbo.fn_TraVeTenKhachHang ('KH001') as N'Tên khách hàng'
--select *from KHACHHANG


--> hàm đếm số lượng bàn, loại bàn điều kiện Trạng thái còn bàn với số lượng chỗ ngồi nhập từ bàn phím
go
	create function fn_SoLuong_LoaiBan(@SoLuongCho int)
	returns @table_soluong_loaiban table(
		LoaiBan nvarchar(50),
		SoLuongCon int
	)
	as
	begin
		insert into @table_soluong_loaiban
			select LoaiBan, count(*) from BAN where SoLuongCho = @SoLuongCho and TrangThai = N'Còn Bàn'
			group by LoaiBan
		return
	end
go
--select *from fn_SoLuong_LoaiBan (4)
--select *from BAN


--> Hàm trả về tổng số tiền ban đầu, tổng số tiền giảm giá, tổng số tiền sau khi giảm giá của một Hóa đơn với trạng thái và ngày lập được nhập từ bàn phím
go
	create function fn_TongTien(@TrangThai nvarchar(50),@NgayLap datetime)
	returns @table_TongTien table(
		TongTienBanDau money,
		TongTienGiamGia money,
		TongTienThanhToan money
	)
	as
	begin
		insert into @table_TongTien
			select sum(TongTienTruocGiam),sum(SoTienGiam),sum(TongTienPhaiTra) from HOADON where TrangThai = @TrangThai and NgayLapHoaDon = @NgayLap
		return
	end
go

--select *from fn_TongTien (N'Đã thanh toán','2025-')
--select *from HOADON

-->Hàm đếm số lượng đơn hàng của một khách hàng với tên khách hàng, số điện thoại được nhập từ bàn phím
go
	create function fn_SoLuongDonHang(@TenKhachHang nvarchar(50),@SoDienthoai char(10))
	returns int
	as
	begin
		declare @SoLuong int
		set @SoLuong = (select count(*) from HOADON inner join KHACHHANG on KHACHHANG.MaKhachHang = HOADON.MaKhachHang where TenKhachHang = @TenKhachHang and SoDienThoai = @SoDienthoai
						group by TenKhachHang,SoDienThoai)
		return @SoLuong
	end
go
--select dbo.fn_SoLuongDonHang (N'Hà Văn An','0912345678') as N'Số lượng đơn hàng'
--select *from HOADON inner join KHACHHANG on KHACHHANG.MaKhachHang = HOADON.MaKhachHang



--> Hàm tính tổng doanh thu trong tháng @Thang của năm @Nam
go
	create function fn_DoanhThuTheoThang(@Month int,@Year int)
	returns money
	as
	begin
		declare @TongDoanhThu money
		set @TongDoanhThu = (select sum(DoanhThu) from PHIEUTHONGKE where month(NgayThongKe) = @Month and year(NgayThongKe) = @Year)
		return @TongDoanhThu
	end
go
--select dbo.fn_DoanhThuTheoThang(4,2025) as N'Doanh thu của tháng đó là'
--select *from PHIEUTHONGKE

-->Hàm trả về danh sách nhân viên làm trong ngày @NgayLam nhập từ bàn phím
go
	create function fn_DanhSachLamViec(@NgayLam date)
	returns @table_DanhSachLamViec table(
		MaNhanVien char(10),
		HoTen nvarchar(50)
	)
	as
	begin
		insert into @table_DanhSachLamViec
			select NHANVIEN.MaNhanVien, HoTen from NHANVIEN inner join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien where NgayLam = @NgayLam
		return
	end
go
--select *from fn_DanhSachLamViec ('2025-04-10')
--select *from NHANVIEN  inner join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien

--> Hàm đưa ra danh sách các món ăn với trạng thái còn món trong một nhóm món ăn với Tên nhóm được nhập từ bàn phím
go
	create function fn_SoMonAnTrongNhom(@TenNhom nvarchar(50))
	returns @table_DanhSach table(
		MaMonAn char(10),
		TenMonAn nvarchar(50),
		DonGia money
	)
	as
	begin
		insert into @table_DanhSach
			select MaMonAn,TenMon,DonGia from MONAN inner join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
			where TenNhom = @TenNhom and TrangThai = N'Còn Món'
		return
	end
go

--select *from fn_SoMonAnTrongNhom (N'Món Chính')
--select *from MONAN inner join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom

--> Đưa ra số lượt đánhh giá của món ăn với tên món ăn và thời gian đánh giá được nhập từ bàn phím
go
	create function fn_SoLuotDanhGia(@TenMon nvarchar(50),@ThoiGianDanhGia datetime)
	returns int
	as
	begin
		declare @SoLuotDanhGia int
		set @SoLuotDanhGia = (select count(*) from DANHGIA inner join MONAN on DANHGIA.MaMonAn = MONAN.MaMonAn
								where TenMon = @TenMon and ThoiGianDanhGia = @ThoiGianDanhGia
								group by TenMon,ThoiGianDanhGia)
		return @SoLuotDanhGia
	end
go

--select dbo.fn_SoLuotDanhGia (N'Cơm gà',N'2025-04-11') as N'Số lượt đánh giá'
--select *from DANHGIA inner join MONAN on DANHGIA.MaMonAn = MONAN.MaMonAn

--> Hàm tính tổng số lượng món ăn thuộc nhóm món ăn @TenNhom được nhập từ bàn phím
go
	create function fn_TongSLMonAn(@TenNhom nvarchar(50))
	returns int
	as
	begin
		declare @TongSoLuong int
		set @TongSoLuong = (select sum(SoLuong) from  NHOMMONAN inner join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom inner join CHITIETHOADON on MONAN.MaMonAn = CHITIETHOADON.MaMonAn
							where TenNhom = @TenNhom)
		return @TongSoLuong
	end
go

--select dbo.fn_TongSLMonAn (N'Món chính') as N'Tổng số lượng món ăn'
--select TenNhom, TenMon, SoLuong from NHOMMONAN inner join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom inner join CHITIETHOADON on MONAN.MaMonAn = CHITIETHOADON.MaMonAn

--> Trigger

--> Trigger cập nhật lại trạng thái bàn khi bàn được đặt (được thêm vào)
go
	create trigger trg_CapNhatTrangThaiBan
	on CHITIETDATBAN
	for insert
	as
	begin
		declare @MaBan char(10)
		set @MaBan = (select MaBan from inserted)
		if(not exists(select *from BAN where MaBan = @MaBan))
			begin
				raiserror(N'Không tồn lại mã bàn đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @TrangThai nvarchar(50)
				set @TrangThai = (select TrangThai from BAN where MaBan = @MaBan)
				if(@TrangThai = N'Hết Bàn')
					begin
						raiserror(N'Bàn đã có người đặt trước',16,1)
						rollback transaction
					end
				else
					update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBan
			end
	end
go
--insert into BAN values('B03',N'Bàn VIP',7,N'Còn Bàn')
--insert into CHITIETDATBAN values('KH001','B03',1)
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG
--> trigger trả bàn (khi ra về khách hàng sẽ trả lại bàn đó) xóa thông tin chi tiết đặt bàn thì bàn từ trạng thái 'Hết bàn' sẽ trở thành 'Còn bàn'
go
	create trigger trg_TraBan
	on CHITIETDATBAN
	for delete
	as
	begin
		declare @MaBan char(10)
		set @MaBan = (select MaBan from deleted)
		update Ban set TrangThai = N'Còn bàn' where MaBan = @MaBan
	end
go

--delete from CHITIETDATBAN where MaBan = 'B02'
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG
--> trigger chuyển bàn tức là khách hàng A đang đặt bàn B1 muốn chuyển thành bàn B2 
go
	create trigger trg_ChuyenBan
	on CHITIETDATBAN
	for update
	as
	begin
		declare @MaBanBanDau char(10)
		declare @MaBanMuonChuyen char(10)
		set @MaBanBanDau = (select MaBan from deleted)
		set @MaBanMuonChuyen = (select MaBan from inserted)
		declare @TrangThaiChuyen nvarchar(50)
		set @TrangThaiChuyen = (select TrangThai from BAN where MaBan = @MaBanMuonChuyen)
		if(@TrangThaiChuyen = N'Hết Bàn')
			begin
				raiserror(N'Không còn bàn muốn chuyển',16,1)
				rollback transaction
			end
		else
			update BAN set TrangThai = N'Còn Bàn' where MaBan = @MaBanBanDau
			update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBanMuonChuyen
	end
go

--update CHITIETDATBAN set MaBan = 'B03' where MaBan = 'B01'
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG

--> trigger gọi món (nếu khách hàng gọi món thì trong chi tiết hóa đơn cần chèn thêm một món ăn)
go
	create trigger trg_ThemMonAn
	on CHITIETHOADON
	for insert 
	as
	begin
		declare @MaMonAn char(10)
		set @MaMonAn = (select MaMonAn from inserted)
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			begin
				raiserror(N'Không tồn tại món ăn đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @SoLuong int
				set @SoLuong = (select SoLuongCon from MONAN where MaMonAn = @MaMonAn)
				declare @SoLuongGoi int
				set @SoLuongGoi = (select SoLuong from inserted)
				if(@SoLuong < @SoLuongGoi)
					begin
						raiserror(N'Nhà hàng không có đủ món ăn đó',16,1)
						rollback transaction
					end
				else
					update MONAN set SoLuongCon = SoLuongCon - @SoLuongGoi where MaMonAn = @MaMonAn
			end
	end
go
--insert into CHITIETHOADON values('HD01','MA003',2)
--insert into MONAN values('MA004',N'Nước mía',N'Cốc',10000,N'Hết Món','NM03',0)
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON
--> trigger sửa lại trạng thái món ăn nếu số lượng còn của món ăn đó thay đổi 
go
	create trigger trg_CapNhatTrangThai
	on MONAN
	for update
	as
	begin
		if(update  (MaMonAn))
		begin
			raiserror(N'Không được phép cập nhật theo Mã món ăn',16,1)
			rollback transaction
		end
		else
			begin
				declare @SoLuongCu int
				set @SoLuongCu = (select SoLuongCon from deleted)
				declare @SoLuongMoi int
				set @SoLuongMoi = (select SoLuongCon from inserted)
				if(@SoLuongCu = 0 and @SoLuongMoi > 0)
					update MONAN set TrangThai = N'Còn Món' where SoLuongCon = @SoLuongMoi
				else
					update MONAN set TrangThai = N'Hết Món' where SoLuongCon = @SoLuongMoi
			end
	end
go
--update MONAN set SoLuongCon = 0 where MaMonAn = 'MA004'
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON

--> trigger cập nhật lại số lượng món ăn
go
	create trigger trg_CapNhatMonAn
	on CHITIETHOADON
	for update
	as
	begin
		declare @MaMonCu char(10)
		set @MaMonCu = (select MaMonAn from deleted)
		declare @MaMonMoi char(10)
		set @MaMonMoi = (select MaMonAn from inserted)
		declare @SoLuongCu int
		set @SoLuongCu = (select SoLuong from deleted)
		declare @SoLuongMoi int
		set @SoLuongMoi = (select SoLuong from inserted)
		declare @SoLuongMC int
		set @SoLuongMC = (select SoLuongCon from MONAN where MaMonAn = @MaMonCu)
		declare @SoLuongMM int
		set @SoLuongMM = (select SoLuongCon from MONAN where MaMonAn = @MaMonMoi)
		if(@SoLuongMM < @SoLuongMoi)
			begin
				raiserror(N'Không có đủ món đó',16,1)
				rollback transaction
			end
		else
			begin
				update MONAN set SoLuongCon = SoLuongCon + @SoLuongCu where MaMonAn = @MaMonCu
				update MONAN set SoLuongCon = SoLuongCon - @SoLuongMoi where MaMonAn = @MaMonMoi
			end
	end
go
--update CHITIETHOADON set MaMonAn = 'MA001',SoLuong = 2 where MaMonAn = 'MA002' and MaHoaDon = 'HD02'
--update CHITIETHOADON set SoLuong = 4 where MaMonAn = 'MA001' and MaHoaDon = 'HD02'
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON


--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG

--> trigger tạo một chi tiets phiếu nhập
go
	create trigger trg_TaoChiTietPhieuNhap
	on CHITIETNHAPHANG
	for insert
	as
	begin
		declare @MaPhieuNhap char(10)
		set @MaPhieuNhap = (select MaPhieuNhap from inserted)
		if(not exists(Select *from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap))
			begin
				raiserror(N'Không tồn tại phiếu nhập hàng đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @SoLuongNhap int
				set @SoLuongNhap = (select SoLuongNhap from inserted)
				declare @SoLuongCo int
				set @SoLuongCo = (select SoLuong from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap)
				if(@SoLuongCo < @SoLuongNhap)
					begin
						raiserror(N'Không đủ số lượng nhập vào',16,1)
						rollback transaction
					end
				else
					update PHIEUNHAPHANG set SoLuong = SoLuong - @SoLuongNhap where MaPhieuNhap = @MaPhieuNhap
			end
	end
go
--insert into CHITIETNHAPHANG values('NL01','PN002',1,18000,18000)
--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG

--> trigger chỉnh sửa lại số lượng phiếu nhập

go
	create trigger trg_ChinhSuaPhieuNhap
	on CHITIETNHAPHANG
	for update
	as
	begin
		declare @MaPhieuNhap char(10)
		set @MaPhieuNhap = (select MaPhieuNhap from inserted)
		declare @SoLuongTruoc int
		set @SoLuongTruoc = (select SoLuongNhap from inserted)
		declare @SoLuongSau int
		set @SoLuongSau = (select SoLuongNhap from deleted)
		declare @SoLuongCo int
		set @SoLuongCo = (select SoLuong from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap)
		if(@SoLuongSau - @SoLuongTruoc > @SoLuongCo)
			begin
				raiserror(N'Không đủ số lượng nhập vào',16,1)
				rollback transaction
			end
		else
			update PHIEUNHAPHANG set SoLuong = SoLuong - (@SoLuongTruoc - @SoLuongSau) where MaPhieuNhap = @MaPhieuNhap
	end
go	
--update CHITIETNHAPHANG set SoLuongNhap = 2 where MaNguyenLieu = 'NL01' and MaPhieuNhap = 'PN002'
--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG
