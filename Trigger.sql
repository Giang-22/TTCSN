
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