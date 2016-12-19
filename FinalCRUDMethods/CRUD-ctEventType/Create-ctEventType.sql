/*============================
Description: This script is used to generate the ctEventType info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:57pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreateEventType
	@eventTypeID int,
	@eventTypeDescription nvarchar(max),
	@designation varchar(50)

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		INSERT ctEventType(eventTypeID,eventTypeDescription,designation)
		VALUES (@eventTypeID,@eventTypeDescription,@designation)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO