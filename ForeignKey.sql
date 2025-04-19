Alter table CHITIETDATBAN add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DANHGIA add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DanhGia add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table CHITIETHOADON add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table NHANVIEN add  foreign key(MaQuanLy) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUTHonGKE add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaNhanVienLap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUNHAPHANG add  foreign key(MaNhanVienNhap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table MONAN add  foreign key(MaNhom) references NHOMMONAN (MaNhom)  on update no action on delete no action 
go
Alter table CHITIETDATBAN add  foreign key(MaBan) references BAN (MaBan)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaCa) references CALAMVIEC (MaCa)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhuyenMai) references KHUYENMAI (MaKhuyenMai)  on update no action on delete no action 
go
Alter table CHITIETHOADon add  foreign key(MaHoaDon) references HOADON (MaHoaDon)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaPhieuNhap) references PHIEUNHAPHANG (MaPhieuNhap)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go
