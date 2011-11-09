USE [GMR]
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__News__StategyTyp__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__News__StategyTyp__22AA2996]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[News] DROP CONSTRAINT [DF__News__StategyTyp__22AA2996]
END


End
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserTypes_UserTypeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypes]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserTypes_UserTypeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserTypes] DROP CONSTRAINT [DF_UserTypes_UserTypeName]
END


End
GO
/****** Object:  ForeignKey [FK_Chats_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chats_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chats]'))
ALTER TABLE [dbo].[Chats] DROP CONSTRAINT [FK_Chats_Users]
GO
/****** Object:  ForeignKey [FK_Inbox_Services]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inbox]'))
ALTER TABLE [dbo].[Inbox] DROP CONSTRAINT [FK_Inbox_Services]
GO
/****** Object:  ForeignKey [FK_InstantMessages_Chats]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Chats]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages] DROP CONSTRAINT [FK_InstantMessages_Chats]
GO
/****** Object:  ForeignKey [FK_InstantMessages_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages] DROP CONSTRAINT [FK_InstantMessages_Users]
GO
/****** Object:  ForeignKey [FK__MarketPri__Place__5F7E2DAC]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MarketPri__Place__5F7E2DAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices] DROP CONSTRAINT [FK__MarketPri__Place__5F7E2DAC]
GO
/****** Object:  ForeignKey [FK__MarketPri__Symbo__607251E5]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MarketPri__Symbo__607251E5]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices] DROP CONSTRAINT [FK__MarketPri__Symbo__607251E5]
GO
/****** Object:  ForeignKey [FK_MarketPrices_Partners]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MarketPrices_Partners]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices] DROP CONSTRAINT [FK_MarketPrices_Partners]
GO
/****** Object:  ForeignKey [FK_News_Categories]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News] DROP CONSTRAINT [FK_News_Categories]
GO
/****** Object:  ForeignKey [FK_Outbox_Services]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Outbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Outbox]'))
ALTER TABLE [dbo].[Outbox] DROP CONSTRAINT [FK_Outbox_Services]
GO
/****** Object:  ForeignKey [FK_Partners_CreatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners] DROP CONSTRAINT [FK_Partners_CreatedBy]
GO
/****** Object:  ForeignKey [FK_Partners_UpdatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners] DROP CONSTRAINT [FK_Partners_UpdatedBy]
GO
/****** Object:  ForeignKey [FK_Permissions_Groups]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [FK_Permissions_Groups]
GO
/****** Object:  ForeignKey [FK_Permissions_Modules]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [FK_Permissions_Modules]
GO
/****** Object:  ForeignKey [FK_Permissions_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [FK_Permissions_Users]
GO
/****** Object:  ForeignKey [FK_Users_Groups]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Groups]
GO
/****** Object:  ForeignKey [FK_Users_Staffs]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Staffs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Staffs]
GO
/****** Object:  ForeignKey [FK_Users_Users_CreatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Users_CreatedBy]
GO
/****** Object:  ForeignKey [FK_Users_Users_UpdatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Users_UpdatedBy]
GO
/****** Object:  ForeignKey [FK_Users_UserTypes]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UserTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_UserTypes]
GO
/****** Object:  Table [dbo].[Inbox]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inbox]') AND type in (N'U'))
DROP TABLE [dbo].[Inbox]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
DROP TABLE [dbo].[News]
GO
/****** Object:  Table [dbo].[Outbox]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Outbox]') AND type in (N'U'))
DROP TABLE [dbo].[Outbox]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modules]') AND type in (N'U'))
DROP TABLE [dbo].[Modules]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permissions]') AND type in (N'U'))
DROP TABLE [dbo].[Permissions]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Districts]') AND type in (N'U'))
DROP TABLE [dbo].[Districts]
GO
/****** Object:  Table [dbo].[MarketPrices]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MarketPrices]') AND type in (N'U'))
DROP TABLE [dbo].[MarketPrices]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
DROP TABLE [dbo].[Groups]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services]') AND type in (N'U'))
DROP TABLE [dbo].[Services]
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statistics]') AND type in (N'U'))
DROP TABLE [dbo].[Statistics]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
DROP TABLE [dbo].[Status]
GO
/****** Object:  Table [dbo].[SymbolTypes]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SymbolTypes]') AND type in (N'U'))
DROP TABLE [dbo].[SymbolTypes]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 10/16/2011 19:43:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypes]') AND type in (N'U'))
DROP TABLE [dbo].[UserTypes]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chats]') AND type in (N'U'))
DROP TABLE [dbo].[Chats]
GO
/****** Object:  Table [dbo].[InstantMessages]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstantMessages]') AND type in (N'U'))
DROP TABLE [dbo].[InstantMessages]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 10/16/2011 19:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Partners]') AND type in (N'U'))
DROP TABLE [dbo].[Partners]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Partners]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Partners](
	[PartnerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](512) NULL,
	[ContactName] [nvarchar](255) NULL,
	[PhoneNumber1] [nvarchar](30) NULL,
	[PhoneNumber2] [nvarchar](30) NULL,
	[Description] [nvarchar](1024) NULL,
	[PartnerType] [nvarchar](10) NULL,
	[LogoPath] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserID] [int] NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Partners] ON
INSERT [dbo].[Partners] ([PartnerID], [Name], [Address], [ContactName], [PhoneNumber1], [PhoneNumber2], [Description], [PartnerType], [LogoPath], [Status], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (1, N'Test', N'123 AA', N'Truong Nguyen', N'00000', N'0000', N'ccc', N'Type', N'logo.png', 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Partners] OFF
/****** Object:  Table [dbo].[InstantMessages]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstantMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InstantMessages](
	[InstantMessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ChatRoomID] [int] NULL,
	[AddBy] [int] NULL,
	[Content] [nvarchar](1024) NULL,
	[ContentType] [nvarchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_InstantMessage_InstantMessageID] PRIMARY KEY CLUSTERED 
(
	[InstantMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chats](
	[ChatRoomID] [int] NOT NULL,
	[SessionName] [nvarchar](255) NULL,
	[MemberID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[ChatRoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 10/16/2011 19:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[StatusID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[DisplayName] [nvarchar](50) NULL,
 CONSTRAINT [PK_User_Types] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON
INSERT [dbo].[UserTypes] ([UserTypeID], [UserTypeName], [Description], [StatusID], [CreatedDate], [UpdatedDate], [DisplayName]) VALUES (2, N'Super Admin', NULL, 1, CAST(0x00009F7800000000 AS DateTime), CAST(0x00009F7800000000 AS DateTime), NULL)
INSERT [dbo].[UserTypes] ([UserTypeID], [UserTypeName], [Description], [StatusID], [CreatedDate], [UpdatedDate], [DisplayName]) VALUES (4, N'Partner', NULL, 1, CAST(0x00009E0B00000000 AS DateTime), CAST(0x00009E0B00000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
/****** Object:  Table [dbo].[SymbolTypes]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SymbolTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SymbolTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_SymbolTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SymbolTypes] ON
INSERT [dbo].[SymbolTypes] ([ID], [DisplayName], [Order]) VALUES (1, N'SJC', 1)
INSERT [dbo].[SymbolTypes] ([ID], [DisplayName], [Order]) VALUES (3, N'Gold', 2)
INSERT [dbo].[SymbolTypes] ([ID], [DisplayName], [Order]) VALUES (4, N'Dollar', 3)
SET IDENTITY_INSERT [dbo].[SymbolTypes] OFF
/****** Object:  Table [dbo].[Status]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statistics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Statistics](
	[StatID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentCount] [bigint] NULL,
	[AddUpCount] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[Today] [datetime] NULL,
 CONSTRAINT [PK_Statistics] PRIMARY KEY CLUSTERED 
(
	[StatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](255) NULL,
	[Syntax] [nvarchar](255) NULL,
	[ServiceNumber] [nchar](10) NULL,
	[Description] [nvarchar](1024) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](32) NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[PhoneNumber1] [nvarchar](20) NOT NULL,
	[PhoneNumber2] [nvarchar](20) NULL,
	[PhoneNumber3] [nvarchar](20) NULL,
	[UserTypeID] [int] NOT NULL,
	[GroupID] [int] NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[StatusID] [int] NULL,
	[Occupation] [nvarchar](255) NULL,
	[AnualIcome] [nvarchar](255) NULL,
	[Industry] [nvarchar](255) NULL,
	[BirthYear] [nvarchar](5) NULL,
	[Description] [nvarchar](1024) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserID] [int] NULL,
	[PartnerId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [FullName], [PhoneNumber1], [PhoneNumber2], [PhoneNumber3], [UserTypeID], [GroupID], [Email], [Address], [StatusID], [Occupation], [AnualIcome], [Industry], [BirthYear], [Description], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID], [PartnerId]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'Admin MRC', N'111', NULL, NULL, 2, NULL, N'admin@nhipdieudautu.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, CAST(0x00009F7800000000 AS DateTime), NULL, CAST(0x00009F7800000000 AS DateTime), NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [FullName], [PhoneNumber1], [PhoneNumber2], [PhoneNumber3], [UserTypeID], [GroupID], [Email], [Address], [StatusID], [Occupation], [AnualIcome], [Industry], [BirthYear], [Description], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID], [PartnerId]) VALUES (2, N'partner', N'e10adc3949ba59abbe56e057f20f883e', N'Partner MRC', N'567890', NULL, NULL, 4, NULL, N'partner1@nhipdieudautu.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, CAST(0x00009F7800000000 AS DateTime), NULL, CAST(0x00009F7800000000 AS DateTime), NULL, 1)
/****** Object:  Table [dbo].[Groups]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[Description] [nvarchar](1024) NULL,
	[StatusID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MarketPrices]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MarketPrices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MarketPrices](
	[MarketPriceID] [bigint] IDENTITY(1,1) NOT NULL,
	[SymbolNameID] [int] NOT NULL,
	[PlaceID] [int] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[CurrBuyPrice] [money] NULL,
	[CurrSellPrice] [money] NULL,
	[DailyOpenPrice] [money] NULL,
	[DailyClosePrice] [money] NULL,
	[DailyPriceChange] [money] NULL,
	[PartnerID] [int] NULL,
	[UpdateDateTime] [datetime] NULL,
	[AdjustedRate] [nvarchar](1024) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserID] [int] NULL,
 CONSTRAINT [PK_MarketPrice_MarketPriceID] PRIMARY KEY CLUSTERED 
(
	[MarketPriceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MarketPrices] ON
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (1, 1, 1, NULL, 4678.0000, 4678.0000, 1.0000, 1.0000, NULL, 1, CAST(0x00009F7D0105376E AS DateTime), N'1', CAST(0x00009F7D0105376E AS DateTime), 1, CAST(0x00009F7C0105376E AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (2, 1, 1, NULL, 4320.0000, 4320.0000, 2.0000, 2.0000, NULL, 1, CAST(0x00009F7D013A1689 AS DateTime), N'2', CAST(0x00009F7D013A1689 AS DateTime), 1, CAST(0x00009F7C013A1689 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (3, 1, 1, NULL, 3200.0000, 4200.0000, 370000.0000, 370000.0000, NULL, 1, CAST(0x00009F7D01522363 AS DateTime), NULL, CAST(0x00009F7D01522363 AS DateTime), 1, CAST(0x00009F7D01522363 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (4, 1, 1, NULL, 4000.0000, 4000.0000, NULL, NULL, NULL, 1, CAST(0x00009F7E00E490BC AS DateTime), NULL, CAST(0x00009F7E00E490BC AS DateTime), 1, CAST(0x00009F7E00E490BC AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (5, 1, 1, NULL, 4325.0000, 4000.0000, NULL, NULL, NULL, 1, CAST(0x00009F7E00E4F863 AS DateTime), NULL, CAST(0x00009F7E00E4F863 AS DateTime), 1, CAST(0x00009F7E00E4F863 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (6, 1, 1, NULL, 3600.0000, 3600.0000, 500.0000, 500.0000, 0.0000, 1, CAST(0x00009F7E00F0EFA3 AS DateTime), N'0.0%', CAST(0x00009F7E00F0EFA3 AS DateTime), 1, CAST(0x00009F7E00F0EFA3 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (7, 1, 1, NULL, 3666.0000, 3777.0000, 500.0000, 666.0000, 0.0000, 1, CAST(0x00009F7E00F13AB2 AS DateTime), N'0.0%', CAST(0x00009F7E00F13AB2 AS DateTime), 1, CAST(0x00009F7E00F13AB2 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (8, 1, 1, NULL, 3700.0000, 3725.0000, 500.0000, 700.0000, 0.0000, 1, CAST(0x00009F7E00F1EDCA AS DateTime), N'0.0%', CAST(0x00009F7E00F1EDCA AS DateTime), 1, CAST(0x00009F7E00F1EDCA AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (9, 1, 1, NULL, 3888.0000, 3999.0000, NULL, 370000.0000, -369112.0000, 1, CAST(0x00009F7E00F28E4B AS DateTime), N'-369112.0%', CAST(0x00009F7E00F28E4B AS DateTime), 1, CAST(0x00009F7E00F28E4B AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (10, 3, 1, NULL, 1250.0000, 1268.0000, 1250.0000, 1250.0000, 0.0000, 1, CAST(0x00009F7E0112F376 AS DateTime), N'-1250.0%', CAST(0x00009F7E0112F376 AS DateTime), 1, CAST(0x00009F7D0112F376 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (11, 3, 1, NULL, 1380.0000, 1400.0000, 1380.0000, 1250.0000, 130.0000, 1, CAST(0x00009F7E01133945 AS DateTime), N'-1120.0%', CAST(0x00009F7E01133945 AS DateTime), 1, CAST(0x00009F7E01133945 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (12, 3, 1, NULL, 1388.0000, 1433.0000, 1380.0000, 1250.0000, 138.0000, 1, CAST(0x00009F7E011450E5 AS DateTime), N'0.1%', CAST(0x00009F7E011450E5 AS DateTime), 1, CAST(0x00009F7E011450E5 AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (13, 3, 1, NULL, 1390.0000, 1422.0000, 1380.0000, 1250.0000, 140.0000, 1, CAST(0x00009F7E0114D69D AS DateTime), N'11.2%', CAST(0x00009F7E0114D69D AS DateTime), 1, CAST(0x00009F7E0114D69D AS DateTime), 1)
INSERT [dbo].[MarketPrices] ([MarketPriceID], [SymbolNameID], [PlaceID], [Description], [CurrBuyPrice], [CurrSellPrice], [DailyOpenPrice], [DailyClosePrice], [DailyPriceChange], [PartnerID], [UpdateDateTime], [AdjustedRate], [CreatedDate], [CreatedUserID], [UpdatedDate], [UpdatedUserID]) VALUES (14, 1, 1, NULL, 3300.0000, 9600.0000, 4000.0000, 3200.0000, 100.0000, 1, CAST(0x00009F7E01188651 AS DateTime), N'3.1%', CAST(0x00009F7E01188651 AS DateTime), 1, CAST(0x00009F7E01188651 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MarketPrices] OFF
/****** Object:  Table [dbo].[Districts]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Districts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Districts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Districts] ON
INSERT [dbo].[Districts] ([ID], [DisplayName], [Order]) VALUES (1, N'HCMC', 1)
INSERT [dbo].[Districts] ([ID], [DisplayName], [Order]) VALUES (2, N'Hà Nội', 2)
INSERT [dbo].[Districts] ([ID], [DisplayName], [Order]) VALUES (4, N'Đà Nẵng', 3)
SET IDENTITY_INSERT [dbo].[Districts] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[ImagePath] [nvarchar](255) NULL,
	[Description] [nvarchar](1024) NULL,
	[StatusID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [pk_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NULL,
	[ModuleID] [int] NULL,
	[Read] [bit] NULL,
	[Create] [bit] NULL,
	[Edit] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Modules](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](1024) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Outbox]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Outbox]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Outbox](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](1024) NULL,
	[ServiceID] [int] NULL,
	[ServiceNumber] [nvarchar](20) NULL,
	[ToNumber] [nvarchar](30) NULL,
	[SentDate] [datetime] NULL,
	[Description] [nvarchar](1024) NULL,
	[StatusID] [int] NULL,
	[Source] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Outbox] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Headline] [nvarchar](1024) NULL,
	[Subject] [nvarchar](1024) NULL,
	[News_CategoryID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ViewCount] [int] NULL,
	[Description] [nvarchar](1024) NULL,
	[SMSChannel] [nvarchar](1024) NULL,
	[ImagePath] [nvarchar](255) NULL,
	[StategyType] [nvarchar](2) NOT NULL,
	[Status] [nvarchar](2) NOT NULL,
	[Source] [nvarchar](100) NULL,
	[Author] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedUserID] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Inbox]    Script Date: 10/16/2011 19:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inbox]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inbox](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](1024) NULL,
	[ServiceID] [int] NULL,
	[ServiceNumber] [nvarchar](20) NULL,
	[FromNumber] [nvarchar](30) NULL,
	[ReceivedDate] [datetime] NULL,
	[Description] [nvarchar](1024) NULL,
	[StatusID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Inbox] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Default [DF__News__StategyTyp__22AA2996]    Script Date: 10/16/2011 19:43:31 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__News__StategyTyp__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__News__StategyTyp__22AA2996]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__StategyTyp__22AA2996]  DEFAULT ('S') FOR [StategyType]
END


End
GO
/****** Object:  Default [DF_UserTypes_UserTypeName]    Script Date: 10/16/2011 19:43:32 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserTypes_UserTypeName]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserTypes_UserTypeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserTypes] ADD  CONSTRAINT [DF_UserTypes_UserTypeName]  DEFAULT (N'') FOR [UserTypeName]
END


End
GO
/****** Object:  ForeignKey [FK_Chats_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chats_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chats]'))
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chats_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chats]'))
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users]
GO
/****** Object:  ForeignKey [FK_Inbox_Services]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inbox]'))
ALTER TABLE [dbo].[Inbox]  WITH CHECK ADD  CONSTRAINT [FK_Inbox_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inbox]'))
ALTER TABLE [dbo].[Inbox] CHECK CONSTRAINT [FK_Inbox_Services]
GO
/****** Object:  ForeignKey [FK_InstantMessages_Chats]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Chats]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages]  WITH CHECK ADD  CONSTRAINT [FK_InstantMessages_Chats] FOREIGN KEY([ChatRoomID])
REFERENCES [dbo].[Chats] ([ChatRoomID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Chats]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages] CHECK CONSTRAINT [FK_InstantMessages_Chats]
GO
/****** Object:  ForeignKey [FK_InstantMessages_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages]  WITH CHECK ADD  CONSTRAINT [FK_InstantMessages_Users] FOREIGN KEY([AddBy])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstantMessages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstantMessages]'))
ALTER TABLE [dbo].[InstantMessages] CHECK CONSTRAINT [FK_InstantMessages_Users]
GO
/****** Object:  ForeignKey [FK__MarketPri__Place__5F7E2DAC]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MarketPri__Place__5F7E2DAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices]  WITH CHECK ADD FOREIGN KEY([PlaceID])
REFERENCES [dbo].[Districts] ([ID])
GO
/****** Object:  ForeignKey [FK__MarketPri__Symbo__607251E5]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MarketPri__Symbo__607251E5]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices]  WITH CHECK ADD FOREIGN KEY([SymbolNameID])
REFERENCES [dbo].[SymbolTypes] ([ID])
GO
/****** Object:  ForeignKey [FK_MarketPrices_Partners]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MarketPrices_Partners]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices]  WITH CHECK ADD  CONSTRAINT [FK_MarketPrices_Partners] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MarketPrices_Partners]') AND parent_object_id = OBJECT_ID(N'[dbo].[MarketPrices]'))
ALTER TABLE [dbo].[MarketPrices] CHECK CONSTRAINT [FK_MarketPrices_Partners]
GO
/****** Object:  ForeignKey [FK_News_Categories]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Categories] FOREIGN KEY([News_CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Categories]
GO
/****** Object:  ForeignKey [FK_Outbox_Services]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Outbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Outbox]'))
ALTER TABLE [dbo].[Outbox]  WITH CHECK ADD  CONSTRAINT [FK_Outbox_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Outbox_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[Outbox]'))
ALTER TABLE [dbo].[Outbox] CHECK CONSTRAINT [FK_Outbox_Services]
GO
/****** Object:  ForeignKey [FK_Partners_CreatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_CreatedBy] FOREIGN KEY([CreatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_CreatedBy]
GO
/****** Object:  ForeignKey [FK_Partners_UpdatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_UpdatedBy] FOREIGN KEY([UpdatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Partners_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Partners]'))
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_UpdatedBy]
GO
/****** Object:  ForeignKey [FK_Permissions_Groups]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Groups]
GO
/****** Object:  ForeignKey [FK_Permissions_Modules]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Modules]
GO
/****** Object:  ForeignKey [FK_Permissions_Users]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permissions_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permissions]'))
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users]
GO
/****** Object:  ForeignKey [FK_Users_Groups]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Groups]
GO
/****** Object:  ForeignKey [FK_Users_Staffs]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Staffs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Staffs] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Staffs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Staffs]
GO
/****** Object:  ForeignKey [FK_Users_Users_CreatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_CreatedBy] FOREIGN KEY([CreatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users_CreatedBy]
GO
/****** Object:  ForeignKey [FK_Users_Users_UpdatedBy]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_UpdatedBy] FOREIGN KEY([UpdatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Users_UpdatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users_UpdatedBy]
GO
/****** Object:  ForeignKey [FK_Users_UserTypes]    Script Date: 10/16/2011 19:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UserTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UserTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
