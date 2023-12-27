

USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30),		--ngoài cột này bị lặp lại, mình còn cần thêm cột
							--fullname, tên cty, chức vụ
	--.....CompanyName.....
	Phone char(11),	--chỉ 1 số phone hoy, CẦN GIẢI NGHĨA THÊM SỐ NÀY LÀ SỐ GÌ
	PhoneType nvarchar(20) --090x, Home, 091x work 
)	
-------------------------------------------------------
--TÁCH BẢNG
--KHỐN NẠN, INFO BỊ PHÂN MẢNH, NẰM NHIỀU NƠI, PHẢI JOIN RỒI
--NHẬP DATA COI CHỪNG BỊ VÊNH, XÓA DATA COI CHỪNG LẠC TRÔI, 
--PHÂN MẢNH PHẢI CÓ LÚC TÁI NHẬP (JOIN ) JOIN TRÊN CỘT MẸ NÀO??
--FK PHẢI XUẤT HIỆN!!
--hg thích chơi fk đc ko??? đc và ko đc
--nếu chỉ cần join éo cần fk, cootj = value, khớp lệnh là join, nối bảng, ghép ngang
--nếu kèm theo xóa, sửa, thêm, chết mẹ, lộn xộn ko nhất quán

CREATE TABLE Person4_1
(
		Nick nvarchar(30),		--ngoài cột này bị lặp lại, mình còn cần thêm cột
							--fullname, tên cty, chức vụ
		Title nvarchar(50),
		Company nvarchar(40)
)

CREATE TABLE PhoneBookV4_1
(
	Phone char(11),	--chỉ 1 số phone hoy, CẦN GIẢI NGHĨA THÊM SỐ NÀY LÀ SỐ GÌ
	PhoneType nvarchar(20), --090x, Home, 091x work 
	Nick nvarchar(30) --éo cần fk, chỉ cần join vẫn oki
)
 

INSERT INTO Person4_1 VALUES(N'Thuanpr' , 'Lecture', 'fptu hcmc')
INSERT INTO Person4_1 VALUES(N'annguyen' , 'Student', 'ute hcmc')
INSERT INTO Person4_1 VALUES(N'Binhle' , 'Student', 'thuan hcmc')

INSERT INTO PhoneBookV4_1 VALUES('090x', 'CELL', N'Thuanpr')

