
USE Cartesian
SELECT * FROM VnDict, EnDict --tích đề-các

SELECT * FROM VnDict CROSS JOIN EnDict --tích đề-các

SELECT * FROM VnDict vn,  EnDict en --TÍCH ĐỀ CÁC CONG FILTER LẠI
			WHERE vn.Nmbr = en.Nmbr	-- THỰC DỤNG

SELECT * FROM VnDict,  EnDict 
			WHERE Nmbr = Nmbr	--BỐI RỐI LIỀN

SELECT * FROM VnDict,  EnDict 
			WHERE VnDict.Nmbr = EnDict.Nmbr	--NÊN ĐẶT ALIAS THÌ GIÚP NGẮN GỌN CÂU LỆNH

--CHUẨN THẾ GIỚI
SELECT * FROM VnDict vn INNER JOIN EnDict en	--NHÌN SÂU TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
						ON vn.Nmbr = en.Nmbr			--GHÉP CÓ TƯƠNG QUAN BÊN TRONG, THEO ĐIỂM CHUNG

SELECT * FROM VnDict vn JOIN EnDict en	--NHÌN SÂU TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
						ON vn.Nmbr = en.Nmbr

--CÓ THỂ DÙNG THÊM WHERE ĐC HAY KO??? KHI XÀI INNER, JOINS
--JOIN CHỈ LÀ THÊM DATA ĐỂ TÍNH TOÁN, GỘP DATA LẠI NHIỀU HƠN, SAU ĐÓ ÁP DỤNG TBO
--KIẾN THỨC SELECT ĐÃ HỌC

--THÍ NGHIỆM THÊM CHO INNER JOIN, GHÉP NGANG CÓ XEM XÉT CÓ MÔN ĐĂNG HỘ ĐỐI HAY KO??
SELECT * FROM VnDict
SELECT * FROM EnDict

SELECT * FROM EnDict e, VnDict v
		WHERE e.Nmbr = v.Nmbr

		
SELECT * FROM EnDict e, VnDict v
		WHERE e.Nmbr > v.Nmbr		--GHÉP CÓ CHỌN LỌC, HG XÀI DẤU =
									--MÀ DÙNG DẤU < <= > >= !=
									--NON-EQUI JOIN
									--VÃN KO LÀ GHÉP BỪA BÃI
--2TWO 1MOT
--3THREE 1 MOT
--3THREE 2HAI

		
SELECT * FROM EnDict e, VnDict v		--THỰC DỤNG
		WHERE e.Nmbr != v.Nmbr
		
		
SELECT * FROM EnDict e JOIN VnDict v		--CHUẨN MỰC
		ON e.Nmbr != v.Nmbr	