/*============================
Description: This script is used to update the ctRecipientAddress info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateRecipientAddress
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

		UPDATE ctRecipientAddress
		SET @ctRecipientAddressID = ctRecipientAddressID, @recipientID = recipientID, @streetName =streetName, @cityName = cityName, @stateName = stateName, @zipcode = zipcode
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