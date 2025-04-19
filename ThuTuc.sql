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
