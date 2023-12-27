--Mỗi giảng viên có thể có tổ cvhwucxs nhiều seminar/buổi phụ đạo khác nhau và mỗi seminar/buổi phụ đạo chỉ do một giảng viên phụ trách
--thông tin lưu trữ bao gồm: 
		--mã sdoos giảng viên, tên giảng viên, email, phone, bộ môn (SE, CF, ÍT, Incuuubator,...), 
		--ngày giwof seminar/phụ đao, loại hình tổ chức( seminar, phuuj đạo), chủ đề, otms tắt nọi dung, 
		--phòng học( nếu tiến hành offline), online-link (nếu tiến hành online), sĩ số dự kiến

--CHIẾN LƯỢC: GOM 1 BẢNG
--XEM: ĐA TRỊ, COMPOSITE, LOOKUP, LẶP LẠI TRÊN 1 NHÓM CỘT 
--		TÁCH THÊM DÒNG TỐT HƠN THÊM CỘT (KHI CẦN THÊM DATA)

CREATE DATABASE DBDESIGN_ACTIVITIES
USE DBDESIGN_ACTIVITIES

CREATE TABLE ACTIVITY_V1
(
	LecturerID char(8),
	LecName nvarchar(30),    --composite, tách nếu mún sort
	Email varchar(50),
	Phone char(11),
	Major varchar(30),
	StartDate datetime,   --lưu cả ngày giờ
	ActtType nvarchar(30),  --workshop, seminar, phụ đạo
	Topic nvarchar(30),	--Giới thiệu về Array List
	Intro nvarchar(250),
	Room nvarchar(50),	--lưu hyperLink của Zoom, Meet, phòng 
	Seats int
)

SELECT * FROM ACTIVITY_V1
INSERT INTO ACTIVITY_V1
	VALUES('00000001', N'HÒA.ĐNT', 'hoadnt@', '090x', 'CF', '2021-11-3'
				, 'seminar', N'Nhập môn Machine Learning', N'....', N'Phòng Seminar Thư viện ĐH UTE Tphcm', 100)

INSERT INTO ACTIVITY_V1
	VALUES('00000001', N'HÒA.ĐNT', 'hoadnt@', '090x', 'CF', '2021-11-3'
				, 'seminar', N'Giới thiệu về YOLO V4', N'....', N'Phòng Seminar Thư viện ĐH UTE Tphcm', 100)

				
INSERT INTO ACTIVITY_V1
	VALUES('00000001', N'HÒA.ĐNT', 'hoadnt@', '090x', 'CF', '2021-12-3 08:00:00'
				, 'Worrkshop', N'Giới thiệu về YOLO V4 (part 12', N'....', N'Phòng Seminar Thư viện  UTEHCM', 100)


--ƯU ĐIỂM & NHƯỢC ĐIỂM
CREATE TABLE LECTURER_V2
(
	LecturerID char(8) PRIMARY KEY,
	LecName nvarchar(30),    --composite, tách nếu mún sort
	Email varchar(50),
	Phone char(11),
	Major varchar(30)
)

CREATE TABLE ACTIVITY_V2
(
	SEQ int IDENTITY PRIMARY KEY,
	StartDate datetime,   --lưu cả ngày giờ
	ActtType nvarchar(30),  --workshop, seminar, phụ đạo, COI CHỪNG GÕ WORRKSHOP ko ai cấm gõ TRAINING
							--mùi của LOOKUP 
	Topic nvarchar(30),	--Giới thiệu về Array List
	Intro nvarchar(250),
	Room nvarchar(50),	--lưu hyperLink của Zoom, Meet, phòng 
	Seats int,
	LecturerID char(8) REFERENCES LECTURER_V2(LecturerID)
)
SELECT * FROM LECTURER_V2
SELECT * FROM ACTIVITY_V2
INSERT INTO LECTURER_V2
	VALUES('00000001', N'HÒA.ĐNT', 'hoadnt@', '090x', 'CF')

INSERT INTO ACTIVITY_V2
	VALUES( '2021-11-3 08:30:00 '
				, 'seminar', N'Nhập môn Machine Learning', N'....', N'Phòng Seminar Thư viện ĐH UTE Tphcm', 100, '00000001')

INSERT INTO ACTIVITY_V2
	VALUES('2021-11-3 14:30:00'
				, 'seminar', N'Giới thiệu về YOLO V4', N'....', N'Phòng Seminar Thư viện ĐH UTE Tphcm', 100, '00000001')

				
INSERT INTO ACTIVITY_V2
	VALUES('2021-12-3 08:00:00'
				, 'Worrkshop', N'Giới thiệu về YOLO V4 (part 12', N'....', N'Phòng Seminar Thư viện  UTEHCM', 100, '00000001')
