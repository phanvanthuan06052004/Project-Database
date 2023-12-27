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