
-- Tao login v� user 
CREATE LOGIN user_nhanvien WITH PASSWORD = 'NhanVien123!';
CREATE USER user_nhanvien FOR LOGIN user_nhanvien;

CREATE LOGIN user_quanly WITH PASSWORD = 'QuanLy123!';
CREATE USER user_quanly FOR LOGIN user_quanly;

CREATE LOGIN user_ketoan WITH PASSWORD = 'KeToan123!';
CREATE USER user_ketoan FOR LOGIN user_ketoan;

--C?p quy?n grant cho nh�n vi�n(user_nhanvien)
-- Cho ph�p xem th�ng tin b�n
GRANT SELECT ON BAN TO user_nhanvien;

-- Cho ph�p xem danh s�ch m�n ?n
GRANT SELECT ON MONAN TO user_nhanvien;

-- Cho ph�p tra c?u th�ng tin kh�ch h�ng
GRANT SELECT ON KHACHHANG TO user_nhanvien;

-- Cho ph�p xem v� t?o chi ti?t ??t b�n
GRANT SELECT, INSERT ON CHITIETDATBAN TO user_nhanvien;

-- Cho ph�p xem v� ??ng k� ca l�m vi?c
GRANT SELECT, INSERT ON NHANVIEN_CALAMVIEC TO user_nhanvien;

-- Cho ph�p xem th�ng tin c�c ca l�m
GRANT SELECT ON CALAMVIEC TO user_nhanvien;

-- Cho ph�p t?o h�a ??n khi thanh to�n
GRANT INSERT ON HOADON TO user_nhanvien;

-- Cho ph�p ghi chi ti?t h�a ??n
GRANT INSERT ON CHITIETHOADON TO user_nhanvien;

-- Cho ph�p g?i ?�nh gi� m�n ?n
GRANT INSERT ON DANHGIA TO user_nhanvien;

-- Cho ph�p xem c�c ch??ng tr�nh khuy?n m�i
GRANT SELECT ON KHUYENMAI TO user_nhanvien;

--C?p quy?n grant cho qu?n l�(user_quanly)
-- Qu?n l� nh�n vi�n
GRANT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN TO user_quanly;

-- Qu?n l� ca l�m vi?c
GRANT SELECT, INSERT, UPDATE, DELETE ON CALAMVIEC TO user_quanly;

-- Qu?n l� ph�n c�ng ca l�m
GRANT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN_CALAMVIEC TO user_quanly;

-- Qu?n l� th�ng tin kh�ch h�ng
GRANT SELECT, INSERT, UPDATE, DELETE ON KHACHHANG TO user_quanly;

-- Qu?n l� h�a ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON HOADON TO user_quanly;

-- Qu?n l� chi ti?t h�a ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETHOADON TO user_quanly;

-- Qu?n l� chi ti?t ??t b�n
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETDATBAN TO user_quanly;

-- Qu?n l� b�n ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON BAN TO user_quanly;

-- Qu?n l� m�n ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON MONAN TO user_quanly;

-- Qu?n l� nh�m m�n ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON NHOMMONAN TO user_quanly;

-- Qu?n l� nguy�n li?u
GRANT SELECT, INSERT, UPDATE, DELETE ON NGUYENLIEU TO user_quanly;

-- Qu?n l� nguy�n li?u trong m�n ?n
GRANT SELECT, INSERT, UPDATE, DELETE ON NGUYENLIEU_MONAN TO user_quanly;

-- Qu?n l� ?�nh gi� c?a kh�ch h�ng
GRANT SELECT, INSERT, UPDATE, DELETE ON DANHGIA TO user_quanly;

-- Qu?n l� ch??ng tr�nh khuy?n m�i
GRANT SELECT, INSERT, UPDATE, DELETE ON KHUYENMAI TO user_quanly;

-- Qu?n l� b�o c�o th?ng k�
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUTHONGKE TO user_quanly;

--C?p quy?n grant cho k? to�n 
-- Qu?n l� h�a ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON HOADON TO user_ketoan;

-- Qu?n l� chi ti?t h�a ??n
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETHOADON TO user_ketoan;

-- Qu?n l� phi?u nh?p h�ng
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUNHAPHANG TO user_ketoan;

-- Qu?n l� chi ti?t nh?p h�ng
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETNHAPHANG TO user_ketoan;

-- Xem m�n ?n ?? ??i chi?u b�o c�o
GRANT SELECT ON MONAN TO user_ketoan;

-- Xem nguy�n li?u ?? ki?m tra t?n kho
GRANT SELECT ON NGUYENLIEU TO user_ketoan;

-- L?p v� xem b�o c�o th?ng k� t�i ch�nh
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUTHONGKE TO user_ketoan;

--thu h?i quy?n(revoke) c?a nh�n vi�n(user_nhanvien)
-- Thu h?i quy?n xem th�ng tin b�n
REVOKE ALL ON BAN FROM user_nhanvien;

-- Thu h?i quy?n xem m�n ?n
REVOKE ALL ON MONAN FROM user_nhanvien;

-- Thu h?i quy?n truy c?p kh�ch h�ng
REVOKE ALL ON KHACHHANG FROM user_nhanvien;

-- Thu h?i quy?n ??t b�n
REVOKE ALL ON CHITIETDATBAN FROM user_nhanvien;

-- Thu h?i quy?n ??ng k� ca
REVOKE ALL ON NHANVIEN_CALAMVIEC FROM user_nhanvien;

-- Thu h?i quy?n xem ca l�m vi?c
REVOKE ALL ON CALAMVIEC FROM user_nhanvien;

-- Thu h?i quy?n t?o h�a ??n
REVOKE ALL ON HOADON FROM user_nhanvien;

-- Thu h?i quy?n t?o chi ti?t h�a ??n
REVOKE ALL ON CHITIETHOADON FROM user_nhanvien;

-- Thu h?i quy?n g?i ?�nh gi�
REVOKE ALL ON DANHGIA FROM user_nhanvien;

-- Thu h?i quy?n xem khuy?n m�i
REVOKE ALL ON KHUYENMAI FROM user_nhanvien;

--thu h?i quy?n(revoke) c?a qu?n l�(user_quanly)
-- Thu h?i quy?n tr�n b?ng NHANVIEN
REVOKE ALL ON NHANVIEN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng CALAMVIEC
REVOKE ALL ON CALAMVIEC FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng NHANVIEN_CALAMVIEC
REVOKE ALL ON NHANVIEN_CALAMVIEC FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng KHACHHANG
REVOKE ALL ON KHACHHANG FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng HOADON
REVOKE ALL ON HOADON FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng CHITIETHOADON
REVOKE ALL ON CHITIETHOADON FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng CHITIETDATBAN
REVOKE ALL ON CHITIETDATBAN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng BAN
REVOKE ALL ON BAN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng MONAN
REVOKE ALL ON MONAN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng NHOMMONAN
REVOKE ALL ON NHOMMONAN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng NGUYENLIEU
REVOKE ALL ON NGUYENLIEU FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng NGUYENLIEU_MONAN
REVOKE ALL ON NGUYENLIEU_MONAN FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng DANHGIA
REVOKE ALL ON DANHGIA FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng KHUYENMAI
REVOKE ALL ON KHUYENMAI FROM user_quanly;

-- Thu h?i quy?n tr�n b?ng PHIEUTHONGKE
REVOKE ALL ON PHIEUTHONGKE FROM user_quanly;

--thu h?i quy?n(revoke) c?a k? to�n(user_ketoan)
-- Thu h?i quy?n tr�n b?ng HOADON
REVOKE ALL ON HOADON FROM user_ketoan;

-- Thu h?i quy?n tr�n b?ng CHITIETHOADON
REVOKE ALL ON CHITIETHOADON FROM user_ketoan;

-- Thu h?i quy?n tr�n b?ng PHIEUNHAPHANG
REVOKE ALL ON PHIEUNHAPHANG FROM user_ketoan;

-- Thu h?i quy?n tr�n b?ng CHITIETNHAPHANG
REVOKE ALL ON CHITIETNHAPHANG FROM user_ketoan;

-- Thu h?i quy?n SELECT tr�n b?ng MONAN
REVOKE ALL ON MONAN FROM user_ketoan;

-- Thu h?i quy?n SELECT tr�n b?ng NGUYENLIEU
REVOKE ALL ON NGUYENLIEU FROM user_ketoan;

-- Thu h?i quy?n tr�n b?ng PHIEUTHONGKE
REVOKE ALL ON PHIEUTHONGKE FROM user_ketoan;
