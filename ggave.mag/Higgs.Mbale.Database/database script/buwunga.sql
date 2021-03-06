USE [master]
GO
/****** Object:  Database [Buwunga]    Script Date: 6/21/2021 2:46:28 PM ******/
CREATE DATABASE [Buwunga]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Higgs.Mbale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\Buwunga_data.mdf' , SIZE = 16256KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Higgs.Mbale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\Buwunga_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Buwunga] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Buwunga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Buwunga] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Buwunga] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Buwunga] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Buwunga] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Buwunga] SET ARITHABORT OFF 
GO
ALTER DATABASE [Buwunga] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Buwunga] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Buwunga] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Buwunga] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Buwunga] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Buwunga] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Buwunga] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Buwunga] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Buwunga] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Buwunga] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Buwunga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Buwunga] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Buwunga] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Buwunga] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Buwunga] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Buwunga] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Buwunga] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Buwunga] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Buwunga] SET  MULTI_USER 
GO
ALTER DATABASE [Buwunga] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Buwunga] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Buwunga] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Buwunga] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Buwunga] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Buwunga', N'ON'
GO
ALTER DATABASE [Buwunga] SET QUERY_STORE = OFF
GO
USE [Buwunga]
GO
/****** Object:  Table [dbo].[AccountTransactionActivity]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTransactionActivity](
	[AccountTransactionActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](128) NULL,
	[CasualWorkerId] [bigint] NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[SectorId] [bigint] NOT NULL,
	[StartAmount] [float] NOT NULL,
	[Action] [nvarchar](128) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Balance] [float] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[SupplyId] [bigint] NULL,
	[WeightNote] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[Bags] [float] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_dbo.AccountTransactionActivity] PRIMARY KEY CLUSTERED 
(
	[AccountTransactionActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Charge] [float] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityBatchCasual]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityBatchCasual](
	[ActivityId] [bigint] NOT NULL,
	[CasualWorkerId] [bigint] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[DeletedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_ActivityBatchCasual] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC,
	[CasualWorkerId] ASC,
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityBranch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityBranch](
	[ActivityId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ActivityBranch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC,
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[TotalCash] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserCode]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserCode](
	[Id] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Code] [int] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.AspNetUserCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserProduct]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserProduct](
	[Id] [nvarchar](128) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.AspNetUserProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Mobile] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NULL,
	[GenderId] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[UniqueNumber] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[RegionId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetCategoryId] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[AssetCount] [float] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.AssetId] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetCategory](
	[AssetCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.AssetCategory] PRIMARY KEY CLUSTERED 
(
	[AssetCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchId] [bigint] IDENTITY(1,1) NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Quantity] [float] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[BrandBalance] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Batch] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchDeliveryGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchDeliveryGradeSize](
	[BatchId] [bigint] NOT NULL,
	[DeliveryId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BatchDeliveryGradeSize] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC,
	[BatchId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchGradeSize](
	[BatchOutPutId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Balance] [float] NOT NULL,
 CONSTRAINT [PK_dbo.BatchGrade] PRIMARY KEY CLUSTERED 
(
	[BatchOutPutId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchOutPut]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchOutPut](
	[BatchOutPutId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[FlourOutPut] [float] NOT NULL,
	[LossPercentage] [float] NOT NULL,
	[FlourPercentage] [float] NOT NULL,
	[BrandPercentage] [float] NOT NULL,
	[BrandOutPut] [float] NOT NULL,
	[Loss] [float] NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.BatchOutPut] PRIMARY KEY CLUSTERED 
(
	[BatchOutPutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchProduct]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchProduct](
	[BatchId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[OutPut] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BatchProduct] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchProjection]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchProjection](
	[BatchProjectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[FlourOutPut] [float] NOT NULL,
	[FlourSales] [float] NOT NULL,
	[BrandSales] [float] NOT NULL,
	[FlourPercentage] [float] NOT NULL,
	[BrandPercentage] [float] NOT NULL,
	[FlourPrice] [float] NOT NULL,
	[BrandPrice] [float] NOT NULL,
	[BrandOutPut] [float] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[UnitCost] [float] NOT NULL,
	[ProductionCost] [float] NOT NULL,
	[ExpectedContribution] [float] NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.BatchProjection] PRIMARY KEY CLUSTERED 
(
	[BatchProjectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchSupply]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchSupply](
	[BatchId] [bigint] NOT NULL,
	[SupplyId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[NormalBags] [float] NOT NULL,
	[BagsOfStones] [float] NOT NULL,
 CONSTRAINT [PK_dbo.BatchSupply] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC,
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchTransferGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchTransferGradeSize](
	[BatchId] [bigint] NOT NULL,
	[FlourTransferId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BatchTransferGradeSize] PRIMARY KEY CLUSTERED 
(
	[FlourTransferId] ASC,
	[BatchId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[MillingChargeRate] [float] NOT NULL,
	[Initials] [nvarchar](25) NULL,
 CONSTRAINT [PK_dbo.Branch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchSector]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchSector](
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BranchSector] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buvera]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buvera](
	[BuveraId] [bigint] IDENTITY(1,1) NOT NULL,
	[TotalCost] [float] NULL,
	[StoreId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[FromSupplier] [nvarchar](255) NOT NULL,
	[TotalQuantity] [float] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[ToReceiver] [nvarchar](255) NULL,
	[InvoiceNumber] [nvarchar](100) NULL,
	[BuveraCategoryId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.Buvera] PRIMARY KEY CLUSTERED 
(
	[BuveraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuveraCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuveraCategory](
	[BuveraCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.BuveraCategory] PRIMARY KEY CLUSTERED 
(
	[BuveraCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuveraGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuveraGradeSize](
	[BuveraId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BuveraGradeSize] PRIMARY KEY CLUSTERED 
(
	[BuveraId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuveraTransfer]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuveraTransfer](
	[BuveraTransferId] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[ToReceiverStoreId] [bigint] NOT NULL,
	[Accept] [bit] NOT NULL,
	[Reject] [bit] NOT NULL,
	[FromSupplierStoreId] [bigint] NOT NULL,
	[TotalQuantity] [float] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.BuveraTransfer] PRIMARY KEY CLUSTERED 
(
	[BuveraTransferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuveraTransferGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuveraTransferGradeSize](
	[BuveraTransferId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BuveraTransferGradeSize] PRIMARY KEY CLUSTERED 
(
	[BuveraTransferId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cash]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cash](
	[CashId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[SectorId] [bigint] NOT NULL,
	[StartAmount] [float] NOT NULL,
	[Action] [nvarchar](128) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Balance] [float] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[RequistionCategoryId] [bigint] NULL,
	[CustomerId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Cash] PRIMARY KEY CLUSTERED 
(
	[CashId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSale]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSale](
	[CashSaleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[ProductId] [bigint] NOT NULL,
	[PaymentModeId] [bigint] NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[Amount] [float] NULL,
	[StoreId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Quantity] [float] NULL,
	[Cancelled] [bit] NOT NULL,
	[ReceiptLimit] [int] NULL,
 CONSTRAINT [PK_dbo.CashSale] PRIMARY KEY CLUSTERED 
(
	[CashSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSaleBatch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSaleBatch](
	[BatchId] [bigint] NOT NULL,
	[CashSaleId] [bigint] NOT NULL,
	[BatchQuantity] [float] NULL,
	[Price] [float] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Amount] [float] NULL,
	[ProductId] [bigint] NULL,
 CONSTRAINT [PK_dbo.CashSaleBatch] PRIMARY KEY CLUSTERED 
(
	[CashSaleId] ASC,
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSaleBatchGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSaleBatchGradeSize](
	[BatchId] [bigint] NOT NULL,
	[CashSaleId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.CashSaleBatchGradeSize] PRIMARY KEY CLUSTERED 
(
	[CashSaleId] ASC,
	[BatchId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSaleGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSaleGradeSize](
	[CashSaleId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.CashSaleGradeSize] PRIMARY KEY CLUSTERED 
(
	[CashSaleId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashTransfer]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashTransfer](
	[CashTransferId] [bigint] IDENTITY(1,1) NOT NULL,
	[Response] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
	[ToReceiverBranchId] [bigint] NOT NULL,
	[Accept] [bit] NOT NULL,
	[Reject] [bit] NOT NULL,
	[FromBranchId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[AmountInWords] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[SectorId] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CashTransfer] PRIMARY KEY CLUSTERED 
(
	[CashTransferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualActivity]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualActivity](
	[CasualActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[CasualWorkerId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[ActivityId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.CasualActivity] PRIMARY KEY CLUSTERED 
(
	[CasualActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualWorker]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualWorker](
	[CasualWorkerId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Address] [nvarchar](128) NOT NULL,
	[PhoneNumber] [nvarchar](256) NULL,
	[NINNumber] [nvarchar](255) NULL,
	[NextOfKeen] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[UniqueNumber] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.CasualWorker] PRIMARY KEY CLUSTERED 
(
	[CasualWorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[DriverName] [nvarchar](500) NOT NULL,
	[Price] [float] NULL,
	[ProductId] [bigint] NOT NULL,
	[PaymentModeId] [bigint] NOT NULL,
	[DeliveryCost] [float] NOT NULL,
	[DriverNIN] [nvarchar](max) NOT NULL,
	[VehicleNumber] [nvarchar](128) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[MediaId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Quantity] [float] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_dbo.Delivery] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryBatch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryBatch](
	[BatchId] [bigint] NOT NULL,
	[DeliveryId] [bigint] NOT NULL,
	[BatchQuantity] [float] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Price] [float] NULL,
	[Amount] [float] NULL,
	[ProductId] [bigint] NULL,
 CONSTRAINT [PK_dbo.DeliveryBatch] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC,
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryGradeSize](
	[DeliveryId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryGradeSize] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryStock]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStock](
	[DeliveryId] [bigint] NOT NULL,
	[StockId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryStock] PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC,
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposit]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposit](
	[DepositId] [bigint] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](128) NULL,
	[CasualWorkerId] [bigint] NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[SectorId] [bigint] NOT NULL,
	[StartAmount] [float] NOT NULL,
	[Action] [nvarchar](128) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[SupplyId] [bigint] NULL,
	[Balance] [float] NOT NULL,
	[WeightNote] [nvarchar](1) NULL,
	[Quantity] [float] NULL,
	[Bags] [float] NULL,
	[Price] [float] NULL,
	[Approved] [bit] NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Deposit] PRIMARY KEY CLUSTERED 
(
	[DepositId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[DocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[ItemId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DocumentNumber] [bigint] NOT NULL,
	[DocumentCategoryId] [bigint] NOT NULL,
	[Quantity] [float] NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[AmountInWords] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.Document] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentCategory](
	[DocumentCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DocumentCategory] PRIMARY KEY CLUSTERED 
(
	[DocumentCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentGradeSize](
	[DocumentId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DocumentGradeSize] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactoryExpense]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactoryExpense](
	[FactoryExpenseId] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Amount] [float] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.FactoryExpense] PRIMARY KEY CLUSTERED 
(
	[FactoryExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlourTransfer]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlourTransfer](
	[FlourTransferId] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[ToReceiverStoreId] [bigint] NOT NULL,
	[Accept] [bit] NOT NULL,
	[Reject] [bit] NOT NULL,
	[FromSupplierStoreId] [bigint] NOT NULL,
	[TotalQuantity] [float] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.FlourTransfer] PRIMARY KEY CLUSTERED 
(
	[FlourTransferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlourTransferBatch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlourTransferBatch](
	[BatchId] [bigint] NOT NULL,
	[FlourTransferId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[BatchQuantity] [float] NOT NULL,
 CONSTRAINT [PK_dbo.FlourTransferBatch] PRIMARY KEY CLUSTERED 
(
	[FlourTransferId] ASC,
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlourTransferGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlourTransferGradeSize](
	[FlourTransferId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.FlourTransferGradeSize] PRIMARY KEY CLUSTERED 
(
	[FlourTransferId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](128) NOT NULL,
	[Price] [float] NOT NULL,
	[InventoryCategoryId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryCategory](
	[InventoryCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.InventoryCategory] PRIMARY KEY CLUSTERED 
(
	[InventoryCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryPurchase]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryPurchase](
	[InventoryPurchaseId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryId] [bigint] NOT NULL,
	[ItemName] [nvarchar](128) NOT NULL,
	[Amount] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.InventoryPurchase] PRIMARY KEY CLUSTERED 
(
	[InventoryPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabourCost]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabourCost](
	[LabourCostId] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[ActivityId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.LabourCost] PRIMARY KEY CLUSTERED 
(
	[LabourCostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
	[Initials] [nvarchar](50) NULL,
	[RegionId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineRepair]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineRepair](
	[MachineRepairId] [bigint] IDENTITY(1,1) NOT NULL,
	[NameOfRepair] [nvarchar](128) NOT NULL,
	[Amount] [float] NOT NULL,
	[DateRepaired] [datetime] NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.MachineRepair] PRIMARY KEY CLUSTERED 
(
	[MachineRepairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaizeBrandStore]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaizeBrandStore](
	[MaizeBrandStoreId] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [float] NULL,
	[StoreId] [bigint] NOT NULL,
	[Action] [nvarchar](128) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[Balance] [float] NOT NULL,
	[StartQuantity] [float] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.MaizeBrandStore] PRIMARY KEY CLUSTERED 
(
	[MaizeBrandStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NULL,
	[StatusId] [bigint] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Balance] [float] NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderGradeSize](
	[OrderId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Balance] [float] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_dbo.OrderGradeSize] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherExpense]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherExpense](
	[OtherExpenseId] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Amount] [float] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.OtherExpense] PRIMARY KEY CLUSTERED 
(
	[OtherExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMode]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMode](
	[PaymentModeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.PaymentMode] PRIMARY KEY CLUSTERED 
(
	[PaymentModeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Initials] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Region] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requistion]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requistion](
	[RequistionId] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[ApprovedById] [nvarchar](128) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Response] [nvarchar](max) NULL,
	[RequistionNumber] [nvarchar](128) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Amount] [float] NOT NULL,
	[Rejected] [bit] NULL,
	[Approved] [bit] NULL,
	[AmountInWords] [nvarchar](255) NULL,
	[CasualWorkerId] [bigint] NULL,
	[BatchId] [bigint] NULL,
	[SupplyId] [bigint] NULL,
	[ActivityId] [bigint] NULL,
	[PartPayment] [bit] NULL,
	[RequistionCategoryId] [bigint] NOT NULL,
	[Quantity] [float] NULL,
	[RepairerName] [nvarchar](255) NULL,
	[RepairDate] [datetime] NOT NULL,
	[BankId] [bigint] NULL,
	[UtilityCategoryId] [bigint] NULL,
 CONSTRAINT [PK_dbo.Requistion] PRIMARY KEY CLUSTERED 
(
	[RequistionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequistionCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequistionCategory](
	[RequistionCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.RequistionCategory] PRIMARY KEY CLUSTERED 
(
	[RequistionCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[SectorId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Sector] PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_dbo.Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [bigint] IDENTITY(1,1) NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[InOrOut] [bit] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[StoreId] [bigint] NOT NULL,
	[SoldOut] [bit] NULL,
 CONSTRAINT [PK_dbo.Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockGradeSize](
	[StockId] [bigint] NOT NULL,
	[GradeId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StockGradeSize] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockProduct]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockProduct](
	[StockId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StockProduct] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[OutSourcerId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreBuveraGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreBuveraGradeSize](
	[GradeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StoreBuveraGradeSize] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[SizeId] ASC,
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreBuveraTransferGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreBuveraTransferGradeSize](
	[GradeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StoreBuveraTransferGradeSize] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreFlourTransferGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreFlourTransferGradeSize](
	[GradeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StoreFlourTransferGradeSize] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreGradeSize]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreGradeSize](
	[GradeId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StoreGradeSize] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[GradeId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreProduct]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreProduct](
	[StoreId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.StoreProduct] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreStock]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreStock](
	[StoreStockId] [bigint] IDENTITY(1,1) NOT NULL,
	[StockId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[StockBalance] [float] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SectorId] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[StartStock] [float] NOT NULL,
	[SoldOut] [bit] NOT NULL,
	[InOrOut] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[SoldAmount] [float] NULL,
	[Balance] [float] NULL,
 CONSTRAINT [PK_dbo.StoreStock] PRIMARY KEY CLUSTERED 
(
	[StoreStockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[SupplyId] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[TruckNumber] [nvarchar](max) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[SupplierId] [nvarchar](128) NOT NULL,
	[SupplyDate] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Used] [bit] NOT NULL,
	[WeightNoteNumber] [nvarchar](50) NOT NULL,
	[MoistureContent] [float] NULL,
	[BagsOfStones] [float] NOT NULL,
	[NormalBags] [float] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Offloading] [nvarchar](50) NULL,
	[AmountToPay] [float] NOT NULL,
	[YellowBags] [float] NULL,
	[PartiallyPaid] [bit] NOT NULL,
	[PartialAmount] [float] NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_dbo.Supply] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NULL,
	[SectorId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[TransactionTypeId] [bigint] NOT NULL,
	[TransactionSubTypeId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[SupplyId] [bigint] NULL,
 CONSTRAINT [PK_dbo.Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionSubType]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionSubType](
	[TransactionSubTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionTypeId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.TransactionSubType] PRIMARY KEY CLUSTERED 
(
	[TransactionSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBranch]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBranch](
	[UserId] [nvarchar](128) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.UserBranch] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilityAccount]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilityAccount](
	[UtilityAccountId] [bigint] IDENTITY(1,1) NOT NULL,
	[UtilityCategoryId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[InvoiceNumber] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Action] [nvarchar](128) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Deleted] [bit] NULL,
	[Balance] [float] NOT NULL,
	[StartAmount] [float] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.UtilityAccount] PRIMARY KEY CLUSTERED 
(
	[UtilityAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilityCategory]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilityCategory](
	[UtilityCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UtilityCategory] PRIMARY KEY CLUSTERED 
(
	[UtilityCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightLoss]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightLoss](
	[WeightLossId] [bigint] IDENTITY(1,1) NOT NULL,
	[DeliveryId] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[Price] [float] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_dbo.WeightLoss] PRIMARY KEY CLUSTERED 
(
	[WeightLossId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightNoteNumber]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightNoteNumber](
	[WeightNoteNumberId] [bigint] IDENTITY(1,1) NOT NULL,
	[WeightNoteValue] [float] NOT NULL,
	[WeightNoteRangeId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Used] [bit] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[NotUsed] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.WeightNoteNumber] PRIMARY KEY CLUSTERED 
(
	[WeightNoteNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightNoteRange]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightNoteRange](
	[WeightNoteRangeId] [bigint] IDENTITY(1,1) NOT NULL,
	[StartNumber] [float] NOT NULL,
	[EndNumber] [float] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Printed] [bit] NOT NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[DeletedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.WeightNoteRange] PRIMARY KEY CLUSTERED 
(
	[WeightNoteRangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightNoteSupply]    Script Date: 6/21/2021 2:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightNoteSupply](
	[WeightNoteNumberId] [bigint] NOT NULL,
	[SupplyId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.WeightNoteSupply] PRIMARY KEY CLUSTERED 
(
	[WeightNoteNumberId] ASC,
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountTransactionActivity] ADD  CONSTRAINT [DF__AccountTr__TimeS__2FEF161B]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Activity] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[ActivityBatchCasual] ADD  CONSTRAINT [DF_dbo_ActivityBatchCasual_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Asset] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[AssetCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF__Batch__TimeStamp__3E52440B]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Batch] ADD  DEFAULT ((0)) FOR [BrandBalance]
GO
ALTER TABLE [dbo].[BatchGradeSize] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[BatchOutPut] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[BatchOutPut] ADD  CONSTRAINT [DF_BatchOutPut_BranchId]  DEFAULT ((1)) FOR [BranchId]
GO
ALTER TABLE [dbo].[BatchOutPut] ADD  CONSTRAINT [DF_BatchOutPut_SecotorId]  DEFAULT ((2)) FOR [SectorId]
GO
ALTER TABLE [dbo].[BatchProjection] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[BatchSupply] ADD  DEFAULT ((0)) FOR [NormalBags]
GO
ALTER TABLE [dbo].[BatchSupply] ADD  DEFAULT ((0)) FOR [BagsOfStones]
GO
ALTER TABLE [dbo].[Branch] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_MillingChargeRate]  DEFAULT ((0)) FOR [MillingChargeRate]
GO
ALTER TABLE [dbo].[Buvera] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Buvera] ADD  CONSTRAINT [DF_Buvera_BuveraCategoryId]  DEFAULT ((5)) FOR [BuveraCategoryId]
GO
ALTER TABLE [dbo].[Buvera] ADD  CONSTRAINT [DF_Buvera_ProductId]  DEFAULT ((1)) FOR [ProductId]
GO
ALTER TABLE [dbo].[BuveraCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[BuveraCategory] ADD  CONSTRAINT [DF_BuveraCategory_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[BuveraTransfer] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[BuveraTransfer] ADD  CONSTRAINT [DF_BuveraTransfer_ProductId]  DEFAULT ((1)) FOR [ProductId]
GO
ALTER TABLE [dbo].[Cash] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[CashSale] ADD  CONSTRAINT [DF__CashSale__TimeSt__2C938683]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[CashSale] ADD  CONSTRAINT [DF_CashSale_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[CashSaleBatch] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[CashTransfer] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[CasualActivity] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[CasualWorker] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF__Delivery__TimeSt__7B663F43]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_DeliveryDate]  DEFAULT (getdate()) FOR [DeliveryDate]
GO
ALTER TABLE [dbo].[DeliveryBatch] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Deposit] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Document] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[DocumentCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[FactoryExpense] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[FlourTransfer] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[FlourTransferBatch] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[FlourTransferBatch] ADD  CONSTRAINT [DF_FlourTransferBatch_BatchQuantity]  DEFAULT ((0)) FOR [BatchQuantity]
GO
ALTER TABLE [dbo].[Grade] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[InventoryCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[InventoryPurchase] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[LabourCost] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Location] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[MachineRepair] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[MaizeBrandStore] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__TimeStamp__4F47C5E3]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderGradeSize] ADD  CONSTRAINT [DF_OrderGradeSize_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OtherExpense] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[PaymentMode] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Requistion] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Requistion] ADD  CONSTRAINT [DF_Requistion_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Requistion] ADD  DEFAULT ((0)) FOR [Rejected]
GO
ALTER TABLE [dbo].[Requistion] ADD  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[Requistion] ADD  CONSTRAINT [DF_Requistion_PartPayment]  DEFAULT ((0)) FOR [PartPayment]
GO
ALTER TABLE [dbo].[Requistion] ADD  CONSTRAINT [DF_Requistion_RequistionCategoryId]  DEFAULT ((1)) FOR [RequistionCategoryId]
GO
ALTER TABLE [dbo].[Requistion] ADD  CONSTRAINT [DF_Requistion_RepairDate]  DEFAULT (getdate()) FOR [RepairDate]
GO
ALTER TABLE [dbo].[RequistionCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Sector] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Size] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Status] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_StoreId]  DEFAULT ((1)) FOR [StoreId]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_SoldOut]  DEFAULT ((0)) FOR [SoldOut]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF__Store__TimeStamp__282DF8C2]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[StoreStock] ADD  CONSTRAINT [DF_StoreStock_SoldOut]  DEFAULT ((0)) FOR [SoldOut]
GO
ALTER TABLE [dbo].[StoreStock] ADD  CONSTRAINT [DF_StoreStock_InOrOut]  DEFAULT ((0)) FOR [InOrOut]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF__Supply__TimeStam__7EC1CEDB]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_Used]  DEFAULT ((0)) FOR [Used]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_WeightNoteNumber]  DEFAULT ((235)) FOR [WeightNoteNumber]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_BagsOfStones]  DEFAULT ((0.0)) FOR [BagsOfStones]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_NormalBags]  DEFAULT ((0.0)) FOR [NormalBags]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_StatusId]  DEFAULT ((10002)) FOR [StatusId]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_StoreId]  DEFAULT ((1)) FOR [StoreId]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_AmountToPay]  DEFAULT ((0.0)) FOR [AmountToPay]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_YellowBags]  DEFAULT ((0)) FOR [YellowBags]
GO
ALTER TABLE [dbo].[Supply] ADD  CONSTRAINT [DF_Supply_PartiallyPaid]  DEFAULT ((0)) FOR [PartiallyPaid]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF__Transacti__TimeS__1209AD79]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[TransactionSubType] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[UserBranch] ADD  CONSTRAINT [DF_UserBranch_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[UtilityAccount] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[UtilityCategory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[WeightLoss] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[WeightNoteNumber] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[WeightNoteNumber] ADD  CONSTRAINT [DF_WeightNoteNumber_NotUsed]  DEFAULT ((0)) FOR [NotUsed]
GO
ALTER TABLE [dbo].[WeightNoteRange] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_AspNetUserId] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_AspNetUserId]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_BranchId]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_CasualWorkerId] FOREIGN KEY([CasualWorkerId])
REFERENCES [dbo].[CasualWorker] ([CasualWorkerId])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_CasualWorkerId]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_CreatedBy]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_DeletedBy]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_SectorId]
GO
ALTER TABLE [dbo].[AccountTransactionActivity]  WITH CHECK ADD  CONSTRAINT [FK_AccountTransactionActivity_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[AccountTransactionActivity] CHECK CONSTRAINT [FK_AccountTransactionActivity_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_CreatedBy]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_DeletedBy]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_UpdatedBy]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBatchCasual_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_ActivityBatchCasual_CreatedBy]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBatchCasual_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_ActivityBatchCasual_DeletedBy]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBatchCasual_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_ActivityBatchCasual_UpdatedBy]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_dbo_ActivityBatchCasual_ActivityId] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_dbo_ActivityBatchCasual_ActivityId]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_dbo_ActivityBatchCasual_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_dbo_ActivityBatchCasual_BatchId]
GO
ALTER TABLE [dbo].[ActivityBatchCasual]  WITH CHECK ADD  CONSTRAINT [FK_dbo_ActivityBatchCasual_CasualWorkerId] FOREIGN KEY([CasualWorkerId])
REFERENCES [dbo].[CasualWorker] ([CasualWorkerId])
GO
ALTER TABLE [dbo].[ActivityBatchCasual] CHECK CONSTRAINT [FK_dbo_ActivityBatchCasual_CasualWorkerId]
GO
ALTER TABLE [dbo].[ActivityBranch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityBranch_dbo.Activity_ActivityId] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityBranch] CHECK CONSTRAINT [FK_dbo.ActivityBranch_dbo.Activity_ActivityId]
GO
ALTER TABLE [dbo].[ActivityBranch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActivityBranch_dbo.Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityBranch] CHECK CONSTRAINT [FK_dbo.ActivityBranch_dbo.Branch_BranchId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[AspNetUserCode]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserCode_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserCode] CHECK CONSTRAINT [FK_AspNetUserCode_Id]
GO
ALTER TABLE [dbo].[AspNetUserCode]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserCode_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserCode] CHECK CONSTRAINT [FK_AspNetUserCode_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[AspNetUserProduct]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserProduct_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserProduct] CHECK CONSTRAINT [FK_AspNetUserProduct_Id]
GO
ALTER TABLE [dbo].[AspNetUserProduct]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserProduct_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[AspNetUserProduct] CHECK CONSTRAINT [FK_AspNetUserProduct_ProductId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUser_CreatedBy]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUser_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUser_DeletedBy]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH NOCHECK ADD  CONSTRAINT [FK_AspNetUser_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUser_RegionId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUser_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUser_UpdatedBy]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AssetCategoryId] FOREIGN KEY([AssetCategoryId])
REFERENCES [dbo].[AssetCategory] ([AssetCategoryId])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_AssetCategoryId]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_BranchId]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_CreatedBy]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_DeletedBy]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_UpdatedBy]
GO
ALTER TABLE [dbo].[AssetCategory]  WITH CHECK ADD  CONSTRAINT [FK_AssetCategory_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AssetCategory] CHECK CONSTRAINT [FK_AssetCategory_CreatedBy]
GO
ALTER TABLE [dbo].[AssetCategory]  WITH CHECK ADD  CONSTRAINT [FK_AssetCategory_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AssetCategory] CHECK CONSTRAINT [FK_AssetCategory_DeletedBy]
GO
ALTER TABLE [dbo].[AssetCategory]  WITH CHECK ADD  CONSTRAINT [FK_AssetCategory_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AssetCategory] CHECK CONSTRAINT [FK_AssetCategory_UpdatedBy]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Branch]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_CreatedBy]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Sector]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_UpdatedBy]
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Batch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Batch_BatchId]
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Delivery_DeliveryId] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Delivery_DeliveryId]
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchDeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.BatchDeliveryGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[BatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchGradeSize_dbo.BatchOutPut_BatchId] FOREIGN KEY([BatchOutPutId])
REFERENCES [dbo].[BatchOutPut] ([BatchOutPutId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchGradeSize] CHECK CONSTRAINT [FK_dbo.BatchGradeSize_dbo.BatchOutPut_BatchId]
GO
ALTER TABLE [dbo].[BatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchGradeSize] CHECK CONSTRAINT [FK_dbo.BatchGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[BatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchGradeSize] CHECK CONSTRAINT [FK_dbo.BatchGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_BatchId]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_BranchId]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_CreatedBy]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_DeletedBy]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_SectorId]
GO
ALTER TABLE [dbo].[BatchOutPut]  WITH CHECK ADD  CONSTRAINT [FK_BatchOutPut_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchOutPut] CHECK CONSTRAINT [FK_BatchOutPut_UpdatedBy]
GO
ALTER TABLE [dbo].[BatchProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchProduct_dbo.Batch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchProduct] CHECK CONSTRAINT [FK_dbo.BatchProduct_dbo.Batch_BatchId]
GO
ALTER TABLE [dbo].[BatchProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchProduct_dbo.Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchProduct] CHECK CONSTRAINT [FK_dbo.BatchProduct_dbo.Product_ProductId]
GO
ALTER TABLE [dbo].[BatchProjection]  WITH CHECK ADD  CONSTRAINT [FK_BatchProjection_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[BatchProjection] CHECK CONSTRAINT [FK_BatchProjection_BatchId]
GO
ALTER TABLE [dbo].[BatchProjection]  WITH CHECK ADD  CONSTRAINT [FK_BatchProjection_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[BatchProjection] CHECK CONSTRAINT [FK_BatchProjection_BranchId]
GO
ALTER TABLE [dbo].[BatchProjection]  WITH CHECK ADD  CONSTRAINT [FK_BatchProjection_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchProjection] CHECK CONSTRAINT [FK_BatchProjection_CreatedBy]
GO
ALTER TABLE [dbo].[BatchProjection]  WITH CHECK ADD  CONSTRAINT [FK_BatchProjection_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchProjection] CHECK CONSTRAINT [FK_BatchProjection_DeletedBy]
GO
ALTER TABLE [dbo].[BatchProjection]  WITH CHECK ADD  CONSTRAINT [FK_BatchProjection_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BatchProjection] CHECK CONSTRAINT [FK_BatchProjection_UpdatedBy]
GO
ALTER TABLE [dbo].[BatchSupply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchSupply_dbo.Batch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchSupply] CHECK CONSTRAINT [FK_dbo.BatchSupply_dbo.Batch_BatchId]
GO
ALTER TABLE [dbo].[BatchSupply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchSupply_dbo.Supply_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Supply] ([SupplyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchSupply] CHECK CONSTRAINT [FK_dbo.BatchSupply_dbo.Supply_SupplyId]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_CreatedBy]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_DeletedBy]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_UpdatedBy]
GO
ALTER TABLE [dbo].[BranchSector]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BranchSector_dbo.Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BranchSector] CHECK CONSTRAINT [FK_dbo.BranchSector_dbo.Branch_BranchId]
GO
ALTER TABLE [dbo].[BranchSector]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BranchSector_dbo.Sector_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BranchSector] CHECK CONSTRAINT [FK_dbo.BranchSector_dbo.Sector_SectorId]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_BranchId]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_BuveraCategoryId] FOREIGN KEY([BuveraCategoryId])
REFERENCES [dbo].[BuveraCategory] ([BuveraCategoryId])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_BuveraCategoryId]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_CreatedBy]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_DeletedBy]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_ProductId]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_StoreId]
GO
ALTER TABLE [dbo].[Buvera]  WITH CHECK ADD  CONSTRAINT [FK_Buvera_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Buvera] CHECK CONSTRAINT [FK_Buvera_UpdatedBy]
GO
ALTER TABLE [dbo].[BuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Buvera_BuveraId] FOREIGN KEY([BuveraId])
REFERENCES [dbo].[Buvera] ([BuveraId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuveraGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Buvera_BuveraId]
GO
ALTER TABLE [dbo].[BuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuveraGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[BuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuveraGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[BuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuveraGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_BranchId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_CreatedBy]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_DeletedBy]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_FromSupplierStoreId] FOREIGN KEY([FromSupplierStoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_FromSupplierStoreId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_ProductId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_StoreId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_ToReceiverStoreId] FOREIGN KEY([ToReceiverStoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_ToReceiverStoreId]
GO
ALTER TABLE [dbo].[BuveraTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BuveraTransfer_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BuveraTransfer] CHECK CONSTRAINT [FK_BuveraTransfer_UpdatedBy]
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.BuveraTransfer_BuveraTransferId] FOREIGN KEY([BuveraTransferId])
REFERENCES [dbo].[BuveraTransfer] ([BuveraTransferId])
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.BuveraTransfer_BuveraTransferId]
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[BuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.BuveraTransferGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_BranchId]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_CreatedBy]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_CustomerId]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_DeletedBy]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_RequistionCategory] FOREIGN KEY([RequistionCategoryId])
REFERENCES [dbo].[RequistionCategory] ([RequistionCategoryId])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_RequistionCategory]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_SectorId]
GO
ALTER TABLE [dbo].[Cash]  WITH CHECK ADD  CONSTRAINT [FK_Cash_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[Cash] CHECK CONSTRAINT [FK_Cash_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_BranchId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_CreatedBy]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_DeletedBy]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_PaymentModeId] FOREIGN KEY([PaymentModeId])
REFERENCES [dbo].[PaymentMode] ([PaymentModeId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_PaymentModeId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_ProductId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_SectorId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_StoreId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[CashSale]  WITH CHECK ADD  CONSTRAINT [FK_CashSale_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashSale] CHECK CONSTRAINT [FK_CashSale_UpdatedBy]
GO
ALTER TABLE [dbo].[CashSaleBatch]  WITH CHECK ADD  CONSTRAINT [FK_CashSaleBatch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[CashSaleBatch] CHECK CONSTRAINT [FK_CashSaleBatch_BatchId]
GO
ALTER TABLE [dbo].[CashSaleBatch]  WITH CHECK ADD  CONSTRAINT [FK_CashSaleBatch_CashSaleId] FOREIGN KEY([CashSaleId])
REFERENCES [dbo].[CashSale] ([CashSaleId])
GO
ALTER TABLE [dbo].[CashSaleBatch] CHECK CONSTRAINT [FK_CashSaleBatch_CashSaleId]
GO
ALTER TABLE [dbo].[CashSaleBatch]  WITH CHECK ADD  CONSTRAINT [FK_CashSaleBatch_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[CashSaleBatch] CHECK CONSTRAINT [FK_CashSaleBatch_ProductId]
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Batch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Batch_BatchId]
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.CashSale_CashSaleId] FOREIGN KEY([CashSaleId])
REFERENCES [dbo].[CashSale] ([CashSaleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.CashSale_CashSaleId]
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleBatchGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleBatchGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[CashSaleGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.CashSale_CashSaleId] FOREIGN KEY([CashSaleId])
REFERENCES [dbo].[CashSale] ([CashSaleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.CashSale_CashSaleId]
GO
ALTER TABLE [dbo].[CashSaleGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[CashSaleGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashSaleGradeSize] CHECK CONSTRAINT [FK_dbo.CashSaleGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_CreatedBy]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_DeletedBy]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_FromBranchId] FOREIGN KEY([FromBranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_FromBranchId]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_SectorId]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_ToReceiverBranchId] FOREIGN KEY([ToReceiverBranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_ToReceiverBranchId]
GO
ALTER TABLE [dbo].[CashTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CashTransfer_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CashTransfer] CHECK CONSTRAINT [FK_CashTransfer_UpdatedBy]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_ActivityId] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_ActivityId]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_BatchId]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_BranchId]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_CasualWorkerId] FOREIGN KEY([CasualWorkerId])
REFERENCES [dbo].[CasualWorker] ([CasualWorkerId])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_CasualWorkerId]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_CreatedBy]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_DeletedBy]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_SectorId]
GO
ALTER TABLE [dbo].[CasualActivity]  WITH CHECK ADD  CONSTRAINT [FK_CasualActivity_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualActivity] CHECK CONSTRAINT [FK_CasualActivity_UpdatedBy]
GO
ALTER TABLE [dbo].[CasualWorker]  WITH CHECK ADD  CONSTRAINT [FK_CasualWorker_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[CasualWorker] CHECK CONSTRAINT [FK_CasualWorker_BranchId]
GO
ALTER TABLE [dbo].[CasualWorker]  WITH CHECK ADD  CONSTRAINT [FK_CasualWorker_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualWorker] CHECK CONSTRAINT [FK_CasualWorker_CreatedBy]
GO
ALTER TABLE [dbo].[CasualWorker]  WITH CHECK ADD  CONSTRAINT [FK_CasualWorker_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualWorker] CHECK CONSTRAINT [FK_CasualWorker_DeletedBy]
GO
ALTER TABLE [dbo].[CasualWorker]  WITH CHECK ADD  CONSTRAINT [FK_CasualWorker_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CasualWorker] CHECK CONSTRAINT [FK_CasualWorker_UpdatedBy]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_BranchId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_CreatedBy]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_DeletedBy]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_PaymentModeId] FOREIGN KEY([PaymentModeId])
REFERENCES [dbo].[PaymentMode] ([PaymentModeId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_PaymentModeId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_ProductId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_SectorId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Store]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_UpdatedBy]
GO
ALTER TABLE [dbo].[DeliveryBatch]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryBatch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[DeliveryBatch] CHECK CONSTRAINT [FK_DeliveryBatch_BatchId]
GO
ALTER TABLE [dbo].[DeliveryBatch]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryBatch_DeliveryId] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
GO
ALTER TABLE [dbo].[DeliveryBatch] CHECK CONSTRAINT [FK_DeliveryBatch_DeliveryId]
GO
ALTER TABLE [dbo].[DeliveryBatch]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryBatch_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[DeliveryBatch] CHECK CONSTRAINT [FK_DeliveryBatch_ProductId]
GO
ALTER TABLE [dbo].[DeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Delivery_DeliveryId] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Delivery_DeliveryId]
GO
ALTER TABLE [dbo].[DeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[DeliveryGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryGradeSize] CHECK CONSTRAINT [FK_dbo.DeliveryGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[DeliveryStock]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryStock_dbo.Delivery_DeliveryId] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryStock] CHECK CONSTRAINT [FK_dbo.DeliveryStock_dbo.Delivery_DeliveryId]
GO
ALTER TABLE [dbo].[DeliveryStock]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryStock_dbo.Stock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([StockId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryStock] CHECK CONSTRAINT [FK_dbo.DeliveryStock_dbo.Stock_StockId]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_AspNetUserId] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_AspNetUserId]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_BranchId]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_CasualWorkerId] FOREIGN KEY([CasualWorkerId])
REFERENCES [dbo].[CasualWorker] ([CasualWorkerId])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_CasualWorkerId]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_CreatedBy]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_DeletedBy]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_SectorId]
GO
ALTER TABLE [dbo].[Deposit]  WITH CHECK ADD  CONSTRAINT [FK_Deposit_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[Deposit] CHECK CONSTRAINT [FK_Deposit_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_BranchId]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_CreatedBy]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_DeletedBy]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocumentCategoryId] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([DocumentCategoryId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_DocumentCategoryId]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_UpdatedBy]
GO
ALTER TABLE [dbo].[DocumentGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Document_DocumentId] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentGradeSize] CHECK CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Document_DocumentId]
GO
ALTER TABLE [dbo].[DocumentGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentGradeSize] CHECK CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[DocumentGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentGradeSize] CHECK CONSTRAINT [FK_dbo.DocumentGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_Batch] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_Batch]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_Branch]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_CreatedBy]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_DeletedBy]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_Sector]
GO
ALTER TABLE [dbo].[FactoryExpense]  WITH CHECK ADD  CONSTRAINT [FK_FactoryExpense_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FactoryExpense] CHECK CONSTRAINT [FK_FactoryExpense_UpdatedBy]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_BranchId]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_CreatedBy]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_DeletedBy]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_FromSupplierStoreId] FOREIGN KEY([FromSupplierStoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_FromSupplierStoreId]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_StoreId]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_ToReceiverStoreId] FOREIGN KEY([ToReceiverStoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_ToReceiverStoreId]
GO
ALTER TABLE [dbo].[FlourTransfer]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransfer_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FlourTransfer] CHECK CONSTRAINT [FK_FlourTransfer_UpdatedBy]
GO
ALTER TABLE [dbo].[FlourTransferBatch]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransferBatch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[FlourTransferBatch] CHECK CONSTRAINT [FK_FlourTransferBatch_BatchId]
GO
ALTER TABLE [dbo].[FlourTransferBatch]  WITH CHECK ADD  CONSTRAINT [FK_FlourTransferBatch_DeliveryId] FOREIGN KEY([FlourTransferId])
REFERENCES [dbo].[FlourTransfer] ([FlourTransferId])
GO
ALTER TABLE [dbo].[FlourTransferBatch] CHECK CONSTRAINT [FK_FlourTransferBatch_DeliveryId]
GO
ALTER TABLE [dbo].[FlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.FlourTransfer_FlourTransferId] FOREIGN KEY([FlourTransferId])
REFERENCES [dbo].[FlourTransfer] ([FlourTransferId])
GO
ALTER TABLE [dbo].[FlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.FlourTransfer_FlourTransferId]
GO
ALTER TABLE [dbo].[FlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[FlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[FlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[FlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[FlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[FlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.FlourTransferGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_CreatedBy]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_DeletedBy]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_UpdatedBy]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_CreatedBy]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_DeletedBy]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_InventoryCategoryId] FOREIGN KEY([InventoryCategoryId])
REFERENCES [dbo].[InventoryCategory] ([InventoryCategoryId])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_InventoryCategoryId]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_UpdatedBy]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_BranchId]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_CreatedBy]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_DeletedBy]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_InventoryId] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([InventoryId])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_InventoryId]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_SectorId]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_StoreId]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[InventoryPurchase]  WITH CHECK ADD  CONSTRAINT [FK_InventoryPurchase_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InventoryPurchase] CHECK CONSTRAINT [FK_InventoryPurchase_UpdatedBy]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_Activity]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_Batch] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_Batch]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_Branch]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_CreatedBy]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_DeletedBy]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_Sector]
GO
ALTER TABLE [dbo].[LabourCost]  WITH CHECK ADD  CONSTRAINT [FK_LabourCost_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LabourCost] CHECK CONSTRAINT [FK_LabourCost_UpdatedBy]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_RegionId]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_BatchId]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_BranchId]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_CreatedBy]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_DeletedBy]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_SectorId]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[MachineRepair]  WITH CHECK ADD  CONSTRAINT [FK_MachineRepair_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MachineRepair] CHECK CONSTRAINT [FK_MachineRepair_UpdatedBy]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_BatchId]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_BranchId]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_CreatedBy]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_DeletedBy]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_StoreId]
GO
ALTER TABLE [dbo].[MaizeBrandStore]  WITH CHECK ADD  CONSTRAINT [FK_MaizeBrandStore_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MaizeBrandStore] CHECK CONSTRAINT [FK_MaizeBrandStore_UpdatedBy]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_BranchId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CreatedBy]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CustomerId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_DeletedBy]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ProductId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatusId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UpdatedBy]
GO
ALTER TABLE [dbo].[OrderGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderGradeSize] CHECK CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[OrderGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderGradeSize] CHECK CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Order_OrderId]
GO
ALTER TABLE [dbo].[OrderGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderGradeSize] CHECK CONSTRAINT [FK_dbo.OrderGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_Batch] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_Batch]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_Branch]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_CreatedBy]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_DeletedBy]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_Sector]
GO
ALTER TABLE [dbo].[OtherExpense]  WITH CHECK ADD  CONSTRAINT [FK_OtherExpense_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OtherExpense] CHECK CONSTRAINT [FK_OtherExpense_UpdatedBy]
GO
ALTER TABLE [dbo].[PaymentMode]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMode_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PaymentMode] CHECK CONSTRAINT [FK_PaymentMode_CreatedBy]
GO
ALTER TABLE [dbo].[PaymentMode]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMode_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PaymentMode] CHECK CONSTRAINT [FK_PaymentMode_DeletedBy]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CreatedBy]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_DeletedBy]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UpdatedBy]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_Activity]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_ApprovedById] FOREIGN KEY([ApprovedById])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_ApprovedById]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_Batch] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_Batch]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_BranchId]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_CasualWorker] FOREIGN KEY([CasualWorkerId])
REFERENCES [dbo].[CasualWorker] ([CasualWorkerId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_CasualWorker]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_CreatedBy]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_DeletedBy]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_RequistionCategory] FOREIGN KEY([RequistionCategoryId])
REFERENCES [dbo].[RequistionCategory] ([RequistionCategoryId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_RequistionCategory]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_StatusId]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_Supply] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Supply] ([SupplyId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_Supply]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_UpdatedBy]
GO
ALTER TABLE [dbo].[Requistion]  WITH CHECK ADD  CONSTRAINT [FK_Requistion_UtilityCategoryId] FOREIGN KEY([UtilityCategoryId])
REFERENCES [dbo].[UtilityCategory] ([UtilityCategoryId])
GO
ALTER TABLE [dbo].[Requistion] CHECK CONSTRAINT [FK_Requistion_UtilityCategoryId]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_CreatedBy]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_DeletedBy]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_UpdatedBy]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_CreatedBy]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_DeletedBy]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_UpdatedBy]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_CreatedBy]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_DeletedBy]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_UpdatedBy]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_BatchId]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_BranchId]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_CreatedBy]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_DeletedBy]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_ProductId]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_SectorId]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Store]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_UpdatedBy]
GO
ALTER TABLE [dbo].[StockGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StockGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockGradeSize] CHECK CONSTRAINT [FK_dbo.StockGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[StockGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StockGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockGradeSize] CHECK CONSTRAINT [FK_dbo.StockGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[StockGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StockGradeSize_dbo.Stock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([StockId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockGradeSize] CHECK CONSTRAINT [FK_dbo.StockGradeSize_dbo.Stock_StockId]
GO
ALTER TABLE [dbo].[StockProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StockProduct_dbo.Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockProduct] CHECK CONSTRAINT [FK_dbo.StockProduct_dbo.Product_ProductId]
GO
ALTER TABLE [dbo].[StockProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StockProduct_dbo.Stock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([StockId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockProduct] CHECK CONSTRAINT [FK_dbo.StockProduct_dbo.Stock_StockId]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_BranchId]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_CreatedBy]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_DeletedBy]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_OutSourcerId] FOREIGN KEY([OutSourcerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_OutSourcerId]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_UpdatedBy]
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreBuveraGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[StoreBuveraTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreBuveraTransferGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[StoreFlourTransferGradeSize] CHECK CONSTRAINT [FK_dbo.StoreFlourTransferGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[StoreGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreGradeSize] CHECK CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[StoreGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Size_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreGradeSize] CHECK CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Size_SizeId]
GO
ALTER TABLE [dbo].[StoreGradeSize]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreGradeSize] CHECK CONSTRAINT [FK_dbo.StoreGradeSize_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[StoreProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreProduct_dbo.Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreProduct] CHECK CONSTRAINT [FK_dbo.StoreProduct_dbo.Product_ProductId]
GO
ALTER TABLE [dbo].[StoreProduct]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StoreProduct_dbo.Store_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreProduct] CHECK CONSTRAINT [FK_dbo.StoreProduct_dbo.Store_StoreId]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [FK_StoreStock_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [FK_StoreStock_BranchId]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [FK_StoreStock_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [FK_StoreStock_ProductId]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [FK_StoreStock_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [FK_StoreStock_SectorId]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [Fk_StoreStock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([StockId])
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [Fk_StoreStock_StockId]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [FK_StoreStock_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [FK_StoreStock_StoreId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_BranchId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_CreatedBy]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_DeletedBy]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_StatusId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Store]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_SupplierId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Supply] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Supply] ([SupplyId])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Supply]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_UpdatedBy]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BranchId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_CreatedBy]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_DeletedBy]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_SectorId] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_SectorId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionSubTypeId] FOREIGN KEY([TransactionSubTypeId])
REFERENCES [dbo].[TransactionSubType] ([TransactionSubTypeId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionSubTypeId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionTypeId] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionTypeId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_UpdatedBy]
GO
ALTER TABLE [dbo].[TransactionSubType]  WITH CHECK ADD  CONSTRAINT [FK_TransactionSubType_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TransactionSubType] CHECK CONSTRAINT [FK_TransactionSubType_CreatedBy]
GO
ALTER TABLE [dbo].[TransactionSubType]  WITH CHECK ADD  CONSTRAINT [FK_TransactionSubType_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TransactionSubType] CHECK CONSTRAINT [FK_TransactionSubType_DeletedBy]
GO
ALTER TABLE [dbo].[TransactionSubType]  WITH CHECK ADD  CONSTRAINT [FK_TransactionSubType_TransactionTypeId] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[TransactionSubType] CHECK CONSTRAINT [FK_TransactionSubType_TransactionTypeId]
GO
ALTER TABLE [dbo].[TransactionSubType]  WITH CHECK ADD  CONSTRAINT [FK_TransactionSubType_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TransactionSubType] CHECK CONSTRAINT [FK_TransactionSubType_UpdatedBy]
GO
ALTER TABLE [dbo].[UserBranch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserBranch_dbo.AspNetUser_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserBranch] CHECK CONSTRAINT [FK_dbo.UserBranch_dbo.AspNetUser_Id]
GO
ALTER TABLE [dbo].[UserBranch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserBranch_dbo.Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserBranch] CHECK CONSTRAINT [FK_dbo.UserBranch_dbo.Branch_BranchId]
GO
ALTER TABLE [dbo].[UtilityAccount]  WITH CHECK ADD  CONSTRAINT [FK_UtilityAccount_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[UtilityAccount] CHECK CONSTRAINT [FK_UtilityAccount_BranchId]
GO
ALTER TABLE [dbo].[UtilityAccount]  WITH CHECK ADD  CONSTRAINT [FK_UtilityAccount_CategoryId] FOREIGN KEY([UtilityCategoryId])
REFERENCES [dbo].[UtilityCategory] ([UtilityCategoryId])
GO
ALTER TABLE [dbo].[UtilityAccount] CHECK CONSTRAINT [FK_UtilityAccount_CategoryId]
GO
ALTER TABLE [dbo].[UtilityAccount]  WITH CHECK ADD  CONSTRAINT [FK_UtilityAccount_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UtilityAccount] CHECK CONSTRAINT [FK_UtilityAccount_CreatedBy]
GO
ALTER TABLE [dbo].[UtilityAccount]  WITH CHECK ADD  CONSTRAINT [FK_UtilityAccount_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UtilityAccount] CHECK CONSTRAINT [FK_UtilityAccount_DeletedBy]
GO
ALTER TABLE [dbo].[UtilityAccount]  WITH CHECK ADD  CONSTRAINT [FK_UtilityAccount_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UtilityAccount] CHECK CONSTRAINT [FK_UtilityAccount_UpdatedBy]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_BranchId]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_CreatedBy]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_CustomerId]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_DeletedBy]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_DeliveryId] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_DeliveryId]
GO
ALTER TABLE [dbo].[WeightLoss]  WITH CHECK ADD  CONSTRAINT [FK_WeightLoss_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightLoss] CHECK CONSTRAINT [FK_WeightLoss_UpdatedBy]
GO
ALTER TABLE [dbo].[WeightNoteNumber]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteNumber_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[WeightNoteNumber] CHECK CONSTRAINT [FK_WeightNoteNumber_BranchId]
GO
ALTER TABLE [dbo].[WeightNoteNumber]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteNumber_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteNumber] CHECK CONSTRAINT [FK_WeightNoteNumber_CreatedBy]
GO
ALTER TABLE [dbo].[WeightNoteNumber]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteNumber_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteNumber] CHECK CONSTRAINT [FK_WeightNoteNumber_DeletedBy]
GO
ALTER TABLE [dbo].[WeightNoteNumber]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteNumber_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteNumber] CHECK CONSTRAINT [FK_WeightNoteNumber_UpdatedBy]
GO
ALTER TABLE [dbo].[WeightNoteNumber]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteNumber_WeightNoteRange] FOREIGN KEY([WeightNoteRangeId])
REFERENCES [dbo].[WeightNoteRange] ([WeightNoteRangeId])
GO
ALTER TABLE [dbo].[WeightNoteNumber] CHECK CONSTRAINT [FK_WeightNoteNumber_WeightNoteRange]
GO
ALTER TABLE [dbo].[WeightNoteRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteRange_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[WeightNoteRange] CHECK CONSTRAINT [FK_WeightNoteRange_BranchId]
GO
ALTER TABLE [dbo].[WeightNoteRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteRange_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteRange] CHECK CONSTRAINT [FK_WeightNoteRange_CreatedBy]
GO
ALTER TABLE [dbo].[WeightNoteRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteRange_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteRange] CHECK CONSTRAINT [FK_WeightNoteRange_DeletedBy]
GO
ALTER TABLE [dbo].[WeightNoteRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightNoteRange_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WeightNoteRange] CHECK CONSTRAINT [FK_WeightNoteRange_UpdatedBy]
GO
ALTER TABLE [dbo].[WeightNoteSupply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WeightNoteSupply_dbo.Supply_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Supply] ([SupplyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WeightNoteSupply] CHECK CONSTRAINT [FK_dbo.WeightNoteSupply_dbo.Supply_SupplyId]
GO
ALTER TABLE [dbo].[WeightNoteSupply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WeightSupply_dbo.WeightNoteNumber_WeightNoteNumberId] FOREIGN KEY([WeightNoteNumberId])
REFERENCES [dbo].[WeightNoteNumber] ([WeightNoteNumberId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WeightNoteSupply] CHECK CONSTRAINT [FK_dbo.WeightSupply_dbo.WeightNoteNumber_WeightNoteNumberId]
GO
/****** Object:  StoredProcedure [dbo].[CheckIfWeightNoteExists]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckIfWeightNoteExists]
	@inPutWeightNoteNumber NVARCHAR(50)
	
AS

BEGIN
SELECT COUNT(*) FROM Supply 
        WHERE WeightNoteNumber= @inPutWeightNoteNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashBoardNotifications]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDashBoardNotifications]
	AS
BEGIN
	select
	cashtransfers=(select count(1) from CashTransfer Where (Reject =  0 AND Accept = 0)),
	supplies=(select count(1) from Supply Where  Approved IS NULL),
	deliveries = (select count(1) from Delivery Where Approved IS NULL),
	outsourceroutputs = (select count(1) from OutSourcerOutPut Where Approved IS NULL),
	transactions = (select count(1) from Deposit Where Approved IS NULL),
	requistions = (select count(1) from Requistion Where (StatusId = 10002 AND (Rejected =0 AND Approved = 0)))

END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderToDeliver]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderToDeliver]
	@orderId BIGINT
	
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_GetOrderDetails

	
	select * FROM [Order] WHERE OrderId = @orderId
	
 

 COMMIT TRANSACTION TRA_GetOrderDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_GetOrderDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_AccountTransactionActivity_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_AccountTransactionActivity_AsDeleted]

	@inPutTransactionId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateTransactionDetails

	
	Update AccountTransactionActivity
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE AccountTransactionActivityId = @inPutTransactionId AND Deleted = 0 	
 

 COMMIT TRANSACTION TRA_UpdateTransactionDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateTransactionDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

	
GO
/****** Object:  StoredProcedure [dbo].[Mark_Activity_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Activity_AsDeleted]
		@inPutActivityId BIGINT,
	@userId NVARCHAR (128)
		
AS 
DECLARE 
@ActivityId BIGINT,
@CasualActivityId BIGINT

DECLARE @ActivityBatchCasuals TABLE(
	ActivityId BIGINT
)


DECLARE @CasualActivities TABLE(
	CasualActivityId BIGINT
)
BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateActivityDetails

 
INSERT INTO @ActivityBatchCasuals

	SELECT ActivityId FROM ActivityBatchCasual  WHERE ActivityId = @inPutActivityId  AND Deleted = 0 

WHILE(Select Count(*) From @ActivityBatchCasuals) > 0
BEGIN
	SELECT TOP 1 @ActivityId = ActivityId From @ActivityBatchCasuals 


	Update ActivityBatchCasual
	SET Deleted = 1,DeletedBy = @userId, DeletedOn = GETDATE() 
	WHERE ActivityId = @inPutActivityId AND Deleted = 0
	
	Delete @ActivityBatchCasuals  Where ActivityId = @ActivityId

		
	END
	
 
INSERT INTO @CasualActivities

	SELECT CasualActivityId FROM CasualActivity  WHERE ActivityId = @inPutActivityId  AND Deleted = 0 

WHILE(Select Count(*) From @CasualActivities) > 0
BEGIN
	SELECT TOP 1 @CasualActivityId = CasualActivityId From @CasualActivities 


	Update CasualActivity
	SET Deleted = 1,DeletedBy = @userId, DeletedOn = GETDATE() 
	WHERE ActivityId = @inPutActivityId AND Deleted = 0
	
	Delete @CasualActivities  Where CasualActivityId = @CasualActivityId

		
	END
	
		
	Update Activity
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE ActivityId = @inPutActivityId AND Deleted = 0
	

	

 COMMIT TRANSACTION TRA_UpdateActivityDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateActivityDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_Asset_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Asset_AsDeleted]

	@inPutAssetId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateAssetDetails
 	
	Update Asset
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE AssetId = @inPutAssetId AND Deleted = 0 	
 

 COMMIT TRANSACTION TRA_UpdateAssetDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateAssetDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[Mark_AssetCategory_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_AssetCategory_AsDeleted]
		
@inPutAssetCategoryId BIGINT,
@userId NVARCHAR (128)
		
AS 
DECLARE 
@AssetCategoryId BIGINT,
@AssetId BIGINT

DECLARE @AssetCategoryAssets TABLE
(
		AssetId bigint
	)


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateAssetCategoryDetails

INSERT INTO @AssetCategoryAssets
	SELECT AssetId FROM [Asset] WHERE AssetCategoryId = @inPutAssetCategoryId  AND Deleted = 0 

WHILE(Select Count(*) From @AssetCategoryAssets) > 0
BEGIN
	SELECT TOP 1 @AssetId = AssetId From @AssetCategoryAssets 
				
		
	 Update [Asset]
	 SET Deleted = 1,DeletedBy = @userId,DeletedOn = GETDATE()
	 WHERE AssetId =@AssetId AND Deleted = 0
	 
	 Delete @AssetCategoryAssets Where AssetId = @AssetId

	
	
 END
 
	Update [AssetCategory]
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE AssetCategoryId = @inPutAssetCategoryId AND Deleted = 0

 COMMIT TRANSACTION TRA_UpdateAssetCategoryDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateAssetCategoryDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[Mark_Cash_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Cash_AsDeleted]

@inPutCashId BIGINT,
	@userId NVARCHAR (128),
	@branchId BIGINT 
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateCashDetails

	
	Update Cash
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE CashId = @inPutCashId AND Deleted = 0 AND BranchId = @branchId
	
 

 COMMIT TRANSACTION TRA_UpdateCashDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateCashDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_CasualActivity_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_CasualActivity_AsDeleted]
	@inPutCasualActivityId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateCasualActivityDetails

	
	Update CasualActivity
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE CasualActivityId = @inPutCasualActivityId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateCasualActivityDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateCasualActivityDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[Mark_Delivery_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Delivery_AsDeleted]
	
@inPutDeliveryId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateDeliveryDetails

	
	Update Delivery
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE DeliveryId = @inPutDeliveryId AND Deleted = 0 
	
 

 COMMIT TRANSACTION TRA_UpdateDeliveryDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateDeliveryDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_FactoryExpense_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_FactoryExpense_AsDeleted]
	@inPutFactoryExpenseId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateFactoryExpenseDetails

	
	Update FactoryExpense
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE FactoryExpenseId = @inPutFactoryExpenseId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateFactoryExpenseDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateFactoryExpenseDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[Mark_FinancialAccountTransaction_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_FinancialAccountTransaction_AsDeleted]
	@inPutFinancialAccountId BIGINT,
	@userId NVARCHAR (128),
	@inPutFinancialAccountTransactionId BIGINT
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateFinancialDetails

	
	Update FinancialAccountTransaction
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE FinancialAccountId = @inPutFinancialAccountId AND Deleted = 0 AND FinancialAccountTransactionId = @inPutFinancialAccountTransactionId
	
 

 COMMIT TRANSACTION TRA_UpdateFinancialDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateFinancialDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_LabourCost_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_LabourCost_AsDeleted]
	@inPutLabourCostId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateLabourCostDetails

	
	Update LabourCost
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE LabourCostId = @inPutLabourCostId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateLabourCostDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateLabourCostDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[Mark_MachineRepair_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_MachineRepair_AsDeleted]
	@inPutRepairId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateMachineRepairDetails

	
	Update MachineRepair
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE MachineRepairId = @inPutRepairId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateMachineRepairDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateMachineRepairDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[Mark_Order_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Order_AsDeleted]
	@inPutOrderId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOrderDetails

	
	Update [Order]
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE OrderId = @inPutOrderId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOrderDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOrderDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_OtherExpense_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_OtherExpense_AsDeleted]
	@inPutOtherExpenseId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOtherExpenseDetails

	
	Update OtherExpense
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE OtherExpenseId = @inPutOtherExpenseId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOtherExpenseDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOtherExpenseDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH



GO
/****** Object:  StoredProcedure [dbo].[Mark_Requistion_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Requistion_AsDeleted]
@inPutRequistionId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateRequistionDetails

	
	Update Requistion
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE RequistionId = @inPutRequistionId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateRequistionDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateRequistionDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_Store_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Store_AsDeleted]

@inPutStoreId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateStoreDetails

	
	Update Store
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE StoreId = @inPutStoreId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateStoreDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateStoreDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[Mark_Utility_AccountTransaction_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_Utility_AccountTransaction_AsDeleted]

@inPutUtilityAccountId BIGINT,
	@userId NVARCHAR (128),
	@utilityCategoryId BIGINT
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateUtilityAccountDetails

	
	Update UtilityAccount
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE UtilityAccountId = @inPutUtilityAccountId AND Deleted = 0 AND UtilityCategoryId = @utilityCategoryId
	
 

 COMMIT TRANSACTION TRA_UpdateUtilityAccountDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateUtilityAccountDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Mark_WeightLoss_AsDeleted]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mark_WeightLoss_AsDeleted]

	@inPutWeightLossId BIGINT,
	@userId NVARCHAR (128)
		
AS 

BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateWeightLossDetails
 	
	Update WeightLoss
	SET Deleted =1,DeletedBy = @userId,DeletedOn = GETDATE()
	WHERE WeightLossId = @inPutWeightLossId AND Deleted = 0 	
 

 COMMIT TRANSACTION TRA_UpdateWeightLossDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateWeightLossDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[Update_Delivery_WithApprovedOrRejected]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Delivery_WithApprovedOrRejected]
	@inPutDeliveryId BIGINT,
	@approved BIT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateDeliveryDetails

	
	Update Delivery
	SET Approved = @approved,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE DeliveryId = @inPutDeliveryId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateDeliveryDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateDeliveryDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Update_OutPut_WithApprovedOrRejected]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_OutPut_WithApprovedOrRejected]

	@inPutOutSourcerOutPutId BIGINT,
	@approved BIT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOutPutDetails

	
	Update OutSourcerOutPut
	SET Approved = @approved,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE OutSourcerOutPutId = @inPutOutSourcerOutPutId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOutPutDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOutPutDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Update_RiceInPut_WithApprovedOrRejected]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_RiceInPut_WithApprovedOrRejected]
	@inPutId BIGINT,
	@approved BIT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateInPutDetails

	
	Update RiceInput
	SET Approved = @approved,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE RiceInputId = @inPutId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateInPutDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateInPutDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateBatchBrandQuantity]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBatchBrandQuantity]

	@inPutBatchId BIGINT,
	@quantity Float,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateBatchDetails

	
	Update Batch
	SET BrandBalance = @quantity,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE BatchId = @inPutBatchId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateBatchDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateBatchDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateMaizeBrandBatchQuantity]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMaizeBrandBatchQuantity]

	@inPutMaizeStoreId BIGINT,
	@quantity Float,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateMaizeBrandStoreDetails

	
	Update MaizeBrandStore
	SET Quantity = @quantity,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE MaizeBrandStoreId = @inPutMaizeStoreId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateMaizeBrandStoreDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateMaizeBrandStoreDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderGradeSizes]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderGradeSizes]
	@orderId BIGINT,
	@gradeId BIGINT,
	@sizeId BIGINT,
	@quantity FLOAT,
	@balance FLOAT
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOrderGradeSize

	
	insert into OrderGradeSize (OrderId,GradeId,SizeId,Quantity,[TimeStamp],Balance)
	Values(@orderId,@gradeId,@sizeId,@quantity,GETDATE(), @balance)
	
 COMMIT TRANSACTION TRA_UpdateOrderGradeSize

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOrderGradeSize
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderWithBalanceQuantity]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderWithBalanceQuantity]
	
	@inPutOrderId BIGINT,
	@quantity Float,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOrderDetails

	
	Update [Order]
	SET Balance = @quantity,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE OrderId = @inPutOrderId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOrderDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOrderDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderWithCompletedStatus]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderWithCompletedStatus]

	@inPutOrderId BIGINT,
	@statusId BIGINT,
	@balance FLOAT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOrderDetails

	
	Update [Order]
	SET StatusId = @statusId,Balance=@balance,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE OrderId = @inPutOrderId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOrderDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOrderDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderWithInProgressStatus]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderWithInProgressStatus]

	@inPutOrderId BIGINT,
	@statusId BIGINT,
	@balance FLOAT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateOrderDetails

	
	Update [Order]
	SET StatusId = @statusId,Balance = @balance,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE OrderId = @inPutOrderId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateOrderDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateOrderDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateRequistionWithCompletedStatus]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRequistionWithCompletedStatus]
	@inPutRequistionId BIGINT,
	@statusId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateRequistionDetails

	
	Update Requistion
	SET StatusId = @statusId,ApprovedById = @userId,Approved = 1,[TimeStamp] = GETDATE()
	WHERE RequistionId = @inPutRequistionId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateRequistionDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateRequistionDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateStoreStockWithSoldOut]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStoreStockWithSoldOut]

	@inPutStockId BIGINT,
	@soldOut BIT,
	@inPutProductId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
-- couldn't use full or reasonable name coz sql complains name is too long maximum(32) xters
 BEGIN TRANSACTION TRA_UpdateStoreStockDetails

	
	Update StoreStock
	SET SoldOut = @soldOut,[TimeStamp] = GETDATE()
	WHERE StockId = @inPutStockId AND ProductId = @inPutProductId
	
 
	Update Stock
	SET SoldOut = @soldOut,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE StockId = @inPutStockId AND Deleted = 0
	

 COMMIT TRANSACTION TRA_UpdateStoreStockDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateStoreStockDetails
				PRINT 'Error detected, all changes reversed'
			END

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplyOnRequistionApproval]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplyOnRequistionApproval]

	@inPutSupplyId BIGINT,
	
	@isPaid bit,
	@amountToPay float,
	
	@partialAmount float,
	@partiallyPaid bit,
	@userId NVARCHAR (128)
		
AS 

DECLARE @supplyId BIGINT
BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateSupplyDetails

	
	Update Supply
	SET [TimeStamp] = GETDATE(),
	UpdatedBy = @userId,
	   IsPaid = @isPaid,AmountToPay = @amountToPay, PartiallyPaid = @partiallyPaid,
       PartialAmount = @partialAmount
	WHERE SupplyId = @inPutSupplyId AND (Deleted = 0 OR Deleted = null)
	
 

 COMMIT TRANSACTION TRA_UpdateSupplyDetails

		PRINT 'Operation Successful.'
		RETURN @supplyId
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateSupplyDetails
				RETURN -1
				PRINT 'Error detected, all changes reversed'
			END
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplyWithCompletedStatus]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplyWithCompletedStatus]
	@inPutSupplyId BIGINT,
	@statusId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateSupplyDetails

	
	Update Supply
	SET StatusId = @statusId,UpdatedBy = @userId,[TimeStamp] = GETDATE()
	WHERE SupplyId = @inPutSupplyId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateSupplyDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateSupplyDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplyWithInProgressStatus]    Script Date: 6/21/2021 2:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplyWithInProgressStatus]
	
	@inPutSupplyId BIGINT,
	@statusId BIGINT,
	@userId NVARCHAR (128)
		
AS 


BEGIN TRY
 BEGIN TRANSACTION TRA_UpdateSupplyDetails

	
	Update Supply
	SET StatusId = @statusId,UpdatedBy = @userId,[Used]=1,[TimeStamp] = GETDATE()
	WHERE SupplyId = @inPutSupplyId AND Deleted = 0
	
 

 COMMIT TRANSACTION TRA_UpdateSupplyDetails

		PRINT 'Operation Successful.'
		
 END TRY
 BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION TRA_UpdateSupplyDetails
				PRINT 'Error detected, all changes reversed'
			END
END CATCH
GO
USE [master]
GO
ALTER DATABASE [Buwunga] SET  READ_WRITE 
GO
