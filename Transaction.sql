--TRANSACTION	
-- 2. Giao d?ch: Nh?p h�ng v� chi ti?t nguy�n li?u
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

-- 3. Giao d?ch: H?y h�a ??n
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

-- 4. Giao d?ch: ?�nh d?u h�a ??n ?� ho�n ti?n
create proc sp_HoanTienHoaDon
    @MaHoaDon char(10)
as
begin
    begin transaction
    begin try
        update HOADON
        set TrangThai = N'?� ho�n ti?n'
        where MaHoaDon = @MaHoaDon
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

-- 5. Giao d?ch: G?p b�n
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

        update BAN set TrangThai = N'C�n B�n' where MaBan = @MaBanCu
        update BAN set TrangThai = N'H?t B�n' where MaBan = @MaBanMoi

        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

