USE Northwind
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
--Khi ta SELECT ít cột từ Table gốc thì có 1 nguy cơ dữ liệu sẽ bị trùng lại
--ko phải ta bị sai, ko phải người thiết kế table và người nhập liệu sai
--Do chúng ta có nhiều info trùng nhau/đặc điểm trùng nhau, nên nếu chỉ tập trung vào cái data này
--trùng  nhau chắc chắn xảy ra
--100 triệu người dân VN được quản lí info bao gồm: ID, Tên, DOB,.... Tỉnh thành sinh sống
--													<>							63 tỉnh
--													<>							63 tỉnh
--LỆNH SELECT HỖ TRỢ LOẠI TRỪ DÒNG TRÙNG NHAU/TRÙNG 100%
--SELECT DISTINCT TÊN-CÁC- CỘT FROM <TÊN-TABLE>
----------------------------------------------------------

--1.Liệt kê danh sách sinh viên
SELECT * FROM Employees
--Phân tích: 9 người nhưng chỉ có 4 title --- 100tr dân VN chỉ 63 tỉnh
SELECT TitleOfCourtesy FROM Employees --9 DANH XƯNG
SELECT DISTINCT TitleOfCourtesy FROM Employees --CHỈ LÀ 4 

SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees 
--NẾU DISTINCT ĐI KÈM VỚI ID/KEY, NÓ VÔ DỤNG, KEY SAO TRÙNG MÀ LOẠI TRỪ

--2.In ra thông tin khách hàng
SELECT * FROM Customers --92 ROWS

--3. Có bao nhiêu quốc gia xuất hiện trong thông tin k/h, in ra
SELECT DISTINCT Country FROM Customers --22 rows

SELECT  Country FROM Customers --92 rows




