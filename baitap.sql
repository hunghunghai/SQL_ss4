create database QuanlyBanHang2;
use QuanlyBanHang2 ;
create table khachhang(
makh varchar(4) primary key,
tenkh varchar(30) not null,
diachi varchar(50),
ngaysinh datetime,
sodt varchar(15) unicode
);
create table nhanvien(
manv varchar(4)primary key,
hoten varchar(30) not null,
gioitinh bit not null,
diachi varchar(30) not null,
ngaysinh datetime not null,
dienthoai varchar (15),
email text ,
noisinh varchar(20) not null,
ngayvaolam datetime,
maql varchar(4)
);
create table nhacungcap(
mancc varchar(5) primary key,
tenncc varchar(50) not null,
diachi varchar (50) not null,
dienthoai varchar( 15) not null,
email varchar (30) not null,
website varchar(30)
);
create table loaisp(
maloaisp varchar(4) primary key,
tenloaisp varchar(30) not null,
ghichu varchar(100) not null
);
create table sanpham(
masp varchar(4) primary key,
maloaisp varchar(4) not null,
foreign key(maloaisp)references loaisp(maloaisp),
tensp varchar (50) not null ,
donvitinh varchar(10) not null,
ghichu varchar(100)
);
create table phieunhap(
sopn varchar(5) primary key,
manv varchar(4) not null,
foreign key(manv)references nhanvien(manv),
maNcc varchar(5) not null,
foreign key(mancc)references nhacungcap(mancc),
ngaynhap datetime not null,
ghichu varchar(100)
);
create table ctphieunhap(
ctphieunhapId int auto_increment primary key,
masp varchar(4) not null,
sopn varchar(5) not null,
foreign key(masp) references sanpham(masp),
foreign key(sopn) references phieunhap(sopn),
soluong smallint not null default 0,
gianhap real not null check(gianhap>=0)
);
create table phieuxuat(
sopx varchar(5)  primary key,
manv varchar(4) not null,
makh varchar(4) not null,
foreign key(makh)references khachhang(makh),
foreign key(manv)references nhanvien(manv),
ngayban DATETIME,
ghichu text
);
--  alter table phieuxuat add CHECK (ngayban >= now());
create table ctphieuxuat(
ctphieuxuatId int auto_increment primary key,
sopx varchar(5) not null,
masp varchar(4) not null,
foreign key (sopx) references phieuxuat(sopx),
foreign key (masp) references sanpham(masp),
soluong smallint not null check(soluong > 0),
giaban real not null check (giaban > 0)
);
INSERT INTO nhanvien (manv, hoten, gioitinh, diachi, ngaysinh, dienthoai, email, noisinh, ngayvaolam, maql)
VALUES
  ('NV01', 'Nguyen Van A', 1, '123 Nguyen Hue, TP.HCM', '1990-01-15', '0901234567', 'nv.a@example.com', 'TP.HCM', '2020-01-01 08:00:00', null),
  ('NV02', 'Tran Thi B', 0, '456 Le Loi, TP.HCM', '1995-05-20', '0912345678', 'tt.b@example.com', 'TP.HCM', '2021-03-15 09:30:00', 'NV02'),
  ('NV03', 'Pham Van C', 1, '789 Vo Van Tan, TP.HCM', '1988-11-02', '0987654321', 'pv.c@example.com', 'TP.HCM', '2019-10-10 07:45:00', 'NV02');
INSERT INTO khachhang (makh, tenkh, diachi, ngaysinh, sodt)
VALUES
  ('KH01', 'Nguyen Thi D', '101 Nguyen Trai, TP.HCM', '1985-12-25', '0978123456'),
('KH02', 'Tran Van E', '202 Le Lai, TP.HCM', '1992-08-10', '0987123456'),
  ('KH03', 'Le Thi F', '303 Vo Van Tan, TP.HCM', '1989-06-18', '0918123456');
INSERT INTO nhacungcap (mancc, tenncc, diachi, dienthoai, email, website)
VALUES
  ('NCC01', 'Cong ty A', '15 Le Duan, TP.HCM', '0909123456', 'info@ncc-a.com', 'www.ncc-a.com'),
  ('NCC02', 'Cong ty B', '25 Nguyen Thi Minh Khai, TP.HCM', '0918234567', 'info@ncc-b.com', 'www.ncc-b.com'),
  ('NCC03', 'Cong ty C', '35 Tran Hung Dao, TP.HCM', '0987654321', 'info@ncc-c.com', 'www.ncc-c.com');
INSERT INTO loaisp (maloaisp, tenloaisp, ghichu)
VALUES
  ('LSP1', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
  ('LSP2', 'Laptop', 'Các sản phẩm laptop'),
  ('LSP3', 'Phụ kiện điện tử', 'Các phụ kiện điện tử');
INSERT INTO sanpham (masp, maloaisp, tensp, donvitinh, ghichu)
VALUES
  ('SP01', 'LSP1', 'iPhone 12', 'cái', 'Màu đen, bộ nhớ 128GB'),
  ('SP02', 'LSP1', 'Samsung Galaxy S21', 'cái', 'Màu xanh, bộ nhớ 256GB'),
  ('SP03', 'LSP2', 'Dell XPS 13', 'cái', 'Core i7, RAM 16GB');
INSERT INTO phieunhap (sopn, manv, mancc, ngaynhap, ghichu)
VALUES
  ('PN01', 'NV01', 'NCC01', '2023-07-10 10:30:00', 'Phiếu nhập số 1'),
  ('PN02', 'NV02', 'NCC02', '2023-07-15 15:45:00', 'Phiếu nhập số 2'),
  ('PN03', 'NV03', 'NCC03', '2023-07-20 09:00:00', 'Phiếu nhập số 3');
INSERT INTO ctphieunhap (masp, sopn, soluong, gianhap)
VALUES
  ('SP01', 'PN01', 50, 15000000),
  ('SP02', 'PN01', 30, 13000000),
  ('SP03', 'PN02', 20, 18000000),
  ('SP01', 'PN03', 40, 14500000);
INSERT INTO phieuxuat (sopx, manv, makh, ngayban, ghichu)
VALUES
  ('PX01', 'NV01', 'KH01', '2023-08-12 14:30:00', 'Phiếu xuất số 1'),
  ('PX02', 'NV02', 'KH02', '2023-08-18 10:15:00', 'Phiếu xuất số 2'),
  ('PX03', 'NV03', 'KH03', '2023-08-20 16:00:00', 'Phiếu xuất số 3');
INSERT INTO ctphieuxuat (sopx, masp, soluong, giaban)
VALUES
  ('PX01', 'SP01', 10, 20000000),
  ('PX01', 'SP02', 20, 18000000),
  ('PX02', 'SP03', 5, 22000000),
  ('PX03', 'SP01', 15, 19500000);
  
  
  -- 1
 select DATE_FORMAT(ngayban, '%Y-%m') as month,
       makh as customer_code,
       (select tenkh from khachhang WHERE makh = px.makh) AS customer_name,
       (select diachi from khachhang WHERE makh = px.makh) AS address,
       SUM(giaban * soluong) AS total_amount
from phieuxuat px
JOIN ctphieuxuat ctx ON px.sopx = ctx.sopx
GROUP BY month, customer_code;


 -- 2
select YEAR(ngayban) AS year,
       DATE_FORMAT(ngayban, '%Y-%m') AS month,
       masp AS product_code,
       (select tensp from sanpham WHERE masp = px.masp) AS product_name,
       donvitinh AS unit_of_measurement,
       SUM(soluong) AS total_quantity_sold
from phieuxuat px
JOIN ctphieuxuat ctx ON px.sopx = ctx.sopx
GROUP BY year, month, product_code;

-- 3
select DATE_FORMAT(ngayban, '%Y-%m') AS month,
       SUM(giaban * soluong) AS total_sales_revenue
from phieuxuat
WHERE YEAR(ngayban) = 2023 AND MONTH(ngayban) <= 6
GROUP BY month;

-- 4
select sopx AS invoice_number,
       ngayban AS sales_date,
       (select hoten from nhanvien WHERE manv = px.manv) AS salesperson_name,
       (select tenkh from khachhang WHERE makh = px.makh) AS customer_name,
       SUM(giaban * soluong) AS total_value
from phieuxuat px
JOIN ctphieuxuat ctx ON px.sopx = ctx.sopx
WHERE YEAR(ngayban) = 2023 AND MONTH(ngayban) IN (8, 9)
GROUP BY sopx;


-- 5
select sopx AS invoice_number,
       makh AS customer_code,
       (select tenkh from khachhang WHERE makh = px.makh) AS customer_name,
       (select hoten from nhanvien WHERE manv = px.manv) AS salesperson_name,
       ngayban AS sales_date,
       SUM(giaban * soluong) AS total_value
from phieuxuat px
JOIN ctphieuxuat ctx ON px.sopx = ctx.sopx
WHERE DATE(ngayban) = CURDATE()
GROUP BY sopx;
-- 6
select px.manv as salesperson_code,
       (select hoten from nhanvien where manv = px.manv) as salesperson_name,
       ctx.masp as product_code,
       (select tensp from sanpham where masp = ctx.masp) as product_name,
       donvitinh as unit_of_measurement,
       SUM(soluong) as total_quantity_sold
from phieuxuat px
join ctphieuxuat ctx on px.sopx = ctx.sopx
group by px.manv, ctx.masp;


