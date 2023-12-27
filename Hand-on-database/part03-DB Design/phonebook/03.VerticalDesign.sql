--BTTH: THIẾT KẾ CSDL, TABLE(S) ĐC DANH BẠ ĐIỆN THOẠI TRONG MÁY CỦA BẠN
-- Tìm object có đặc điểm đi kèm
--		Person -> name:
--					số phone:
--					Title:
--Gom thành 1 table, đặc điểm biến thành cột, đừng lo có cần nhiều table hay ko, từ từ

--Đánh giá thực tế có ổn không???? ổn khi thêm khi xóa, cập nhật data - ĐIỀU GÌ BỊ KÌ LẠ, DỊ THƯỜNG, BẤT THƯỜNG KHI CREATE/UPDATE/DELETE TRÊN TABLE, - ANOMALIES/ANOMALY

--ỔN ko khi ta truy vấn SELECT

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV2
(
	Nick nvarchar(30),
	--Phone varchar(50),	--cấm đa trị, cấm gộp nhiều số phone tring 1 cell
	Phone1 char(11),	--chỉ 1 số phone hoy
	Phone2 char(11),
	Phone3 char(11)	--éo biết cột nào là loại nào, 1,2,3 vô hồn
)	

CREATE TABLE PhoneBookV2
(
	Nick nvarchar(30),
	--Phone varchar(50),	--cấm đa trị, cấm gộp nhiều số phone tring 1 cell
	HomePhone char(11),	--chỉ 1 số phone hoy
	WorkPhone char(11),
	CellPhone char(11)	
)
--MỞ RỘNG TABLE THEO CHIỀU NGANG - THÊM CỘT !!!

SELECT * FROM PhoneBookV2
INSERT INTO PhoneBookV2 VALUES(N'Thuanpr', NULL, NULL, '090x')
--An có 2 số phone, làm sao lưu??
INSERT INTO PhoneBookV2 VALUES(N'annguyen', '090x', '091x', NULL)

--Bình có 3 số phone, làm sao lưu? mày ko thấy tao để độ rộng 
--phone 50 à
INSERT INTO PhoneBookV2 VALUES(N'Binhle','090x' , '091x' , '092x ')

--*****PHÂN TÍCH:
-->>>>> ƯU ĐIỂM: SELECT PHONE LÀ RA ĐC TẤT CẢ CÁC SỐ DI ĐỘNG
--1.SQL. Cho tôi biết các số di động của mọi người
SELECT Nick, CellPhone FROM PhoneBookV2
SELECT p.Nick, p.CellPhone FROM PhoneBookV2 p
-->>>> Cho tui biết số để bàn, ở nhà của anh binhle?? 
SELECT p.Nick,p.homePhone, p.CellPhone FROM PhoneBookV2 p WHERE p.Nick = 'Binhle'
-- >>> NHƯỢC ĐIỂM
--> Thống kê số lượng điện thoại mỗi người xài, mấy sim??? ko trả lời đc
-->	Data bị NULL, phí ko gian lưu trữ
--> NGƯỜI CÓ 4 PHONE, 5 PHONE THÌ SAO???
--> solution: thêm cột, càng thêm cột trừ hao về người có nhiều phone
-->				những người còn lại bị null càng nhiều
-->PHÍ VÌ CHỈ 1 VÀI NGƯỜI ĐẶC BIỆT NHIỀU PHONE MÀ TẤT CẢ ANH EM KHÁC ĐỀU ĐC
--> XEM CHUNG LÀ NHIỀU SỐ PHONE, PHÍ KO GIAN LƯU TRỮ
--> GIẢ SỬ VẪN QUYẾT TÂM THEO CỘT, NỞ RA CỘT, THÌ GIÁ PHẢI TRẢ SỬA CODE LẬP TRÌNH
--> SAU NÀY, VÌ TÊN CỘT MỚI ĐC THÊM VÔ KHI NÂNG CẤP APP, SỬA THÊM CÂU QUERY

-->TRIÊT LÍ THIẾT KẾ: CỐ GẮNG GIỮ NGUYÊN CÁI TỦ, CHỈ THÊM ĐỒ,
--					KO THÊM CỘT CỦA TABLE, CHỈ CẦN THÊM DÒNG NẾU CÓ BIẾN ĐỘNG SỐ LƯỢNG
--
-->> PHIÊN BẢN 3 - PHIÊN BẢN NGON BẮT ĐẦU, AI NHIỀU PHONE THÌ NHIỀU DÒNG, NHIỀU 
--> CELL THEO CHIỀU DỌC THÊM DỌC
-->COUNT NGON LÀNH LUÔN, TRẢ LỜI ĐC NGAY ĐC CÂU BAO NHIÊU SIM BAO NHIÊU SÓNG

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

