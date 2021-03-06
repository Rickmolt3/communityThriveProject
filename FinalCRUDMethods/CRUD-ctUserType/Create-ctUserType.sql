/*============================
Description: This script is used to generate the ctUserType info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:42pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreateUserType
	@UserTypeID int,
	@userTypeDescription int

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		INSERT ctUserType(userTypeID,userTypeDescription)
		VALUES (@UserTypeID,@userTypeDescription)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO