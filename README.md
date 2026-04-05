

## 🚀 Hướng dẫn sử dụng

### 1. Chuẩn bị môi trường

#### 1.1 Cài đặt dependencies

```bash
pip install -r requirements.txt
```

Hoặc cài đặt thủ công:

```bash
pip install pandas sqlalchemy python-dotenv faker pyodbc
```

#### 1.2 Cấu hình kết nối SQL Server

Tạo file `.env` trong thư mục project:

```env
DB_USER=your_username
DB_PASSWORD=your_password
DB_HOST=your_server_name
DB_NAME=Data_Warehouse
```

**Lưu ý**: 
- Đảm bảo đã cài đặt **ODBC Driver 17 for SQL Server** trên máy
- Kiểm tra tên server và xác thực được SQL Server trước khi chạy

#### 1.3 Tạo Database và Schema

Chạy script SQL sau trên SQL Server (xem file `schema.sql` hoặc copy từ phần SQL ở trên):

```sql
CREATE DATABASE Data_Warehouse;
GO
USE Data_Warehouse;
GO

-- Tạo các bảng (chi tiết trong file SQL tương ứng)
CREATE TABLE VanPhongDaiDien (
    MaThanhPho VARCHAR(20) PRIMARY KEY,
    ...
);
-- ... các bảng khác
```

## 🛠️ Công nghệ sử dụng

- **Python 3.12+**
- **Pandas**: Xử lý dữ liệu
- **SQLAlchemy**: ORM kết nối SQL Server
- **python-dotenv**: Quản lý biến môi trường
- **Faker**: Tạo dữ liệu giả
- **SQL Server 2019+**

## 📊 Dữ liệu

- **Dataset**: Olist E-commerce (Brazilian) : https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
- **Bản ghi**: ~100K khách hàng, ~100K đơn hàng, ~32K sản phẩm
- **Format**: CSV



