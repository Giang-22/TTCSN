
-- tạo login và user 
create login user_nhanvien with password = 'NhanVien123!';
create user user_nhanvien for login user_nhanvien;


create login user_quanly with password = 'QuanLy123!';
create user user_quanly for login user_quanly;

create login user_ketoan with password = 'KeToan123!';
create user user_ketoan for login user_ketoan;

-- cấp quyền grant cho nhân viên (user_nhanvien)
-- cho phép xem thông tin bàn
grant select on BAN to user_nhanvien;

-- cho phép xem danh sách món ăn
grant select on MONAN to user_nhanvien;

-- cho phép tra cứu thông tin khách hàng
grant select on KHACHHANG to user_nhanvien;

-- cho phép xem và tạo chi tiết đặt bàn
grant select, insert on CHITIETDATBAN to user_nhanvien;

-- cho phép xem và đăng ký ca làm việc
grant select, insert on NHANVIEN_CALAMVIEC to user_nhanvien;

-- cho phép xem thông tin các ca làm
grant select on CALAMVIEC to user_nhanvien;

-- cho phép tạo hóa đơn khi thanh toán
grant insert on HOADON to user_nhanvien;

-- cho phép ghi chi tiết hóa đơn
grant insert on CHITIETHOADON to user_nhanvien;

-- cho phép gửi đánh giá món ăn
grant insert on DANHGIA to user_nhanvien;

-- cho phép xem các chương trình khuyến mãi
grant select on KHUYENMAI to user_nhanvien;

-- cấp quyền grant cho quản lý (user_quanly)
-- quản lý nhân viên
grant select, insert, update, delete on NHANVIEN to user_quanly;

-- quản lý ca làm việc
grant select, insert, update, delete on CALAMVIEC to user_quanly;

-- quản lý phân công ca làm
grant select, insert, update, delete on NHANVIEN_CALAMVIEC to user_quanly;

-- quản lý thông tin khách hàng
grant select, insert, update, delete on KHACHHANG to user_quanly;

-- quản lý hóa đơn
grant select, insert, update, delete on HOADON to user_quanly;

-- quản lý chi tiết hóa đơn
grant select, insert, update, delete on CHITIETHOADON to user_quanly;

-- quản lý chi tiết đặt bàn
grant select, insert, update, delete on CHITIETDATBAN to user_quanly;

-- quản lý bàn ăn
grant select, insert, update, delete on BAN to user_quanly;

-- quản lý món ăn
grant select, insert, update, delete on MONAN to user_quanly;

-- quản lý nhóm món ăn
grant select, insert, update, delete on NHOMMONAN to user_quanly;

-- quản lý nguyên liệu
grant select, insert, update, delete on NGUYENLIEU to user_quanly;

-- quản lý nguyên liệu trong món ăn
grant select, insert, update, delete on NGUYENLIEU_MONAN to user_quanly;

-- quản lý đánh giá của khách hàng
grant select, insert, update, delete on DANHGIA to user_quanly;

-- quản lý chương trình khuyến mãi
grant select, insert, update, delete on KHUYENMAI to user_quanly;

-- quản lý báo cáo thống kê
grant select, insert, update, delete on PHIEUTHONGKE to user_quanly;

-- cấp quyền grant cho kế toán 
-- quản lý hóa đơn
grant select, insert, update, delete on HOADON to user_ketoan;

-- quản lý chi tiết hóa đơn
grant select, insert, update, delete on CHITIETHOADON to user_ketoan;

-- quản lý phiếu nhập hàng
grant select, insert, update, delete on PHIEUNHAPHANG to user_ketoan;

-- quản lý chi tiết nhập hàng
grant select, insert, update, delete on CHITIETNHAPHANG to user_ketoan;

-- xem món ăn để đối chiếu báo cáo
grant select on MONAN to user_ketoan;

-- xem nguyên liệu để kiểm tra tồn kho
grant select on NGUYENLIEU to user_ketoan;

