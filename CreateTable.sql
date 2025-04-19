use master
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
