CREATE TABLE [dbo].[TicketMessage]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[TicketId] NVARCHAR(8) NOT NULL,
	[Subject] NVARCHAR(255) NOT NULL,
	[ContentHtml] NVARCHAR(MAX) NOT NULL ,
	[Date] Datetime NOT NULL,
	[SenderName] NVARCHAR(125),
	[ReceiverName] NVARCHAR(125),
	[IsReply] BIT NOT NULL,
	[Created] DATETIME DEFAULT GETDATE(),
	[CreatedBy] NVARCHAR(255) DEFAULT SYSTEM_USER,
	[Modyfied] DATETIME,
	[ModyfiedBy] NVARCHAR(255),
	CONSTRAINT [FK_TicketMessage_Ticket] FOREIGN KEY ([TicketId]) REFERENCES [dbo].[Ticket] ([Id])
)
GO
CREATE TRIGGER [dbo].[Tr_TicketMessage_Upd] ON [dbo].[TicketMessage] FOR UPDATE 
AS
UPDATE TicketMessage
SET Modyfied = GETDATE(), ModyfiedBy = SYSTEM_USER
FROM TicketMessage JOIN INSERTED ON (TicketMessage.Id = INSERTED.Id)