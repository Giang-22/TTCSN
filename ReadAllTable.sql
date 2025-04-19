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

-- 1. MÓN ĂN BÁN CHẠY NHẤT (được gọi nhiều nhất)
select top 1 ct.MaMonAn, m.TenMon, sum(ct.SoLuong) as SoLuongBan
from CHITIETHOADON ct
join MONAN m on ct.MaMonAn = m.MaMonAn
group by ct.MaMonAn, m.TenMon
order by sum(ct.SoLuong) desc;
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
