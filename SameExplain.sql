--Kiểm tra tốc độ truy vấn
--Kiểm tra thời gian
set statistics time on
set statistics time off

--Kiểm tra tài nguyên
set statistics io on
set statistics io off
-- 1. MÓN ĂN BÁN CHẠY NHẤT (được gọi nhiều nhất)
set statistics io on
set statistics time on
select top 1 ct.MaMonAn, m.TenMon, sum(ct.SoLuong) as SoLuongBan
from CHITIETHOADON ct
join MONAN m on ct.MaMonAn = m.MaMonAn
group by ct.MaMonAn, m.TenMon
order by sum(ct.SoLuong) desc;
set statistics time off
set statistics io off