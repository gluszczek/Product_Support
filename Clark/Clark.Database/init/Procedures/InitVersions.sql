CREATE PROCEDURE [init].[InitVersions]
AS
	MERGE INTO [dbo].[Version] AS Target
		USING (VALUES
			('1.0.0', 'initialized database')
    )
		AS Source ([Version], [Description])
			ON Target.[Version]= Source.[Version]
			WHEN MATCHED THEN
				UPDATE SET [Description] = Source.[Description]
			WHEN NOT MATCHED BY TARGET THEN
				INSERT ([Version], [Description])
					VALUES ([Version], [Description])
			WHEN NOT MATCHED BY SOURCE THEN
				DELETE;
