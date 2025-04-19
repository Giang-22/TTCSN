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
