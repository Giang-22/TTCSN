
-- ===================== THỐNG KÊ & BÁO CÁO =====================

--Đếm số lượng món ăn theo từng nhóm món ăn
select MaNhom, count(*) as SoLuongMonAn
from MONAN
group by MaNhom;

--Đếm số lượng bàn đã được đặt theo từng mã bàn
select MaBan, count(*) as SoLanDat
from CHITIETDATBAN
group by MaBan;

--Đếm số lượng đánh giá theo từng món ăn
select MaMonAn, count(*) as SoLuotDanhGia
from DANHGIA
group by MaMonAn;

--Đếm số lượng hóa đơn theo từng trạng thái
select TrangThai, count(*) as SoLuongHoaDon
from HOADON
group by TrangThai;

-- Đếm số nhân viên theo chức vụ
select ChucVu, count(*) as SoLuongNhanVien
from NHANVIEN
group by ChucVu;

-- Đếm số lần làm việc theo từng ca làm
select MaCa, count(*) as SoLanLam
from NHANVIEN_CALAMVIEC
group by MaCa;

--Đếm số món ăn theo nhóm chỉ những món còn món
select MaNhom, count(*) as SoMonCon
from MONAN
where TrangThai = N'Còn Món'
group by MaNhom;

--Đếm số hóa đơn theo trạng thái chỉ những hóa đơn đã thanh toán
select TrangThai, count(*) as SoHoaDon
from HOADON
where TrangThai = N'Đã thanh toán'
group by TrangThai;

--Đếm số lượt đặt bàn theo bàn chỉ bàn thường
select MaBan, count(*) as SoLanDat
from CHITIETDATBAN
where MaBan in (
	select MaBan from BAN where LoaiBan = N'Bàn thường'
)
group by MaBan;

--Đếm số lượng ca làm trong một ngày cụ thể
select MaCa, count(*) as SoNhanVienLam
from NHANVIEN_CALAMVIEC
where NgayLam = '2025-04-10'
group by MaCa;

--Đếm số món ăn được đánh giá, theo từng nhóm món ăn (chỉ tính món còn món)
select 
    NM.TenNhom, 
    MA.TrangThai, 
    count(DG.MaMonAn) as SoMonDuocDanhGia,
    min(MA.DonGia) as GiaThapNhat,
    max(MA.DonGia) as GiaCaoNhat
from DANHGIA DG
inner join MONAN MA on DG.MaMonAn = MA.MaMonAn
inner join NHOMMONAN NM on MA.MaNhom = NM.MaNhom
where MA.TrangThai = N'Còn Món'
group by NM.TenNhom, MA.TrangThai;

-- Đếm số hóa đơn lập bởi mỗi nhân viên, chỉ tính hóa đơn đã thanh toán
select 
    NV.HoTen, 
    NV.ChucVu,
    count(HD.MaHoaDon) as SoHoaDonDaThanhToan,
    sum(HD.TongTienPhaiTra) as TongTienDaThu,
    max(HD.NgayLapHoaDon) as LanCuoiLap
from HOADON HD
inner join NHANVIEN NV on HD.MaNhanVienLap = NV.MaNhanVien
where HD.TrangThai = N'Đã thanh toán'
group by NV.HoTen, NV.ChucVu;

--Tính tổng doanh thu và tổng số lượng sản phẩm đã bán (theo từng món ăn)
select 
    MA.TenMon,
    MA.DonGia,
    sum(CTHD.SoLuong) as TongSoLuongBan,
    sum(CTHD.SoLuong * MA.DonGia) as TongDoanhThu,
    avg(CTHD.SoLuong * MA.DonGia) as DoanhThuTrungBinhMoiHoaDon
from CHITIETHOADON CTHD
inner join MONAN MA on CTHD.MaMonAn = MA.MaMonAn
group by MA.TenMon, MA.DonGia;

--Tính tổng doanh thu và trung bình tiền phải trả của mỗi khách hàng
select 
    KH.TenKhachHang,
    count(HD.MaHoaDon) as SoHoaDon,
    sum(HD.TongTienPhaiTra) as TongDoanhThuTuKhach,
    avg(HD.TongTienPhaiTra) as TrungBinhMoiHoaDon
from HOADON HD
inner join KHACHHANG KH on HD.MaKhachHang = KH.MaKhachHang
where HD.TrangThai = N'Đã thanh toán'
group by KH.TenKhachHang;

-- Tính tổng số lượng món bán được và doanh thu theo nhóm món ăn
select 
    NM.TenNhom,
    sum(CTHD.SoLuong) as TongSoLuongBan,
    sum(CTHD.SoLuong * MA.DonGia) as TongDoanhThu
from CHITIETHOADON CTHD
inner join MONAN MA on CTHD.MaMonAn = MA.MaMonAn
inner join NHOMMONAN NM on MA.MaNhom = NM.MaNhom
group by NM.TenNhom;

