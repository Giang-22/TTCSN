
-- Tao login và user 
CREATE LOGIN user_nhanvien WITH PASSWORD = 'NhanVien123!';
CREATE USER user_nhanvien FOR LOGIN user_nhanvien;

CREATE LOGIN user_quanly WITH PASSWORD = 'QuanLy123!';
CREATE USER user_quanly FOR LOGIN user_quanly;

CREATE LOGIN user_ketoan WITH PASSWORD = 'KeToan123!';
CREATE USER user_ketoan FOR LOGIN user_ketoan;

--C?p quy?n grant cho nhân viên(user_nhanvien)
-- Cho phép xem thông tin bàn
GRANT SELECT ON BAN TO user_nhanvien;

-- Cho phép xem danh sách món ?n
GRANT SELECT ON MONAN TO user_nhanvien;

-- Cho phép tra c?u thông tin khách hàng
GRANT SELECT ON KHACHHANG TO user_nhanvien;

-- Cho phép xem và t?o chi ti?t ??t bàn
GRANT SELECT, INSERT ON CHITIETDATBAN TO user_nhanvien;

-- Cho phép xem và ??ng ký ca làm vi?c
GRANT SELECT, INSERT ON NHANVIEN_CALAMVIEC TO user_nhanvien;

-- Cho phép xem thông tin các ca làm
GRANT SELECT ON CALAMVIEC TO user_nhanvien;

-- Cho phép t?o hóa ??n khi thanh toán
GRANT INSERT ON HOADON TO user_nhanvien;

-- Cho phép ghi chi ti?t hóa ??n
GRANT INSERT ON CHITIETHOADON TO user_nhanvien;

-- Cho phép g?i ?ánh giá món ?n
GRANT INSERT ON DANHGIA TO user_nhanvien;

-- Cho phép xem các ch??ng trình khuy?n mãi
GRANT SELECT ON KHUYENMAI TO user_nhanvien;

--C?p quy?n grant cho qu?n lý(user_quanly)
-- Qu?n lý nhân viên
GRANT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN TO user_quanly;

-- Qu?n lý ca làm vi?c
GRANT SELECT, INSERT, UPDATE, DELETE ON CALAMVIEC TO user_quanly;

-- Qu?n lý phân công ca làm
GRANT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN_CALAMVIEC TO user_quanly;

-- Qu?n lý thông tin khách hàng
GRANT SELECT, INSERT, UPDATE, DELETE ON KHACHHANG TO user_quanly;

-- Qu?n lý hóa ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON HOADON TO user_quanly;

-- Qu?n lý chi ti?t hóa ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETHOADON TO user_quanly;

-- Qu?n lý chi ti?t ??t bàn
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETDATBAN TO user_quanly;

-- Qu?n lý bàn ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON BAN TO user_quanly;

-- Qu?n lý món ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON MONAN TO user_quanly;

-- Qu?n lý nhóm món ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON NHOMMONAN TO user_quanly;

-- Qu?n lý nguyên li?u
GRANT SELECT, INSERT, UPDATE, DELETE ON NGUYENLIEU TO user_quanly;

-- Qu?n lý nguyên li?u trong món ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON NGUYENLIEU_MONAN TO user_quanly;

-- Qu?n lý ?ánh giá c?a khách hàng
GRANT SELECT, INSERT, UPDATE, DELETE ON DANHGIA TO user_quanly;

-- Qu?n lý ch??ng trình khuy?n mãi
GRANT SELECT, INSERT, UPDATE, DELETE ON KHUYENMAI TO user_quanly;

-- Qu?n lý báo cáo th?ng kê
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUTHONGKE TO user_quanly;

--C?p quy?n grant cho k? toán 
-- Qu?n lý hóa ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON HOADON TO user_ketoan;

-- Qu?n lý chi ti?t hóa ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETHOADON TO user_ketoan;

-- Qu?n lý phi?u nh?p hàng
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUNHAPHANG TO user_ketoan;

-- Qu?n lý chi ti?t nh?p hàng
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETNHAPHANG TO user_ketoan;

-- Xem món ?n ?? ??i chi?u báo cáo
GRANT SELECT ON MONAN TO user_ketoan;

-- Xem nguyên li?u ?? ki?m tra t?n kho
GRANT SELECT ON NGUYENLIEU TO user_ketoan;

-- L?p và xem báo cáo th?ng kê tài chính
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUTHONGKE TO user_ketoan;

--thu h?i quy?n(revoke) c?a nhân viên(user_nhanvien)
-- Thu h?i quy?n xem thông tin bàn
REVOKE ALL ON BAN FROM user_nhanvien;

