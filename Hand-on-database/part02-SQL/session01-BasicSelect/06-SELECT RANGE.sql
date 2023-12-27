USE Northwind

------------------------------------------------------------
---LÍ THUYẾT
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
--KHI BẠN CẦN LỌC DỮ LIÊU TỎNG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >=.... AND <=..., TA CÓ THỂ THAY THẾ 
--BẰNG MỆNH ĐỀ BETWEEN, IN
--*Cú pháp: CỘT BETWEEN VALUE-1 AND VALUE-2
--									>>>> BETWEEN THAY THẾ CHO 2 MỆNH ĐỀ  >= <= AND
--*Cú pháp: CỘT IN (MỘT tập các giá trị cách nhau dấu phẩy)
--									>>IN THAY THẾ CHO 1 LOẠT OR
------------------------------------------------------------
--1.Liệt kê danh sách sinh viên sinh trong đoạn năm [1960 1970]
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 ORDER BY BirthDate DESC --4

--2. Liệt kê các đơn hàng có trọng lượng từ 100-500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500

--3.Liệt kê các đơn hàng gửi tới Anh, Pháp, Mĩ
SELECT * FROM Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France'
SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'France', 'UK') --255	

--4.Liệt kê các đơn hàng không gửi tới Anh, Pháp, Mĩ
SELECT * FROM Orders WHERE NOT (ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France')
SELECT * FROM Orders WHERE ShipCountry NOT IN ('USA', 'France', 'UK') 

--5. Liệt kê các đơn hàng trong năm 1996 loại trừ các tháng 6 7 8 9
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6,7,8,9)

--LƯU Ý IN: CHỈ KHI TA LIỆT KÊ ĐC TẬP GIÁ TRỊ THÌ MỚI CHƠI IN 
--KHOẢNG SỐ THỰC THÌ KO LÀM ĐC

--6. Liệt kê các đơn hàng có trọng lượng từ 1000...110
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 110 ORDER BY Freight DESC
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 110 ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight IN () ---100...110 VÔ SỐ GIÁ TRỊ THỰC