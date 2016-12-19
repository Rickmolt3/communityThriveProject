/*============================
Description: This script is used to read the ctRolePrivilidges info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:17pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadRolePrivilidges
	
	@roleFK int,
	@privilidgeFK int

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT  roleFK,privilidgeFK
		FROM ctRolePrivilidges
		WHERE @roleFK = roleFK

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO