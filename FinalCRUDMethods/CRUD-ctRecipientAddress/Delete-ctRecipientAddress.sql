/*============================
Description: This script is used to delete the ctRecipientAddress info and remove the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_DeleteRecipientAddress
	@ctRecipientAddressID int,
	@recipientID int,
	@streetName nvarchar(100),
	@cityName nvarchar(50),
	@stateName nvarchar(50),
	@zipcode int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		DELETE FROM ctRecipientAddress
		WHERE @ctRecipientAddressID = ctRecipientAddressID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO