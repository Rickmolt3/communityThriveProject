/*============================
Description: This script is used to read the ctEventType info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadEventType
	
	@eventTypeID int,
	@eventTypeDescription nvarchar(max),
	@designation varchar(50)

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT eventTypeID,eventTypeDescription,designation
		FROM ctEventType
		WHERE @eventTypeID = eventTypeID or @eventTypeDescription = eventTypeDescription or @designation = designation

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO