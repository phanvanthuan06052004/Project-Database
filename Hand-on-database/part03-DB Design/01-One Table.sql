CREATE DATABASE DBDESIGN_ONETABLE
--CREATE DÙNG ĐỂ TẠO CẤU TRÚC LƯU TRỮ/ DÀN KHUNG/ THÙNG CHỨA DÙNG LƯU TRỮ DATA/INFO
--TƯƠNG ĐƯƠNG VIỆC XÂY PHÒNG CHỨA ĐỒ - DATABASE
--						MUA TỦ ĐỂ TRONG PHÒNG - TABLE
--1 DB CHỨA NHIỀU TABLE - 1 PHÒNG CÓ NHIỀU TỦ
--							1 NHÀ CÓ NHIỀU PHÒNG
--TẠO RA CẤU TRÚC LƯU TRỮ - CHƯA NÓI DATA BỎ VÀO - DDL (PHÂN NHÁNH CỦA SQL)


USE DBDESIGN_ONETABLE

--Tạo table luue trữ hồ sơ sv: mã số (phân biệt các sv với nhau), tên dob, địa chỉ...
--1 SV ~~~ 1 OBJECT~~~ 1 ENTITY
--1 TABLE DÙNG LƯU TRỮ NHIỀU ENTITY
CREATE TABLE Studentv1
(
	StudentID char(8),
	lastName nvarchar(40),		--tại sao ko gộp fullname cho rồi???
	FirstName nvarchar(10),		--n: lưu kí tự Unicode Tiếng việt
	DOB datetime,
	[Address] nvarchar(50)
)

--SQL server | orcale (orcale/java) | DB (IBM) | MySQL | PostgeSQL | SQLite | MS Access (ofice)

--THAO TÁC TRÊN DATA/ MÓN ĐỒ TRONG TỦ/ TRONG TABLE - DML/DQL (dành riêng cho select)
select * from Studentv1 --gõ thường okie
SELECT * FROM Studentv1	--GÕ CHUẨN

--ĐƯA DATA VÀO TABLE / MUA ĐỒ QUẦN ÁO VÀ BỎ VÀO TỦ
INSERT INTO Studentv1 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...tp.Hồ Chí Minh')	--ĐƯA HẾT CÁC CỘT, SV FULL KO CHE THÔNG TIN

--MỘT SỐ CỘT CHƯA THÈM NHẬP INFO, ĐC QUYỀN BỎ TRỐNG NẾU CỘT CHO PHÉP TRỐNG VALUE
--DEFAULT KHI ĐÓNG CÁI TỦ/ MUA TỦ/ THIẾT KẾ, MẶC ĐỊNH NULL
INSERT INTO Studentv1 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL)
--TÊN THÀNH PHỐ LÀ NULL, WHERE = 'NULL' OKIE VÌ NÓ LÀ DATA
--NULL Ở CÂU TRÊN WHERE ADDRESS IS NULL

INSERT INTO Studentv1 VALUES('SE123458', N'Võ', N'Cường', '2003-3-1', 'NULL')

--TUI CHỈ MÚN LƯU VÀI INFO, KO ĐỦ SỐ CỘT, MIỄN CỘT CÒN LẠI CHO PHÉP BỎ TRỐNG
INSERT INTO Studentv1(StudentID, lastName, FirstName)
			VALUES('SE123459', N'Trần', N'Dũng')

INSERT INTO Studentv1( lastName, FirstName, StudentID)
			VALUES(N'Phạm', N'Em', 'SE123460')

INSERT INTO Studentv1(StudentID, lastName, FirstName)
			VALUES(NULL, NULL, NULL)

INSERT INTO Studentv1( lastName, FirstName, StudentID)
			VALUES(NULL, NULL, NULL)	--SIÊU NGUY HIỂM, SV TOÀN INFO BỎ TRỐNG
										--GÀI CÁCH ĐƯA DATA VÀO CỘT SAO CHO HỢP LÍ
										--CONSTRAINTS TRÊN DATA/CELL/COLLUMN

SELECT * FROM Studentv1

--CÚ PHÁP NGUY HIỂM NÀY CÒN LỚN HƠN!!!
--TRÙNG MÃ SỐ KO CHẤP NHẬN ĐC, KO XĐ ĐC 1 SV -- GÀI RÀNG BUỘC DỮ LIỆU QUAN TRỌNG NÀY
--											--CỘT MÀ VALUE CẤM TRÙNG TRÊN MỌI CELL CÙNG CỘT
											--DÙNG LÀM CHIA KHÓ / KEY ĐỂ TÌM RA/ MỞ RA/ XĐ
											--DUY NHẤT 1 INFO, DÒNG, 1 SV, 1 EMTITY, 1 OBJECT
											
INSERT INTO Studentv1( lastName, FirstName, StudentID)
			VALUES(N'Đỗ', N'Giang', 'SE123460')

SELECT * FROM Studentv1 WHERE StudentID = 'se123460'

CREATE TABLE Studentv2
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,		--tại sao ko gộp fullname cho rồi???
	FirstName nvarchar(10) NOT NULL,		--n: lưu kí tự Unicode Tiếng việt (* ĐÓ ) registration/sign-up
	DOB datetime,
	[Address] nvarchar(50)
)

INSERT INTO Studentv2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...tp.Hồ Chí Minh')	--ĐƯA HẾT CÁC CỘT, SV FULL KO CHE THÔNG TIN

SELECT * FROM Studentv2

--THỬ COI QUA MẶT ĐK???
INSERT INTO Studentv2(StudentID, lastName, FirstName)
			VALUES(NULL, NULL, NULL)	--gãy

