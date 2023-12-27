use QLNV1  --CHỌN ĐỂ CHƠI VỚI THÙNG CHỨA DATA NÀO ĐÓ	
			--TẠI THỜI ĐIỂM ĐỂ CHƠI VỚI 1 THÙNG CHƯA DATA
SELECT * FROM DIADIEM_PHONG
-------------------------------------------------------
---LÍ THUYẾT
--1.DBE cung cấp câu lệnh SELECT dùng để
--	inra màn hình 1 cái gì đó --printf() sout()
--	in ra dữ liệu có trong table (hàng/ cột)
----------------------------------------------------------
--1.Hôm nay là ngày bao nhiêu????
SELECT GETDATE() 

SELECT GETDATE() AS [Hôm nay là  ngày:]
--2.Bây giờ là tháng mấy???
SELECT  MONTH (GETDATE()) AS [Bây giờ tháng mấy]
SELECT  YEAR (GETDATE())
--3.Trị tuyệt đối của -5 là mấy?
SELECT ABS(-5) AS [Trị tuyệt đối của -5]
--4.5+5 là mấy???
SELECT 5+5 AS [5+5 là mấy]
--5.In ra tên của mình
SELECT N'Phan Văn Thuận' AS [ My fullname is]
SELECT N'Phan' + N'Văn Thuận' AS [ My fullname is]
--6.Tính tuổi
SELECT YEAR(GETDATE()) - 2004 
SELECT N'PHAN' + N'VĂN THUẬN' + CONVERT(VARCHAR, YEAR(GETDATE()) - 2004 ) + N'YEAR OLD'
--7.Phép nhân 2 số
SELECT 10*10 AS [10 X 10=]