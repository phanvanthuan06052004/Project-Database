USE Northwind

---LÍ THUYẾT
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- MỆNH ĐỀ WHERE: DÙNG LÀM BỘ LỌC/FILTER/NHẶT RA NHỮNG DỮ LIỆU TA CẦN THEO 1 TIÊU CHÍ NÀO ĐÓ 
--VÍ DỤ: Lọc ra những sv có quê hương ở Bình Dương
--		Lọc ra những sv có quê ở Tiền Giang và điểm Tb >= 8 

--CÚ PHÁP DÙNG BỘ LỌC
--SELECT * (cột bạn muốn in ra) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
--* ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI-CỘT CÓ GIÁ TRỊ CẦN LỌC
--					LỌC THEO TÊN CỘT VỚI VALUE THẾ NÀO, LẤY TÊN CỘT, XEM VALUE TRONG CELL
--					CÓ THỎA ĐIỀU KIỆN LỌC HAY KHÔNG?
--ĐỂ VIẾT ĐK LỌC TA CẦN
-- >  tên cột
--	  value của cột (cell)
--	  toán tử (operator) > >= < <= = (một dấu = hoy, ko giống C Java ==), !=, <> (!= hoặc <> cùng 1 nghĩa)
--		nhiều đk lọc đi kèm, dùng thêm logic operators, AND, OR, NOT (trong J, C: && || !)
--VÍ DỤ:	WHERE City = N'Bình Dương'
--			WHERE City = N'Tiền Giang' AND Gpa >= 8
--LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM ĐẾN DATA TYPES
--Số: nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14, 9.8
--Chuỗi/kí tự: 'A', 'ahii'
--Ngày tháng: '2003-01-01 ...'

----------------------------------------------------------
-- THỰC HÀNH
--1. In ra danh sách các khách hàng
SELECT * FROM Customers --92 ROW

--2. In ra dnah sách kh đền từ Ý
SELECT * FROM Customers WHERE Country = 'Italy' --3  

--3. In ra danh sách khách hàng đến từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA' --13

--4. In ra kiểu khách hàng đến từ Mĩ, Ý
--đời thường có thể nói: những k/h đến từ Ý và Mĩ, Ý hoặc Mĩ
--SELECT * FROM Customers WHERE Country = 'Italy'  AND 'USA' --ERROR, thiếu toan tử
SELECT * FROM Customers WHERE Country = 'USA' AND Country = 'Italy' --0
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' --hiểu nghĩa logic, hơn hơn tiếng việt

--sort theo ý, Mĩ, để gom cùng cụm cho dễ theo dõi

SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country

--5.In ra khách hàng đến từ thủ đô nước Đức
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' --1

--6. In ra các thông tin cảu nhân viên
SELECT * FROM Employees

--7.In ra thông tin nhân viên có năm sinh từ 1990 trở lại gần đây/ dổ lại
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 --4/9

--8.In ra thông tin của nhân viên có tuổi từ 60 trở lên
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age ,* FROM Employees WHERE YEAR(GETDATE()) - YEAR(BirthDate) >= 60 --8/9

--9. Những nhân viên nào ở Luân Đôn
SELECT * FROM Employees WHERE City = 'London' 

--10.Những nhân viên nào ko ở London
SELECT * FROM Employees WHERE City != 'London' 
SELECT * FROM Employees WHERE City <> 'London' 
--vi diệu
--ĐẢO MỆNH ĐỀ!!!
SELECT * FROM Employees WHERE NOT (City = 'London')
--SELECT * FROM Employees WHERE  !(City = 'London') --SAI CÚ PHÁP, ĐẢO MỆNH ĐỀ, PHÉP SS THÌ DÙNG NOT

--11. In ra hồ sơ nhân viên có mã số là 1
--đi vào ngân hàng để giao dịch, hoặc đưa stk, kèm cmnd, filter theo cmnd
SELECT * FROM Employees WHERE EmployeeID = 1 --kiểu số, hg có '', chơi như lập trình
--WHERE TRÊN KEY CHỈ RA 1 MÀ THÔI 
--SELECT MÀ CÓ WHERE KEY CHỎ 1 DÒNG TRẢ VỀ DISITNCT LÀ VÔ NGHĨA

SELECT DISTINCT EmployeeID, City FROM Employees WHERE EmployeeID = 1 ORDER BY EmployeeID

--CÔNG THỨC FULL KO CHE CỦA SELECT
-- SELECT....		FROM....		WHERE...GROUP BY....HAVING...ORDER BY
--		DISTINCE		1,N TABLE
--		HÀM()
--		NESTED QUERY/ SUB QUERY 

--12. xem thông tin của bên đơn hàng
SELECT * FROM Orders --830

--13. Xem thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng
SELECT * FROM Orders ORDER BY Freight DESC 

--14. In thông tin bên Đơn hàng sắp xếp giảm dần theo trọng lượng, tọng lượng >= 500kg
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC --13

--15. In ra thông tin Đơn hàng săp xếp giam dần theo trọng lượng, trọng lượng năm trong khoảng từ 100 đến 500
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 ORDER BY ShipVia 

--16.In ra thông tin Đơn hàng săp xếp giảm dần theo trọng lượng, trọng lượng năm trong khoảng từ 100 đến 500 và ship bởi cty giao vận số 1
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 

--16. và không ship tới London
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND ShipCity <> 'London'
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND NOT (ShipCity = 'London')

--RẤT RẤT CẨN THẬN KHI TRONG MỆNH ĐỀ WHERE LẠI CÓ AND OR TRỘN VỚI NHAU, TA PHẢI SÀI THÊM ()
--ĐỂ PHÂN TÁCH THỨ TỰ FILTER.... (SS AND OR KHÁC NỮA) AND (SS KHÁC)

--17. Liệt kê danh sách kh đến từ Mỹ hoặc Mexico
SELECT * FROM Customers WHERE Country = 'USA' OR COUNTRY = 'Mexico'

--18. Liệt kê danh sách kh không đến từ Mỹ hoặc Mexico
SELECT * FROM Customers WHERE NOT (Country = 'USA' OR Country = 'Mexico') --73
SELECT * FROM Customers WHERE Country <> 'USA' AND Country != 'Mexico' --73

--19. Liệt kê các nhân viên sinh ra trong đoạn [1960 1970]
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC --4