-- lập và xem báo cáo thống kê tài chính
grant select, insert, update, delete on PHIEUTHONGKE to user_ketoan;

-- thu hồi quyền của nhân viên (user_nhanvien)
-- thu hồi quyền xem thông tin bàn
revoke all on BAN from user_nhanvien;

-- thu hồi quyền xem món ăn
revoke all on MONAN from user_nhanvien;

-- thu hồi quyền truy cập khách hàng
revoke all on KHACHHANG from user_nhanvien;

-- thu hồi quyền đặt bàn
revoke all on CHITIETDATBAN from user_nhanvien;

-- thu hồi quyền đăng ký ca
revoke all on NHANVIEN_CALAMVIEC from user_nhanvien;

-- thu hồi quyền xem ca làm việc
revoke all on CALAMVIEC from user_nhanvien;

-- thu hồi quyền tạo hóa đơn
revoke all on HOADON from user_nhanvien;

-- thu hồi quyền tạo chi tiết hóa đơn
revoke all on CHITIETHOADON from user_nhanvien;

-- thu hồi quyền gửi đánh giá
revoke all on DANHGIA from user_nhanvien;

-- thu hồi quyền xem khuyến mãi
revoke all on KHUYENMAI from user_nhanvien;

-- thu hồi quyền của quản lý (user_quanly)
-- thu hồi quyền trên bảng NHANVIEN
revoke all on NHANVIEN from user_quanly;

-- thu hồi quyền trên bảng CALAMVIEC
revoke all on CALAMVIEC from user_quanly;

-- thu hồi quyền trên bảng NHANVIEN_CALAMVIEC
revoke all on NHANVIEN_CALAMVIEC from user_quanly;

-- thu hồi quyền trên bảng KHACHHANG
revoke all on KHACHHANG from user_quanly;

-- thu hồi quyền trên bảng HOADON
revoke all on HOADON from user_quanly;

-- thu hồi quyền trên bảng CHITIETHOADON
revoke all on CHITIETHOADON from user_quanly;

-- thu hồi quyền trên bảng CHITIETDATBAN
revoke all on CHITIETDATBAN from user_quanly;

-- thu hồi quyền trên bảng BAN
revoke all on BAN from user_quanly;

-- thu hồi quyền trên bảng MONAN
revoke all on MONAN from user_quanly;

-- thu hồi quyền trên bảng NHOMMONAN
revoke all on NHOMMONAN from user_quanly;

-- thu hồi quyền trên bảng NGUYENLIEU
revoke all on NGUYENLIEU from user_quanly;

-- thu hồi quyền trên bảng NGUYENLIEU_MONAN
revoke all on NGUYENLIEU_MONAN from user_quanly;

-- thu hồi quyền trên bảng DANHGIA
revoke all on DANHGIA from user_quanly;

-- thu hồi quyền trên bảng KHUYENMAI
revoke all on KHUYENMAI from user_quanly;

-- thu hồi quyền trên bảng PHIEUTHONGKE
revoke all on PHIEUTHONGKE from user_quanly;

-- thu hồi quyền của kế toán (user_ketoan)
-- thu hồi quyền trên bảng HOADON
revoke all on HOADON from user_ketoan;

-- thu hồi quyền trên bảng CHITIETHOADON
revoke all on CHITIETHOADON from user_ketoan;

-- thu hồi quyền trên bảng PHIEUNHAPHANG
revoke all on PHIEUNHAPHANG from user_ketoan;

-- thu hồi quyền trên bảng CHITIETNHAPHANG
revoke all on CHITIETNHAPHANG from user_ketoan;

-- thu hồi quyền select trên bảng MONAN
revoke all on MONAN from user_ketoan;

-- thu hồi quyền select trên bảng NGUYENLIEU
revoke all on NGUYENLIEU from user_ketoan;

-- thu hồi quyền trên bảng PHIEUTHONGKE
revoke all on PHIEUTHONGKE from user_ketoan;
