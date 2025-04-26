
create index IDX_KHACHHANG_TEN on KHACHHANG(TenKhachHang);
--> Tăng tốc truy vấn tìm kiếm khách hàng theo tên.
create unique index IDX_KHACHHANG_SDT on KHACHHANG(SoDienThoai);
--> Đảm bảo số điện thoại không bị trùng lặp và hỗ trợ tìm kiếm nhanh theo SĐT.
create index IDX_KHACHHANG_DIACHI on KHACHHANG(DiaChi);
--> Hỗ trợ truy vấn, thống kê khách hàng theo khu vực địa chỉ.

create unique index IDX_MONAN_TENMON on MONAN(TenMon);
--> Đảm bảo tên món ăn là duy nhất trong hệ thống.
create index IDX_MONAN_DONVITINH on MONAN(DonViTinh);
--> Hỗ trợ lọc món ăn theo đơn vị tính (ví dụ: phần, tô…).
create index IDX_MONAN_TRANGTHAI on MONAN(TrangThai);
--> Giúp truy vấn nhanh trạng thái món ăn: còn bán, hết món, ngừng kinh doanh.
create index IDX_MONAN_MANHOM on MONAN(MaNhom);
--> Dễ dàng lọc món ăn theo nhóm (món chính, món phụ…).
create index IDX_MONAN_SOLUONGCON on MONAN(SoLuongCon);
--> Hỗ trợ kiểm tra, cảnh báo món sắp hết khi số lượng tồn kho giảm.

create index IDX_NHANVIEN_HOTEN on NHANVIEN(HoTen);
--> Truy vấn nhanh nhân viên theo họ tên.
create index IDX_NHANVIEN_GIOITINH on NHANVIEN(GioiTinh);
--> Lọc nhân viên theo giới tính.
create index IDX_NHANVIEN_CHUCVU on NHANVIEN(ChucVu);
--> Truy vấn nhanh danh sách nhân viên theo chức vụ.
create index IDX_NHANVIEN_MAQUANLY on NHANVIEN(MaQuanLy);
--> Phục vụ cho mô hình phân cấp quản lý nhân viên.
create index IDX_NHANVIEN_LUONG on NHANVIEN(LuongCoBan);
--> Hỗ trợ sắp xếp hoặc lọc nhân viên theo mức lương cơ bản.

create index IDX_BAN_LOAIBAN on BAN(LoaiBan);
--> Lọc bàn theo loại bàn (đơn, nhóm…).
create index IDX_BAN_SOLUONGCHO on BAN(SoLuongCho);
--> Truy vấn nhanh các bàn theo số lượng chỗ ngồi.
create index IDX_BAN_TRANGTHAI on BAN(TrangThai);
--> Hỗ trợ kiểm tra bàn đang trống, có khách hoặc đã đặt.

create index IDX_CTDB_MAKHACHHANG on CHITIETDATBAN(MaKhachHang);
--> Tìm các lần đặt bàn của một khách hàng cụ thể.
create index IDX_CTDB_MABAN on CHITIETDATBAN(MaBan);
--> Truy vấn thông tin đặt bàn theo từng bàn cụ thể.

create index IDX_DANHGIA_MAKHACHHANG on DANHGIA(MaKhachHang);
--> Lọc danh sách đánh giá theo khách hàng.
create index IDX_DANHGIA_MAMONAN on DANHGIA(MaMonAn);
--> Truy vấn đánh giá của từng món ăn.
create index IDX_DANHGIA_THOIGIAN on DANHGIA(ThoiGianDanhGia);
--> Hỗ trợ lọc đánh giá theo khoảng thời gian.

create index IDX_CALAMVIEC_GIOBATDAU on CALAMVIEC(GioBatDau);
--> Tìm ca làm việc bắt đầu vào thời gian cụ thể.
create index IDX_CALAMVIEC_GIOKETTHUC on CALAMVIEC(GioKetThuc);
--> Tìm ca làm kết thúc vào thời gian cụ thể.

create index IDX_NVCA_NGAYLAM on NHANVIEN_CALAMVIEC(NgayLam);
--> Truy vấn ca làm của nhân viên theo ngày cụ thể.
create index IDX_NVCA_MACA on NHANVIEN_CALAMVIEC(MaCa);
--> Lọc danh sách ca làm theo mã ca.

