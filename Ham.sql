
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
