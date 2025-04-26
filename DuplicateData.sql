--Kiểm tra trùng lặp dữ liệu
--Tìm và in ra các khách hàng có số điện thoại bị trùng
declare @sdt char(10)
declare cur_sdt cursor for
	select SoDienThoai From KHACHHANG
open cur_sdt
fetch next from cur_sdt into @sdt
while @@FETCH_STATUS = 0
begin
	if(select count(*) from KHACHHANG where SoDienThoai = @sdt) > 1
		print(N'Số điện thoại bị trùng là: ' + @sdt)
	fetch next from cur_sdt into @sdt
end

close cur_sdt
deallocate cur_sdt
--Tìm và in ra các tên món ăn bị trùng
declare @tenmonan nvarchar(50)
declare cur_tenmonan cursor for
	select TenMon from MONAN
open cur_tenmonan
fetch next from cur_tenmonan into @tenmonan
while @@FETCH_STATUS = 0
begin
	if(select count(*) from MONAN where TenMon = @tenmonan) > 1
		print(N'Tên món ăn bị trùng là: ' + @tenmonan)
	fetch next from cur_tenmonan into @tenmonan
end

close cur_tenmonan
deallocate cur_tenmonan
--Tìm và in ra tên các nhóm món ăn bị trùng
declare @tennhommon nvarchar(50)
declare cur_tennhommon cursor for
	select TenNhom from NHOMMONAN
open cur_tennhommon
fetch next from cur_tennhommon into @tennhommon
while @@FETCH_STATUS = 0
begin
	if(select count(*) from NHOMMONAN where TenNhom = @tennhommon) > 1
		print(N'Tên nhóm món ăn bị trùng là: ' + @tennhommon)
	fetch next from cur_tennhommon into @tennhommon
end

close cur_tennhommon
deallocate cur_tennhommon
--thủ tục tạo hoá đơn và chi tiết hoá đơn
go
create proc sp_taohoadon(@MaHoaDon char(10), 
						 @MaNhanVien char(10), 
						 @NgayLap date, 
						 @TongTien money, 
						 @GiamGia money, 
						 @PhaiTra money, 
						 @TrangThai nvarchar(50), 
						 @MaKhuyenMai char(10), 
						 @MaKhachHang char(10),
						 @MaMonAn char(10),
						 @SoLuong int
)
as
begin
	begin transaction
		begin try
			if(exists(select * from HOADON where MaHoaDon = @MaHoaDon))
				raiserror(N'Mã hoá đơn đã tồn tại', 16, 1)
			insert into HOADON values(@MaHoaDon, @MaNhanVien, @NgayLap, @TongTien, @GiamGia, @PhaiTra, @TrangThai, @MaKhuyenMai, @MaKhachHang)
			insert into CHITIETHOADON values(@MaHoaDon, @MaMonAn, @SoLuong)
			commit
		end try
		begin catch
			rollback transaction
			print error_message()
		end catch

end
--thủ tục tạo phiếu nhập hàng và chi tiết nhập hàng
alter proc sp_taophieunhaphang(@MaPhieu char(10), 
							 @NgayLap date, 
						     @MaNhanVien char(10), 
							 @SoLuong int,
							 @NhaCungCap nvarchar(50),
							 @MaNguyenLieu char(10),
							 @SoLuongNhap int,
						     @DonGia money, 
						     @ThanhTien money						     
)
as
begin
	begin transaction
		begin try
			if(exists(select * from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieu))
				raiserror(N'Mã phiếu nhập đã tồn tại', 16, 1)
			insert into PHIEUNHAPHANG values(@MaPhieu, @NgayLap, @SoLuong, @NhaCungCap, @MaNhanVien)
			insert into CHITIETNHAPHANG values(@MaNguyenLieu, @MaPhieu, @SoLuongNhap, @DonGia, @ThanhTien)
			commit
		end try
		begin catch
			rollback transaction
			print error_message()
		end catch
end
--thủ tục hoànt tiên cho hoá đơn
create proc sp_hoantien(@MaHoaDon char(10))
as
begin
	begin transaction
	begin try
		update hoadon set TrangThai = N'Đã hoàn tiền'
		where MaHoaDon = @MaHoaDon
		commit
	end try
	begin catch 
		rollback transaction
		print error_message()
	end catch
end

