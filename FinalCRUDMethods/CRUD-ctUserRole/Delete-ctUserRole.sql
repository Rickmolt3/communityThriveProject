/*============================
Description: This script is used to delete the ctUserRole info and remove the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:30pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_DeleteUserRole
	@ctUserRoleID int,
	@roleID int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		DELETE FROM ctUserRole
		WHERE @ctUserRoleID = ctUserRoleID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO