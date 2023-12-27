--THIẾT KẾ ĐẦU TIÊN: GOM TẤT TRONG 1 TABLE
--đặc điểm chính là cột, value dđ chính là Cell
--thông tin chích ngừa bào gồm: tên: An Nguyễn, cccd: 123344....,
CREATE DATABASE DBDESIGN_VACCINATION

USE DBDESIGN_VACCINATION

CREATE TABLE VaccinationV1
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),	--sort heng, Fullname là sort họ đó
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng hg là pk
										--key ứng viên, candidate key
	InjectionInfo nvarchar(255) 
)
--cách thiết kế này lưu trữ các mũi chích của mình đc không?? - ĐƯỢC
SELECT * FROM VaccinationV1

INSERT INTO VaccinationV1 
				VALUES('00000000001',N'Nguyễn', N'An', '090x', N'AZ ngày 18.10.2023 đh UTE | AZ Ngày 18.11.2023 BV LÊ VĂN VIỆT, Q.TĐ')

--PHÂN TÍCH: 
--ƯU ĐIỂM: DỄ LƯU TRỮ, SELECT, CÓ NGAY, đa tri tốt trong vu này!!!!
--NHƯỢC ĐIỂM: THỐNG KÊ ÉO ĐC, ÍT NHẤT ĐI CẮT CHUỖI, CĂNG!!! BỊ CĂNG DO ĐA TRỊ

--SOLUTION: CẦN QUAN TÂM THỐNG KÊ, TÍNH TOÁN SỐ LIỆU (? MŨI, AZ CÓ BAO NHIÊU....)
--TÁCH CỘT, TÁCH BẢNG

CREATE TABLE VaccinationV2
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),	--sort heng, Fullname là sort họ đó
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng hg là pk
										--key ứng viên, candidate key
	Dose1 nvarchar(100), --AZ, Astra, Astra... 25.9.2023, ĐH UTE - COMPOSITE (Phức hợp)
	Dose2 nvarchar(100)		--AZ, Astra,....
)
--PHÂN TÍCH:
--*ƯU ĐIỂM: gọn gàng, select gọn gàng
--*NHƯỢC ĐIỂM: NULL!!!, THÊM MŨI NHẮC 3, 4 HÀNG NĂM THÌ SAO??
			--CHỈ VÌ VÀI NGƯỜI, MÀ TA PHẢI CHỪA CHỖ NULL
			--THỐNG KÊ!! CỘT COMPOSITE CHƯA CHO MÌNH ĐC THỐNG KÊ

--MULTI- VALUED: MỘT CELL CHỨA NHIỀU INFO ĐỘC LẬP BÌNH ĐẲNG VỀ NGỮ NGHĨA
--				ví dụ: Address: 1/1 LL, Q.1, tp.HCM ; 1/1 Man Thien, TP.TĐ
--										thường trú				tạm trú
--				GÓI COMPO, NHIỀU ĐÒ TRONG 1 CELL
--				ĐỌC: CÓ 2 ĐỊA CHỈ
--COMPOSITE VALUE CELL: Một value duy nhất, mỗi value này gom nhiều miếng nhỏ hơn 
--						nhiều miếng nhỏ hơn, mỗi miếng có 1 vai trò riêng
--						gom chung thành 1 thứ khác
--						Address: 1/1 Man Thiện, P.5, TP HCM
--						Fullname: Hoàng Ngọc Trinh -> cả: tên gọi đầy đủ
--								  First last mid

--VÌ SÓ LẦN CHÍCH CÒN CÓ THỂ GIA TĂNG CHO TỪNG NGƯỜI, MŨI 2, MŨI NHẮC, MŨI THƯỜNG NIÊN
--AI THÍCH NHIỀU THÌ NHIỀU DÒNG, HAY HƠN HẲN

