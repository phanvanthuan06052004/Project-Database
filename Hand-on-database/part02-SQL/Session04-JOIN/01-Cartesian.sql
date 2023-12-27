USE Cartesian
CREATE DATABASE Cartesian
--DB ~~ KHO~~ TỦ`~~ THÙNG CHỨA DATA BÊN TRONG 
--DATA BÊN TRONG CẤT DƯỚI DẠNG KỆ CÓ NGĂN - TABLE

CREATE TABLE EnDict				--DDL (1 nhánh của SQL)
(								--Data Defination Language
	Nmbr int,
	EnDesc Varchar(30)
)
--DROP TABLE EnDict			--DDL
--từ điển tiếng anh số đếm
--1 One 
--2 Two
--CHÈN DATA
SELECT * FROM EnDict			--DML DATA MANIPULATION LANGUAGE

INSERT INTO EnDict VALUES(1, 'One')
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')

--PHẦN NÀY THÊM CHO OUTER JOIN
INSERT INTO EnDict VALUES(4, 'Four')
CREATE TABLE VnDict				--DDL (1 nhánh của SQL)
(								--Data Defination Language
	Nmbr int,					
	VnDesc NVarchar(30)			--nvarchar() String lưu tiếng Việt
)								--varchar() String lưu tiếng Anh

INSERT INTO VnDict VALUES(1, N'Một')
INSERT INTO VnDict VALUES(2, N'Hai')
INSERT INTO VnDict VALUES(3, N'Ba')
INSERT INTO VnDict VALUES(5, N'Năm')
SELECT * FROM EnDict		
SELECT * FROM VnDict
--BÔI ĐEN CẢ 2 LỆNH NÀY CHẠY, THÌ NÓ KO PAHIR LÀ JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY
--CÙNG LÚC, CHO 2 TẬP KẾT QUẢ RIÊNG BIỆT!!
--JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KO ẢNH HƯỞNG DỮ LIỆU GỐC CẢU MỖI 
--TABLE
--JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE

SELECT * FROM VnDict, EnDict	--sinh table mới, tạm thời lúc chạy hoy
								-- số cột = tổng 2 bên
								--số dòng = tích 2 bên

SELECT * FROM VnDict, EnDict ORDER BY EnDict
SELECT * FROM VnDict, EnDict ORDER BY Nmbr
--GHÉP TABLE, JOIN BỊ TRÙNG TÊN CỘT, DÙNG ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIEUS 
--														CHỈ ĐỊNH CỘT THUỘC TABLE TRÁNH NHẦM
SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr --THAM CHIẾU CỘT THÔNG QUA TABLE
SELECT * FROM VnDict vn, EnDict en ORDER BY en.Nmbr --đặt tên ngắn/giả cho table
													--dùng tham chiếu cho các cột
SELECT vn.Nmbr, vn.VnDesc, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr

SELECT vn.*, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr

SELECT vn.*, en.* FROM VnDict vn, EnDict en ORDER BY en.Nmbr

--CÚ PHÁP VIẾT THỨ 2
SELECT vn.*, en.* FROM VnDict vn CROSS JOIN EnDict en ORDER BY en.Nmbr

--TUI BIẾT RẰNG CÓ CẶP GHÉP XÀI ĐƯỢC, VÌ CÓ TRƯỜNG HỢP TRONG CELL NÀO ĐÓ, HERE NMBR
SELECT * FROM VnDict vn, EnDict en 
			WHERE vn.Nmbr = en.Nmbr	--rút từ 3x3 = 9 xuống còn 3
			--GHÉP CÓ CHỌN LỌC KHI TÌM TƯƠNG QUAN CỘT/CELL ĐỂ GHÉP -> INNER JOIN/OUTER
											--EQUI JOIN
											--ĐA PHẦN THƯỜNG GHÉP THEO TOÁN TỬ =
											--CÒN CÓ THỂ GHÉP THEO > >= < <= !=
