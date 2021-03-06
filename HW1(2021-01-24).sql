USE [master]
GO
/****** Object:  Database [Filmler]    Script Date: 22.01.2021 20:38:47 ******/
CREATE DATABASE [Filmler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Filmler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Filmler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Filmler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Filmler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Filmler] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Filmler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Filmler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Filmler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Filmler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Filmler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Filmler] SET ARITHABORT OFF 
GO
ALTER DATABASE [Filmler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Filmler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Filmler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Filmler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Filmler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Filmler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Filmler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Filmler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Filmler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Filmler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Filmler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Filmler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Filmler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Filmler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Filmler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Filmler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Filmler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Filmler] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Filmler] SET  MULTI_USER 
GO
ALTER DATABASE [Filmler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Filmler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Filmler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Filmler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Filmler] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Filmler] SET QUERY_STORE = OFF
GO
USE [Filmler]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](200) NOT NULL,
	[YapimYili] [char](4) NOT NULL,
	[Gisesi] [money] NOT NULL,
	[Yonetmen_Id] [int] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmOyuncuKarakter]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmOyuncuKarakter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Film_Id] [int] NOT NULL,
	[Oyuncu_Id] [int] NOT NULL,
	[Karakter_Id] [int] NOT NULL,
 CONSTRAINT [PK_FilmOyuncuKarakter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmTur]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmTur](
	[Film_Id] [int] NOT NULL,
	[Tur_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karakter]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karakter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Karakter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncu]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[Soyadi] [varchar](50) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
 CONSTRAINT [PK_Oyuncu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tur]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetmen]    Script Date: 22.01.2021 20:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetmen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[Soyadi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Yonetmen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (6, N'Inglourious Basterds', N'2009', 20000000.0000, 3)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (7, N'The Dark Knight', N'2008', 30000000.0000, 1)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (8, N'The Wolf of Wall Street', N'2014', 35000000.0000, 2)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (9, N'Avatar', N'2009', 45000000.0000, 6)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (10, N'Inception', N'2010', 54000000.0000, 1)
INSERT [dbo].[Film] ([Id], [Adi], [YapimYili], [Gisesi], [Yonetmen_Id]) VALUES (11, N'Fight Club', N'1999', 29000000.0000, 5)
SET IDENTITY_INSERT [dbo].[Film] OFF
SET IDENTITY_INSERT [dbo].[FilmOyuncuKarakter] ON 

INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (1, 6, 1, 1)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (2, 7, 2, 2)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (3, 8, 3, 3)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (4, 9, 4, 4)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (5, 10, 5, 5)
INSERT [dbo].[FilmOyuncuKarakter] ([Id], [Film_Id], [Oyuncu_Id], [Karakter_Id]) VALUES (6, 11, 6, 6)
SET IDENTITY_INSERT [dbo].[FilmOyuncuKarakter] OFF
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (6, 1)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (6, 2)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (7, 2)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (7, 5)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (8, 1)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (9, 6)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (10, 5)
INSERT [dbo].[FilmTur] ([Film_Id], [Tur_Id]) VALUES (11, 4)
SET IDENTITY_INSERT [dbo].[Karakter] ON 

INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (1, N'Archie Hicox')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (2, N'Bruce Wayne')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (3, N'Naomi Lapaglia')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (4, N'Neyriti')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (5, N'Cobb')
INSERT [dbo].[Karakter] ([Id], [AdiSoyadi]) VALUES (6, N'Tyler Durden')
SET IDENTITY_INSERT [dbo].[Karakter] OFF
SET IDENTITY_INSERT [dbo].[Oyuncu] ON 

INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (1, N'Michael', N'Fassbender', CAST(N'1977-01-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (2, N'Christian', N'Bale', CAST(N'1974-01-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (3, N'Margot', N'Robbie', CAST(N'1990-01-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (4, N'Zoe ', N'Saldana', CAST(N'1978-01-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (5, N'Leonardo', N'DiCaprio', CAST(N'1974-01-01' AS Date))
INSERT [dbo].[Oyuncu] ([Id], [Adi], [Soyadi], [DogumTarihi]) VALUES (6, N'Brad', N'Pitt', CAST(N'1963-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Oyuncu] OFF
SET IDENTITY_INSERT [dbo].[Tur] ON 

INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (1, N'Aksiyon')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (2, N'Macera')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (3, N'Korku')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (4, N'Dram')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (5, N'Gizem')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (6, N'Bilimkurgu')
SET IDENTITY_INSERT [dbo].[Tur] OFF
SET IDENTITY_INSERT [dbo].[Yonetmen] ON 

INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (1, N'Christopher', N'Nolan')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (2, N'Martin', N'Scorsese')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (3, N'Quentin ', N'Tarantino')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (4, N'Steven ', N'Spielberg')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (5, N'David', N'Fincher')
INSERT [dbo].[Yonetmen] ([Id], [Adi], [Soyadi]) VALUES (6, N'James', N'Cameroon')
SET IDENTITY_INSERT [dbo].[Yonetmen] OFF
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Yonetmen] FOREIGN KEY([Yonetmen_Id])
REFERENCES [dbo].[Yonetmen] ([Id])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Yonetmen]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Film] FOREIGN KEY([Film_Id])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Film]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Karakter] FOREIGN KEY([Karakter_Id])
REFERENCES [dbo].[Karakter] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Karakter]
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter]  WITH CHECK ADD  CONSTRAINT [FK_FilmOyuncuKarakter_Oyuncu] FOREIGN KEY([Oyuncu_Id])
REFERENCES [dbo].[Oyuncu] ([Id])
GO
ALTER TABLE [dbo].[FilmOyuncuKarakter] CHECK CONSTRAINT [FK_FilmOyuncuKarakter_Oyuncu]
GO
ALTER TABLE [dbo].[FilmTur]  WITH CHECK ADD  CONSTRAINT [FK_FilmTur_Film] FOREIGN KEY([Film_Id])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[FilmTur] CHECK CONSTRAINT [FK_FilmTur_Film]
GO
ALTER TABLE [dbo].[FilmTur]  WITH CHECK ADD  CONSTRAINT [FK_FilmTur_Tur] FOREIGN KEY([Tur_Id])
REFERENCES [dbo].[Tur] ([Id])
GO
ALTER TABLE [dbo].[FilmTur] CHECK CONSTRAINT [FK_FilmTur_Tur]
GO
USE [master]
GO
ALTER DATABASE [Filmler] SET  READ_WRITE 
GO
