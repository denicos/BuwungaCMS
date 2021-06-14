﻿CREATE TABLE [dbo].[Requistion]
(
	[RequistionId] BIGINT IDENTITY(1,1) NOT NULL,	
	[StatusId] BIGINT NOT NULL,
	[BranchId] BIGINT NOT NULL,
	[Amount]  FLOAT NOT NULL,
	[ApprovedById]  [nvarchar](128) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AmountInWords] [nvarchar](max) NOT NULL,
	[Response]   [nvarchar](max) NULL,
	[Approved]   bit NOT NULL,
	[Rejected]   bit NOT NULL,
	[RequistionNumber] [nvarchar](128) NOT NULL,
	[Deleted]	[bit] NULL,
	[CreatedBy] [nvarchar](128) NULL, 
    [UpdatedBy] [nvarchar](128) NULL,     
    [DeletedBy] [nvarchar](128) NULL,
	[CreatedOn]	[datetime] NULL,
	[TimeStamp]	[datetime] NOT NULL DEFAULT GETDATE(),	
	[DeletedOn]	[datetime] NULL,
	[CasualWorkerId] BIGINT NULL,
	[ActivityId]	BIGINT NULL,
	[SupplyId]      BIGINT  NULL,
	[BatchId]		BIGINT NULL,
	[PartPayment]    [bit] DEFAULT(0),
	[RequistionCategoryId] BIGINT NOT NULL,
	[Quantity]      FLOAT NULL,
	[RepairerName]  [nvarchar](255) NULL,
	[RepairDate]	[datetime] NOT NULL DEFAULT GETDATE(),	
	[UtilityCategoryId]   BIGINT NULL,
	
    CONSTRAINT [PK_dbo.Requistion] PRIMARY KEY CLUSTERED 
(
	[RequistionId] ASC
),
CONSTRAINT [FK_Requistion_StatusId] FOREIGN KEY([StatusId]) REFERENCES [dbo].[Status](StatusId),
CONSTRAINT [FK_Requistion_BranchId] FOREIGN KEY([BranchId]) REFERENCES [dbo].[Branch](BranchId),
CONSTRAINT [FK_Requistion_ApprovedById] FOREIGN KEY ([ApprovedById]) REFERENCES [dbo].[AspNetUsers](Id),

CONSTRAINT [FK_Requistion_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[AspNetUsers](Id),
CONSTRAINT [FK_Requistion_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[AspNetUsers](Id),
CONSTRAINT [FK_Requistion_DeletedBy] FOREIGN KEY ([DeletedBy]) REFERENCES [dbo].[AspNetUsers](Id),
CONSTRAINT [FK_Requistion_CasualWorker] FOREIGN KEY ([CasualWorkerId]) REFERENCES [dbo].[CasualWorker](CasualWorkerId),
CONSTRAINT [FK_Requistion_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity](ActivityId),
CONSTRAINT [FK_Requistion_Batch] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[Batch](BatchId),
CONSTRAINT [FK_Requistion_UtilityCategory] FOREIGN KEY ([UtilityCategoryId]) REFERENCES [dbo].[UtilityCategory](UtilityCategoryId),
CONSTRAINT [FK_Requistion_Supply] FOREIGN KEY ([SupplyId]) REFERENCES [dbo].[Supply](SupplyId),
CONSTRAINT [FK_Requistion_RequistionCategory] FOREIGN KEY ([RequistionCategoryId]) REFERENCES [dbo].[RequistionCategory](RequistionCategoryId),
)ON [PRIMARY]

