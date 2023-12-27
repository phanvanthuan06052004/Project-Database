USE Northwind

------------------------------------------------------------
--LÍ THUYẾT
--	Cú pháp chuẩn của câu lệnh SELECT
-- SELECT * FROM <TABLE> WHERE...
--WHERE CỘT = VALUE NÀO ĐÓ
--WHERE CỘT LIKE PATTERN NÀO ĐÓ e.g. '____'
--WHERE CỘT BETWEEN RANGE
--WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐC LIỆT KÊ)

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 VALUE/CELL
-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 TẬP GIÁ TRỊ/CELL
--TẬP KẾT QUẢ NÀY ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN)

--*****
--WHERE CỘT = VALUE NÀO ĐÓ - đã học, e.g YEAR (DOB) = 2004
--			= THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL
-- KĨ THUẬT VIẾT CÂU SQL THEO KIỂU HỎI GIÁN TIẾP, LỒNG NHAU, TRONG 
--CÂU SQL CHỨA CÂU SQL KHÁC
------------------------------------------------------------
--THỰC HÀNH
--1.In ra danh sách nhân viên
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1 --return 1 CELL/ROW
SELECT FirstName FROM Employees -- 1 tập giá tri/ 1 cột/ phép chiếu
--2.Liệt kê các nhân viên ở London
SELECT * FROM Employees WHERE City = 'London' --4
--3.Liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees WHERE FirstName = 'Robert'

SELECT City FROM Employees WHERE FirstName = 'Robert' --1vcalue LONDON

--đáp án cho câu 3 bắt đầu
SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE FirstName = 'Robert')

--Câu này 9.9 điểm, trong kq con Robert bị dư, tìm cùng quê R
--ko cần nói lại Robert

SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE FirstName = 'Robert') AND FirstName <> 'Robert' 

--4.Liệt kê tất cả các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

--4.1 Liệt kê tất cả các đơn hàng trọng lượng lớn hơn 252kg
SELECT * FROM Orders WHERE Freight >= 252 --47

--4.2 Liệt kê các đơn hàng có trọng lượng lớn hơn trọng lượng đơn hàng 10555
SELECT * FROM Orders WHERE Freight >= 252 ???? CỦA ĐƠN HÀNG 10555

SELECT * FROM Orders WHERE Freight >= (SELECT Freight FROM Orders WHERE OrderID = '10555') --47 
																							-- Xuất hiện lun cả 10555
SELECT * FROM Orders WHERE Freight >= (SELECT Freight FROM Orders WHERE OrderID = '10555') AND OrderID != '10555' --46
--BTVN
--1.Liệt kê danh sách các công ty vận chuyển hàng
--2. Liệt kê danh sách các đơn hàng đc vận chuyển bởi công ty giao vận có mã số là 1
--3. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speed Express
--4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speedy Express và trọng lượng từ 50-100
--5.Liệt kê các mặt hàng cùng loại với  mặt hàng Filo Mix
--6. Liệt kê các nhân viên trẻ tuoir hơn nhân viên Janet
--------------------------------------------------------------
--1.Liệt kê danh sách các công ty vận chuyển hàng
SELECT * FROM Shippers
--2. Liệt kê danh sách các đơn hàng đc vận chuyển bởi công ty giao vận có mã số là 1
SELECT * FROM Orders WHERE ShipVia = 1

--3. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speed Express
SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')

--4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speedy Express và trọng lượng từ 50-100
SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express') AND Freight BETWEEN 50 AND 100 --50


SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express') AND Freight IN (50,100) --SAI, IN LÀ SO SÁNH BẰNG, THAY CHO 1 ĐỐNG OR

SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID FROM Shippers
														WHERE CompanyName = 'Speedy Express'
)
--5.Chủng loại của Filo Mix
-- Filo Mix là Sp/ mặt hàng, thuộc nhóm gì mình chưa biết
--hỏi tiếp
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Products WHERE CategoryID = (
										SELECT CategoryID FROM Products WHERE ProductName ='Filo Mix'
)

--6.Liệt kê nv trẻ hơn Janet
--TRẺ HƠN NGHĨA LÀ NĂM SINH > jANET
SELECT * FROM Employees
SELECT * FROM Employees WHERE BirthDate > (SELECT BirthDate FROM Employees WHERE FirstName = 'Janet') --1
