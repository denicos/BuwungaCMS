CREATE TABLE [dbo].[PettyCash]
(
	
	[PettyCashId]  BIGINT IDENTITY(1,1) NOT NULL,	
	[BranchId]  BIGINT NOT NULL,
	[StartAmount] FLOAT NOT NULL,
	[Action] [nvarchar](128) NOT NULL,
	[Notes]   [nvarchar](max) NULL,
	[Amount] FLOAT NOT NULL,
	[Balance] FLOAT NOT NULL,
	[RequistionCategoryId]  BIGINT NOT NULL,
	[Deleted]	[bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,     
    [DeletedBy] [nvarchar](128) NULL,
	[CreatedOn]	[datetime] NOT NULL,
	[TimeStamp]	[datetime] NOT NULL DEFAULT GETDATE(),	
	[DeletedOn]	[datetime] NULL,

    CONSTRAINT [PK_dbo.PettyCash] PRIMARY KEY CLUSTERED 
(
	[PettyCashId] ASC
),
CONSTRAINT [FK_PettyCash_BranchId] FOREIGN KEY([BranchId]) REFERENCES [dbo].[Branch](BranchId),
CONSTRAINT [FK_PettyCash_RequistionCategoryId] FOREIGN KEY([RequistionCategoryId]) REFERENCES [dbo].[RequistionCategory](RequistionCategoryId),
CONSTRAINT [FK_PettyCash_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[AspNetUsers](Id),
CONSTRAINT [FK_PettyCash_DeletedBy] FOREIGN KEY ([DeletedBy]) REFERENCES [dbo].[AspNetUsers](Id),
)ON [PRIMARY]


