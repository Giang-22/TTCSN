-- 1. đếm số lượng bản ghi theo nhóm (group by, count)

-- đếm số lượng món ăn theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    count(MONAN.MaMonAn) as SoLuongMonAn,
    sum(MONAN.SoLuongCon) as TongSoLuongCon
from NHOMMONAN
left join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom
group by NHOMMONAN.TenNhom;

-- đếm số lượng hóa đơn theo trạng thái
select 
    TrangThai,
    count(MaHoaDon) as SoLuongHoaDon
from HOADON
group by TrangThai;

-- đếm số lượng bàn theo loại bàn và trạng thái
select 
    LoaiBan,
    TrangThai,
    count(MaBan) as SoLuongBan
from BAN
group by LoaiBan, TrangThai;

-- đếm số lượng đánh giá theo điểm đánh giá
select 
    DiemDanhGia,
    count(*) as SoLuongDanhGia
from DANHGIA
group by DiemDanhGia;

-- đếm số lượng phiếu nhập hàng theo nhà cung cấp
select 
    NhaCungCap,
    count(MaPhieuNhap) as SoLuongPhieuNhap
from PHIEUNHAPHANG
group by NhaCungCap;

-- đếm số lượng nhân viên theo chức vụ
select 
    ChucVu,
    count(MaNhanVien) as SoLuongNhanVien
from NHANVIEN
group by ChucVu;

-- đếm số lượng ca làm việc của nhân viên
select 
    NHANVIEN.HoTen,
    count(NHANVIEN_CALAMVIEC.MaCa) as SoLuongCaLam
from NHANVIEN
left join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien
group by NHANVIEN.HoTen;

-- đếm số lượng khách hàng đặt bàn
select 
    KHACHHANG.TenKhachHang,
    count(CHITIETDATBAN.MaBan) as SoLuongBanDat
from KHACHHANG
left join CHITIETDATBAN on KHACHHANG.MaKhachHang = CHITIETDATBAN.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- đếm số lượng hóa đơn sử dụng khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    count(HOADON.MaHoaDon) as SoLuongHoaDon
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- đếm số lượng món ăn tồn kho
select 
    NHOMMONAN.TenNhom,
    sum(MONAN.SoLuongCon) as TongSoLuongTonKho,
    count(case when MONAN.SoLuongCon <= 10 then 1 end) as SoMonGanHet
from MONAN
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
group by NHOMMONAN.TenNhom;

-- 2. tính tổng doanh thu, tổng số lượng sản phẩm đã bán (sum, avg)

-- tính tổng doanh thu và doanh thu trung bình theo ngày
select 
    convert(date, NgayLapHoaDon) as Ngay,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by convert(date, NgayLapHoaDon);

-- tính tổng số lượng món ăn đã bán theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- tính tổng chi phí nhập hàng theo nhà cung cấp
select 
    PHIEUNHAPHANG.NhaCungCap,
    sum(CHITIETNHAPHANG.ThanhTien) as TongChiPhiNhap,
    avg(CHITIETNHAPHANG.ThanhTien) as ChiPhiNhapTrungBinh
from PHIEUNHAPHANG
join CHITIETNHAPHANG on PHIEUNHAPHANG.MaPhieuNhap = CHITIETNHAPHANG.MaPhieuNhap
group by PHIEUNHAPHANG.NhaCungCap;

-- tính tổng số tiền giảm giá theo khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    sum(HOADON.SoTienGiam) as TongTienGiam,
    avg(HOADON.SoTienGiam) as TienGiamTrungBinh
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- tính tổng số lượng nguyên liệu nhập theo loại nguyên liệu
select 
    NGUYENLIEU.Loai,
    sum(CHITIETNHAPHANG.SoLuongNhap) as TongSoLuongNhap,
    avg(CHITIETNHAPHANG.SoLuongNhap) as SoLuongNhapTrungBinh
from NGUYENLIEU
join CHITIETNHAPHANG on NGUYENLIEU.MaNguyenLieu = CHITIETNHAPHANG.MaNguyenLieu
group by NGUYENLIEU.Loai;

