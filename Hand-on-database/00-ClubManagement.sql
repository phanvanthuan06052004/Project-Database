DROP DATABASE ClubManagement

CREATE DATABASE ClubManagement

USE ClubManagement

DROP TABLE Club
CREATE TABLE Club
(
	ClubID char(5) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	ClubName nvarchar(50),
	Hotline varchar(11)
)

INSERT INTO Club VALUES('SiTi', N'Cộng đồng Sinh viên Tình nguyện', '090x')
INSERT INTO Club VALUES('SkllC', N'Skillcetera', '091x')
INSERT INTO Club VALUES('CSG', N'CLB Truyền thông Cóc Sài Gòn', '092x')
INSERT INTO Club VALUES('FEV', N'FPT Event Club', '093x')
INSERT INTO Club VALUES('FCode', N'FPT Code', '094x')

SELECT * FROM Club

DROP TABLE Student
CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50)	
)

INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE1', N'Nguyễn', N'Một');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE2', N'Lê', N'Hai');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE3', N'Trần', N'Ba');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE4', N'Phạm', N'Bốn');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE5', N'Lý', N'Năm');

SELECT * FROM Student

DROP TABLE Registration
CREATE TABLE Registration
(
	RegID int IDENTITY(1, 1) PRIMARY KEY,   -- PK Primary Key - Khóa chính - Tăng tự động từ 1	      
	StudentID char(8),
	ClubID char(5),    
	JoinedDate date,
	LeavedDate date
	CONSTRAINT FK_Reg_Club FOREIGN KEY (ClubID) REFERENCES Club(ClubID),                -- FK Foreign Key - Khóa ngoại
	CONSTRAINT FK_Reg_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID)     -- FK Foreign Key - Khóa ngoại
)


-- SiTi 3, SkllC 2, CSG 2, FEV 0, FCODE 0
-- SE1 3, SE2 3, SE3 1, SE4 0, SE5 0
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'CSG')


INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'CSG')

INSERT INTO Registration(StudentID, ClubID) VALUES('SE3', 'SiTi')

SELECT * FROM Registration

--THỤC HÀNH
--1.Liệt kê các sv đang theo học
SELECT * FROM Student

--2.Liệt kê thông tin sv đang theo học kèm theo clb bạn í đang tham gia
--output 1: mã sv, tên sv, mã clb
--output 2: mã sv, tên sv, mã clb, tên clb

SELECT * FROM Student S JOIN Registration R 
		ON S.StudentID = R.StudentID --GHÉP 2 TABLE ĐỂ SÁT NHAU, NHIỀU CỘT QUÁ

SELECT S.StudentID, S.FirstName + ' ' + S.LastName AS FULLNAME, R.ClubID FROM Student S JOIN Registration R 
		ON S.StudentID = R.StudentID	--rút bớt cột
--!!!! thiếu mẹ 2 sv 4 5 VÌ JOIN = 
SELECT S.StudentID, S.FirstName + ' ' + S.LastName AS FULLNAME, R.ClubID FROM Student S LEFT JOIN Registration R 
		ON S.StudentID = R.StudentID

--3.In ra thông tin tham gia clb của các sv
--output: mã sv, tên sv, mã clb, tên clb, joineddate
SELECT * FROM Student S JOIN Registration R
			ON S.StudentID = R.StudentID
			JOIN Club C ON C.ClubID = R.ClubID

SELECT S.StudentID, S.FirstName, C.ClubID, C.ClubName, R.JoinedDate
			FROM Student S JOIN Registration R
			ON S.StudentID = R.StudentID
			JOIN Club C ON C.ClubID = R.ClubID
--Vấn đề lớn: mất mẹ nó 2 sv 4,5 mất lubn cả clb FCODE FEV

SELECT S.StudentID, S.FirstName, C.ClubID, C.ClubName, R.JoinedDate
			FROM Student S , Registration R, Club C
			WHERE S.StudentID = R.StudentID AND C.ClubID = R.ClubID
--Tao đố mày lấy đc phần hụt, vì nó chỉ đi tìm đám bằng nhau common field
--ghép và i nra, thằng nào bằng, hụt, kệ mẹ mày

--join SẼ GIÚP, VÌ NÓ NHÌN LUÔN PHẦN CHUNG VÀ PHẦN HỤT

SELECT S.StudentID, S.FirstName, C.ClubID, C.ClubName, R.JoinedDate
			FROM Student S FULL JOIN Registration R
			ON S.StudentID = R.StudentID
			FULL JOIN Club C ON C.ClubID = R.ClubID --11

--BTVN
--1.Đém số clb mà mỗi sv đã tham gia
--output: mã sv, tên sv, số- clb-tham-gia

--2.Sinh viên SE1 tham gia mấy clb
--output: mã sv, tên sv, số- clb-tham-gia

--3.Sinh viên nào tham gia nhiều clb nhất??

--4.CLB Cộng đồng Sinh viên Tình nguyện có những sv nào tham gia
--ko sùng sub cũng ok, nhớ là tụi hg có hỏi Siti à nhen
--sùng sub cũng ok

--5.Mỗi clb có bao nhiêu thành viên
--output: mã clv, tên clb, số thành viên

--6.CLB nào đông member nhất
--output: mã clb, tên clb, số thành viên

--7. CLB SiTi cà CSC có bao nhiêu member. Đếm riêng từng clb
--output: mã clb, tên clb, số thành viên (2 dòng)

--8.Có tổng cộng bao nhiêu lượt sv tham gia clb