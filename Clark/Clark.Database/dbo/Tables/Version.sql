﻿CREATE TABLE [dbo].[Version]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[Version] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX) NOT NULL,
	CONSTRAINT [PK_Version] PRIMARY KEY ([Id])
)
