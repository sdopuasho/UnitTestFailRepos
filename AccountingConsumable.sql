USE [master]
GO
/****** Object:  Database [AccountingForConsumables]    Script Date: 11.05.2021 21:16:41 ******/
CREATE DATABASE [AccountingForConsumables]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountingForConsumables', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AccountingForConsumables.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountingForConsumables_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AccountingForConsumables_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AccountingForConsumables] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingForConsumables].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingForConsumables] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingForConsumables] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingForConsumables] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AccountingForConsumables] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingForConsumables] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET RECOVERY FULL 
GO
ALTER DATABASE [AccountingForConsumables] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingForConsumables] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingForConsumables] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingForConsumables] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingForConsumables] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingForConsumables] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AccountingForConsumables', N'ON'
GO
ALTER DATABASE [AccountingForConsumables] SET QUERY_STORE = OFF
GO
USE [AccountingForConsumables]
GO
/****** Object:  Table [dbo].[DeliveredMaterial]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveredMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Delivery] [int] NOT NULL,
	[FK_MaterialCard] [int] NOT NULL,
	[DeliveryQuantity] [int] NOT NULL,
 CONSTRAINT [PK_DeliveredMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_WorkPlace] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](7) NOT NULL,
	[GenderShort] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarization]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Worker] [int] NOT NULL,
	[FK_Warehouse] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Inventarization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCard]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InventNumber] [nvarchar](50) NOT NULL,
	[DateOfDelivery] [datetime] NOT NULL,
	[FK_StatusOfMaterial_id] [int] NULL,
	[FK_Material] [int] NOT NULL,
 CONSTRAINT [PK_MaterialCard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialGroup]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NameOfMaterialGroup] [nvarchar](50) NOT NULL,
	[NameShort] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_MaterialGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialInInventarization]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialInInventarization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Inventarization] [int] NOT NULL,
	[FK_Material] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_MaterialInInventarization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](50) NOT NULL,
	[FK_Manufacturer] [int] NOT NULL,
	[FK_MaterialGroup] [int] NOT NULL,
	[FK_Unit] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsInDelivery]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsInDelivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_MaterialCard] [int] NOT NULL,
	[FK_Replenishment] [int] NOT NULL,
	[MaterialQuantity] [int] NOT NULL,
 CONSTRAINT [PK_MaterialsInDelivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationHystory]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationHystory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Worker] [int] NOT NULL,
	[Operation] [nvarchar](max) NOT NULL,
	[DateTimeOfOperation] [datetime] NOT NULL,
 CONSTRAINT [PK_OperationHystory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Warehouse] [int] NOT NULL,
	[FK_WorkPlace] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedMaterial]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Order] [int] NOT NULL,
	[FK_MaterialCard] [int] NOT NULL,
	[OrderedQuantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderedMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplenishmentOfMaterials]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplenishmentOfMaterials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Warehouse] [int] NOT NULL,
	[ContractNumber] [nvarchar](50) NOT NULL,
	[DateOfAcceptanceToTheWarehouse] [datetime] NOT NULL,
	[FK_Worker] [int] NOT NULL,
	[Certified] [bit] NOT NULL,
 CONSTRAINT [PK_ReplenishmentOfMaterials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_TypeOfRoom] [int] NOT NULL,
	[NumberOfRoom] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOfMaterial]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOfMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NameOfStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOfMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOfWorker]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOfWorker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NameOfStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOfWorker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfRoom]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfRoom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfRoom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[NameShort] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfWarehouse] [nvarchar](50) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[FK_Gender] [int] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FK_StatusOfWorker] [int] NOT NULL,
	[FK_Position] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CheckFirstVisit] [bit] NOT NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkPlace]    Script Date: 11.05.2021 21:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkPlace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Room] [int] NOT NULL,
	[NumberPlace] [int] NOT NULL,
	[FK_Worker] [int] NOT NULL,
 CONSTRAINT [PK_WorkPlace] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveredMaterial] ON 

INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (1, 2, 1, 1)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (2, 4, 2, 2)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (3, 5, 3, 3)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (4, 3, 4, 4)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (5, 1, 5, 5)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (6, 6, 6, 6)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (7, 7, 7, 7)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (8, 8, 8, 8)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (9, 9, 9, 1)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (10, 10, 10, 2)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (11, 11, 11, 3)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (12, 12, 12, 4)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (13, 13, 13, 5)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (14, 14, 14, 6)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (15, 15, 15, 7)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (16, 16, 16, 8)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (17, 17, 17, 1)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (18, 18, 18, 2)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (19, 19, 19, 3)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (20, 20, 20, 4)
INSERT [dbo].[DeliveredMaterial] ([id], [FK_Delivery], [FK_MaterialCard], [DeliveryQuantity]) VALUES (21, 21, 20, 5)
SET IDENTITY_INSERT [dbo].[DeliveredMaterial] OFF
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (1, 1, CAST(N'2021-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (2, 2, CAST(N'2021-02-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (3, 3, CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (4, 4, CAST(N'2021-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (5, 5, CAST(N'2021-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (6, 6, CAST(N'2021-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (7, 7, CAST(N'2021-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (8, 8, CAST(N'2021-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (9, 9, CAST(N'2021-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (10, 10, CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (11, 11, CAST(N'2021-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (12, 12, CAST(N'2021-03-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (13, 13, CAST(N'2021-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (14, 14, CAST(N'2021-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (15, 15, CAST(N'2021-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (16, 16, CAST(N'2021-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (17, 17, CAST(N'2021-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (18, 18, CAST(N'2021-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (19, 19, CAST(N'2021-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (20, 20, CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [FK_WorkPlace], [DeliveryDate]) VALUES (21, 21, CAST(N'2021-04-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [GenderName], [GenderShort]) VALUES (1, N'Мужской', N'М')
INSERT [dbo].[Gender] ([id], [GenderName], [GenderShort]) VALUES (2, N'Женский', N'Ж')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Inventarization] ON 

INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (1, 1, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (2, 2, 2, CAST(N'2021-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (3, 3, 3, CAST(N'2021-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (7, 4, 2, CAST(N'2021-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (8, 5, 1, CAST(N'2021-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (9, 6, 3, CAST(N'2021-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (10, 7, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (11, 8, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (12, 9, 3, CAST(N'2021-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (13, 10, 1, CAST(N'2021-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (17, 2, 2, CAST(N'2021-04-04T14:37:48.207' AS DateTime))
INSERT [dbo].[Inventarization] ([id], [FK_Worker], [FK_Warehouse], [Date]) VALUES (18, 2, 2, CAST(N'2021-04-04T14:40:51.237' AS DateTime))
SET IDENTITY_INSERT [dbo].[Inventarization] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (1, N'Торгово-сервисный центр ООО "АртЛекс"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (2, N'Торгово-сервисный центр ООО "А-Сервис"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (3, N'Торгово-сервисная компания ООО "Дастин"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (4, N'ООО «ИНТАНТ-Сибирь»')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (5, N'Торгово-сервисная фирма ООО "Дарт"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (6, N'Торгово-сервисный центр ООО "Принт-Сервис"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (7, N'Торгово-сервисный центр "Y-Z"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (8, N'ООО "Альянс систем"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (9, N'Торговая компания ООО "Антей"')
INSERT [dbo].[Manufacturer] ([id], [ManufacturerName]) VALUES (10, N'ООО "Фартов"')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[MaterialCard] ON 

INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (1, N'A00000001', CAST(N'2021-01-20T00:00:00.000' AS DateTime), NULL, 21)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (2, N'A00000002', CAST(N'2021-01-21T00:00:00.000' AS DateTime), NULL, 22)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (3, N'A00000003', CAST(N'2021-01-22T00:00:00.000' AS DateTime), NULL, 23)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (4, N'A00000004', CAST(N'2021-01-23T00:00:00.000' AS DateTime), NULL, 24)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (5, N'A00000005', CAST(N'2021-01-25T00:00:00.000' AS DateTime), NULL, 25)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (6, N'A00000006', CAST(N'2021-01-28T00:00:00.000' AS DateTime), NULL, 26)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (7, N'A00000007', CAST(N'2021-01-30T00:00:00.000' AS DateTime), NULL, 27)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (8, N'A00000008', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, 28)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (9, N'A00000009', CAST(N'2021-02-02T00:00:00.000' AS DateTime), NULL, 29)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (10, N'A00000010', CAST(N'2021-02-05T00:00:00.000' AS DateTime), NULL, 30)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (11, N'A00000011', CAST(N'2021-02-06T00:00:00.000' AS DateTime), NULL, 31)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (12, N'A00000012', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, 32)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (13, N'A00000013', CAST(N'2021-02-10T00:00:00.000' AS DateTime), NULL, 33)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (14, N'A00000014', CAST(N'2021-02-13T00:00:00.000' AS DateTime), NULL, 34)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (15, N'A00000015', CAST(N'2021-02-17T00:00:00.000' AS DateTime), NULL, 35)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (16, N'A00000016', CAST(N'2021-02-18T00:00:00.000' AS DateTime), NULL, 36)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (17, N'A00000017', CAST(N'2021-02-19T00:00:00.000' AS DateTime), NULL, 37)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (18, N'A00000018', CAST(N'2021-02-20T00:00:00.000' AS DateTime), NULL, 38)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (19, N'A00000019', CAST(N'2021-02-23T00:00:00.000' AS DateTime), NULL, 39)
INSERT [dbo].[MaterialCard] ([id], [InventNumber], [DateOfDelivery], [FK_StatusOfMaterial_id], [FK_Material]) VALUES (20, N'A00000020', CAST(N'2021-02-24T00:00:00.000' AS DateTime), NULL, 40)
SET IDENTITY_INSERT [dbo].[MaterialCard] OFF
SET IDENTITY_INSERT [dbo].[MaterialGroup] ON 

INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (1, N'Канцелярия', N'КЦ')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (2, N'Картриджи для принтеров', N'КДП')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (3, N'Чернила', N'ЧР')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (4, N'Термопленка', N'ТП')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (5, N'Готовые ремкомплекты', N'ГР')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (6, N'Наборы и средства для очистки', N'НИСДО')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (7, N'Фотобарабаны', N'ФБ')
INSERT [dbo].[MaterialGroup] ([id], [NameOfMaterialGroup], [NameShort]) VALUES (8, N'Прочее', N'ПР')
SET IDENTITY_INSERT [dbo].[MaterialGroup] OFF
SET IDENTITY_INSERT [dbo].[MaterialInInventarization] ON 

INSERT [dbo].[MaterialInInventarization] ([id], [FK_Inventarization], [FK_Material], [Amount]) VALUES (1, 1, 23, 2)
INSERT [dbo].[MaterialInInventarization] ([id], [FK_Inventarization], [FK_Material], [Amount]) VALUES (2, 2, 22, 2)
INSERT [dbo].[MaterialInInventarization] ([id], [FK_Inventarization], [FK_Material], [Amount]) VALUES (3, 2, 22, 2)
SET IDENTITY_INSERT [dbo].[MaterialInInventarization] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (21, N'Бумага для принтера Alhaco A3', 3, 1, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (22, N'Катридж для принтера Epson', 2, 2, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (23, N'Чернила для принтера Melen ', 6, 3, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (24, N'Термопленка Альянс', 4, 4, 6)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (25, N'Ремкомплект для принтера Less', 7, 5, 2)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (26, N'Средство очистки Cantry', 5, 6, 3)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (27, N'Скрепки для степлера Mell', 8, 8, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (28, N'Канцелярский нож', 10, 1, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (29, N'Канцелярские ножницы ', 4, 1, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (30, N'Ремкомплект для факса', 7, 5, 2)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (31, N'Бумага для принтера Alhaco A2', 7, 1, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (32, N'Катридж для принтера HP', 1, 2, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (33, N'Чернила для принтера Leven', 9, 3, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (34, N'Термопленка Skaylet', 4, 4, 6)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (35, N'Скрепки для степлера Setell', 3, 8, 5)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (36, N'Порошок для очистки кресел Mideya', 5, 6, 4)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (37, N'Канцелярский нож', 2, 1, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (38, N'Ремкомплект для принтера Kaily', 7, 5, 2)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (39, N'Катридж для принтера Hellen', 6, 2, 1)
INSERT [dbo].[Materials] ([id], [MaterialName], [FK_Manufacturer], [FK_MaterialGroup], [FK_Unit]) VALUES (40, N'Бумага для принтера Alhaco A2', 1, 1, 5)
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[MaterialsInDelivery] ON 

INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (1, 2, 1, 1)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (2, 3, 2, 2)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (3, 6, 3, 3)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (4, 7, 4, 4)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (5, 3, 5, 5)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (6, 8, 6, 6)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (7, 9, 7, 7)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (8, 10, 8, 8)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (9, 13, 9, 9)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (10, 12, 10, 10)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (11, 7, 11, 11)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (12, 2, 12, 12)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (13, 10, 13, 13)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (14, 16, 14, 14)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (15, 18, 15, 15)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (16, 15, 16, 16)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (17, 12, 17, 17)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (18, 11, 18, 18)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (19, 18, 19, 19)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (20, 5, 20, 20)
INSERT [dbo].[MaterialsInDelivery] ([id], [FK_MaterialCard], [FK_Replenishment], [MaterialQuantity]) VALUES (21, 6, 21, 21)
SET IDENTITY_INSERT [dbo].[MaterialsInDelivery] OFF
SET IDENTITY_INSERT [dbo].[OperationHystory] ON 

INSERT [dbo].[OperationHystory] ([id], [FK_Worker], [Operation], [DateTimeOfOperation]) VALUES (1, 1, N'Авторизация в системе', CAST(N'2021-05-11T09:54:42.163' AS DateTime))
INSERT [dbo].[OperationHystory] ([id], [FK_Worker], [Operation], [DateTimeOfOperation]) VALUES (2, 1, N'Авторизация в системе', CAST(N'2021-05-11T11:52:14.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[OperationHystory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (1, 1, 1)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (2, 2, 2)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (3, 3, 3)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (4, 1, 4)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (5, 2, 5)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (6, 3, 6)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (7, 1, 7)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (8, 2, 8)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (9, 3, 9)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (10, 1, 10)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (11, 2, 11)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (12, 3, 12)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (13, 1, 13)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (14, 2, 14)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (15, 3, 15)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (16, 1, 16)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (17, 2, 17)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (18, 3, 18)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (19, 1, 19)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (20, 2, 20)
INSERT [dbo].[Order] ([id], [FK_Warehouse], [FK_WorkPlace]) VALUES (21, 3, 21)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderedMaterial] ON 

INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (1, 1, 2, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (2, 2, 4, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (3, 3, 6, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (4, 4, 8, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (5, 5, 10, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (6, 6, 12, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (7, 7, 14, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (8, 8, 16, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (9, 9, 18, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (10, 10, 3, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (11, 11, 5, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (12, 12, 7, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (13, 13, 9, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (14, 14, 11, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (15, 15, 13, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (16, 16, 15, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (17, 17, 17, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (18, 18, 19, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (19, 19, 2, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (20, 20, 5, 1)
INSERT [dbo].[OrderedMaterial] ([id], [FK_Order], [FK_MaterialCard], [OrderedQuantity]) VALUES (21, 21, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderedMaterial] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([id], [PositionName]) VALUES (1, N'Директор')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (2, N'Офисный сотрудник')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (3, N'Администратор вычислительной сети')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (4, N'Администратор баз данных')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (5, N'Аналитик программного обеспечения')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (6, N'Веб-мастер')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (7, N'Ведущий программист')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (8, N'Директор по информационным технологиям')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (9, N'Контент-менеджер')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (10, N'Руководитель цифровой трансформации')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (11, N'Системный администратор')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (12, N'Системный аналитик')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (13, N'Тестировщик')
INSERT [dbo].[Position] ([id], [PositionName]) VALUES (14, N'Менеджер по персоналу')
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[ReplenishmentOfMaterials] ON 

INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (1, 1, N'УП0004', CAST(N'2021-01-12T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (2, 2, N'УП0005', CAST(N'2021-01-14T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (3, 3, N'УП0006', CAST(N'2021-01-15T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (4, 1, N'УП0007', CAST(N'2021-01-18T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (5, 2, N'УП0008', CAST(N'2021-01-19T00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (6, 3, N'УП0009', CAST(N'2021-01-22T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (7, 1, N'УП0010', CAST(N'2021-01-25T00:00:00.000' AS DateTime), 8, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (8, 2, N'УП0011', CAST(N'2021-01-27T00:00:00.000' AS DateTime), 9, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (9, 3, N'УП0012', CAST(N'2021-01-28T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (10, 1, N'УП0013', CAST(N'2021-01-29T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (11, 2, N'УП0014', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 12, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (12, 3, N'УП0015', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 13, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (13, 1, N'УП0016', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 14, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (14, 2, N'УП0017', CAST(N'2021-02-09T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (15, 3, N'УП0018', CAST(N'2021-02-10T00:00:00.000' AS DateTime), 16, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (16, 1, N'УП0019', CAST(N'2021-02-11T00:00:00.000' AS DateTime), 17, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (17, 2, N'УП0020', CAST(N'2021-02-12T00:00:00.000' AS DateTime), 18, 1)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (18, 3, N'УП0021', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 19, 0)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (19, 1, N'УП0022', CAST(N'2021-02-16T00:00:00.000' AS DateTime), 20, 0)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (20, 2, N'УП0023', CAST(N'2021-02-17T00:00:00.000' AS DateTime), 21, 0)
INSERT [dbo].[ReplenishmentOfMaterials] ([id], [FK_Warehouse], [ContractNumber], [DateOfAcceptanceToTheWarehouse], [FK_Worker], [Certified]) VALUES (21, 3, N'УП0024', CAST(N'2021-02-19T00:00:00.000' AS DateTime), 22, 0)
SET IDENTITY_INSERT [dbo].[ReplenishmentOfMaterials] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (15, 1, 1)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (16, 1, 2)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (17, 2, 1)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (18, 2, 2)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (19, 2, 3)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (20, 2, 4)
INSERT [dbo].[Room] ([id], [FK_TypeOfRoom], [NumberOfRoom]) VALUES (21, 2, 5)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[StatusOfWorker] ON 

INSERT [dbo].[StatusOfWorker] ([id], [NameOfStatus]) VALUES (1, N'Заархивирован')
INSERT [dbo].[StatusOfWorker] ([id], [NameOfStatus]) VALUES (2, N'Активен')
INSERT [dbo].[StatusOfWorker] ([id], [NameOfStatus]) VALUES (3, N'Не активен')
SET IDENTITY_INSERT [dbo].[StatusOfWorker] OFF
SET IDENTITY_INSERT [dbo].[TypeOfRoom] ON 

INSERT [dbo].[TypeOfRoom] ([id], [RoomType]) VALUES (1, N'Склад')
INSERT [dbo].[TypeOfRoom] ([id], [RoomType]) VALUES (2, N'Офис')
SET IDENTITY_INSERT [dbo].[TypeOfRoom] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (1, N'Штука', N'шт')
INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (2, N'Комплект', N'компл')
INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (3, N'Литр', N'л')
INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (4, N'Килограмм', N'кг')
INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (5, N'Упаковка', N'упак')
INSERT [dbo].[Unit] ([id], [UnitName], [NameShort]) VALUES (6, N'Метр', N'м')
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([id], [NumberOfWarehouse], [ContactNumber]) VALUES (1, N'1', N'+7(3822)938-009')
INSERT [dbo].[Warehouse] ([id], [NumberOfWarehouse], [ContactNumber]) VALUES (2, N'2', N'+7(3822)23-13-25')
INSERT [dbo].[Warehouse] ([id], [NumberOfWarehouse], [ContactNumber]) VALUES (3, N'3', N'+7(3822)788-588')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (1, N'Мальцев', N'Сергей', N'Алиевич', 1, N'+7(927)988-43-97', N'hitcomlog@gmail.com', 2, 2, N'Abc#2', N'Abc#2', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (2, N'Давыдов', N'Фёдор', N'Петрович', 1, N'+7(982)128-53-19', N'hr6zdl@yandex.ru', 2, 2, N'Taucage', N' xTpiM1lE', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (3, N'Крылов', N'Алексей', N'Петрович', 1, N'+7(951)597-82-58', N'kaft93x@outlook.com', 2, 4, N'Gallador', N' rdeTkTX4', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (4, N'Бессонов', N'Платон', N'Дмитриевич', 1, N'+7(928)592-74-42', N'dcu@yandex.ru', 2, 6, N'Whitebinder', N' fs6QWwZR', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (5, N'Григорьев', N'Владислав', N'Андреевич', 1, N'+7(969)278-67-69', N'19dn@outlook.com', 2, 6, N'Gavihuginn', N' wpbQGaFu', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (6, N'Соколова', N'Ярослава', N'Артёмовна', 2, N'+7(993)934-18-10', N'pa5h@mail.ru', 2, 2, N'Drelahuginn', N' CudoFWgW', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (7, N'Иванов', N'Павел', N'Платонович', 1, N'+7(909)485-33-61', N'281av0@gmail.com', 3, 2, N'Doomhammer', N' f0te9xDN', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (8, N'Лебедев', N'Артём', N'Алексеевич', 1, N'+7(966)719-24-91', N'8edmfh@outlook.com', 1, 7, N'Yoshura', N' UzTVTaz5', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (9, N'Владимирова', N'Мария', N'Владимировна', 2, N'+7(976)160-34-20', N'sfn13i@mail.ru', 2, 7, N'Kazrataur', N' n8PNmbg0', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (10, N'Назаров', N'Степан', N'Тимофеевич', 1, N'+7(960)676-61-32', N'g0orc3x1@outlook.com', 2, 9, N'Thojurus', N' oGSop2qM', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (11, N'Кузнецов', N'Максим', N'Ильич', 1, N'+7(961)924-21-86', N'rv7bp@gmail.com', 1, 11, N'Andromafyn', N'yJXJLTpu', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (12, N'Потапова', N'Ева', N'Андреевна', 2, N'+7(945)574-79-74', N'93@outlook.com', 2, 11, N'Sadal', N' hX9Xt8UM', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (13, N'Волков', N'Юрий', N'Андреевич', 1, N'+7(999)971-89-61', N'er@gmail.com', 2, 13, N'Kelv', N' 6wehuRpx', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (14, N'Шарова', N'Алиса', N'Артёмовна', 2, N'+7(927)147-78-10', N'o0my@gmail.com', 2, 12, N'Gamath', N' PkGPSjki', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (15, N'Толкачева', N'Ксения', N'Тимофеевна', 2, N'+7(998)399-44-61', N'715qy08@gmail.com', 3, 2, N'Ballasius', N' X2JRbWqD', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (16, N'Алексеев', N'Роман', N'Ярославович', 1, N'+7(943)666-89-11', N'vubx0t@mail.ru', 2, 2, N'Mazurisar', N' 7tUbAO1x', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (17, N'Иванов', N'Максим', N'Кириллович', 1, N'+7(936)291-52-18', N'wnhborq@outlook.com', 2, 2, N'Dalar', N' gt6fAgWX', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (18, N'Смирнов', N'Алексей', N'Савельевич', 1, N'+7(915)104-53-73', N'gq@yandex.ru', 2, 11, N'Munizar', N' NMZ4YdAx', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (19, N'Крылов', N'Евгений', N'Михайлович', 1, N'+7(963)716-22-54', N'ic0pu@outlook.com', 2, 2, N'Gozil', N' yTqu75QF', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (20, N'Рыбакова', N'Амина', N'Мироновна', 2, N'+7(917)289-46-93', N'o7khr@yandex.ru', 2, 2, N'Cerad', N' C3OIyM8h', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (21, N'Попова', N'Мария', N'Ивановна', 2, N'+7(952)997-21-04', N'2shlaq@outlook.com', 2, 2, N'Tashicage', N'm0q7tsX2', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (22, N'Ковалев', N'Филипп', N'Георгиевич', 1, N'+7(952)383-14-46', N'cdbw@yandex.ru', 1, 4, N'Sainis', N' hiUkWkGi', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (23, N'Нефедова', N'Анастасия', N'Георгиевна', 2, N'+7(952)215-01-11', N'wrts90puk@yandex.ru', 2, 6, N'Auribor', N' BHpGmOMs', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (24, N'Воробьева', N'Алёна', N'Тимофеевна', 2, N'+7(952)745-12-38', N'yxunv@gmail.com', 2, 7, N'Dazius', N' H82drMQs', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (25, N'Овчинникова', N'Валерия', N'Даниловна', 2, N'+7(952)364-46-87', N'7y@yandex.ru', 2, 7, N'Burirdana', N' kPikJcu5', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (26, N'Егорова', N'Мария', N'Семёновна', 2, N'+7(952)701-25-77', N'6@mail.ru', 2, 12, N'Ariuzius', N' 2lHqSLJL', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (27, N'Мельников', N'Михаил', N'Маркович', 1, N'+7(952)928-03-08', N'k8sjebg1y@mail.ru', 3, 2, N'Bluecliff', N' 95nYGiJg', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (28, N'Степанова', N'Анна', N'Константиновна', 2, N'+7(952)442-77-09', N'jirbold@gmail.com', 2, 12, N'Zara', N' 4CKH5fzj', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (29, N'Панова', N'Ксения', N'Максимовна', 2, N'+7(952)635-31-34', N'u7yhwf1vb@mail.ru', 2, 2, N'Mavekelv', N' bYZmbMod', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (30, N'Федоров', N'Сергей', N'Матвеевич', 1, N'+7(952)361-94-87', N'f@outlook.com', 1, 2, N'Kulasius', N' CEef3dGx', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (31, N'Орлова', N'Полина', N'Антоновна', 2, N'+7(923)981-85-67', N'gjkhp@mail.ru', 2, 2, N'Zulkira', N'Sc2EL65Q', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (32, N'Кравцов', N'Серафим', N'Михайлович', 1, N'+7(923)405-04-36', N'wyalkxfde@gmail.com', 2, 2, N'Malazel', N' La2f5E7E', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (33, N'Чернова', N'Василиса', N'Дмитриевна', 2, N'+7(923)872-16-03', N'f245n@outlook.com', 2, 2, N'Kathrinin', N' aEaQglST', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (34, N'Шувалова', N'Полина', N'Ивановна', 2, N'+7(923)122-65-81', N'w@outlook.com', 2, 2, N'Bloodskin', N' djosbZNn', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (35, N'Попова', N'Аиша', N'Данииловна', 2, N'+7(923)633-20-04', N'js3kyopz@mail.ru', 3, 2, N'Goldstalker', N' JfnqanKb', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (36, N'Иванова', N'Анастасия', N'Михайловна', 2, N'+7(923)094-53-12', N'o@outlook.com', 2, 9, N'Nazius', N' gPtm5EwO', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (37, N'Лебедева', N'Ева', N'Максимовна', 2, N'+7(923)854-55-70', N'uzfd@mail.ru', 1, 2, N'Saithinadar', N' hft8jfu0', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (38, N'Никонова', N'Вероника', N'Петровна', 2, N'+7(923)022-51-40', N'g@mail.ru', 2, 7, N'Painterror', N' IxsAzBbk', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (39, N'Николаева', N'Анна', N'Эмировна', 2, N'+7(923)730-83-53', N'dvjf0@gmail.com', 3, 2, N'Dawnseeker', N' NvYqSp4v', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (40, N'Зотов', N'Артём', N'Кириллович', 1, N'+7(923)589-89-21', N'd2mc@outlook.com', 2, 2, N'Dousar', N' Jsb1IC4I', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (41, N'Сахарова', N'Мария', N'Максимовна', 2, N'+7(906)961-18-94', N'06lk@mail.ru', 2, 2, N'Granigar', N'jGirGyzQ', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (42, N'Титов', N'Мирослав', N'Арсентьевич', 1, N'+7(906)742-19-87', N'emhzysf2@yandex.ru', 2, 7, N'Bladeredeemer', N' I9SWRYPo', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (43, N'Лобанов', N'Кирилл', N'Богданович', 1, N'+7(951)615-20-62', N'd1w28lkg@yandex.ru', 2, 2, N'Spellmane', N' uMDhvhyV', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (44, N'Рожков', N'Даниил', N'Максимович', 1, N'+7(951)309-72-08', N't93@mail.ru', 2, 2, N'Jujar', N' U0cKk0Ww', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (45, N'Баранова', N'Екатерина', N'Савельевна', 2, N'+7(951)851-31-71', N't3i@outlook.com', 2, 9, N'Gahelm', N' MnwvbZBL', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (46, N'Дементьева', N'Василиса', N'Дмитриевна', 2, N'+7(906)499-37-62', N't6ro3@gmail.com', 3, 2, N'Adordred', N' jodbzdBx', 1, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (47, N'Петрова', N'Марта', N'Филипповна', 2, N'+7(906)706-16-58', N'1zqnk0y7@yandex.ru', 2, 9, N'Bralkree', N' UjnLodjk', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (48, N'Алехина', N'Валерия', N'Артёмовна', 2, N'+7(906)026-41-68', N'768ptl4nv@gmail.com', 2, 2, N'Morarim', N' RLnQnB5Q', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (49, N'Дисюк', N'Виктор', N'Юрьевич', 1, N'+7(906)840-84-86', N'bzq3yh2c1@mail.ru', 2, 1, N'Swordmaster', N' iFZNFun5', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (50, N'Никифорова', N'Мирослава', N'Макаровна', 2, N'+7(906)752-52-56', N'78k3dvwx@outlook.com', 3, 2, N'Vosar', N' mx4GFBgh', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (51, N'Андреева', N'Полина', N'Марковна', 2, N'+7(951)056-56-90', N'fe8obp@mail.ru', 2, 2, N'Drelalv', N' SDNmxgRSzk', 0, NULL)
INSERT [dbo].[Worker] ([id], [FirstName], [LastName], [MiddleName], [FK_Gender], [PhoneNumber], [Email], [FK_StatusOfWorker], [FK_Position], [Login], [Password], [CheckFirstVisit], [Photo]) VALUES (52, N'Григорьев', N'Игорь', N'Андреевич', 1, N'89528002445', N'hitcomlog@gmail.com', 2, 12, N'tester', N'test', 0, NULL)
SET IDENTITY_INSERT [dbo].[Worker] OFF
SET IDENTITY_INSERT [dbo].[WorkPlace] ON 

INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (1, 15, 1, 1)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (2, 15, 2, 2)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (3, 15, 3, 3)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (4, 16, 1, 4)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (5, 16, 2, 5)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (6, 16, 3, 6)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (7, 17, 1, 7)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (8, 17, 2, 8)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (9, 17, 3, 9)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (10, 18, 1, 10)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (11, 18, 2, 11)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (12, 18, 3, 12)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (13, 19, 1, 13)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (14, 19, 2, 14)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (15, 19, 3, 15)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (16, 20, 1, 16)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (17, 20, 2, 17)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (18, 20, 3, 18)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (19, 21, 1, 19)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (20, 21, 2, 20)
INSERT [dbo].[WorkPlace] ([id], [FK_Room], [NumberPlace], [FK_Worker]) VALUES (21, 21, 3, 21)
SET IDENTITY_INSERT [dbo].[WorkPlace] OFF
ALTER TABLE [dbo].[DeliveredMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DeliveredMaterial_Delivery] FOREIGN KEY([FK_Delivery])
REFERENCES [dbo].[Delivery] ([id])
GO
ALTER TABLE [dbo].[DeliveredMaterial] CHECK CONSTRAINT [FK_DeliveredMaterial_Delivery]
GO
ALTER TABLE [dbo].[DeliveredMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DeliveredMaterial_MaterialCard] FOREIGN KEY([FK_MaterialCard])
REFERENCES [dbo].[MaterialCard] ([id])
GO
ALTER TABLE [dbo].[DeliveredMaterial] CHECK CONSTRAINT [FK_DeliveredMaterial_MaterialCard]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_WorkPlace] FOREIGN KEY([FK_WorkPlace])
REFERENCES [dbo].[WorkPlace] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_WorkPlace]
GO
ALTER TABLE [dbo].[Inventarization]  WITH CHECK ADD  CONSTRAINT [FK_Inventarization_Warehouse] FOREIGN KEY([FK_Warehouse])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[Inventarization] CHECK CONSTRAINT [FK_Inventarization_Warehouse]
GO
ALTER TABLE [dbo].[Inventarization]  WITH CHECK ADD  CONSTRAINT [FK_Inventarization_Worker] FOREIGN KEY([FK_Worker])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[Inventarization] CHECK CONSTRAINT [FK_Inventarization_Worker]
GO
ALTER TABLE [dbo].[MaterialCard]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCard_Materials] FOREIGN KEY([FK_Material])
REFERENCES [dbo].[Materials] ([id])
GO
ALTER TABLE [dbo].[MaterialCard] CHECK CONSTRAINT [FK_MaterialCard_Materials]
GO
ALTER TABLE [dbo].[MaterialCard]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCard_StatusOfMaterial] FOREIGN KEY([FK_StatusOfMaterial_id])
REFERENCES [dbo].[StatusOfMaterial] ([id])
GO
ALTER TABLE [dbo].[MaterialCard] CHECK CONSTRAINT [FK_MaterialCard_StatusOfMaterial]
GO
ALTER TABLE [dbo].[MaterialInInventarization]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInInventarization_Inventarization] FOREIGN KEY([FK_Inventarization])
REFERENCES [dbo].[Inventarization] ([id])
GO
ALTER TABLE [dbo].[MaterialInInventarization] CHECK CONSTRAINT [FK_MaterialInInventarization_Inventarization]
GO
ALTER TABLE [dbo].[MaterialInInventarization]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInInventarization_Materials] FOREIGN KEY([FK_Material])
REFERENCES [dbo].[Materials] ([id])
GO
ALTER TABLE [dbo].[MaterialInInventarization] CHECK CONSTRAINT [FK_MaterialInInventarization_Materials]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Manufacturer] FOREIGN KEY([FK_Manufacturer])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Manufacturer]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialGroup] FOREIGN KEY([FK_MaterialGroup])
REFERENCES [dbo].[MaterialGroup] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialGroup]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Unit] FOREIGN KEY([FK_Unit])
REFERENCES [dbo].[Unit] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Unit]
GO
ALTER TABLE [dbo].[MaterialsInDelivery]  WITH CHECK ADD  CONSTRAINT [FK_MaterialsInDelivery_MaterialCard] FOREIGN KEY([FK_MaterialCard])
REFERENCES [dbo].[MaterialCard] ([id])
GO
ALTER TABLE [dbo].[MaterialsInDelivery] CHECK CONSTRAINT [FK_MaterialsInDelivery_MaterialCard]
GO
ALTER TABLE [dbo].[MaterialsInDelivery]  WITH CHECK ADD  CONSTRAINT [FK_MaterialsInDelivery_ReplenishmentOfMaterials] FOREIGN KEY([FK_Replenishment])
REFERENCES [dbo].[ReplenishmentOfMaterials] ([id])
GO
ALTER TABLE [dbo].[MaterialsInDelivery] CHECK CONSTRAINT [FK_MaterialsInDelivery_ReplenishmentOfMaterials]
GO
ALTER TABLE [dbo].[OperationHystory]  WITH CHECK ADD  CONSTRAINT [FK_OperationHystory_Worker] FOREIGN KEY([FK_Worker])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[OperationHystory] CHECK CONSTRAINT [FK_OperationHystory_Worker]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Warehouse] FOREIGN KEY([FK_Warehouse])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Warehouse]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_WorkPlace] FOREIGN KEY([FK_WorkPlace])
REFERENCES [dbo].[WorkPlace] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_WorkPlace]
GO
ALTER TABLE [dbo].[OrderedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_OrderedMaterial_MaterialCard] FOREIGN KEY([FK_MaterialCard])
REFERENCES [dbo].[MaterialCard] ([id])
GO
ALTER TABLE [dbo].[OrderedMaterial] CHECK CONSTRAINT [FK_OrderedMaterial_MaterialCard]
GO
ALTER TABLE [dbo].[OrderedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_OrderedMaterial_Order] FOREIGN KEY([FK_Order])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderedMaterial] CHECK CONSTRAINT [FK_OrderedMaterial_Order]
GO
ALTER TABLE [dbo].[ReplenishmentOfMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ReplenishmentOfMaterials_Warehouse] FOREIGN KEY([FK_Warehouse])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[ReplenishmentOfMaterials] CHECK CONSTRAINT [FK_ReplenishmentOfMaterials_Warehouse]
GO
ALTER TABLE [dbo].[ReplenishmentOfMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ReplenishmentOfMaterials_Worker] FOREIGN KEY([FK_Worker])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[ReplenishmentOfMaterials] CHECK CONSTRAINT [FK_ReplenishmentOfMaterials_Worker]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_TypeOfRoom] FOREIGN KEY([FK_TypeOfRoom])
REFERENCES [dbo].[TypeOfRoom] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_TypeOfRoom]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Gender] FOREIGN KEY([FK_Gender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Gender]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Position] FOREIGN KEY([FK_Position])
REFERENCES [dbo].[Position] ([id])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Position]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_StatusOfWorker] FOREIGN KEY([FK_StatusOfWorker])
REFERENCES [dbo].[StatusOfWorker] ([id])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_StatusOfWorker]
GO
ALTER TABLE [dbo].[WorkPlace]  WITH CHECK ADD  CONSTRAINT [FK_WorkPlace_Room] FOREIGN KEY([FK_Room])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[WorkPlace] CHECK CONSTRAINT [FK_WorkPlace_Room]
GO
ALTER TABLE [dbo].[WorkPlace]  WITH CHECK ADD  CONSTRAINT [FK_WorkPlace_Worker] FOREIGN KEY([FK_Worker])
REFERENCES [dbo].[Worker] ([id])
GO
ALTER TABLE [dbo].[WorkPlace] CHECK CONSTRAINT [FK_WorkPlace_Worker]
GO
USE [master]
GO
ALTER DATABASE [AccountingForConsumables] SET  READ_WRITE 
GO