-- Thu h?i quy?n xem món ?n
REVOKE ALL ON MONAN FROM user_nhanvien;

-- Thu h?i quy?n truy c?p khách hàng
REVOKE ALL ON KHACHHANG FROM user_nhanvien;

-- Thu h?i quy?n ??t bàn
REVOKE ALL ON CHITIETDATBAN FROM user_nhanvien;

-- Thu h?i quy?n ??ng ký ca
REVOKE ALL ON NHANVIEN_CALAMVIEC FROM user_nhanvien;

-- Thu h?i quy?n xem ca làm vi?c
REVOKE ALL ON CALAMVIEC FROM user_nhanvien;

-- Thu h?i quy?n t?o hóa ??n
REVOKE ALL ON HOADON FROM user_nhanvien;

-- Thu h?i quy?n t?o chi ti?t hóa ??n
REVOKE ALL ON CHITIETHOADON FROM user_nhanvien;

-- Thu h?i quy?n g?i ?ánh giá
REVOKE ALL ON DANHGIA FROM user_nhanvien;

-- Thu h?i quy?n xem khuy?n mãi
REVOKE ALL ON KHUYENMAI FROM user_nhanvien;

--thu h?i quy?n(revoke) c?a qu?n lý(user_quanly)
-- Thu h?i quy?n trên b?ng NHANVIEN
REVOKE ALL ON NHANVIEN FROM user_quanly;

-- Thu h?i quy?n trên b?ng CALAMVIEC
REVOKE ALL ON CALAMVIEC FROM user_quanly;

-- Thu h?i quy?n trên b?ng NHANVIEN_CALAMVIEC
REVOKE ALL ON NHANVIEN_CALAMVIEC FROM user_quanly;

-- Thu h?i quy?n trên b?ng KHACHHANG
REVOKE ALL ON KHACHHANG FROM user_quanly;

-- Thu h?i quy?n trên b?ng HOADON
REVOKE ALL ON HOADON FROM user_quanly;

-- Thu h?i quy?n trên b?ng CHITIETHOADON
REVOKE ALL ON CHITIETHOADON FROM user_quanly;

-- Thu h?i quy?n trên b?ng CHITIETDATBAN
REVOKE ALL ON CHITIETDATBAN FROM user_quanly;

-- Thu h?i quy?n trên b?ng BAN
REVOKE ALL ON BAN FROM user_quanly;

-- Thu h?i quy?n trên b?ng MONAN
REVOKE ALL ON MONAN FROM user_quanly;

-- Thu h?i quy?n trên b?ng NHOMMONAN
REVOKE ALL ON NHOMMONAN FROM user_quanly;

-- Thu h?i quy?n trên b?ng NGUYENLIEU
REVOKE ALL ON NGUYENLIEU FROM user_quanly;

-- Thu h?i quy?n trên b?ng NGUYENLIEU_MONAN
REVOKE ALL ON NGUYENLIEU_MONAN FROM user_quanly;

-- Thu h?i quy?n trên b?ng DANHGIA
REVOKE ALL ON DANHGIA FROM user_quanly;

-- Thu h?i quy?n trên b?ng KHUYENMAI
REVOKE ALL ON KHUYENMAI FROM user_quanly;

-- Thu h?i quy?n trên b?ng PHIEUTHONGKE
REVOKE ALL ON PHIEUTHONGKE FROM user_quanly;

--thu h?i quy?n(revoke) c?a k? toán(user_ketoan)
-- Thu h?i quy?n trên b?ng HOADON
REVOKE ALL ON HOADON FROM user_ketoan;

-- Thu h?i quy?n trên b?ng CHITIETHOADON
REVOKE ALL ON CHITIETHOADON FROM user_ketoan;

-- Thu h?i quy?n trên b?ng PHIEUNHAPHANG
REVOKE ALL ON PHIEUNHAPHANG FROM user_ketoan;

-- Thu h?i quy?n trên b?ng CHITIETNHAPHANG
REVOKE ALL ON CHITIETNHAPHANG FROM user_ketoan;

-- Thu h?i quy?n SELECT trên b?ng MONAN
REVOKE ALL ON MONAN FROM user_ketoan;

-- Thu h?i quy?n SELECT trên b?ng NGUYENLIEU
REVOKE ALL ON NGUYENLIEU FROM user_ketoan;

-- Thu h?i quy?n trên b?ng PHIEUTHONGKE
REVOKE ALL ON PHIEUTHONGKE FROM user_ketoan;
