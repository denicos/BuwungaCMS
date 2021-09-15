CREATE TABLE [dbo].[MillingCharge]
(
	[MillingChargeId]  BIGINT IDENTITY(1,1) NOT NULL,	
	[BranchId]  BIGINT NULL,
	[Quantity] FLOAT NOT NULL,
	[Notes]   [nvarchar](max) NULL,
	[Amount] FLOAT NOT NULL,
	[Deleted]	[bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,     
    [DeletedBy] [nvarchar](128) NULL,
	[CreatedOn]	[datetime] NOT NULL,
	[TimeStamp]	[datetime] NOT NULL DEFAULT GETDATE(),	
	[DeletedOn]	[datetime] NULL,
	

    CONSTRAINT [PK_dbo.MillingCharge] PRIMARY KEY CLUSTERED 
(
	[MillingChargeId] ASC
),
CONSTRAINT [FK_MillingCharge_BranchId] FOREIGN KEY([BranchId]) REFERENCES [dbo].[Branch](BranchId),
CONSTRAINT [FK_MillingCharge_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[AspNetUsers](Id),
CONSTRAINT [FK_MillingCharge_DeletedBy] FOREIGN KEY ([DeletedBy]) REFERENCES [dbo].[AspNetUsers](Id),
)ON [PRIMARY]
