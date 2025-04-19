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