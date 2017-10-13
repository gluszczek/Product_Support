CREATE PROCEDURE [init].[InitDatabase]
AS
	EXEC [init].[InitVersions]
	EXEC [init].[InitTicketStatuses]