CREATE TABLE PersonV3
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),	--sort heng, Fullname là sort họ đó
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng hg là pk
										--key ứng viên, candidate key
)
--COMPOSITE GỘP N INFO VÀO TRONG 1 CELL, DỄ, NHANH LÀ ƯU ĐIỂM, NHẬP 1 CHUỖI DÀI LÀ XONG
--				NHƯỢC ĐIỂM: ÉO THỐNG KẾ TỐT, ÉO SORT ĐC
--							fullname sort làm sao
--COMPOSITE SẼ TÁCH CỘT, VÌ MÌNH ĐÃ CỐ TRƯỚC ĐÓ GOM N THỨ KHÁC NHAU ĐỂ LÀM RA 1 THỨ KHÁC
--						TÁCH CỘT TRẢ LẠI ĐÚNG NGỮ NGHĨA
CREATE TABLE VaccinationV3
(
	Dose nvarchar(100), --AZ, Astra, Astra... 25.9.2023, ĐH UTE - COMPOSITE (Phức hợp)
	PersonID char(11) REFERENCES PersonV3(ID)	--AZ, Astra,....

)
--PHÂN TÍCH:
--ƯU ĐIỂM: CHÍCH THÊM NHÁT NÀO THÌ THÊM DÒNG NHÁT ĐÓ, CHẤP 10 MŨI ĐỦ CHỖ LƯU, KO ẢNH HƯỞNG NGƯỜI CHÍCH SAU
--NHƯỢC: THỐNG KÊ ÉO ĐC
--COMPOSITE TÁCH TIẾP THÀNH CỘT CỘT CỘT CỘT CỘT CỘT CỘT, TRẢ LẠI ĐÚNG Ý NGHĨA CHO TỪNG
--MIẾNG INFO NHỎ
CREATE TABLE PersonV4
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),	--sort heng, Fullname là sort họ đó
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng hg là pk
										--key ứng viên, candidate key
)

CREATE TABLE VaccinationV4
(
	--Dose nvarchar(100), --AZ, Astra, Astra... 25.9.2023, ĐH UTE - COMPOSITE (Phức hợp)
	--tách cột hoi
	Dose int, --liều chích số 1
	InjDate datetime, --giờ chích
	Vaccine nvarchar(50), --tên vaccine
	Lot nvarchar(20),
	Locaition nvarchar(50),
	PersonID char(11) REFERENCES PersonV4(ID)	--AZ, Astra,....
)
INSERT INTO PersonV4 VALUES('00000000001',N'Nguyễn', N'An', '090X')
INSERT INTO PersonV4 VALUES('00000000002',N'LÊ', N'BÌNH', '0901X')

INSERT INTO VaccinationV4
		VALUES(1, GETDATE(), 'AZ', NULL, NULL, '00000000001' )

SELECT * FROM PersonV4
SELECT * FROM VaccinationV4

--IN RA XANH VÀNG CHO MỖI NGƯỜI
SELECT * FROM PersonV4 P LEFT JOIN VaccinationV4 V
					ON P.ID = V.PersonID

SELECT P.ID, P.FirstName ,COUNT(*) AS 'No Dose' FROM PersonV4 P LEFT JOIN VaccinationV4 V
					ON P.ID = V.PersonID
					GROUP BY P.ID, P.FirstName	--CHẾT MẸ COUNT(*)
												--BÌNH CÓ 1 DÒNG CÓ KHA KHÁ NULL

SELECT P.ID, P.FirstName ,COUNT(V.Dose) AS 'No Dose' FROM PersonV4 P LEFT JOIN VaccinationV4 V
					ON P.ID = V.PersonID
					GROUP BY P.ID, P.FirstName
					
--ĂN TIỀN XANH ĐỎ
SELECT P.ID, P.FirstName ,IIF(COUNT(V.Dose ) = 0, 'NOOP',
							IIF(COUNT(V.Dose) = 1, 'YELLOW', 'GREEN'))
								AS STATUS
					FROM PersonV4 P LEFT JOIN VaccinationV4 V
					ON P.ID = V.PersonID
					GROUP BY P.ID, P.FirstName


INSERT INTO VaccinationV4
		VALUES(1, GETDATE(), 'AZ', NULL, NULL, '00000000001' )

INSERT INTO VaccinationV4
		VALUES(2, GETDATE(), 'AZ', NULL, NULL, '00000000001' )

-------------------------------------------------------------------
-------------------------------------------------------------------
--PHÂN TÍCH:
--cột Vaccine cho phép gõ các giá trị tên VC một cách tự do -> inconsistence
--AZ, Astraa, AstraZeneca AstraZeneca, Astra Zênca
-- >>>có mùi cuẩ dropdown, mùi của combo box >>> Lookup Table
--ko cho gõ mà chọn từ danh sách có sẵn..
--tham chiếu từ danh sách có sẵn
--Vaccine phải tách thành table CHA, Table 1,ĐÁM CON ĐÁM N
--PHẢI REFERENCE VỀ

CREATE TABLE PersonV5
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),	--sort heng, Fullname là sort họ đó
	Phone varchar(11) NOT NULL UNIQUE, --constraint, cấm trùng nhưng hg là pk
										--key ứng viên, candidate key
)
INSERT INTO PersonV5 VALUES('00000000001',N'Nguyễn', N'An', '090X')
INSERT INTO PersonV5 VALUES('00000000002',N'LÊ', N'BÌNH', '0901X')
INSERT INTO PersonV5 VALUES('00000000003',N'PHAN', N'THUẬN', '0903X')
CREATE TABLE VaccineV5
(
	VaccineName varchar(30) PRIMARY KEY
	--HÃNG sx, địa điểm hãng, thông tin về lâm sàng
)

INSERT INTO VaccineV5 VALUES('AstraZeneca')
INSERT INTO VaccineV5 VALUES('pfizer')
INSERT INTO VaccineV5 VALUES('Verocell')
INSERT INTO VaccineV5 VALUES('Monderna')

SELECT * FROM VaccineV5

--PRIMARY KEY MÀ LÀ VARCAHR() LÀM GIẢM HIỆU NĂNG VỀ THỰC THI QUERY
--CHẠY CHẬM, THƯỜNG NGƯỜI TA CHỌN PK LÀ CON SỐ TỐT NHẤT, TỐT NHÌ CHAR
--SẼ GIẢNG RIÊNG 1 BUỔI VỀ PRIMARY KEY(PK,FK,CK,CSPK, NK, SRK -AK)

DROP TABLE VaccinationV5
CREATE TABLE VaccinationV5
(
	SEQ int IDENTITY(1,1) PRIMARY KEY, --CỨ TĂNG MÃI MÃI ĐI, 2 TỶ 1 MẤY LẦN CHÍCH
	Dose int, --liều chích số 1,2 CÓ THỂ LẶP LẠI CHO MỖI PESON, ko thể là pk
	InjDate datetime, --giờ chích
	Vaccine varchar(30) REFERENCES VaccineV5(VaccineName), --tên vaccine KO CHO NHÂP TỰ DO, PHẢI THAM CHIẾU
	Lot nvarchar(20),
	Locaition nvarchar(50), --nơi chích bản chất là COMPOSITE, TÁCH THÀNH CỘT CITY, QUẬN/HUYỆN
							--LẠI LÀ LOOKUP NẾU MUỐN, ĐỂ KO GÕ LUNG TUNG, THỐNG KÊ TIỆN TỪNG ĐVỊ
	PersonID char(11) REFERENCES PersonV5(ID)	--AZ, Astra,....

	--FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName),
	--CONSTRAINT FK_VCN_VC FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName)
)

