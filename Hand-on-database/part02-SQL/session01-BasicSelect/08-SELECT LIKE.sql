﻿USE Northwind

------------------------------------------------------------
---LÍ THUYẾT
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
--Trong thực tế có những lúc ta muốn tìm  dữ liệu/filter theo kiểu gần đúng 
--gần đúng trên kiểu chuỗi, ví dụ, liệt kê ai đó có tên là AN, khác câu
--Liệt kê ai đó tên bắt đầu bằng chữ A
--Tìm đúng, TOÁN TỬ ='AN'
--Tìm gần đúng, tìm có sự xuất hiện, không dùng =, DÙNG TOÁN TỬ LIKE
--								LIKE 'A...'....
--ĐỂ SỬ DỤNG TOÁN TỬ LIKE, TA CẦN THÊM 2 THỨ TRỢ GIÚP, DẤU % VÀ DẤU _
--% đại diện cho 1 chuỗi bất kì nào đó
--_ đại diện cho 1 kí tự bất kì nào đó
--VÍ DỤ: name LIKE 'A%', bất kì ai có tên xuất hiện bằng chữ A, phần còn lại là gì ko care
--		 Name LIKe 'A_', bất kì ai có tên là hai kí tự, trong đó kí tự đầu phải là A
------------------------------------------------------------

--1.In ra dnah sách nhân viên
SELECT * FROM Employees

--2.Nhân viên nào có tên bắt đầu chữ A
SELECT * FROM Employees WHERE FirstName = 'A%' --0 VÌ TOÁN TỬ SS BẰNG A%, CÓ AI TÊN A% KHÔNG
SELECT * FROM Employees WHERE FirstName LIKE 'A%' --2

--2.1 Nhân viên nào có tên bắt đầu chữ A, in ra cả fulllname được ghép đầy đủ

SELECT EmployeeID, FirstName + ' ' + LastName AS FULLNAME, Title  FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FULLNAME, Title  FROM Employees WHERE FirstName LIKE 'A%'

--3. Nhân viên nào có chữ A cuối cùng
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FULLNAME, Title  FROM Employees WHERE FirstName LIKE '%A'

--4.Nhân viên nào tên có 4 kí tự
--Dùng hàm ktr độ dài tên = 4 hay ko 
SELECT * FROM Employees WHERE FirstName LIKE '____' --1

--5. Xem dnah sách các sản phẩm/ món đồ đang có - product
SELECT * FROM Products --77

--6. Những sản phẩm có tên bắt đầu bằng CH
SELECT * FROM Products WHERE ProductName LIKE 'Ch%' --6

SELECT * FROM Products WHERE ProductName LIKE '%Ch%' --14
--trong tên có từ Ch, không quan tâm vị trí xh

--7. Những sản phẩm tên có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____' 

--8. Những sản phẩm trong tên sp mà từ cuối cùng là 5 kí tự
SELECT * FROM Employees WHERE ProductName LIKE '%_____'  --tên có từ 5 kí tự trở lên
SELECT * FROM Products WHERE ProductName LIKE '% _____' --tên có ít nhất 2 từ 
													--từ cuối củng 5 kí tự
													--VÔ TÌNH LOẠI ĐI THẰNG TÊN CHỈ CSO ĐÚNG 5 KÍ TỰ
													--11
SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '______'