-- tính tổng lương cơ bản theo chức vụ nhân viên
select 
    ChucVu,
    sum(LuongCoBan) as TongLuongCoBan,
    avg(LuongCoBan) as LuongCoBanTrungBinh
from NHANVIEN
group by ChucVu;

-- tính tổng số bàn đã đặt theo khách hàng
select 
    KHACHHANG.TenKhachHang,
    sum(CHITIETDATBAN.SoLuongBan) as TongSoBanDat,
    avg(CHITIETDATBAN.SoLuongBan) as SoBanDatTrungBinh
from CHITIETDATBAN
join KHACHHANG on CHITIETDATBAN.MaKhachHang = KHACHHANG.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- tính tổng số món ăn đã bán theo món
select 
    MONAN.TenMon,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by MONAN.TenMon;

-- tính tổng doanh thu theo tháng
select 
    year(NgayLapHoaDon) as Nam,
    month(NgayLapHoaDon) as Thang,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by year(NgayLapHoaDon), month(NgayLapHoaDon)
order by Nam, Thang;

-- tính tổng doanh thu theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong * MONAN.DonGia) as TongDoanhThu,
    avg(CHITIETHOADON.SoLuong * MONAN.DonGia) as DoanhThuTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- 3. XÂY DỰNG BÁO CÁO TỪ DỮ LIỆU TRONG HỆ THỐNG

-- Báo cáo doanh thu chi tiết theo ngày và nhân viên
select 
    convert(date, hoadon.NgayLapHoaDon) as Ngay,
    nhanvien.HoTen as NhanVienLap,
    nhanvien.ChucVu as ChucVuNhanVien,
    count(distinct hoadon.MaHoaDon) as SoHoaDon,
    sum(hoadon.TongTienPhaiTra) as TongDoanhThu,
    sum(chitiethoadon.SoLuong) as TongSoLuongMonBan,
    avg(hoadon.TongTienPhaiTra) as DoanhThuTrungBinhHoaDon
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by convert(date, hoadon.NgayLapHoaDon), nhanvien.HoTen, nhanvien.ChucVu
order by Ngay desc;

-- Báo cáo món ăn bán chạy nhất
select 
    monan.TenMon,
    nhommonan.TenNhom,
    sum(chitiethoadon.SoLuong) as TongSoLuongBan,
    sum(chitiethoadon.SoLuong * monan.DonGia) as TongDoanhThuMon,
    count(distinct danhgia.MaKhachHang) as SoLuongDanhGia,
    avg(case 
        when danhgia.DiemDanhGia = N'5 sao' then 5 
        when danhgia.DiemDanhGia = N'4 sao' then 4 
        when danhgia.DiemDanhGia = N'3 sao' then 3 
        when danhgia.DiemDanhGia = N'2 sao' then 2 
        when danhgia.DiemDanhGia = N'1 sao' then 1 
        else 0 
    end) as DiemDanhGiaTrungBinh
from chitiethoadon
join monan on chitiethoadon.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join hoadon on chitiethoadon.MaHoaDon = hoadon.MaHoaDon
left join danhgia on monan.MaMonAn = danhgia.MaMonAn
where hoadon.TrangThai = N'Đã thanh toán'
group by monan.TenMon, nhommonan.TenNhom
order by TongSoLuongBan desc;

-- Báo cáo nhập hàng chi tiết
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    nhanvien.ChucVu as ChucVuNhanVien,
    phieunhaphang.NhaCungCap,
    sum(chitietnhaphang.SoLuongNhap) as TongSoLuongNhap,
    sum(chitietnhaphang.ThanhTien) as TongChiPhiNhap,
    count(distinct chitietnhaphang.MaNguyenLieu) as SoLoaiNguyenLieu
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
group by phieunhaphang.MaPhieuNhap, phieunhaphang.NgayTao, nhanvien.HoTen, nhanvien.ChucVu, phieunhaphang.NhaCungCap
order by phieunhaphang.NgayTao desc;