INSERT INTO VaccinationV5
		VALUES(1, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000001' )--OK

INSERT INTO VaccinationV5
		VALUES(2,'2021-12-20', 'AstraZeneca', NULL, NULL, '00000000001' )--OK

INSERT INTO VaccinationV5
		VALUES(2,'2021-12-20', 'AZ', NULL, NULL, '00000000001' ) --THẤT BẠI
		--ko có loại vaccine gõ tay AZ
		--SEQ tăng mẹ nó thành số 3 và bị thất bại!!!!

INSERT INTO VaccinationV5
		VALUES(1,'2021-12-20', 'Verocell', NULL, NULL, '00000000002' )

INSERT INTO VaccinationV5
		VALUES(2,'2021-12-20', 'AstraZeneca', NULL, NULL, '00000000002' )

INSERT INTO VaccinationV5
		VALUES(3,'2021-12-20', 'Verocell', NULL, NULL, '00000000001' )

SELECT * FROM VaccineV5
SELECT * FROM PersonV5
SELECT * FROM VaccinationV5

--THỐNG KÊ ĐC NHỮNG GÌ
--1.Có bao nhiêu mũi vaccine AZ đã đc chích (chích bao nhát, ko care người)
--output: loại vaccine, tổng số mũi đã chích
SELECT Vaccine, COUNT(*) AS [No vaccine] FROM VaccinationV5 GROUP BY Vaccine

--2. Ngày x có bao nhiêu mũi đã đc chích
--output: ngày, tổng số mũi đã chích
SELECT InjDate, Vaccine, COUNT(*) AS [No vaccine] FROM VaccinationV5 GROUP BY Vaccine, InjDate HAVING DAY(InjDate) = 20

--3.Thống kê số mũi chích của mỗi cá nhân
--output: CCCD, Tên (full), di động, số mũi đã chích(0,1,2,3)
SELECT ID,P.LastName + ' ' + P.FirstName AS [FULL NAME], P.Phone   ,COUNT(*) AS [No vaccine] FROM PersonV5 P LEFT JOIN VaccinationV5 V
						ON P.ID = V.PersonID
						GROUP BY ID, P.FirstName,P.LastName,P.Phone

--4.In ra thông tin chích của mỗi cá nhân
--output: CCCD, Tên (full), di động, số mũi đã chích(0,1,2,3), MÀU SẮC
SELECT ID,P.LastName + ' ' + P.FirstName AS [FULL NAME], P.Phone , COUNT(*) AS [No vaccine], IIF(COUNT(*) = 0,'NOOP', IIF(COUNT(*) = 1,'RED','BLUE')) AS COLOR FROM PersonV5 P LEFT JOIN VaccinationV5 V
						ON P.ID = V.PersonID
						GROUP BY ID, P.FirstName,P.LastName,P.Phone
--5.Có bao nhiêu công dân đã chích ít nhất 1 mũi vaccine

--6.Những công dân nào chưa chích mũi nào??
--output: CCCD, tên
SELECT P.ID FROM PersonV5 P LEFT JOIN VaccinationV5 V
												ON P.ID = V.PersonID
												GROUP BY V.PersonID,P.ID
												HAVING COUNT(V.PersonID) = 0


SELECT ID, LastName + ' ' + FirstName AS FULNAME FROM PersonV5 WHERE ID = (SELECT P.ID FROM PersonV5 P LEFT JOIN VaccinationV5 V
												ON P.ID = V.PersonID
												GROUP BY V.PersonID,P.ID
												HAVING COUNT(V.PersonID) = 0
									)
--7.Công dân có CCCD x đã chích những mũi nào??
--Output: CCCD, tên, thông tin chích(in gộp + chuỗi, tái nhập composite)
SELECT P.ID, P.LastName + ' ' + P.FirstName AS [FULL NAME], V.Vaccine FROM PersonV5 P LEFT JOIN VaccinationV5 V
		ON P.ID = V.PersonID
		GROUP BY V.PersonID,P.ID, V.Vaccine, p.FirstName, p.LastName
		HAVING V.PersonID = '00000000002'

SELECT * FROM (SELECT P.ID, P.LastName + ' ' + P.FirstName AS [FULL NAME], V.Vaccine FROM PersonV5 P LEFT JOIN VaccinationV5 V
		ON P.ID = V.PersonID
		GROUP BY V.PersonID,P.ID, V.Vaccine, p.FirstName, p.LastName
		HAVING V.PersonID = '00000000002') T
		GROUP BY T.ID

--8.Thống kê số mũi vaccine đã chích của mỗi loại vaccine
SELECT * FROM VaccinationV5 --VERO VÀ AZ KO HÀ, MẤT TIÊU MO, PF

SELECT * FROM VaccineV5 V INNER JOIN 
				VaccinationV5 VC	--chả khác câu trên, JOIN =
				ON V.VaccineName = VC.Vaccine

SELECT * FROM VaccineV5 V LEFT JOIN 
				VaccinationV5 VC	
				ON V.VaccineName = VC.Vaccine

SELECT V.VaccineName, COUNT(*) FROM VaccineV5 V LEFT JOIN 
				VaccinationV5 VC				--Gần đúng hoi, count(*) toang cho thằng
				ON V.VaccineName = VC.Vaccine		--chơi hệ left do có 1 dogfn Prizer chủ yếu NULL
				GROUP BY V.VaccineName				--do chưa ai chích, NHỚ COUNT(*) KHÁC COUNT (NULL)

SELECT V.VaccineName, COUNT(VC.SEQ) FROM VaccineV5 V LEFT JOIN 
				VaccinationV5 VC	
				ON V.VaccineName = VC.Vaccine
				--WHERE DATE CHÍCH LÀ THỐNG KÊ THEO NGÀY
				--QUẬN HUYỆN NỮA LÀ THỐNG KÊ THEO NGÀY, QUẬN
				GROUP BY V.VaccineName
--CHỐT HẠ: TÁCH ĐA TRỊ, HAY COMPOSITE DUWAH TRÊN NHU CẦU THỐNG KÊ
--				NẾU CÓ DỮ LIỆU TA LƯU TRỮ!!!
--				GOM BẢNG -> TÌM ĐA TRỊ, TÌM COMPOSITE, TÌM LOOKUP TÁCH THEO
--										NHU CẦU!!!