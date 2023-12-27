USE Northwind
-------------------------------------------------------
---LÍ THUYẾT
--Một DB là nơi chứa data (bán hàng, thư viện, qlsv,..)
--DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (nghệ thuật design db, NF)
--Dùng lệnh SELECT để xem/ in dữ liệu từ TABLE, cũng hiển thị dưới dạng table
--CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						* đại diện cho việc tui mún lấy all ò colums
--CÚ PHÁP MỞ RỘNG:
--					SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁNH-NHAU-DẤU-PHẨY FROM <TÊN-TABLE>
--					SELECT CSO THỂ DÙNG CÁC HÀM XỬU LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--					FROM <TÊN-TABLE>
--Data trả về có cell/ ô có NULL, hiểu rằng chưa xđ value/giá trị, chưa có, chưa biết
--Từ từ cập nhật sau. Ví dụ sv kí tên vào dnah sách thi, cột điểm ngay lúc kí tên 
--gọi là NULL, mang trạng thái chưa xđ
----------------------------------------------------------

--1. Xem thông tin của tất cả các khách hàng đang giao dịch với mình
SELECT * FROM Customers
--INSERT INTO Customers(CustomerID, CompanyName,ContactName) VALUE ('ALFKI','UTE University','Phan Van Thuan')
--bị chửi vì trùng PK
INSERT INTO Customers(CustomerID, CompanyName,ContactName) VALUES ('UTE','UTE University','Phan Van Thuan')
--ngon lành cành đào
--2. Xem thông tin nhân viên, xem hết các cột luôn
SELECT * FROM Employees
--3. Xem các sản phẩm có trong kho 
SELECT * FROM Products
--4. Mua hàng, thì thông tin sẽ nằm ở table order và orderDetails
SELECT * FROM Orders
--5.Xem thông tin công ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName,Phone) VALUES ('Fedex Vietnam','(084)90...')
SELECT * FROM Orders -- PHẦN TRÊN CỦA BILL SIÊU THỊ
SELECT * FROM [Order Details] --dành cho table có tên gọi riêng lẽ, PHẦN TABLE KẺ GIÓNG LỀ NHỮNG MÓN HÀNG ĐÃ MUA
--7.In ra thông tin khách hàng, chỉ gồm cột ID, ComName, ContactName, Country
SELECT CustomerID, CompanyName, ContactName, FROM Customers
--8.In ra thông tin nhân viên, chỉ cần id, Last, First, Title, DoB
--Tên người tách thành last & First: Dành cho mục tiêu Sort theo tiêu chí tên, họ. In ra
--tên theo quy ước mỗi quốc gia 
SELECT * FROM Employees
SELECT EmployeeID, LastName,FirstName, Title ,BirthDate FROM Employees
--9. In ra thông tin nhân viên, ghép tên cho đẹp/gộp cột, tính luôn tuổi
SELECT EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title ,YEAR(BirthDate) FROM Employees

SELECT EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title, YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees

--10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity FROM [Order Details] 
--CÔNG THỨC TÍNH TỔNG TIỀN PHẢI TRẢ TỪNG MÓN, CÓ TRỪ ĐI GIẢM GIÁ, PHẦN TRĂM
--SL * DG - TIỀN GIẢM GIÁ ==> PHẢI TRẢ
--SL * DG - SL * DG * DISCOUNT ==> PHẢI TRẢ
--SL * DG (1 - DISCOUNT %) ==> TIỀN PHẢI TRẢ
SELECT *, UnitPrice * Quantity * (1 - Discount) as subToTal FROM [Order Details] 