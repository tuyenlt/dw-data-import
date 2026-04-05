CREATE DATABASE Data_Warehouse;
GO
USE Data_Warehouse;
GO

-- 1. Bảng Văn phòng đại diện (City/Branch)
CREATE TABLE VanPhongDaiDien (
    MaThanhPho VARCHAR(20) PRIMARY KEY,
    TenThanhPho VARCHAR(255),
    DiaChiVP VARCHAR(255),
    Bang VARCHAR(50),
    ThoiGian DATETIME DEFAULT GETDATE()
);

-- 2. Bảng Cửa hàng
CREATE TABLE CuaHang (
    MaCuaHang VARCHAR(40) PRIMARY KEY,
    MaThanhPho VARCHAR(20),
    SoDienThoai VARCHAR(20),
    ThoiGian DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaThanhPho) REFERENCES VanPhongDaiDien(MaThanhPho)
);

-- 3. Bảng Khách hàng (Bảng cha)
CREATE TABLE KhachHang (
    MaKH VARCHAR(40) PRIMARY KEY,
    TenKH VARCHAR(100),
    NgayDatDauTien DATETIME,
    MaThanhPho VARCHAR(20),
    ThoiGian DATETIME DEFAULT GETDATE(),
);

-- 4. Khách du lịch (Kế thừa từ KhachHang)
CREATE TABLE KhachDuLich (
    MaKH VARCHAR(40) PRIMARY KEY,
    HuongDanVien VARCHAR(50),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- 5. Khách bưu điện (Kế thừa từ KhachHang)
CREATE TABLE KhachBuuDien (
    MaKH VARCHAR(40) PRIMARY KEY,
    DiaChiBuuDien VARCHAR(255),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- 6. Mặt hàng
CREATE TABLE MatHang (
    MaMH VARCHAR(40) PRIMARY KEY,
    MoTa VARCHAR(MAX),
    KichThuoc VARCHAR(50),
    TrongLuong FLOAT,
    ThoiGian DATETIME DEFAULT GETDATE()
);

-- 7. Tồn kho (Mặt hàng được lưu trữ)
CREATE TABLE MatHangLuuTru (
    MaCuaHang VARCHAR(40),
    MaMH VARCHAR(40),
    SoLuongTon INT,
    ThoiGian DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (MaCuaHang, MaMH),
    FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang),
    FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
);

-- 8. Đơn đặt hàng
CREATE TABLE DonDatHang (
    MaDon VARCHAR(40) PRIMARY KEY,
    NgayDat DATETIME DEFAULT GETDATE(),
    MaKH VARCHAR(40),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- 9. Chi tiết đơn hàng (Mặt hàng được đặt)
CREATE TABLE MatHangDuocDat (
    MaDon VARCHAR(40),
    MaMH VARCHAR(40),
    SoLuongDat INT,
    Gia DECIMAL(18, 2),
    ThoiGian DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (MaDon, MaMH),
    FOREIGN KEY (MaDon) REFERENCES DonDatHang(MaDon),
    FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
);