INSERT INTO PhoneBookV4_1 VALUES('090x', 'CELL', N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES('091x', 'HOME', N'annguyen')

INSERT INTO PhoneBookV4_1 VALUES('090x','WORK',N'Binhle')
INSERT INTO PhoneBookV4_1 VALUES('091','CELL',N'Binhle')
INSERT INTO PhoneBookV4_1 VALUES('092x','CELL',N'Binhle')

-->>>>> ƯU ĐIỂM: SELECT PHONE LÀ RA ĐC TẤT CẢ CÁC SỐ DI ĐỘNG

--> Thống kê số lượng điện thoại mỗi người xài, mấy sim??? NGON
--> ko bị NULL, muốn thêm bao nhiêu phone thì thêm!!!
SELECT Nick, COUNT(*) AS [No Phones] FROM PhoneBookV3_1
					GROUP BY (Nick)
SELECT Nick, CellPhone FROM PhoneBookV2

SELECT p.Nick, p.CellPhone FROM PhoneBookV2 p

SELECT p.Nick,p.homePhone, p.CellPhone FROM PhoneBookV2 p
							WHERE p.Nick = 'Binhle'
-- >>> NHƯỢC ĐIỂM
-- Cho tôi biết các số di động của mọi người
--> KO biết số phone x nào đó thuộc loại nào!!!
-->>>> Cho tui biết số để bàn, ở nhà của anh binhle?? 
-- >>>>> In cho tôi số di động của tất cả mọi người??

--Vi phạm PK, redundancy, thuanpro lặp lại nhiều lần làm gì khi thuanpro mới lưu nick
--fullname, title, tên cty, email,...


-->	Data bị NULL, phí ko gian lưu trữ

-->TRIÊT LÍ THIẾT KẾ: CỐ GẮNG GIỮ NGUYÊN CÁI TỦ, CHỈ THÊM ĐỒ,
--					KO THÊM CỘT CỦA TABLE, CHỈ CẦN THÊM DÒNG NẾU CÓ BIẾN ĐỘNG SỐ LƯỢNG
--TRÁNH BỊ REDUNDANCY, PK , -> TÁCH BẢNG, PHẦN LẶP LẠI RA 1 CHỖ KHÁC
--------------------------------------------
--TA CẦN GIẢI QUYẾT PHONE NÀY THUỘC LOẠI NÀO



--PHÂN TÍCH:
--ƯU ĐIỂM:
--Count ngon, group by theo nick, theo loại phone
--where theo loại phone ngon
--Redundancy trên info của nick/full/cty/email/năm sinh....giải quyết xong ở bảng person
SELECT * FROM PhoneBookV3_2 WHERE PhoneType = 'CELL'
--*NHƯỢC ĐIỂM: 
--tính ko nhất quán (inconsistency ) của loại phone: có người gõ: cell, CELL, cell éo sợ vì cùng 1 kiểu
--																gõ thêm: Di động, DĐ -> cả đám này đêò là 1 theo logic
--																máy hiểu khác nhau
--query liệt kê các số di động của tất cả mọi người, toang khi WHERE
--vì éo biết đc có bao nhiêu loại chữ biểu diễn cho DI ĐỘNG
INSERT INTO PhoneBookV4_1 VALUES('093x','MOBILE',N'Binhle')
INSERT INTO PhoneBookV4_1 VALUES('094x','Sugar dady',N'Binhle')

SELECT * FROM Person4_1
SELECT * FROM PhoneBookV4_1

--SQL. Liệt kê các số di động của Binhle
SELECT * FROM PhoneBookV4_1
			WHERE PhoneType = 'CELL' OR PhoneType = 'cell' OR PhoneType = 'DĐ'
SELECT * FROM PhoneBookV4_1
			WHERE IN('CELL','cell','DĐ')
			--mày tính IN cái tập hợp này đến bao giờ khi người ta còn gõ từ khác 
			--cùng biểu diễn khái niệm di động 
			--nhập tự do ko tốt, dù biết rằng chỉ có hữu hạn cái loại số phone
			--để tránh bị inconsistency, ko cho nhập lộn xộn khi ta biết nó chỉ có vài loại, ta sẽ THỐNG NHẤT, KO CHO NHẬP MÀ CHO CHỌN..(tạo cửa sổ sổ ra các lựa chọn)-dropdown box - combo box
			--QUY TẮC THÊM: CÓ NHỮNG LOẠI DỮ LIỆU BIẾT TRƯỚC LÀ NHIỀU, NHƯNG HỮU HẠN CÁI VALUE NHẬP
			--TỈNH THÀNH NHIỀU, CHỈ 63, QUỐC GIA NHIỀU 230, CHÂU LỤC NHIỀU 56, TRƯỜNG THPT, 500 TRƯỜNG
			--CÓ NÊN CHO NGƯỜI TA GÕ TAY HAY KO, KO, VÌ NÓ SẼ GÂY NÊN KO NHẤT QUÁN!!!
			--TỐT NHẤT CHO CHỌN, CHỌN PHẢI TỪ CÁI CÓ SẴN, SẴN, SẴN TỨC LÀ TỪ TABLE KHÁC

			--KO CHO GÕ LUNG TUNG, GÕ TRONG CÁI ĐÃ CÓ - DÍNH 2 THỨ, TABLE KHÁC (ĐÃ NÓI TRÊN)
			--						FK ĐỂ ĐẢM BẢO CHỌN ĐÚNG TRONG ĐÓ HOI
