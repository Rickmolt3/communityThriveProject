/*============================
Description: This script is used to generate the ctPrivlidges info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:57pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreatePrivlidges
	@privlidgesID int,
	@privlidgesDescription nvarchar(150)

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		INSERT ctPrivilidges(privilidgesID,privilidgesDescription)
		VALUES (@privlidgesID,@privlidgesDescription)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO