USE [master]
GO
/****** Object:  Database [web_store]    Script Date: 12/17/2021 14:26:53 ******/
CREATE DATABASE [web_store] ON  PRIMARY 
( NAME = N'web_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\web_store.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'web_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\web_store_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [web_store] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [web_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [web_store] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [web_store] SET ANSI_NULLS OFF
GO
ALTER DATABASE [web_store] SET ANSI_PADDING OFF
GO
ALTER DATABASE [web_store] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [web_store] SET ARITHABORT OFF
GO
ALTER DATABASE [web_store] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [web_store] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [web_store] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [web_store] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [web_store] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [web_store] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [web_store] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [web_store] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [web_store] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [web_store] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [web_store] SET  DISABLE_BROKER
GO
ALTER DATABASE [web_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [web_store] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [web_store] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [web_store] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [web_store] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [web_store] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [web_store] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [web_store] SET  READ_WRITE
GO
ALTER DATABASE [web_store] SET RECOVERY SIMPLE
GO
ALTER DATABASE [web_store] SET  MULTI_USER
GO
ALTER DATABASE [web_store] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [web_store] SET DB_CHAINING OFF
GO
USE [web_store]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[email] [varchar](50) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [varchar](10) NOT NULL,
	[name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Review](
	[id] [varchar](50) NOT NULL,
	[writer] [varchar](50) NOT NULL,
	[imagie] [varchar](1000) NOT NULL,
	[category] [varchar](10) NOT NULL,
	[content] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [varchar](10) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[price] [float] NOT NULL,
	[unit] [varchar](20) NOT NULL,
	[category] [varchar](10) NOT NULL,
	[imagie] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[supplier] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale](
	[product] [varchar](10) NOT NULL,
	[percentage] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/17/2021 14:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cart](
	[product] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[customer] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Review_Categories]    Script Date: 12/17/2021 14:26:54 ******/
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Categories] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Categories]
GO
/****** Object:  ForeignKey [FK_Product_Categories]    Script Date: 12/17/2021 14:26:54 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
/****** Object:  ForeignKey [FK_Sale_Product]    Script Date: 12/17/2021 14:26:54 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
/****** Object:  ForeignKey [FK_cart_Account]    Script Date: 12/17/2021 14:26:54 ******/
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_Account] FOREIGN KEY([customer])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_Account]
GO
/****** Object:  ForeignKey [FK_cart_Product]    Script Date: 12/17/2021 14:26:54 ******/
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_Product] FOREIGN KEY([product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_Product]
GO