-- Báo cáo đặt bàn và sử dụng bàn
select 
    ban.MaBan,
    ban.LoaiBan,
    ban.TrangThai as TrangThaiBan,
    count(chitietdatban.MaKhachHang) as SoLuongDatBan,
    sum(chitietdatban.SoLuongBan) as TongSoBanDat,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from ban
left join chitietdatban on ban.MaBan = chitietdatban.MaBan
left join khachhang on chitietdatban.MaKhachHang = khachhang.MaKhachHang
group by ban.MaBan, ban.LoaiBan, ban.TrangThai
order by ban.MaBan;

-- Báo cáo hóa đơn chi tiết
select 
    hoadon.MaHoaDon,
    hoadon.NgayLapHoaDon,
    nhanvien.HoTen as NhanVienLap,
    khachhang.TenKhachHang,
    sum(chitiethoadon.SoLuong) as TongSoLuongMon,
    hoadon.TongTienPhaiTra,
    khuyenmai.TenKhuyenMai,
    hoadon.SoTienGiam
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by hoadon.MaHoaDon, hoadon.NgayLapHoaDon, nhanvien.HoTen, 
         khachhang.TenKhachHang, hoadon.TongTienPhaiTra, khuyenmai.TenKhuyenMai, hoadon.SoTienGiam
order by hoadon.NgayLapHoaDon desc;

-- Báo cáo thống kê tài chính
select 
    phieuthongke.MaPhieu,
    phieuthongke.NgayThongKe,
    nhanvien.HoTen as NhanVienLap,
    phieuthongke.DoanhThu,
    phieuthongke.Thu,
    phieuthongke.Chi,
    (phieuthongke.Thu - phieuthongke.Chi) as LoiNhuan
from phieuthongke
join nhanvien on phieuthongke.MaNhanVien = nhanvien.MaNhanVien
order by phieuthongke.NgayThongKe desc;

-- Báo cáo nguyên liệu sử dụng cho món ăn
select 
    monan.TenMon,
    nhommonan.TenNhom,
    nguyenlieu.TenNguyenLieu,
    nguyenlieu.Loai,
    nguyenlieu_monan.SoLuong as SoLuongNguyenLieuCanDung,
    nguyenlieu.DonViTinh
from nguyenlieu_monan
join monan on nguyenlieu_monan.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join nguyenlieu on nguyenlieu_monan.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by monan.TenMon;

-- Báo cáo nhân viên và ca làm việc
select 
    nhanvien.HoTen,
    nhanvien.ChucVu,
    count(nhanvien_calamviec.MaCa) as SoLuongCaLam,
    string_agg(concat(calamviec.MaCa, ': ', convert(varchar, calamviec.GioBatDau, 108), ' - ', convert(varchar, calamviec.GioKetThuc, 108)), ', ') as LichLamViec
from nhanvien
left join nhanvien_calamviec on nhanvien.MaNhanVien = nhanvien_calamviec.MaNhanVien
left join calamviec on nhanvien_calamviec.MaCa = calamviec.MaCa
group by nhanvien.HoTen, nhanvien.ChucVu
order by nhanvien.HoTen;

-- Báo cáo chi tiết sử dụng khuyến mãi
select 
    khuyenmai.TenKhuyenMai,
    khuyenmai.MoTa,
    count(hoadon.MaHoaDon) as SoLuongHoaDon,
    sum(hoadon.SoTienGiam) as TongTienGiam,
    avg(hoadon.SoTienGiam) as TienGiamTrungBinh,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from hoadon
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
group by khuyenmai.TenKhuyenMai, khuyenmai.MoTa
order by SoLuongHoaDon desc;

-- Báo cáo chi tiết phiếu nhập hàng để in
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    phieunhaphang.NhaCungCap,
    nguyenlieu.TenNguyenLieu,
    chitietnhaphang.SoLuongNhap,
    chitietnhaphang.DonGia,
    chitietnhaphang.ThanhTien
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
join nguyenlieu on chitietnhaphang.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by phieunhaphang.MaPhieuNhap, nguyenlieu.TenNguyenLieu;