create index IDX_KHUYENMAI_NGAY on KHUYENMAI(NgayBatDau, NgayKetThuc);
--> Tìm chương trình khuyến mãi trong khoảng thời gian cụ thể.

create index IDX_HOADON_NGAY on HOADON(NgayLapHoaDon);
--> Truy vấn nhanh hóa đơn theo ngày lập.
create index IDX_HOADON_TRANGTHAI on HOADON(TrangThai);
--> Lọc hóa đơn theo trạng thái (đã thanh toán, đang xử lý…).
create index IDX_HOADON_KHACHHANG on HOADON(MaKhachHang);
--> Truy xuất hóa đơn của một khách hàng.

create index IDX_PHIEUNHAP_NGAYTAO on PHIEUNHAPHANG(NgayTao);
--> Truy vấn phiếu nhập hàng theo ngày tạo.
create index IDX_PHIEUNHAP_NV on PHIEUNHAPHANG(MaNhanVienNhap);
--> Lọc phiếu nhập theo nhân viên thực hiện.
create index IDX_PHIEUNHAP_NCC on PHIEUNHAPHANG(NhaCungCap);
--> Truy vấn phiếu nhập theo nhà cung cấp.

create index IDX_NL_HANSUDUNG on NGUYENLIEU(HanSuDung);
--> Hỗ trợ kiểm tra và cảnh báo nguyên liệu gần hết hạn.
create index IDX_NL_LOAI on NGUYENLIEU(LOAI);
--> Truy vấn nhanh nguyên liệu theo loại (thịt, rau, gia vị…).
create index IDX_NL_NGAYSX on NGUYENLIEU(NgaySanXuat);
--> Lọc nguyên liệu theo ngày sản xuất.
create index IDX_NL_GIABAN on NGUYENLIEU(GiaBan);
--> Hỗ trợ so sánh giá nguyên liệu, sắp xếp theo giá.
create index IDX_NL_LOAI_HSD on NGUYENLIEU(Loai, HanSuDung);
--> Tìm nguyên liệu theo loại và hạn sử dụng kết hợp.

create index IDX_CTNHAPHANG_MAPHIEUNHAP on CHITIETNHAPHANG(MaPhieuNhap);
--> Truy vấn chi tiết nhập theo mã phiếu nhập.
create index IDX_CTNHAPHANG_MANGUYENLIEU on CHITIETNHAPHANG(MaNguyenLieu);
--> Truy xuất chi tiết nhập của nguyên liệu cụ thể.
create index IDX_CTNHAPHANG_THANHTIEN on CHITIETNHAPHANG(ThanhTien);
--> Hỗ trợ thống kê tổng giá trị nhập từng dòng.
create index IDX_CTNHAPHANG_MANGUYENLIEU_MAPHIEUNHAP 
on CHITIETNHAPHANG(MaNguyenLieu, MaPhieuNhap);
--> Tăng tốc truy vấn khi kết hợp tìm nguyên liệu trong một phiếu cụ thể.

create index IDX_PT_NGAYTHONGKE on PHIEUTHONGKE(NgayThongKe);
--> Truy vấn phiếu thống kê theo ngày.
create index IDX_PT_MANHANVIEN on PHIEUTHONGKE(MaNhanVien);
--> Truy vấn thống kê theo nhân viên.
create index IDX_PT_NGAY_MANHANVIEN on PHIEUTHONGKE(NgayThongKe, MaNhanVien);
--> Tìm thống kê của nhân viên trong một khoảng thời gian.

create index IDX_CTHD_MAHOADON on CHITIETHOADON(MaHoaDon);
--> Truy xuất chi tiết các món ăn trong hóa đơn.
create index IDX_CTHD_MAMONAN on CHITIETHOADON(MaMonAn);
--> Tìm tất cả hóa đơn có món ăn cụ thể.
create index IDX_CTHD_MAMONAN_MAHOADON 
on CHITIETHOADON(MaMonAn, MaHoaDon);
--> Truy vấn nâng cao: tìm món trong hóa đơn cụ thể.