INSERT INTO Studentv2(StudentID, lastName, FirstName)
			VALUES('AHIHI', NULL, NULL)	--gãy

--coi có đc trùng mã số sv hay ko
INSERT INTO Studentv2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...tp.Hồ Chí Minh')	--ĐƯA HẾT CÁC CỘT, SV FULL KO CHE THÔNG TIN
--thử tiếp PK
INSERT INTO Studentv2 VALUES('GD123456', N'Nguyễn', N'An', '2003-1-1', N'...tp.Hồ Chí Minh')	--ĐƯA HẾT CÁC CỘT, SV FULL KO CHE THÔNG TIN
SELECT * FROM Studentv2
INSERT INTO Studentv2 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL) --oki


INSERT INTO Studentv2 VALUES('SE123458', N'Võ', N'Cường', NULL, NULL)	--OKI

INSERT INTO Studentv2(StudentID, lastName, FirstName)
			VALUES('SE123459', N'Trần', N'Dũng')

INSERT INTO Studentv2
			VALUES(NULL, NULL, NULL, NULL, NULL)	--GÃY 3 CHỖ NULL

CREATE TABLE Studentv3
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,		--tại sao ko gộp fullname cho rồi???
	FirstName nvarchar(10) NOT NULL,		--n: lưu kí tự Unicode Tiếng việt (* ĐÓ ) registration/sign-up
	DOB datetime,
	[Address] nvarchar(50)	NULL --THỪA TỪ NULL, DO DEFAULT LÀ VẬY
)

CREATE TABLE Studentv4
(
	StudentID char(8) NOT NULL,
	lastName nvarchar(40) NOT NULL,		--tại sao ko gộp fullname cho rồi???
	FirstName nvarchar(10) NOT NULL,		--n: lưu kí tự Unicode Tiếng việt (* ĐÓ ) registration/sign-up
	DOB datetime,
	[Address] nvarchar(50)	NULL, --THỪA TỪ NULL, DO DEFAULT LÀ VẬY
	PRIMARY KEY (StudentID)
)
--GENERATED TỪ ERD TRONG TOOL THIẾT KẾ
CREATE TABLE Studentv5 (
  StudentID char(8) NOT NULL, 
  LastName  varchar(50) NOT NULL, 
  FirstName varchar(10) NOT NULL, 
  PRIMARY KEY (StudentID)
  );
SELECT * FROM Studentv5

INSERT INTO Studentv4 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...tp.Hồ Chí Minh')	
SELECT * FROM Studentv4

--POWER DESIGNER VS. VISUAL PARADIGM
--	ĐỨC - SAP

------------------------------------
--HỌC THÊM VỀ CÁI CONTRAINTS - TRONG ĐÓ PK CONSTRAINTS
--RÀNG BUỘC LÀ CÁCH TA/DB DESIGNER ÉP CELL/ CỘT NÀO ĐÓ VALUE PHẢI NTN
--ĐẶT EA QUY TẮC/RULE CHO VIỆC NHẬP DATA
--vì có nhiều qu tắc, nên tránh nhầm lẫn, dễ kiểm soát ta sẽ cso quy tắc
--đặt tên cho các quy tắc, constraints name
--ví dụ: Má ở nhà đặt quy tắc/ nội quy cho mình
--Rule: #1: Vào Sg học thật tốt nha con. Tốt: điểm tb >= 8.0 && ko rớt môn nào
--					&& 9 học kì ra trường && ko đổi chuyên ngành
--Rule #2: Tối đi chơi về nhà sớm. Sớm: trong tối cùng ngày, trước 10h khuya
--Rule #3: ????
--tên rb/ quy tắc			nội dung/ cái data đc gài vào
--PK_??????							--PRIMARY KEY 
--Mặc định các DB Engine nó tự đặt tên cho các ràng buộc nó thấy khi bạnh
--gõ lệnh DDL
--DB EN cho mình cơ chế tự đặt tên cho các ràng buộc 

CREATE TABLE Studentv6
(
	StudentID char(8) NOT NULL,
	lastName nvarchar(40) NOT NULL,
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	--PRIMARY KEY (StudentID)	--tự DB Engine đặt tên cho các rb
	CONSTRAINT PK_STUDENTSV6 PRIMARY KEY (StudentID)
) 

--DÂN PRO ĐÔI KHI CÒN LÀM CÁCH SAU. NGƯỜI TA TÁCH HẲN VIỆC TẠO RA RB KHÓA CHÍNH, KHÓA NGOẠI
--RA HẲN CẤU TRÚC TABLE, TỨC LÀ CREATE TABLE CHỈ CHỨA TÊN CẤU TRÚC - CỘT - DOMAIN
--TẠO TABLE XONG RỒI CHỈNH SỬA TABLE - SỬA CÁI TỦ CHỨ KO PHẢI DATA TRONG
CREATE TABLE Studentv7
(
	StudentID char(8),NOT NULL,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	--PRIMARY KEY (StudentID)	--tự DB Engine đặt tên cho các rb
	--CONSTRAINT PK_STUDENTSV7 PRIMARY KEY (StudentID)
)

ALTER TABLE Studentv7 ADD CONSTRAINT PK_STUDENTV7 PRIMARY KEY (StudentID)

--XÓA 1 RÀNG BUỘC ĐC KO, ĐC, CHO ADD THÌ CHO DROP
ALTER TABLE Studentv7 DROP CONSTRAINT PK_STUDENTV7
ALTER TABLE Studentv2 DROP CONSTRAINT [PK__Studentv__32C52A793B511B13]