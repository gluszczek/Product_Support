CREATE TABLE [dbo].[Ticket]
(
	[Id] NVARCHAR(8) NOT NULL PRIMARY KEY,
	[Subject] NVARCHAR(255) NOT NULL,
	[Date] DATETIME NOT NULL,
	[TicketStatusId] INT NOT NULL,
	[Description] NVARCHAR(Max),
	[Created] DATETIME DEFAULT GETDATE(),
	[CreatedBy] NVARCHAR(255) DEFAULT SYSTEM_USER,
	[Modyfied] DATETIME,
	[ModyfiedBy] NVARCHAR(255),
	CONSTRAINT [FK_Ticket_TicketStatus] FOREIGN KEY ([TicketStatusId]) REFERENCES [dbo].[TicketStatus] ([Id])
)
GO
CREATE TRIGGER [dbo].[Tr_Ticket_Upd] ON [dbo].[Ticket] FOR UPDATE 
AS
UPDATE Ticket
SET Modyfied = GETDATE(), ModyfiedBy = SYSTEM_USER
FROM Ticket JOIN INSERTED ON (Ticket.Id = INSERTED.Id)