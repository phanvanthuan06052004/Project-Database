CREATE DATABASE DBDESIGN_ONEMANY
USE DBDESIGN_ONEMANY

--TABLE 1 TẠO TRƯỚC, TABLE N TẠO SAU
CREATE TABLE MajorV1
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DBE TỰ TẠO TÊN RB
	MajorName nvarchar(40) NOT NULL,
	---...
)

--CHÈN DATA - MUA QUẦN ÁO BỎ VÔ TỦ
INSERT INTO MajorV1 VALUES('SE', N'kĩ thuật phần mêm')
INSERT INTO MajorV1 VALUES('IA', N'An toàn thông tin')
CREATE TABLE Studentv1
(
	StudentID char(8) NOT NULL,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	MajorID char(2),		--tên cột khóa ngoại/ tham chiếu ko cần trùng bên 1-key
					--bắt buộc phai trùng 100% kiểu dữ liệu, cần tham chiếu
					--data hoy
	CONSTRAINT PK_STUDENTSV7 PRIMARY KEY (StudentID)
)

--CHÈN DATA SINH VIÊN
SELECT * FROM MajorV1
SELECT * FROM Studentv1
INSERT INTO Studentv1 VALUES('SE1', N'Nuyễn', N'An', NULL, NULL, 'SE')

--THIẾT KẾ TRÊN SAI VÌ KO CÓ THAM CHIẾU GIỮA MAJORID CẢU STUDENT VS MAJORID
INSERT INTO Studentv1 VALUES('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'AH')

CREATE TABLE MajorV2
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DBE TỰ TẠO TÊN RB
	MajorName nvarchar(40) NOT NULL,
	---...
)

CREATE TABLE Studentv2
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	--MajorID char(2) REFERENCES MajorV2(MajorID)	
	MajorID char(2) FOREIGN KEY REFERENCES MajorV2(MajorID)
	--tớ chọn chuyên ngành ở trên kia kìa, xin tham chiếu trên kia
)

INSERT INTO MajorV2 VALUES('SE', N'kĩ thuật phần mêm')
INSERT INTO MajorV2 VALUES('IA', N'An toàn thông tin')

INSERT INTO Studentv2 VALUES('SE1', N'Nuyễn', N'An', NULL, NULL, 'SE')
INSERT INTO Studentv2 VALUES('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'AH')

SELECT * FROM Studentv2

--KO ĐC XÓA TABLE 1 NẾU NÓ ĐANG ĐC THAM CHIẾU BỞI THẰNG KHÁC
--NẾU CÓ MỐI QUN HỆ 1-N, XÓA N TRƯỚC RỒI XÓA 1 SAU

---------------------------------------------------------------
--THÊM KĨ THUẬT FK, Y CHANG CÁCH VIẾT CỦA PK

CREATE TABLE MajorV3
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DBE TỰ TẠO TÊN RB
	MajorName nvarchar(40) NOT NULL,
	---...
)

CREATE TABLE Studentv3
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	
	MajorID char(2),
	CONSTRAINT FK_Studentv3_MajorID  
					FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
	
)

--TA CÓ QUYỀN GỠ 1 CÁI RÀNG BUỘC ĐÃ ĐC THIẾT LẬP!!
ALTER TABLE Studentv3 DROP CONSTRAINT FK_Studentv3_MajorID 

--BỔ SUNG LẠI 1 RÀNG BUỘC KHÁC
--ALTER TABLE Studentv7 ADD CONSTRAINT PK_STUDENTV7 PRIMARY KEY (StudentID)
ALTER TABLE Studentv3 ADD CONSTRAINT  FK_Studentv3_MajorID  
					FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
SELECT * FROM MajorV3	--RỖNG
SELECT * FROM Studentv3	--RỖNG

--INSERT LÀ CHẾT, DO THAM CHIẾU KO TỒN TẠI
INSERT INTO Studentv3 VALUES('SE1', N'Nuyễn', N'An', NULL, NULL, 'SE')

INSERT INTO MajorV3 VALUES('SE', N'kĩ thuật phần mêm')

INSERT INTO MajorV3 VALUES('AH', N'AHII đồ ngu')

INSERT INTO Studentv3 VALUES('AH1', N'LÊ', N'VUI VE', NULL, NULL, 'AH')
 

--THAO TÁC MẠNH TAY TRÊN DATA/ MÓN ĐỒ QUẦN ÁO TRONG TỦ - DML (UPDATE & DELETE)
DELETE FROM Studentv3 -- CỰC KÌ NGUY HIỂM KHI THIẾU WHERE, XÓA HẾT DATA!!! 

DELETE FROM Studentv3 WHERE StudentID = 'AH1'

DELETE FROM MajorV3 WHERE MajorID = 'AH'

