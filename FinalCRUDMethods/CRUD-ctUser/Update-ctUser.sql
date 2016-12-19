/*============================
Description: This script is used to update the ctUser info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:30pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateStock
	@userID int,
	@roleID int,
	@companyID int,
	@emailAddress nvarchar(150),
	@userPassword nvarchar(150),
	@firstName nvarchar(100),
	@lastName nvarchar(100),
	@phoneNumber nvarchar(100),
	@userAddress nvarchar(200),
	@userTypeID int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		UPDATE ctUser
		Set @userID = userID,@roleID = roleID,@companyID = companyID,@emailAddress=@emailAddress,@userPassword = userPassword,@firstName=firstName,@lastName=lastName,phoneNumber=phoneNumber,@userAddress=userAddress,@userTypeID=userTypeID
		WHERE @userID = userID


	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO