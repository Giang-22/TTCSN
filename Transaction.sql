--TRANSACTION	
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

