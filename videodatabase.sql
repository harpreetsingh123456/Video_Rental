USE [master]
GO
/****** Object:  Database [videodatabase]    Script Date: 7/12/2019 2:08:26 AM ******/
CREATE DATABASE [videodatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'videodatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\videodatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'videodatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\videodatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [videodatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videodatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videodatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videodatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videodatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videodatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videodatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [videodatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [videodatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videodatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videodatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videodatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videodatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videodatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videodatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videodatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videodatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videodatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videodatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videodatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videodatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videodatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videodatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videodatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videodatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [videodatabase] SET  MULTI_USER 
GO
ALTER DATABASE [videodatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videodatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videodatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videodatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [videodatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [videodatabase] SET QUERY_STORE = OFF
GO
USE [videodatabase]
GO
/****** Object:  Table [dbo].[RentalMovies]    Script Date: 7/12/2019 2:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalMovies](
	[RMID] [int] IDENTITY(1,1) NOT NULL,
	[MovieIDFK] [int] NULL,
	[CustIDFK] [int] NULL,
	[DateRented] [date] NULL,
	[DateReturned] [date] NULL,
	[Rent_Per_Day] [money] NULL,
	[Number_Of_Days] [int] NULL,
	[Total_Charge] [money] NULL,
 CONSTRAINT [PK_RentalMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RentOutMovies]    Script Date: 7/12/2019 2:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RentOutMovies]
AS
SELECT        RMID, MovieIDFK, CustIDFK, DateRented, DateReturned, Rent_Per_Day, Number_Of_Days, Total_Charge
FROM            dbo.RentalMovies
WHERE        (DateReturned IS NULL)
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/12/2019 2:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/12/2019 2:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [varchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Rental_Cost] [int] NULL,
	[Copies] [nvarchar](50) NULL,
	[Plot] [ntext] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (3, N'Gurdeep', N'Singh', N'5Browns Rd, Manurewa', 978753423)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (10, N'Bikram', N'Singh', N'5Browns Rd, Papakura', 978753423)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (12, N'Vicky', N'Singh', N'10 South Rd, Papatoetoe', 878753424)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (14, N'John', N'Smith', N'7East Rd, Manurewa', 878757777)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (15, N'Fono ', N'Misi', N'6 Queen Street,Auckland', 870000777)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (16, N'Ahmed', N'Qurashi', N'66 Frizoy St,Homai', 870008867)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (17, N'Teena', N'Sharma', N'55 Russel Rd, Takanini', 870008867)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (18, N'Deepak', N'Bhatia', N'8 Ferry Rd, Takanini', 986548867)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (19, N'Baljeet', N'Singh', N'11 Prince Ave, Wellington', 986548888)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (20, N'Kristle', N'Wilson', N'4 Queen  Ave, Otahuhu', 983338888)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (21, N'Vicky ', N'Singh', N'5 Punjab Street,Auckland', 870000000)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (22, N'Rupinder', N'Singh', N'105, Great South Rd,Auckland', 990000000)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (23, N'Daniel', N'Jordan', N'33 Astor Ave, Bombay', 990058595)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (24, N'Micheal', N'Holder', N'26 Onehunga Ave, Handerson', 995567595)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (25, N'Jaison', N'Huge', N'26 king Ave, Waikiki', 995567588)
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (26, N'Bikram', N'Singh', N'5Browns Rd, Papakura', 978753423)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (1, N'4.5/5', N'Iron Man', N'2008', 2, N'7', N'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', N'Action,Adventure,Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (4, N'5/5', N'Spider Man', N'2002', 2, N'15', N'When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.', N'Action,Adventure,Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (5, N'3/5', N'Batman v/s Superman', N'2016', 5, N'1', N'Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.', N'Action, Adventure, Fantansy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (6, N'5/5', N'Avatar', N'2009', 2, N'4', N' paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', N'Action,Advenrure,Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (7, N'5/5', N'3 Idiots', N'2009', 2, N'1', N'Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them "idiots".', N'Comedy, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (8, N'4.5/5', N'Krissh', N'2006', 2, N'6', N'Krishna is forced by circumstances to use his superpowers and become a masked superhero, Krrish, before getting drawn towards his lost legacy.', N'Action,Adventure,Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (9, N'3/5', N'Thugs Of Hindustan', N'2018', 5, N'1', N'In the 18th century, the British East India Company is pitted against Khudabaksh, a "Thug of the Seas" fighting to liberate his country. The English, not knowing how to defeat him, call on a talented con artist, Firangi Mallah.', N'Action,Adventure')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (10, N'4/5', N'Fury', N'2014', 5, N'4', N'stories moves around war', N'Action,Drama ,War')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (11, N'5/5', N'Dangal', N'2016', 5, N'7', N'Former wrestler Mahavir Singh Phogat and his two wrestler daughters struggle towards glory at the Commonwealth Games in the face of societal oppression.', N'Action, Biography, Drama ')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (12, N'4.5/5', N'Ek Tha Tiger', N'2012', 2, N'7', N'India''s top spy Tiger and his love Zoya battle the dark world of intelligence and espionage that forbids its soldiers from loving the enemy.', N'Action, Romance, Thriller ')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (13, N'5/5', N'Sajjan Singh Rangroot', N'2018', 5, N'9', N'A Sikh serving in the British Indian Army is deputed to Europe to fight in World War I.', N'Action, Biography, Drama ')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (15, N'4.5/5', N'Manje Bistre', N'2017', 5, N'4', N'While getting prepared for his sister''s wedding, a young man attempts to woo a girl whose marriage to another man has already been fixed.', N'Comedy , Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (16, N'5/5', N'Carry on Jatta', N'2012', 2, N'4', N'A young woman is considering marrying a man who has no family.', N'Comedy,Adventure')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (17, N'5/5', N'Carry on Jatta 2', N'2018', 5, N'3', N'''Carry On Jatta'' is an Punjabi romantic comedy starring Gippy Grewal and Mahie Gill in the leading roles. It revolves around the confusing and comic events that arise after Jass lies to Mahie about his family in order to marry her.', N'Comedy,Adventure')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (18, N'5/5', N'Angrej', N'2015', 5, N'7', N'A thoughtful young man struggles to find a woman to marry.', N'Comedy, Romance')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (19, N'4/5', N'Housefull', N'2010', 2, N'4', N'Believing himself to be jinxed, a man attempts to find true love, but instead gets caught in a web of lies.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (20, N'4.5/5', N'Housefull 2', N'2012', 2, N'5', N'A comedy of errors wherein four men help each other to fool their prospective father-in-laws creating a cascade of confusion and mayhem.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (21, N'3.5/5', N'Housefull 5', N'2016', 5, N'4', N'A father doesn''t want his three daughters to get married. Now, it''s up to three men to try to and convince the father that they''re a good fit for his daughters.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (22, N'5/5', N'Avengers', N'2018', 5, N'4', N'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', N'Action, Adventure, Fantasy ')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (23, N'4.5/5', N'Avengers Age of Ultron', N'2015', 5, N'5', N'When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it''s up to Earth''s mightiest heroes to stop the villainous Ultron from enacting his terrible plan.', N'Action, Adventure, Fantasy ')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (24, N'4/5', N'The Avengers', N'2012', 2, N'3', N'Earth''s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', N'Action, Adventure, Fantasy ')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentalMovies] ON 

INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (16, 3, 3, CAST(N'2018-12-11' AS Date), CAST(N'2018-12-12' AS Date), 5.0000, 1, 5.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (17, 9, 10, CAST(N'2018-11-30' AS Date), CAST(N'9898-03-25' AS Date), 5.0000, 2877861, 14389305.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (18, 4, 14, CAST(N'2018-12-11' AS Date), CAST(N'2018-12-11' AS Date), 2.0000, 0, 2.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (19, 3, 10, CAST(N'2018-12-11' AS Date), CAST(N'2018-12-12' AS Date), 5.0000, 1, 5.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (20, 1, 10, CAST(N'2018-12-01' AS Date), CAST(N'2018-12-12' AS Date), 2.0000, 11, 22.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (21, 5, 12, CAST(N'2018-10-11' AS Date), CAST(N'2018-12-12' AS Date), 5.0000, 62, 310.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (22, 5, 15, CAST(N'2018-11-30' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (23, 18, 25, CAST(N'2018-10-21' AS Date), CAST(N'2018-12-12' AS Date), 5.0000, 52, 260.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (24, 9, 24, CAST(N'2018-12-11' AS Date), CAST(N'2019-09-28' AS Date), 5.0000, 291, 1455.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (25, 23, 25, CAST(N'2018-11-21' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (26, 19, 20, CAST(N'2018-11-25' AS Date), CAST(N'2018-12-12' AS Date), 2.0000, 17, 34.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (27, 22, 23, CAST(N'2018-11-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (28, 6, 23, CAST(N'2018-10-17' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (29, 4, 10, CAST(N'2018-12-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (30, 1, 3, CAST(N'2018-11-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (31, 23, 21, CAST(N'2018-12-05' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (32, 15, 18, CAST(N'2018-11-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (33, 13, 3, CAST(N'2018-12-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (34, 12, 17, CAST(N'2018-12-08' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (35, 7, 25, CAST(N'2018-10-01' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (36, 10, 19, CAST(N'2018-12-02' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (37, 9, 16, CAST(N'2018-10-02' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (38, 24, 15, CAST(N'2018-11-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (39, 4, 12, CAST(N'2018-11-17' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (40, 9, 22, CAST(N'2018-10-11' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (41, 21, 22, CAST(N'2018-11-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (42, 17, 14, CAST(N'2018-12-04' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (43, 1, 21, CAST(N'2018-12-05' AS Date), CAST(N'2018-12-12' AS Date), 2.0000, 7, 14.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (44, 23, 17, CAST(N'2018-12-12' AS Date), CAST(N'2018-12-12' AS Date), 5.0000, 0, 5.0000)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (45, 7, 22, CAST(N'2018-12-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (46, 7, 18, CAST(N'2018-12-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (47, 7, 12, CAST(N'2018-12-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (48, 4, 14, CAST(N'2018-12-11' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (49, 9, 10, CAST(N'2018-11-30' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[RentalMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rent_Per_Day], [Number_Of_Days], [Total_Charge]) VALUES (50, 7, 16, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RentalMovies] OFF
/****** Object:  StoredProcedure [dbo].[DeleteMovie]    Script Date: 7/12/2019 2:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMovie]
	@MovieID int 
AS
	Delete from Movies where MovieID like @MovieID
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [videodatabase] SET  READ_WRITE 
GO
