/*============================
Description: This script is used to update the ctEvent info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:04pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateEvent
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

		UPDATE ctEvent
		SET @eventsID = eventsID, @eventTypeID = eventTypeID, @eventDescription = eventDescription, @eventDateTime = @eventDateTime
		WHERE @eventsID = eventsID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO