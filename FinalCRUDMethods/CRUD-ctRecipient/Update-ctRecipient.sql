/*============================
Description: This script is used to update the ctRecipient info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateRecipient
	@recipientID int,
	@firstName nvarchar(50),
	@lastName nvarchar(50),
	@gender int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		UPDATE ctRecipient
		SET @recipientID = recipientID, @firstName = firstname, @lastName = lastName, @gender = gender
		WHERE @recipientID = recipientID


	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO