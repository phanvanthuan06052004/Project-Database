USE [master]
GO
/****** Object:  Database [LibaryManagement]    Script Date: 11/20/2023 11:58:44 AM ******/
CREATE DATABASE [LibaryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement2023DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookManagement2023DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagement2023DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookManagement2023DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibaryManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibaryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibaryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibaryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibaryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibaryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibaryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibaryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibaryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibaryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibaryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibaryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibaryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibaryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibaryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibaryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibaryManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibaryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibaryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibaryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibaryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibaryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibaryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibaryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibaryManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [LibaryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibaryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibaryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibaryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibaryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibaryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibaryManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibaryManagement', N'ON'
GO
ALTER DATABASE [LibaryManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibaryManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibaryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/20/2023 11:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[BookCategoryId] [int] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookManagementMember]    Script Date: 11/20/2023 11:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookManagementMember](
	[MemberId] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[MemberRole] [int] NOT NULL,
 CONSTRAINT [PK_BookManagementMember] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookType]    Script Date: 11/20/2023 11:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookType](
	[BookCategoryId] [int] NOT NULL,
	[BookGenreType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[BookCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (1, N'The Handbook Of International Trade And Finance', N'An international trade transaction, no matter how straightforward it may seem at the start, is not completed until delivery has taken place, any other obligations have been fulfilled and the seller has received payment. This may seem obvious; however, even seemingly simple transactions can, and sometimes do, go wrong.', CAST(N'2005-01-01T00:00:00.000' AS DateTime), 10, 45.99, 4, N'Anders Grath')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (2, N'Snow Crash', N'Hiro lives in a Los Angeles where franchises line the freeway as far as the eye can see. The only relief from the sea of logos is within the autonomous city-states, where law-abiding citizens don’t dare leave their mansions.', CAST(N'2001-01-01T00:00:00.000' AS DateTime), 20, 12.99, 2, N'Neal Stephenson')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (3, N'Contact: A Novel', N'The future is here…in an adventure of cosmic dimension. When a signal is discovered that seems to come from far beyond our solar system, a multinational team of scientists decides to find the source. What follows is an eye-opening journey out to the stars to the most awesome encounter in human history. Who—or what—is out there? Why are they watching us? And what do they want with us?', CAST(N'2019-02-26T00:00:00.000' AS DateTime), 15, 12.99, 2, N'Carl Sagan')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (4, N'The Time Machine', N'The story follows a Victorian scientist, who claims that he has invented a device that enables him to travel through time, and has visited the future, arriving in the year 802,701 in what had once been London.', CAST(N'2021-06-29T00:00:00.000' AS DateTime), 11, 6.99, 2, N'H.G. Wells')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (5, N'Rosewater (The Wormwood Trilogy, 1)', N'Rosewater is a town on the edge. A community formed around the edges of a mysterious alien biodome, its residents comprise the hopeful, the hungry, and the helpless -- people eager for a glimpse inside the dome or a taste of its rumored healing powers.', CAST(N'2018-09-18T00:00:00.000' AS DateTime), 27, 10.49, 2, N'Tade Thompson')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (6, N'The Last Russian Doll', N'A haunting, epic novel about betrayal, revenge, and redemption that follows three generations of Russian women, from the 1917 revolution to the last days of the Soviet Union, and the enduring love story at the center.', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 21, 19.99, 1, N'Kristen Loesch')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (7, N'The Whip: a novel inspired by the story of Charley Parkhurst', N'The Whip is inspired by the true story of a woman, Charlotte "Charley" Parkhurst (1812-1879) who lived most of her extraordinary life as a man in the old west. As a young woman in Rhode Island, she fell in love with a runaway slave and had his child. The destruction of her family drove her west to California, dressed as a man, to track the killer.
', CAST(N'2011-12-31T00:00:00.000' AS DateTime), 5, 20.71, 3, N'Karen Kondazian')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (8, N'Where the Lost Wander: A Novel', N'In this epic and haunting love story set on the Oregon Trail, a family and their unlikely protector find their way through peril, uncertainty, and loss.', CAST(N'2020-04-28T00:00:00.000' AS DateTime), 12, 8.28, 3, N'Amy Harmon')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (9, N'All the Light We Cannot See: A Novel', N'Winner of the Pulitzer Prize* A New York Times Book Review Top Ten Book* A National Book Award Finalist', CAST(N'2017-04-04T00:00:00.000' AS DateTime), 30, 16.43, 3, N'Anthony Doerr')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (10, N'Dave Ramsey''s Complete Guide To Money', N'Dave Ramsey’s Complete Guide to Money offers the ultra-practical way to learn how money works.', CAST(N'2012-01-01T00:00:00.000' AS DateTime), 7, 12.09, 4, N'Dave Ramsey')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (11, N'How to Manage Your Money When You Don''t Have Any', N'Unlike many personal finance books, How to Manage Your Money When You Don''t Have Any was specifically written for Americans who struggle to make it on a monthly basis. It provides a respectful, no-nonsense look at the difficult realities of our modern economy, along with an easy to follow path toward better financial stability that will give hope to even the most financially strapped households. Created by a financial expert who hasn''t struck it rich, How to Manage Your Money When You Don''t Have Any offers a first hand..', CAST(N'2012-06-07T00:00:00.000' AS DateTime), 3, 11.99, 4, N'Mr Erik Wecks')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (12, N'Clever Girl Finance: Ditch debt, save money and build real wealth', N'Join the ranks of thousands of smart and savvy women who have turned to money expert and author Bola Sokunbi for guidance on ditching debt, saving money, and building real wealth.', CAST(N'2019-06-25T00:00:00.000' AS DateTime), 17, 14.99, 4, N'Bola Sokunbi')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (13, N'Growing Money', N'Colin and Devon are cousins who share the same birthday. On their eighth birthday, their grandpa gifts them two envelopes of money to do anything they like with it.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), 29, 11.99, 4, N'Brandon L Parker')
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [ReleaseDate], [Quantity], [Price], [BookCategoryId], [Author]) VALUES (14, N'Clever Girl Finance: Learn How Investing Works, Grow Your Money', N'Clever Girl Finance: Learn How Investing Works, Grow Your Money is the leading guide for women who seek to learn the basic foundations of personal investing. In a no-nonsense and straightforward style, this book teaches readers.', CAST(N'2020-10-02T00:00:00.000' AS DateTime), 19, 13.6, 4, N'Bola Sokunbi')
GO
INSERT [dbo].[BookManagementMember] ([MemberId], [Password], [Email], [FullName], [MemberRole]) VALUES (1, N'thuandeptry', N'thuan', N'Administrator', 1)
INSERT [dbo].[BookManagementMember] ([MemberId], [Password], [Email], [FullName], [MemberRole]) VALUES (2, N'Staff@zxc123', N'221102402gmail.com', N'thuận', 2)
INSERT [dbo].[BookManagementMember] ([MemberId], [Password], [Email], [FullName], [MemberRole]) VALUES (3, N'Member@qww11', N'22110129gmail.com', N'nghĩa', 3)
INSERT [dbo].[BookManagementMember] ([MemberId], [Password], [Email], [FullName], [MemberRole]) VALUES (4, N'Member@qasa', N'22110250gmail.com', N'Phát', 3)
INSERT [dbo].[BookManagementMember] ([MemberId], [Password], [Email], [FullName], [MemberRole]) VALUES (5, N'bao', N'bao', N'Administrator', 1)
GO
INSERT [dbo].[BookType] ([BookCategoryId], [BookGenreType], [Description]) VALUES (1, N'Fiction', N'Fiction is any imaginative creative work, primarily any narrative, that depicts individuals, events, or places in ways that are either imaginary or fantastical.')
INSERT [dbo].[BookType] ([BookCategoryId], [BookGenreType], [Description]) VALUES (2, N'Science Fiction', N'Science fiction is a genre of speculative fiction, which typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, and extraterrestrial life.')
INSERT [dbo].[BookType] ([BookCategoryId], [BookGenreType], [Description]) VALUES (3, N'Historical Fiction', N'Historical fiction is a literary genre in which the plot takes place in a setting related to the past events, but is fictional.')
INSERT [dbo].[BookType] ([BookCategoryId], [BookGenreType], [Description]) VALUES (4, N'Finance', N'Finance is a field that deals with the study of investments. It includes the dynamics of assets and liabilities over time under conditions of different degrees of uncertainty and risk. Finance can also be defined as the science of money management. Finance aims to price assets based on their risk level and their expected rate of return.')
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookCategory] FOREIGN KEY([BookCategoryId])
REFERENCES [dbo].[BookType] ([BookCategoryId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookCategory]
GO
USE [master]
GO
ALTER DATABASE [LibaryManagement] SET  READ_WRITE 
GO
