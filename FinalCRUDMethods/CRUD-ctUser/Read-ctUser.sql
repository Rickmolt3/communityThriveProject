/*============================
Description: This script is used to read the ctUser info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:30pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadStock
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

		SELECT  userID,roleID,companyID,emailAddress,userPassword,firstName,lastName,phoneNumber,userAddress,userTypeID
		FROM ctUser
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