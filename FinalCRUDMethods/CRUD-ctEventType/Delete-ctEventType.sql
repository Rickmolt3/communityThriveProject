/*============================
Description: This script is used to delete the ctEventType info and remove the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:30pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_DeleteEventType
	@eventTypeID int,
	@eventTypeDescription nvarchar(max),
	@designation varchar(50)
	
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		DELETE FROM ctEventType
		WHERE eventTypeID = @eventTypeID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO