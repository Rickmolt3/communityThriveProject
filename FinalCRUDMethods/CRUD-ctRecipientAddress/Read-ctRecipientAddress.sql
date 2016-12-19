/*============================
Description: This script is used to read the ctRecipientAddress info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadRecipientAddress
	
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

		SELECT  ctRecipientAddressID,recipientID,streetName,cityName,stateName,zipcode
		FROM ctRecipientAddress
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