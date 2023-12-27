--BTTH: THIẾT KẾ CSDL, TABLE(S) ĐC DANH BẠ ĐIỆN THOẠI TRONG MÁY CỦA BẠN
-- Tìm object có đặc điểm đi kèm
--		Person -> name:
--					số phone:
--					Title:
--Gom thành 1 table, đặc điểm biến thành cột, đừng lo có cần nhiều table hay ko, từ từ

--Đánh giá thực tế có ổn không???? ổn khi thêm khi xóa, cập nhật data - ĐIỀU GÌ BỊ KÌ LẠ, DỊ THƯỜNG, BẤT THƯỜNG KHI CREATE/UPDATE/DELETE TRÊN TABLE, - ANOMALIES/ANOMALY

--ỔN ko khi ta truy vấn SELECT
CREATE DATABASE DBDESIGN_PHONEBOOK

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV1
(
	Nick nvarchar(30),
	Phone varchar(50),

)		--3 số phone gom vào 1 cột

SELECT * FROM PhoneBookV1
INSERT INTO PhoneBookV1 VALUES(N'Thuanpr', '090x')
--An có 2 số phone, làm sao lưu??
INSERT INTO PhoneBookV1 VALUES(N'annguyen', '090x, 091x')

--Bình có 3 số phone, làm sao lưu? mày ko thấy tao để độ rộng 
--phone 50 à
INSERT INTO PhoneBookV1 VALUES(N'Binhle','090x ; 091x ; 092x ')

--*****PHÂN TÍCH:
-->>>>> ƯU ĐIỂM: SELECT PHONE LÀ RA ĐC TẤT CẢ CÁC SỐ DI ĐỘNG

-->>>> Cho tui biết số để bàn, ở nhà của anh binhle?? toang
-->>>> Đáp án: quy ước số đầu tiên là để bàn, số 2 là di động, 3 work
-->>>> khốn nạn vì quy ước ngầm, số nào là loại nào!!! khó nhớ cho ngườ nhập liệu
-- >>>>> In cho tôi số di động của tất cả mọi người??

INSERT INTO PhoneBookV1 VALUES(N'Binhle','090x | 091x | 092x ')
INSERT INTO PhoneBookV1 VALUES(N'Binhle','090x , 091x , 092x ')
INSERT INTO PhoneBookV1 VALUES(N'Binhle','090x-091x - 092x ')
-- >>>> tiêu chí cắt chuỗi - DELIMITER DẤU PHÂN CÁCH KO NHẤT QUÁN
--	>>>>> quy ước ngầm về nhập dấu phân cách

-- đếm xem mỗi người có bao nhiêu số phone!! COUNT() QUÁ QUEN
--dấu phân cách khó khăn cho cắt để count!!!

--KHÓ KHĂN XẢY RA KHI TA GOM NHIỀU VALUE VÀO CÙNG 1 KIỂU NGỮ NGHĨA VÀO 
--TRONG 1 COLUMN (Cột Phone lưu nhiều số phone cách nhau dấu cách)
--gây khó khăn cho nhập dữ liệu (ko nhất quán dấu cách), khi select
--count() thống kê theo tiêu chí (ín số phone ở nhà)
--update thêm phone mới, xóa số củ,

--MỘT CELL MÀ CHỨA NHIỀU VALUE CÙNG KIỂU, ĐC GỌI LÀ ĐA TRỊ
--MULTI-VALUED COLUMN -> TIỀM ẨN NHIỀU KHÓ KHĂN CHO VIỆC XỬ LÍ DATA

--NẾU 1 TABLE CÓ CỘT ĐA TRỊ NGƯỜI TA NÓI RẰNG NÓ ÉO LÀ DẠNG ĐẠT CHUẨN 1
--LEVEL THIẾT KẾ CHÁN QUÁ - 1ST NỎMALIZATION

--CHUẨN 1, CHẤT LƯỢNG THIẾT KẾ TÍNH TỪ 1, 2, 3,...

--THIẾT KẾ KÉM THÌ PAHIR NÂNG CẤP, KO CHƠI ĐA TRỊ NỮA!!!
--KO CHƠI GOM VALUE TRONG 1 CELL
--2 CHIẾN LƯỢC FIX
--CHIỀU NGANG (thêm cột), CHIỀU DỌC(thêm dòng!!!)****

