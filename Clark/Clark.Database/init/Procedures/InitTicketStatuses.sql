CREATE PROCEDURE [init].[InitTicketStatuses]
AS
	MERGE INTO [dbo].[TicketStatus] AS Target
		USING (VALUES
			(1, 'New'),
			(2, 'AnswerNeeded'),
			(3, 'Later'),
			(4, 'Waiting'),
			(5, 'Answered'),
			(6, 'Closed')
		)
		AS Source ([Id], [Name])
			ON Target.[Id]= Source.[Id]
			WHEN MATCHED THEN
				UPDATE SET [Name] = Source.[Name]
			WHEN NOT MATCHED BY TARGET THEN
				INSERT ([Id], [Name])
					VALUES ([Id], [Name])
			WHEN NOT MATCHED BY SOURCE THEN
				DELETE;