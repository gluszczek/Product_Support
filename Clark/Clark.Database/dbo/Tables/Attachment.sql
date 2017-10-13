CREATE TABLE [dbo].[Attachment]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[TicketMessageId] UNIQUEIDENTIFIER NOT NULL,
	[Size] INT NOT NULL,
	[MimeType] NVARCHAR(255) NOT NULL,
	[MediaType] NVARCHAR(255) NOT NULL,
	[MediaSubtype] NVARCHAR(255) NOT NULL,
	[FileName] NVARCHAR(255) NOT NULL,
	[Created] DATETIME DEFAULT GETDATE(),
	[CreatedBy] NVARCHAR(255) DEFAULT SYSTEM_USER,
	[Modyfied] DATETIME,
	[ModyfiedBy] NVARCHAR(255),
	CONSTRAINT [FK_Attachment_TicketMessage] FOREIGN KEY ([TicketMessageId]) REFERENCES [dbo].[TicketMessage] ([Id])
)
GO
CREATE TRIGGER [dbo].[Tr_Attachment_Upd] ON [dbo].[Attachment] FOR UPDATE 
AS
UPDATE Attachment
SET Modyfied = GETDATE(), ModyfiedBy = SYSTEM_USER
FROM Attachment JOIN INSERTED ON (Attachment.Id = INSERTED.Id)