--GÀI THÊM HÀNH XỬ KHI XÓA, SỬA DATA Ở RÀNG BUỘC KHÓA NGOẠI/ DÍNH KHÓA CHÍNH LUÔN
--HIỆU ỨNG DOMINO, SỤP ĐỖ DÂY CHUYỀN, 1 XÓA N ĐI SẠCH >>> CASCADE DELETE. 
									--1 SỬA, N BỊ SỬA THEO>>>>>CASCADE UPDATE
--NGAY LÚC DESIGN TABLE/ CREATE TABLE ĐÃ PHẢI TÍNH VỤ NÀY RỒI
--VẪN CÓ THỂ SỬA SAU NÀY KHI CÓ DATA, CÓ THỂ CÓ TRONG TROUBLE
--CỤM LỆNH: CREATE / ALTER / DROP
SELECT * FROM MajorV3	--RỖNG
SELECT * FROM Studentv3	--RỖNG

ALTER TABLE Studentv3 DROP CONSTRAINT FK_Studentv3_MajorID --XÓA RB KHÓA NGOẠI BỊ THIẾU
--VIỆC GÀI THÊM RULE NHỎ LIÊN QUAN XÓA SỬ DATA

ALTER TABLE Studentv3 ADD CONSTRAINT FK_Studentv3_MajorID 
						FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
						ON DELETE CASCADE
						ON UPDATE CASCADE

---UPDATE DML, MẠNH MẼ, SỬA DATA ĐANG CÓ
UPDATE MajorV3 SET MajorID = 'AK' --CẨN THẬN NẾU KO CÓ WHERE, TOÀN BỘ TABLE BỊ ẢNH HƯỞNG
								--THỬ UPDATE CỘT KEY

UPDATE MajorV3 SET MajorID = 'AK' WHERE MajorID = 'AH'

--SỰ SỤP ĐỔ, XÓA 1, N ĐI SẠCH SẼ
--XÓA CHUYÊN NGÀNH AHIHI, XEM SAO ??? CÒN SV NÀO HG
DELETE FROM MajorV3 WHERE MajorID = 'AH'
DELETE FROM MajorV3 WHERE MajorID = 'AK' --SV AH1 LÊN ĐƯỜNG LUN

--CÒN 2 CÁI GÀI NỮA LIÊN QUAN ĐẾN TÍNH ĐỒNG BỘ NHẤT QUASNB DARAA/ CONSISTENCY
--SET NULL AND DEFAULT 
--KHI 1 XÓA, N VỀ NULL
--KHI 1 XÓA, N VỀ DEFAULT

SELECT * FROM MajorV3	--RỖNG
SELECT * FROM Studentv3	--RỖNG

--*********CHỐT HẠ
--XÓA BÊN 1 TỨC LÀ MẤT BÊN 1, KO LẼ SỤP ĐỔ CẢ ĐÁM BÊN N , KO HAY, NÊN CHỌN ĐƯA BÊN N VỀ NULL
--UPDATE BÊN 1, BÊN 1 VẪN CÒN GIỮ DÒNG/ROW, BÊN N NÊN ĐỒNG BỘ THEO, ĂN THEO, CASCADE

ALTER TABLE Studentv3 DROP CONSTRAINT FK_Studentv3_MajorID --XÓA RB KHÓA NGOẠI BỊ THIẾU
--VIỆC GÀI THÊM RULE NHỎ LIÊN QUAN XÓA SỬ DATA

ALTER TABLE Studentv3 ADD CONSTRAINT FK_Studentv3_MajorID 
						FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
						ON DELETE SET NULL	--XÓA CHO MỒ CÔI, BƠ VƠ, NULL, TỪ TỪ TÍNH
						ON UPDATE CASCADE	--SỬA BỊ ẢNH HƯỞNG DÂY CHUYỀN

--CHO SV BƠ VƠ CHUYÊN NGNAHF VỀ HỌC SE
UPDATE Studentv3 SET MajorID = 'SE' --TOÀN TRƯỜNG HỌC SE ẤY, TOANG

UPDATE Studentv3 SET MajorID = 'SE' 
						WHERE StudentID = 'AH1' --ĐÚNG
						
UPDATE Studentv3 SET MajorID = 'SE' 
						WHERE MajorID IS NULL
/*
CREATE TABLE Studentv3
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	
	MajorID char(2),
	CONSTRAINT FK_Studentv3_MajorID  
					FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
	
)
*/
CREATE TABLE Studentv3
(
	StudentID char(8) PRIMARY KEY,
	lastName nvarchar(40) NOT NULL,	
	FirstName varchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)	NULL, 
	
	MajorID char(2) DEFAULT 'SE',
	CONSTRAINT FK_Studentv3_MajorID  
					FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
					ON DELETE SET DEFAULT
					ON UPDATE CASCADE
)

--CHO SV KO CHỌN CHUYÊN NGÀNH, HẮN HỌC GÌ??? HỌC SE ĐẤY

INSERT INTO Studentv3(StudentID, lastName, FirstName) VALUES('SE2', N'PHẠM', N'BÌNH')

--ALTER TABLE STUDENTV3 ADD CONSTRAINT...Ở TRÊN DONE