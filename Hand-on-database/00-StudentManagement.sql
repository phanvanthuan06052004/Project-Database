

CREATE DATABASE StudentManagement

USE StudentManagement

CREATE TABLE Major
(
	MajorID char(2) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	MajorName varchar(30),
	Hotline varchar(11)
)

INSERT INTO Major VALUES('SE', 'Software Engineering', '090x')
INSERT INTO Major VALUES('IA', 'Information Assurance', '091x')
INSERT INTO Major VALUES('GD', 'Graphic Design', '092x')
INSERT INTO Major VALUES('JP', 'Japanese', '093x')
INSERT INTO Major VALUES('KR', 'Korean', '094x')

SELECT * FROM Major

DROP TABLE Student
CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50), 
	MajorID char(2) REFERENCES Major(MajorID)  -- FK Foreign Key - Khóa ngoại
)

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE1', N'Nguyễn', N'Một', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE2', N'Lê', N'Hai', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE3', N'Trần', N'Ba', 'SE');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE4', N'Phạm', N'Bốn', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE5', N'Lý', N'Năm', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE6', N'Võ', N'Sáu', 'IA');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD7', N'Đinh', N'Bảy', 'GD');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD8', N'Huỳnh', N'Tám', 'GD');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('JP9', N'Ngô', N'Chín', 'JP');

SELECT * FROM Student

-- TỪ TỪ HÃY THÊM VÀO ĐỂ XEM FULL-OUTER JOIN RA SAO
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('UNK', N'Đặng', N'Mười', NULL);


SELECT * FROM Major
SELECT * FROM Student

--1. In ra thông tin chi tiết của SV kèm thông tin chuyên ngnahf
SELECT * FROM Student --INFO tắt của chuyên ngành
SELECT * FROM Major --chỉ có info chuyên ngnahf, thiếu info sv
--JOIN càm chắc rồi, lấy info đang nằm bên kia ghép thheem theo chiều ngang
SELECT * FROM Student s, Major m
		WHERE s.MajorID = M.MajorID	--dư cột Major ID

SELECT s.*, m.MajorName, m.Hotline FROM Student s, Major m
		WHERE s.MajorID = m.MajorID


SELECT s.*, m.MajorName, m.Hotline FROM Student s JOIN Major m
		ON s.MajorID = M.MajorID

--2.In  ra info chi tiết của sv kèm info chuyên ngành. Chỉ quan tâm sv SE và IA
SELECT s.*, m.MajorName, m.Hotline
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID
		WHERE m.MajorID = 'SE' OR m.MajorID = 'IA'  --6 DÒNG

SELECT s.*, m.MajorName, m.Hotline
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID
		WHERE m.MajorID IN ( 'SE', 'IA')  --6 DÒNG

SELECT s.*, m.MajorName, m.Hotline 
		FROM Student s, Major m
		WHERE s.MajorID = M.MajorID AND m.MajorID IN('SE', 'IA') --6

--3.In ra thông tin các sinh viên kèm chuyên ngành. Chuyên ngành nào chưa có SV cũng in ra luôn
--PHÂN TÍCH: căn theo sv mà in, thì Hàn Quốc tèo ko xuất hiện
SELECT s.*, m.* 
		FROM Student s RIGHT JOIN Major m
		ON s.MajorID = M.MajorID		--10 DÒNG

SELECT s.*, m.* 
		FROM  Major m  LEFT JOIN Student s
		ON s.MajorID = m.MajorID		--10 DÒNG, KOREAN FA NULL

SELECT s.*, m.* 
		FROM Student s LEFT JOIN Major m		--9 DÒNG, KOREAN BIẾN MẤT
		ON s.MajorID = M.MajorID

--4. Có bao nhiêu chuyên ngành??
SELECT COUNT(*) FROM Major
SELECT COUNT(MajorID) AS [No major]FROM Major

--5.MỖi chuyên ngành có bao nhiêu sinh viên
--output 0: số lượng sv đang theo học của từng chuyên ngành
--output 1: mã cn | số lượng sv đang theo học
--phân tích: hỏi sv, bao nhiêu sv, đếm sv sure !!!!
--			gặp thêm chữ mỗi!!!!
--			mỗi cn có 1 con số đếm, đếm theo chuyên ngnahf, chia nhóm chuyên ngành mà đếm

SELECT COUNT (*) FROM Student GROUP BY MajorID --ÉO BIẾT CN NÀO BAO NHIÊU SV, ĐẾM ĐÚNG
SELECT MajorID, COUNT (*) AS [No Student] FROM Student GROUP BY MajorID

SELECT MajorID, COUNT (MajorID) AS [No Student] FROM Student GROUP BY MajorID

--6.Chuyên ngnahf nào có từ 3 sv trở lên
--Phân tích: chia chặng rồi
--			đầu tiên phai đếm chuyên ngành đã, quét qua bảng q lần để đếm ra sv
--			đếm xong, dợt lại kết quả, lọc thêm cái từ 3 sv trở lên 
--			phải đếm xong từng ngành rồi mới tính tiếp
SELECT MajorID, COUNT (MajorID) AS [No Student]
								FROM Student 
								GROUP BY MajorID
								HAVING COUNT(MajorID) >= 3  --SE VÀ IA SURE

--7. Chuyên ngành nào có ít SV nhất

SELECT MajorID, COUNT (MajorID) AS [No Student]
								FROM Student 
								GROUP BY MajorID
								HAVING COUNT(MajorID) = 1 --ĂN ĐÒN

SELECT MajorID, COUNT (MajorID) AS [No Student]
								FROM Student 
								GROUP BY MajorID
								HAVING COUNT(MajorID) <= ALL(
															SELECT COUNT (*) FROM Student GROUP BY MajorID
															)

--8.Đếm sv của chuyên ngành SE
SELECT  COUNT (*) FROM Student
				WHERE MajorID = 'SE'		--CÂU NÀY CHẠY NHANH

SELECT MajorID,  COUNT (*) FROM Student
				WHERE MajorID = 'SE'		--CHỈ CÒN LẠI 1 NHÓM
				GROUP BY MajorID

SELECT MajorID, COUNT (MajorID) AS [No Student] FROM Student GROUP BY MajorID 
												HAVING MajorID = 'SE'		--CÂU NÀY CHẠY CHẬM

--9.Đếm số SV của mỗi chuyên ngành
--output : mã chuyên ngành, tên cn, số lượng sv
--phân tích: đáp án cần có info của 2 table
--			đếm trên 2 table
--			đếm trong Major hg có info sc
--			đếm trong SV chỉ có ddc mã cn
--			mún có mã cn, tên cn, số lượng sv -> JOIN 2 BẢNG RỒI MỚI ĐẾM
SELECT MajorID, COUNT (MajorID) AS [No Student] FROM Student GROUP BY MajorID 
									

SELECT s.MajorID, m.MajorName, s.[No Student] 
											FROM (
											SELECT MajorID, COUNT (MajorID) AS [No Student] 
																			FROM Student		--THUẬN TỰ LÀM
																			GROUP BY MajorID 
													) s 
											 JOIN Major m ON s.MajorID = m.MajorID

SELECT S.StudentID, S.FirstName, M.MajorID, M.MajorName 
		FROM Student S INNER JOIN Major M
		ON S.MajorID = M.MajorID
		

SELECT M.MajorID, M.MajorName, COUNT(*) AS [No Students] 
		FROM Student S INNER JOIN Major M
		ON S.MajorID = M.MajorID
		GROUP BY M.MajorID, M.MajorName

--10. câu 10 điểm nè....
--THẾ CÒN TRÒ CHƠI CON MỰC THÌ SAO???
--CHUYÊN NGNAHF HQ CỦA EM ĐÂU RỒI???
SELECT S.StudentID, S.FirstName, M.MajorID, M.MajorName 
		FROM Student S INNER JOIN Major M
		ON S.MajorID = M.MajorID

SELECT M.MajorID, M.MajorName, COUNT(*) AS [No Students] 
		FROM Student S RIGHT JOIN Major M
		ON S.MajorID = M.MajorID
		GROUP BY M.MajorID, M.MajorName		--SAI VÌ CÓ 1 DÒNG HQ FA, NULL SV
											--COUNT(1) CÓ 1 DÒNG FA, HQ CÓ 1 SV SAI

SELECT M.MajorID, M.MajorName, COUNT(StudentID) AS [No Students] 
		FROM Student S RIGHT JOIN Major M
		ON S.MajorID = M.MajorID
		GROUP BY M.MajorID, M.MajorName		--COUNT NULL LẠI ĐÚNG TRONG TH NÀY
											--VÌ MÃ SV NULL ỨNG VỚI CHUYÊN NGNAHF HQ
											--COUNT(*) CHỈ CẦN CÓ DÒNG LÀ RA SỐ 1 
											--CHẤP DÒNG CÓ NHIỀU NULL HAY KO

											--ĐẾM CELL CELL NULL -> 0
		--DASH BOARD MÀN HÌNH THỐNG KÊ CỦA ADMIN WEBSITE TUYỂN SINH