USE [master]
GO
/****** Object:  Database [WorkR Test]    Script Date: 22/05/2022 14:43:20 ******/
CREATE DATABASE [WorkR Test]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WorkR Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkR Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkR Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkR Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkR Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkR Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkR Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkR Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkR Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkR Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkR Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkR Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkR Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkR Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkR Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkR Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkR Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkR Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkR Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkR Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkR Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkR Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkR Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkR Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkR Test] SET RECOVERY FULL 
GO
ALTER DATABASE [WorkR Test] SET  MULTI_USER 
GO
ALTER DATABASE [WorkR Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkR Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkR Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkR Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorkR Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WorkR Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorkR Test', N'ON'
GO
ALTER DATABASE [WorkR Test] SET QUERY_STORE = OFF
GO
USE [WorkR Test]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Booking](
--	[bookingID] [uniqueidentifier] NOT NULL,
--	[customerID] [uniqueidentifier] NOT NULL,
--	[serviceID] [uniqueidentifier] NOT NULL,
--	[bookingTime] [datetime] NOT NULL,
--	[bookingBody] [varchar](50) NOT NULL,
--	[isDeleted] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NULL,
--	[timeDeleted] [datetime] NULL,
-- CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
--(
--	[bookingID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[CommunicationMedium]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[CommunicationMedium](
--	[mediumID] [uniqueidentifier] NOT NULL,
--	[chatBox] [bit] NOT NULL,
--	[phoneCall] [bit] NOT NULL,
--	[onlineCall] [bit] NOT NULL,
-- CONSTRAINT [PK_CommunicationMedium] PRIMARY KEY CLUSTERED 
--(
--	[mediumID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/05/2022 14:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [uniqueidentifier] NOT NULL,
--	[customerTypeID] [uniqueidentifier] NOT NULL,
--	[customerVerificationID] [uniqueidentifier] NOT NULL,
--	[geolocationID] [uniqueidentifier] NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[customerEmailAddress] [nvarchar](50) NOT NULL,
	[customerAddress] [nvarchar](50) NOT NULL,
	[customerHomePhone] [nchar](15) NULL,
	[customerGender] [nvarchar](6) NOT NULL,
	[customerAge] [int] NOT NULL,
	[customerPersonalPhone] [nchar](15) NOT NULL,
	[customerOccupation] [nvarchar](50) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[timeCreated] [datetime] NOT NULL,
	[timeUpdated] [datetime] NOT NULL,
	[timeDeleted] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
--CONSTRAINT [IX_Customer] UNIQUE NONCLUSTERED 
--(
--	[customerVerificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerComplaint]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[CustomerComplaint](
--	[complaintID] [uniqueidentifier] NOT NULL,
--	[customerID] [uniqueidentifier] NOT NULL,
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[complaintTitle] [varchar](30) NOT NULL,
--	[complaintBody] [varchar](max) NOT NULL,
-- CONSTRAINT [PK_CustomerComplaint] PRIMARY KEY CLUSTERED 
--(
--	[complaintID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_CustomerComplaint] UNIQUE NONCLUSTERED 
--(
--	[serviceProviderID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 22/05/2022 14:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[customerTypeID] [uniqueidentifier] NOT NULL,
	[customerTypeName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CustomerType] PRIMARY KEY CLUSTERED 
(
	[customerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerVerification]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[CustomerVerification](
--	[customerVerificationID] [uniqueidentifier] NOT NULL,
--	[identificationID] [uniqueidentifier] NOT NULL,
-- CONSTRAINT [PK_CustomerVerification] PRIMARY KEY CLUSTERED 
--(
--	[customerVerificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_CustomerVerification] UNIQUE NONCLUSTERED 
--(
--	[identificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[Geolocation]    Script Date: 22/05/2022 14:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geolocation](
	[geolocationID] [uniqueidentifier] NOT NULL,
	[longitude] [decimal](12, 9) NOT NULL,
	[latitude] [decimal](12, 9) NOT NULL,
 CONSTRAINT [PK_Geolocation] PRIMARY KEY CLUSTERED 
(
	[geolocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Identification]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Identification](
--	[identificationID] [uniqueidentifier] NOT NULL,
--	[identificationType] [nvarchar](30) NOT NULL,
--	[identificationImage] [varbinary](max) NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
-- CONSTRAINT [PK_Identification] PRIMARY KEY CLUSTERED 
--(
--	[identificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[Payment]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Payment](
--	[paymentID] [uniqueidentifier] NOT NULL,
--	[customerID] [uniqueidentifier] NOT NULL,
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[paymentMode] [varchar](50) NOT NULL,
--	[paymentInvoice] [varchar](50) NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
-- CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
--(
--	[paymentID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ProviderVerification]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ProviderVerification](
--	[providerVerficationID] [uniqueidentifier] NOT NULL,
--	[identificationID] [uniqueidentifier] NOT NULL,
--	[providerGuarantorName] [nvarchar](50) NOT NULL,
--	[providerGuarantorAddress] [nvarchar](50) NOT NULL,
--	[providerGuarantorPhone] [nchar](15) NOT NULL,
--	[providerIsVerified] [bit] NOT NULL,
--	[isDeleted] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeDeleted] [datetime] NULL,
-- CONSTRAINT [PK_ProviderVerification] PRIMARY KEY CLUSTERED 
--(
--	[providerVerficationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_ProviderVerification] UNIQUE NONCLUSTERED 
--(
--	[identificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[Service]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Service](
--	[serviceID] [uniqueidentifier] NOT NULL,
--	[serviceCategoryID] [uniqueidentifier] NOT NULL,
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[geolocationID] [uniqueidentifier] NOT NULL,
--	[mediumID] [uniqueidentifier] NOT NULL,
--	[serviceTitle] [varchar](50) NOT NULL,
--	[serviceURL] [varbinary](50) NOT NULL,
--	[serviceCost] [int] NOT NULL,
--	[isDeleted] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
--	[timeDeleted] [datetime] NULL,
-- CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
--(
--	[serviceID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceCategory](
--	[serviceCategoryID] [uniqueidentifier] NOT NULL,
--	[serviceCategoryName] [varchar](50) NOT NULL,
--	[serviceCategoryDescription] [varchar](80) NOT NULL,
-- CONSTRAINT [PK_Service_Category] PRIMARY KEY CLUSTERED 
--(
--	[serviceCategoryID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServicePaymentStatus]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServicePaymentStatus](
--	[servicePaymentStatusID] [uniqueidentifier] NOT NULL,
--	[paymentID] [uniqueidentifier] NOT NULL,
--	[paymentValue] [varchar](50) NOT NULL,
--	[paidAmount] [int] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
-- CONSTRAINT [PK_ServicePaymentStatus] PRIMARY KEY CLUSTERED 
--(
--	[servicePaymentStatusID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_ServicePaymentStatus] UNIQUE NONCLUSTERED 
--(
--	[paymentID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceProvider]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceProvider](
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[providerVerificationID] [uniqueidentifier] NOT NULL,
--	[geolocationID] [uniqueidentifier] NOT NULL,
--	[statusID] [uniqueidentifier] NOT NULL,
--	[providerName] [nvarchar](50) NOT NULL,
--	[providerEmailAddress] [nvarchar](50) NOT NULL,
--	[providerHomeAddress] [nvarchar](50) NOT NULL,
--	[providerPhoneNumber] [nchar](15) NOT NULL,
--	[providerBusinessName] [nvarchar](50) NOT NULL,
--	[providerOfficeAddress] [nvarchar](50) NOT NULL,
--	[providerOfficePhone] [nchar](15) NOT NULL,
--	[providerGender] [nvarchar](10) NOT NULL,
--	[providerAge] [int] NOT NULL,
--	[isDeleted] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
--	[timeDeleted] [datetime] NULL,
-- CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED 
--(
--	[serviceProviderID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_ServiceProvider] UNIQUE NONCLUSTERED 
--(
--	[statusID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_ServiceProvider_1] UNIQUE NONCLUSTERED 
--(
--	[providerVerificationID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceProviderRating]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceProviderRating](
--	[serviceProviderRatingID] [uniqueidentifier] NOT NULL,
--	[customerID] [uniqueidentifier] NOT NULL,
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[rating] [int] NOT NULL,
-- CONSTRAINT [PK_Service_Provider_Rating] PRIMARY KEY CLUSTERED 
--(
--	[serviceProviderRatingID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceProviderReview]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceProviderReview](
--	[serviceProviderReviewID] [uniqueidentifier] NOT NULL,
--	[customerID] [uniqueidentifier] NOT NULL,
--	[serviceProviderID] [uniqueidentifier] NOT NULL,
--	[serviceProviderReviewBody] [varchar](50) NOT NULL,
--	[rating] [int] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
-- CONSTRAINT [PK_Service_Provider_Review] PRIMARY KEY CLUSTERED 
--(
--	[serviceProviderReviewID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceProviderStatus]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceProviderStatus](
--	[statusID] [uniqueidentifier] NOT NULL,
--	[isAvailable] [bit] NOT NULL,
--	[isEngaged] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
-- CONSTRAINT [PK_ServiceProviderStatus] PRIMARY KEY CLUSTERED 
--(
--	[statusID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[ServiceRequested]    Script Date: 22/05/2022 14:43:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ServiceRequested](
--	[requestID] [uniqueidentifier] NOT NULL,
--	[serviceID] [uniqueidentifier] NOT NULL,
--	[requestName] [nvarchar](20) NOT NULL,
--	[requestDescription] [nvarchar](70) NOT NULL,
--	[isDeleted] [bit] NOT NULL,
--	[timeCreated] [datetime] NOT NULL,
--	[timeUpdated] [datetime] NOT NULL,
--	[timeDeleted] [datetime] NULL,
-- CONSTRAINT [PK_ServiceRequested] PRIMARY KEY CLUSTERED 
--(
--	[requestID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--ALTER TABLE [dbo].[Booking] ADD  DEFAULT (newsequentialid()) FOR [bookingID]
--GO
--ALTER TABLE [dbo].[Booking] ADD  DEFAULT (newsequentialid()) FOR [customerID]
--GO
--ALTER TABLE [dbo].[Booking] ADD  DEFAULT (newsequentialid()) FOR [serviceID]
--GO
--ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
--GO
--ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__payment__2E1BDC42]  DEFAULT (newsequentialid()) FOR [paymentID]
--GO
--ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__userID__2F10007B]  DEFAULT (newsequentialid()) FOR [customerID]
--GO
--ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__service__300424B4]  DEFAULT (newsequentialid()) FOR [serviceProviderID]
--GO
--ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF__Service__service__32E0915F]  DEFAULT (newsequentialid()) FOR [serviceID]
--GO
--ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF__Service__service__34C8D9D1]  DEFAULT (newsequentialid()) FOR [serviceProviderID]
--GO
--ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
--GO
--ALTER TABLE [dbo].[ServiceCategory] ADD  CONSTRAINT [DF__Service_C__servi__37A5467C]  DEFAULT (newsequentialid()) FOR [serviceCategoryID]
--GO
--ALTER TABLE [dbo].[ServiceProviderRating] ADD  DEFAULT (newsequentialid()) FOR [serviceProviderRatingID]
--GO
--ALTER TABLE [dbo].[ServiceProviderRating] ADD  DEFAULT (newsequentialid()) FOR [customerID]
--GO
--ALTER TABLE [dbo].[ServiceProviderRating] ADD  DEFAULT (newsequentialid()) FOR [serviceProviderID]
--GO
--ALTER TABLE [dbo].[ServiceProviderReview] ADD  CONSTRAINT [DF__Service_P__servi__3F466844]  DEFAULT (newsequentialid()) FOR [serviceProviderReviewID]
--GO
--ALTER TABLE [dbo].[ServiceProviderReview] ADD  CONSTRAINT [DF__Service_P__userI__403A8C7D]  DEFAULT (newsequentialid()) FOR [customerID]
--GO
--ALTER TABLE [dbo].[ServiceProviderReview] ADD  CONSTRAINT [DF__Service_P__servi__412EB0B6]  DEFAULT (newsequentialid()) FOR [serviceProviderID]
--GO
--ALTER TABLE [dbo].[ServiceProviderReview] ADD  CONSTRAINT [DF_ServiceProviderReview_rating]  DEFAULT ((1)) FOR [rating]
--GO
--ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([customerID])
--REFERENCES [dbo].[Customer] ([customerID])
--GO
--ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
--GO
--ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Service1] FOREIGN KEY([serviceID])
--REFERENCES [dbo].[Service] ([serviceID])
--GO
--ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Service1]
--GO
ALTER TABLE [dbo].[CustomerType]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerType] FOREIGN KEY([customerTypeID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[CustomerType] CHECK CONSTRAINT [FK_Customer_CustomerType]
GO
--ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerVerification] FOREIGN KEY([customerVerificationID])
--REFERENCES [dbo].[CustomerVerification] ([customerVerificationID])
--GO
--ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerVerification]
--GO
ALTER TABLE [dbo].[Geolocation]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Geolocation] FOREIGN KEY([geolocationID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Geolocation] CHECK CONSTRAINT [FK_Customer_Geolocation]
GO
--ALTER TABLE [dbo].[CustomerComplaint]  WITH CHECK ADD  CONSTRAINT [FK_CustomerComplaint_Customer] FOREIGN KEY([customerID])
--REFERENCES [dbo].[Customer] ([customerID])
--GO
--ALTER TABLE [dbo].[CustomerComplaint] CHECK CONSTRAINT [FK_CustomerComplaint_Customer]
--GO
--ALTER TABLE [dbo].[CustomerComplaint]  WITH CHECK ADD  CONSTRAINT [FK_CustomerComplaint_ServiceProvider] FOREIGN KEY([serviceProviderID])
--REFERENCES [dbo].[ServiceProvider] ([serviceProviderID])
--GO
--ALTER TABLE [dbo].[CustomerComplaint] CHECK CONSTRAINT [FK_CustomerComplaint_ServiceProvider]
--GO
--ALTER TABLE [dbo].[CustomerVerification]  WITH CHECK ADD  CONSTRAINT [FK_CustomerVerification_Identification] FOREIGN KEY([identificationID])
--REFERENCES [dbo].[Identification] ([identificationID])
--GO
--ALTER TABLE [dbo].[CustomerVerification] CHECK CONSTRAINT [FK_CustomerVerification_Identification]
--GO
--ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Customer] FOREIGN KEY([customerID])
--REFERENCES [dbo].[Customer] ([customerID])
--GO
--ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Customer]
--GO
--ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_ServiceProvider] FOREIGN KEY([serviceProviderID])
--REFERENCES [dbo].[ServiceProvider] ([serviceProviderID])
--GO
--ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_ServiceProvider]
--GO
--ALTER TABLE [dbo].[ProviderVerification]  WITH CHECK ADD  CONSTRAINT [FK_ProviderVerification_Identification] FOREIGN KEY([identificationID])
--REFERENCES [dbo].[Identification] ([identificationID])
--GO
--ALTER TABLE [dbo].[ProviderVerification] CHECK CONSTRAINT [FK_ProviderVerification_Identification]
--GO
--ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_CommunicationMedium] FOREIGN KEY([mediumID])
--REFERENCES [dbo].[CommunicationMedium] ([mediumID])
--GO
--ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_CommunicationMedium]
--GO
--ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Geolocation] FOREIGN KEY([geolocationID])
--REFERENCES [dbo].[Geolocation] ([geolocationID])
--GO
--ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Geolocation]
--GO
--ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceCategory] FOREIGN KEY([serviceCategoryID])
--REFERENCES [dbo].[ServiceCategory] ([serviceCategoryID])
--GO
--ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceCategory]
--GO
--ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceProvider] FOREIGN KEY([serviceProviderID])
--REFERENCES [dbo].[ServiceProvider] ([serviceProviderID])
--GO
--ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceProvider]
--GO
--ALTER TABLE [dbo].[ServicePaymentStatus]  WITH CHECK ADD  CONSTRAINT [FK_ServicePaymentStatus_Payment] FOREIGN KEY([paymentID])
--REFERENCES [dbo].[Payment] ([paymentID])
--GO
--ALTER TABLE [dbo].[ServicePaymentStatus] CHECK CONSTRAINT [FK_ServicePaymentStatus_Payment]
--GO
--ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_Geolocation] FOREIGN KEY([geolocationID])
--REFERENCES [dbo].[Geolocation] ([geolocationID])
--GO
--ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_Geolocation]
--GO
--ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_ProviderVerification] FOREIGN KEY([providerVerificationID])
--REFERENCES [dbo].[ProviderVerification] ([providerVerficationID])
--GO
--ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_ProviderVerification]
--GO
--ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_ServiceProviderStatus] FOREIGN KEY([statusID])
--REFERENCES [dbo].[ServiceProviderStatus] ([statusID])
--GO
--ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_ServiceProviderStatus]
--GO
--ALTER TABLE [dbo].[ServiceProviderRating]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviderRating_Customer] FOREIGN KEY([customerID])
--REFERENCES [dbo].[Customer] ([customerID])
--GO
--ALTER TABLE [dbo].[ServiceProviderRating] CHECK CONSTRAINT [FK_ServiceProviderRating_Customer]
--GO
--ALTER TABLE [dbo].[ServiceProviderRating]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviderRating_ServiceProvider] FOREIGN KEY([serviceProviderID])
--REFERENCES [dbo].[ServiceProvider] ([serviceProviderID])
--GO
--ALTER TABLE [dbo].[ServiceProviderRating] CHECK CONSTRAINT [FK_ServiceProviderRating_ServiceProvider]
--GO
--ALTER TABLE [dbo].[ServiceRequested]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequested_Service] FOREIGN KEY([serviceID])
--REFERENCES [dbo].[Service] ([serviceID])
--GO
--ALTER TABLE [dbo].[ServiceRequested] CHECK CONSTRAINT [FK_ServiceRequested_Service]
--GO
USE [master]
GO
ALTER DATABASE [WorkR Test] SET  READ_WRITE 
GO
