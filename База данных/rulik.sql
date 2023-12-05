USE [master]
GO
/****** Object:  Database [rulik]    Script Date: 05.12.2023 16:35:35 ******/
CREATE DATABASE [rulik]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rulik', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\rulik.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rulik_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\rulik_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [rulik] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rulik].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rulik] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rulik] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rulik] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rulik] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rulik] SET ARITHABORT OFF 
GO
ALTER DATABASE [rulik] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rulik] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rulik] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rulik] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rulik] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rulik] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rulik] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rulik] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rulik] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rulik] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rulik] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rulik] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rulik] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rulik] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rulik] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rulik] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rulik] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rulik] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rulik] SET  MULTI_USER 
GO
ALTER DATABASE [rulik] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rulik] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rulik] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rulik] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rulik] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rulik] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'rulik', N'ON'
GO
ALTER DATABASE [rulik] SET QUERY_STORE = OFF
GO
USE [rulik]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](100) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[proizvoditel] [nvarchar](100) NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_status] [int] NOT NULL,
	[id_users] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[data] [date] NOT NULL,
	[kod] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] IDENTITY(1,1) NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id_orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 05.12.2023 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [title]) VALUES (1, N'Пункт выдачи 1')
INSERT [dbo].[point] ([id], [title]) VALUES (2, N'Пункт выдачи 2')
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[type_users] ON 

INSERT [dbo].[type_users] ([id], [role]) VALUES (1, N'администратор')
INSERT [dbo].[type_users] ([id], [role]) VALUES (2, N'менеджер')
INSERT [dbo].[type_users] ([id], [role]) VALUES (3, N'клиент')
SET IDENTITY_INSERT [dbo].[type_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'root', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'manager', N'12345', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'client', N'12345', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_sostav] FOREIGN KEY([id_status])
REFERENCES [dbo].[sostav] ([id_orders])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_sostav]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_users] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_users] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_users]
GO
USE [master]
GO
ALTER DATABASE [rulik] SET  READ_WRITE 
GO
