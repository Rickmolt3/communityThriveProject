/*============================
Description: This script is used to read the ctEvent info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadEvent
	
	@eventsID int,
	@eventTypeID int,
	@eventDescription varchar(max),
	@eventDateTime datetime
	

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT eventsID,eventTypeID,eventDescription,eventDateTime
		FROM ctEvent
		WHERE @eventsID = eventsID or @eventTypeID = eventTypeID or @eventDateTime = eventDateTime

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO